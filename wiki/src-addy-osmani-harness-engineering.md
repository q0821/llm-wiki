---
title: Agent Harness Engineering — Addy Osmani 的論述（FB 中文整理）
type: source
sources: ["未命名.md"]
created: 2026-05-14
updated: 2026-05-14
tags: [harness-engineering, agent, addy-osmani, ai-coding, ratchet, context-rot]
confidence: 中
---

# Agent Harness Engineering — Addy Osmani 的論述

**原文作者**：[[Addy-Osmani]]（Google Cloud AI 總監）
**FB 整理者**：未具名（手機 Obsidian 投遞時題名「未命名.md」，FB share 連結未含 author profile）
**FB 連結**：https://www.facebook.com/share/p/1HCS7NJGjk/?mibextid=wwXIfr
**clip 日期**：2026-05-14
**來源層次**：二次來源（Addy Osmani 原文 → FB 中文整理 → 本知識庫）

> ⚠️ **二次來源警示**：本頁所有論點皆透過 FB 整理者轉述。原文未獨立 fetch，引文與技術細節以「整理者轉述為信」為前提；具體名詞、定義（如「Ratchet」「Context Rot」「Harness-as-a-Service」）若未來要深度引用，建議補抓 Addy 英文原文驗證。

## 核心主張

- **Agent = Model + Harness**（Viv Trivedy 定義）；如果你做的事不是模型本身，那幾乎都屬於 harness——這擴張了 [[Harness-Engineering]] 的範疇
- Harness 是**會持續演化**的系統：每次 agent 犯錯不是「重跑」，而是要透過 **Ratchet 機制**把該次失敗變成永久修正
- HumanLayer 觀點：「這不是模型問題，是設定問題（configuration problem）」
- 七大 harness 元件：工作說明書（CLAUDE.md/AGENTS.md/skill）、工具箱（Tools/MCP）、工作桌與沙箱、分工派工（orchestration）、自動檢查（hooks）、監控（observability）、記憶與搜尋
- 對抗 **[[Context-Rot|Context Rot]]** 三招：compaction、tool-call offloading、progressive disclosure
- **Long-Horizon Execution** 三招：Loop（攔截提早結束）、Planning（先寫 step file）、Split（產出與評估分給不同 agent）
- Hook 的執行層原則：**「成功時安靜，失敗時大聲」**
- 模型變強後 harness 不會萎縮，**只會移動**——舊 scaffolding 移除、新任務邊界產生新 scaffolding
- 產業正在從「**LLM API**」（給你一段回答）轉向「**Harness API**」（給你一套工作環境）

## 詳細摘要

### 一、Viv Trivedy 的定義

> 「Agent = Model + Harness。If you're not the model, you're the harness.」

這個定義把 harness 範疇推到極致：**只要不是模型本身，全是 harness**——包括所有不是模型的程式碼、設定、執行邏輯。Raw model 不是 agent；只有透過 harness 提供狀態、工具執行、回饋迴路、可強制執行的限制後，才會變成 agent。

對照 [[Harness-Engineering]] 中 OpenAI Ryan Lopopolo 的定義「設計基礎設施、約束條件和回饋迴圈讓 AI 代理可靠且大規模運作」——OpenAI 版較工程化，Addy/Trivedy 版更廣譜。

### 二、Harness 七大元件

| 元件 | 比喻 | 具體載體 |
|---|---|---|
| **System prompt 系列** | 工作說明書（新人 SOP）| `CLAUDE.md` / `AGENTS.md` / skill files / subagent instructions |
| **Tools / Skills / MCP** | 工具箱（含工具標籤）| Tool 描述、[[MCP]] servers、[[Agent-Skills]] |
| **檔案系統 / Sandbox / Headless browser** | 工作桌與安全實驗室 | Filesystem、Git、sandbox 隔離 |
| **Orchestration logic** | 分工派工機制 | subagent 啟動、handoff、model routing |
| **Hooks / Middleware** | 自動檢查站（門禁）| lint check、context compaction、typecheck |
| **Observability** | 監控儀表板 | logs、traces、cost、latency metering |
| **Memory + Search** | 持續補知識缺口 | AGENTS.md memory file、web search、MCP tools |

> 七元件與 OpenAI 版三支柱（Context / Constraints / Entropy）可對應到「三支柱是七元件的高層抽象」。

### 三、Ratchet：每次錯誤變成永久規則

Harness engineering 最核心的習慣：把錯誤當**永久信號**，不是一次性意外。

**FB 整理者引述的具體範例**：

> 「如果 agent 送出一個 PR 把測試註解掉、結果不小心被 merge，這不是『下次小心』。下一版 AGENTS.md 就應該寫清楚『不要註解掉測試，要刪掉或修好』。pre-commit hook 應該自動抓出 diff 裡的 `.skip(`。reviewer subagent 也應該被更新，遇到這種情況就阻擋。」

**Addy 的克制原則**：

> 「限制應該只在你真的觀察到失敗時才加入；當模型變強，某些限制已經不再必要時，也應該移除。好的 system prompt 裡，每一條規則都應該能追溯到某個曾經發生過的失敗。」

對應 [[Harness-Engineering]] 中已記錄的 Mitchell Hashimoto 引言：「每當你發現代理犯了一個錯誤，你就花時間設計一個解決方案，確保代理再也不會犯同樣的錯」——同一個範式，兩個工程文化的獨立表述。

→ 本來源據此抽出獨立概念頁 [[Ratchet-Pattern]]。

### 四、從行為往回設計 Harness

> 「設計 harness 最有效的方法，不是先列一堆工具，而是先問：我希望 agent 出現什麼行為？」
>
> 想要的行為 → 為了達成這個行為，需要什麼 harness 設計

每個 harness 元件都應該服務一個具體行為。如果某個 prompt / hook / middleware / tool / subagent 說不出在服務哪個行為，就應該移除。

> 「這讓 harness engineering 更像產品設計，而不是單純堆設定。」

### 五、Filesystem / Git：可持久化的狀態

- 模型只能處理塞進 context window 裡的東西
- 檔案系統讓 agent **卸載暫時不需要塞進 context 的資訊**，並支援多 agent 協作
- Git 之後：版本紀錄、追蹤進度、開分支實驗、保留可比較變更、出錯 rollback

> 「把一次性的文字生成變成可追蹤工作流程的基礎。」

### 六、Bash + Code Execution：通用工具層

ReAct loop（reason → act → observe → continue）：與其預先設計每種工具，**不如給 agent bash 和 code execution，讓它組合解法**。

> 「Bash 是一種通用工具層，像是給 agent 一組基本工具：可以搜尋檔案、跑測試、轉換格式、檢查輸出、寫小工具。」

### 七、Sandbox + Self-Verification

Bash 必須跑在沙箱裡。好的 sandbox 不只是安全，還會預裝**常見語言環境、測試 CLI、headless browser**。

> 「如果 agent 只能寫，不能跑、不能看、不能驗證，那它很容易停在『看起來完成』而不是真的完成。」

### 八、對抗 Context Rot 三招

定義：context window 越塞越滿，推理品質通常會變差。

| 招式 | 做法 | 比喻 |
|---|---|---|
| **Compaction** | 把舊對話/中間過程整理成摘要 | 開會中先整理會議紀錄，不要把逐字稿攤桌上 |
| **Tool-call offloading** | 大型工具輸出（2000 行 log）存檔案系統，只保留必要的開頭、結尾、重點 | 完整資料放資料夾，桌面只留摘要 |
| **Progressive disclosure** | 工具/指令/文件在任務真的需要時才載入 | 教新人時不要第一天塞完整本手冊 |

### 九、Long-Horizon Execution 三招

長時間任務常見問題：太早停下來、不會好好拆解問題。

| 招式 | 做法 | 對應的「人性弱點」 |
|---|---|---|
| **Loop** | 攔截模型想提早結束的行為，新 context window 繼續朝目標前進 | 「你真的做完了嗎？還有沒有驗證？」 |
| **Planning** | 要求模型先把目標拆成 step-by-step plan file，每步透過 self-verification hook 檢查 | 先寫工作清單，每項打勾並檢查成果 |
| **Split** | 「產出」和「評估」拆給不同 agent，避免同一模型自評偏差 | 不要讓同一人又當考生又當考官 |

### 十、Hooks 的執行層原則

Hook 把「請 agent 這樣做」變成「系統強制這樣做」——自動門禁／檢查站。

設計原則：

> 「**成功時安靜，失敗時大聲。**」

Typecheck 通過 → agent 不需要看到任何東西；Typecheck 失敗 → 錯誤訊息直接注入回 loop。

> 「不是建議，而是守門。不是提醒 agent『最好不要犯錯』，而是讓某些錯誤根本過不了關。」

### 十一、Rulebook 與工具選擇

放在 repo 根目錄的 flat markdown file（[[CLAUDE-md|CLAUDE.md]] / AGENTS.md）「**目前仍然是最高槓桿的設定點**」。

要像**飛行員的檢查清單**，不是冗長風格指南。每一條規則都要是從過去失敗中**賺來的**（earn the line）。

工具選擇同理：「**10 個職責清楚、描述精準的工具，永遠比 50 個功能重疊的工具更好用**」。

**安全議題**：工具描述會直接進到 prompt 裡——一個品質差或惡意的外部整合（如未驗證的 MCP server）可能在 agent 工作前就注入不該有的指令。

### 十二、生產 Harness 拆解（Fareed Khan 對 Claude Code 的估計）

| 概念 | 在 Claude Code 中的對應 |
|---|---|
| Context injection | 知識層——把必要背景資料送進 agent |
| Loop state | memory store + worktree isolator——保存任務進度、隔離工作區 |
| Destructive-action hooks | permission gate——危險操作前的安全檢查 |
| Subagent context firewall | 多 agent 隔離——避免不同 agent 看到不該看的資訊 |
| Tool dispatch registry | MCP servers + bash 的接入點——「工具總機」 |

> 「Claude Code 這類 coding agent 的演進，不只是底層模型變強而已。它的軌跡至少同樣程度是 harness 的演進。」

對照本知識庫 [[Claude Code]] 頁——可補上此架構分解視角。

### 十三、Harness 不會萎縮，只會移動

> 「模型變強後，harness 不會消失，只會移動。」

每個元件本質上編碼了一個假設「**這件事模型自己做不好**」。模型進步 → 過時 scaffolding 移除；新任務邊界 → 建立新 scaffolding。

對照 [[Meta-Harness]] 主張「介面應 outlast 任何具體實作」——兩者方向一致：穩定不是「永遠不變」，而是「隨能力邊界推進」。

### 十四、Training Loop：Harness 影響模型訓練

> 「現在很多模型在 post-training 階段，其實會把特定 harness 放在 loop 裡。」

這會產生 overfitting——模型特別擅長 harness 設計者重視的動作（filesystem ops、bash、subagent dispatch）。

意味：harness 不是靜態設定檔，而是會跟模型一起演化的 **living system**。

> 「最好的 harness 不是抽象上的最好，而是最適合你的任務、你的 workflow、你的失敗模式的那一套。」

### 十五、Harness-as-a-Service 正在成形

> 「產業正在從『用 LLM API 寫東西』轉向『用 Harness API 跑東西』。」

| API 層 | 提供什麼 |
|---|---|
| **LLM API** | Completion——給你一段回答 |
| **Harness API** | Runtime——給你一套能執行任務的工作環境 |

很多 SDK 已包好 loop、工具管理、context management、hook、sandbox。工程師可選 harness framework，把心力放在領域 prompt 和工具設計。

troubleshooting 變得「**可規模化**」——不是每次重造 agent 架構，而是在 configuration surface 上調整。

對照本知識庫 [[Managed-Agents]]：Anthropic Claude Managed Agents 是 Harness-as-a-Service 的代表實作。

### 十六、未來方向

- 多個 agent 並行協作
- Agent 自己分析自己的執行軌跡，修正 harness 層問題
- 環境根據任務即時組裝工具

> 「Harness 會越來越不像靜態設定檔，而更像 compiler——根據任務把工具、流程、限制、檢查機制組裝成一套可執行的工作系統。」

### 十七、提及的工具

文末提及 Fred K. Schott 開發的 **Flue**（agent harness framework），「顯然也受到這篇文章早期版本的啟發」。

## 關鍵引用

> 「Agent = Model + Harness. If you're not the model, you're the harness.」 — Viv Trivedy（LangChain）

> 「這不是模型問題，是設定問題（configuration problem）。」 — HumanLayer

> 「成功時安靜，失敗時大聲。」 — Hook 設計原則

> 「好的 system prompt 裡，每一條規則都應該能追溯到某個曾經發生過的失敗。」 — Addy Osmani

> 「Harness 裡每一個元件，本質上都編碼了一個假設：這件事模型自己做不好。」 — Addy Osmani

> 「LLM API 提供的是 completion，Harness API 提供的是 runtime。」 — Addy Osmani

## 信心評估

- **強**：核心概念（Agent = Model + Harness、Ratchet、Context Rot 三招、Long-Horizon Execution 三招、Hook 原則）——多家獨立工程社群（OpenAI、Anthropic、Google、LangChain、HumanLayer）有對應論述
- **中**：具體歸屬（誰先提出哪個術語）——透過 FB 整理者轉述，建議交叉驗證 Addy 英文原文
- **中**：Fareed Khan 對 Claude Code 架構拆解——FB 整理者轉述 Addy 引述他人，三層引述
- **時效**：2026-05 當下 Harness-as-a-Service 趨勢處於正在成形階段，產業共識仍在演化

## 與 Wiki 的關聯

### 形成的對話組

- **[[src-harness-engineering-openai]]**（OpenAI Ryan Lopopolo，三支柱）↔ **本來源**（Google Addy Osmani，七元件）：兩巨頭對同一範式的不同切角
- **[[src-anthropic-managed-agents-engineering]]**（Anthropic [[Meta-Harness]]）↔ **本來源**：「harness 移動而非萎縮」呼應「介面 outlast 實作」

### 新建頁面

- [[Addy-Osmani]]（entity）
- [[Ratchet-Pattern]]（concept）——從本來源萃取

### 更新既有頁面

- [[Harness-Engineering]] — 補七元件視角、Ratchet、Context Rot、Long-Horizon 三招、HaaS 趨勢
- [[Self-Improving-Agent]] — Ratchet 是該範式的核心執行機制
- [[Claude Code]] — 補 Fareed Khan 對 Claude Code 架構的元件拆解
- [[Meta-Harness]] — 補 harness 移動而非萎縮的呼應
- [[CLAUDE-md]] — 補「飛行員 checklist」、「每條規則都要從失敗中賺來」、工具描述安全議題
- [[Agent-Skills]] — 補七元件中「工具描述會進 prompt」的安全議題
- [[MCP]] — 補「未驗證 MCP server 可能注入惡意工具描述」的安全提醒

### 未來可延伸

- 補抓 Addy Osmani 英文原文（如能找到原連結）做獨立 source 頁
- Fred K. Schott 的 Flue harness framework 是否值得追蹤
- 「Context Rot」「Harness-as-a-Service」如後續有更多來源討論，可獨立成概念頁
