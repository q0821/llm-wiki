---
title: Harness Engineering（駕馭工程）
type: concept
sources: [Harness Engineering（AI駕馭工程）入門篇：OpenAI最新編程標準，教你輕鬆做到Lv.1.md, "未命名.md", "cloudflare-ai-code-review.md", "ihower-harness-loop-engineering-系列-9篇.md"]
created: 2026-04-21
updated: 2026-06-29
tags: [AI, Agent, 軟體工程, 架構設計, harness, ratchet, circuit-breaker, production, feedback-loop, loop-engineering]
confidence: 強
---

# Harness Engineering（駕馭工程）

## 定義

Harness Engineering 是 AI Agent 軟體開發的一個正在成形範式：設計基礎設施、約束條件和回饋迴圈，讓 AI 代理能可靠且大規模地運作。多家工程文化（OpenAI、Anthropic、Google、LangChain）對同一範式有獨立但收斂的論述。

**最廣譜定義**（Viv Trivedy / LangChain，[[src-addy-osmani-harness-engineering|via Addy Osmani]]）：

> 「**Agent = Model + Harness. If you're not the model, you're the harness.**」

**OpenAI 版本**（Ryan Lopopolo，[[src-harness-engineering-openai]]）：設計基礎設施、約束條件和回饋迴圈。

「Harness」原意為馬具——AI 模型是馬，harness 是韁繩和導引系統，工程師是騎士。

核心哲學：**Humans steer, agents execute.**

## 四個核心功能

| 功能 | 說明 |
|------|------|
| 約束（Constraining） | 限定代理能做什麼、不能做什麼 |
| 告知（Informing） | 讓代理理解目標——提供上下文 |
| 驗證（Verifying） | 確認代理是否正確執行——測試和檢查 |
| 修正（Correcting） | 代理犯錯時自動修復——回饋迴圈 |

## 三根支柱

### 1. Context Engineering（上下文工程）

代理看不到的東西 = 不存在。所有規範必須存在於 repo 中。

- **靜態上下文**：架構規範、API 合約、coding style（AGENTS.md / CLAUDE.md）
- **動態上下文**：日誌、CI 狀態、目錄結構掃描

最佳實踐：AGENTS.md 當「目錄」指向 `docs/`，不當「百科全書」。

### 2. Architectural Constraints（架構約束）

限制解題空間反而提升生產力。工具：自定義 linter、結構測試、LLM 審計員、pre-commit hooks。

### 3. Entropy Management（熵管理）

AI 代碼會累積特有混亂（文件漂移、命名分歧、死 code）。解法：定期執行清潔代理，持續小步清理。

## 三級實踐路線圖

- **Level 1**（個人，1-2 小時）：CLAUDE.md + pre-commit hooks + 測試套件
- **Level 2**（團隊，1-2 天）：CI 強制約束 + 共用 prompt 模板 + AI 專屬 review checklist
- **Level 3**（組織，1-2 週）：可觀測性整合 + 清潔代理 + harness A/B 測試

## 七元件分解（[[Addy-Osmani]] 視角，[[src-addy-osmani-harness-engineering]]）

OpenAI 三支柱的較細層次拆解，每一塊都對應 agent「現實世界裡的某個工作環節」：

| 元件 | 比喻 | 具體載體 |
|---|---|---|
| System prompt 系列 | 工作說明書 | [[CLAUDE-md|CLAUDE.md]] / AGENTS.md / skill files / subagent instructions |
| Tools / Skills / [[MCP]] | 工具箱（含工具標籤）| Tool 描述、MCP servers、[[Agent-Skills]] |
| 檔案系統 / Sandbox / Headless browser | 工作桌與安全實驗室 | Filesystem、Git、sandbox 隔離 |
| Orchestration logic | 分工派工 | subagent 啟動、handoff、model routing |
| Hooks / Middleware | 自動檢查站 | lint、context compaction、typecheck |
| Observability | 監控儀表板 | logs、traces、cost、latency |
| Memory + Search | 持續補知識缺口 | AGENTS.md memory file、App Flow JSON（[[src-akiraxclaw-app-flow-trick]]）、web search、MCP tools |

> 與三支柱的對應：Context Engineering ↔ System prompt + Memory；Architectural Constraints ↔ Hooks；Entropy Management ↔ Observability + 清潔代理。

## Ratchet 機制：規則只增不減

跨 OpenAI、Anthropic、Google 三家工程文化的共識——agent 的每個錯誤都應**編碼成永久信號**而非一次性意外。

詳見 [[Ratchet-Pattern]] 獨立頁面。

兩個獨立來源的同源表述：

| 來源 | 表述 |
|---|---|
| [[src-harness-engineering-openai]]（OpenAI，引 Mitchell Hashimoto）| 「每當你發現代理犯了一個錯誤，你就花時間設計一個解決方案，確保代理再也不會犯同樣的錯。」 |
| [[src-addy-osmani-harness-engineering]]（Google Addy Osmani）| 「Harness engineering 最重要的習慣，是把 agent 的錯誤當成永久信號，而不是一次性的意外。」 |

**克制原則**（Addy）：「限制應該只在你真的觀察到失敗時才加入；當模型變強，某些限制已經不再必要時，也應該移除」——對應 OpenAI 版的「harness 應可撕裂、隨模型進化移除」。

## 對抗 [[Context-Rot|Context Rot]]（[[Addy-Osmani]] 視角）

定義：context window 越塞越滿，推理品質變差。詳見 [[Context-Rot]] 概念頁。

三招：

| 招式 | 做法 |
|---|---|
| **Compaction** | 把舊對話/中間過程整理成摘要 |
| **Tool-call offloading** | 大型輸出存檔案系統，只保留必要的開頭結尾 |
| **Progressive disclosure** | 工具/指令/文件在任務真的需要時才載入 |

對應 [[src-claude-code-context-management]] 的 rewind / compact / subagent 策略。

## Long-Horizon Execution（長任務的 harness 結構）

[[Addy-Osmani]] 整理的三招：

| 招式 | 做法 | 對應的「人性弱點」 |
|---|---|---|
| **Loop** | 攔截模型想提早結束的行為 | 「你真的做完了嗎？」 |
| **Planning** | 先寫 step-by-step plan file，每步 self-verification | 工作清單與檢查成果 |
| **Split** | 「產出」和「評估」拆給不同 agent | 不要讓同一人又當考生又當考官 |

## Hook 設計原則

> 「**成功時安靜，失敗時大聲。**」 — [[Addy-Osmani]]

Typecheck 通過 → agent 不需要看到任何東西；Typecheck 失敗 → 錯誤訊息直接注入回 loop。Hook 不是建議，而是守門——「某些錯誤根本過不了關」。

## Harness-as-a-Service 趨勢

[[Addy-Osmani]] 觀察的產業轉向：

| API 層 | 提供什麼 | 代表 |
|---|---|---|
| **LLM API** | Completion——一段回答 | OpenAI / Anthropic 早期 API |
| **Harness API** | Runtime——能執行任務的工作環境 | [[Managed-Agents|Claude Managed Agents]]、Flue（Fred K. Schott）等 |

工程重點從「自己拼 agent 架構」轉為「在 configuration surface 上調整」——troubleshooting 變得可規模化。

## Harness 不會萎縮，只會移動

> 「模型變強後，harness 不會消失，只會移動。」 — [[Addy-Osmani]]

每個 harness 元件都編碼了「**這件事模型自己做不好**」的假設。模型進步 → 舊 scaffolding 移除；新任務邊界出現 → 新 scaffolding 建立。

這個觀點與 [[Meta-Harness]]「介面應 outlast 任何具體實作」呼應——穩定不是「永遠不變」，是「隨能力邊界推進」。

## Training Loop：Harness 影響模型訓練

> 「現在很多模型在 post-training 階段，其實會把特定 harness 放在 loop 裡。」 — [[Addy-Osmani]]

代表：harness 不是靜態設定檔，而是會跟模型一起演化的 living system。模型會 overfit 到 harness 設計者重視的動作（filesystem ops、bash、subagent dispatch）。

## Circuit Breaker for AI（[[src-cloudflare-ai-code-review|Cloudflare production]]）

把 Netflix Hystrix 的 **斷路器模式** 從微服務延伸到 AI 模型呼叫——七元件中 **Orchestration logic** 的 production-grade 補強。

### 模型故障回退鏈

```javascript
const DEFAULT_FAILBACK_CHAIN = {
  "opus-4-7":   "opus-4-6",    // Fall back to previous generation
  "opus-4-6":   null,          // End of chain
  "sonnet-4-6": "sonnet-4-5",
  "sonnet-4-5": null,
};
```

- 每個模型系列獨立健康狀態追蹤
- 斷路器「開啟」時，兩分鐘冷卻期後允許**一個探測請求**通過
- 模型分三層分配工作：頂級（Opus 4.7 / GPT-5.4）給協調者、標準（Sonnet 4.6）給子 reviewer、輕量（Kimi K2.5）給文字密集任務

### 錯誤分類：哪些可故障回退

```javascript
switch (err.name) {
  case "APIError":            return { shouldFailback: data.isRetryable };
  case "ProviderAuthError":   return { shouldFailback: false };
  case "ContextOverflowError":return { shouldFailback: false };
  case "MessageAbortedError": return { shouldFailback: false };
}
```

**只有可重試 API 錯誤觸發故障回退**——auth / 脈絡溢出 / abort / 結構化輸出錯誤都不會。對應 [[Ratchet-Pattern]] 的「克制原則」：規則只對真正能解決的失敗類型生效。

### 控制平面：Workers KV 5 秒切換

Cloudflare 系統用 [[Cloudflare|Workers KV]] 存模型路由設定，**provider 停用開關可在 5 秒內讓所有執行中 CI 繞過**——比改 code、deploy、重啟更快。

### 協調者層的獨立故障回退

協調者自己也可能掛——掃 stderr「overloaded」「503」模式偵測，熱交換 `opencode.json` 中的協調者模型重試。**故障回退要做兩層**（reviewer 層 + 協調者層），不能假設「掛的只會是 worker」。

## 概念層次關係

```
Prompt Engineering         → 單次互動（怎麼寫 prompt）
Context Engineering        → 上下文視窗（給什麼資訊）← Harness 的子集
Harness Engineering        → 整個系統（環境 + 約束 + 回饋迴圈）
Dynamic Harness Construction → 任務特定的 harness 動態建構（Anthropic Workflows）← 2026-06-02 後 Anthropic 主推
Agent Engineering          → 代理內部（路由、記憶、工具呼叫）
```

## Dynamic Harness Construction（Anthropic 2026-06-02）

[[src-anthropic-dynamic-workflows-claude-code-2026-06-02|Anthropic 官方 Workflows blog]]（[[Thariq-Shihipar]] + Sid Bidasaria，2026-06-02）提出 **dynamic workflows** 概念，把 harness 從「固定預設」升級為「任務時動態建構」：

> "The default Claude Code harness is built for coding, it is also useful for many other types of tasks because, as it turns out, many tasks resemble coding tasks."

關鍵升級：**Harness 本身是 first-class 動態建構物**，不再是預先設計好的靜態框架。Dynamic Workflows 用 JavaScript 動態生成 subagent 編排，每個 task 對應一個量身定製的 harness。

### 三大 agent 失敗模式（Anthropic 命名）

Workflows 設計動機是解決 3 個本知識庫過去散見但無統一命名的失敗模式：

| 失敗模式 | 原文定義 | 對位的既有概念 |
|---|---|---|
| **Agentic laziness** | Claude 在複雜多步任務中過早停止 | [[Vibe-Coding\|Vibe 過早停止]] + [[Context-Rot]] |
| **Self-preferential bias** | Claude 偏好自己的結果 / 發現 | [[AI-Quality-Collusion]] + [[PGE-Principle]] |
| **Goal drift** | 多輪互動中對原始目標的逐漸偏離 | [[Context-Rot]] + [[CLAUDE-md\|CLAUDE.md]] rule dilution |

### 六種 Workflow 設計模式

Anthropic 整理 6 個可組合的編排模式（細節見 [[src-anthropic-dynamic-workflows-claude-code-2026-06-02#六種設計模式|該 src 頁]]）：

1. **Classify-and-Act** — 分類後路由
2. **Fan-out-and-Synthesize** — 平行展開後合成
3. **Adversarial Verification** — 對抗驗證（對應 [[Adversarial-Code-Review]] 多 agent 版）
4. **Generate-and-Filter** — 候選生成 + 過濾
5. **Tournament** — 競爭配對比較
6. **Loop Until Done** — 未知工作量按停止條件迴圈

**vocabulary 中立 / 實作平台特定**：6 個模式可遷移到 [[OpenAI-Codex-CLI|Codex]] 等其他 agentic CLI，但 Anthropic 用 Workflows 把它們做成可執行 JS 模板。

## 與 Meta-Harness 的關係

[[Meta-Harness]]（Anthropic）和 Harness Engineering（OpenAI）從不同角度解決同一問題：

| 面向 | Harness Engineering | Meta-Harness |
|------|-------------------|--------------|
| 提出者 | OpenAI | Anthropic |
| 核心關注 | 代理「外面」的環境設計 | 介面抽象與實作可替換性 |
| 關鍵主張 | 約束提升生產力 | 介面穩定性 > 實作完整性 |
| 對未來的態度 | harness 應「可撕裂」，隨模型進化移除 | 介面應 outlast 任何具體實作 |

兩者互補：Meta-harness 定義穩定介面，Harness Engineering 設計介面內的約束和回饋系統。

## 四個回饋時機點框架（[[ihower]] 視角，[[src-ihower-harness-loop-engineering-2026-06]]）

[[ihower]] 在 GAIConf 2026 的《Harness + Loop Engineering》系列提出一個**正交於「元件清單」的切角**：別人多回答「harness 由哪些元件組成」（靜態清單，如上面 OpenAI 三支柱 / Addy 七元件 / Cloudflare 七元件），ihower 問的是「Agent 的**回饋**該在哪些**時機點**設計」——由內而外、成本遞增、巢狀的四個時機：

| 時機 | 觸發頻率 | 成本 | 修正粒度 | 對應 hook | 核心設計 |
|---|---|---|---|---|---|
| **① 工具執行內** | 每次 tool call | 毫秒 | 單一動作 | Pre/PostToolUse | 工具回傳值是寫給 agent 的回饋（夾帶指引、回完整 state 非旗標）|
| **② request 之間注入** | 想注入時 | 趨近零 | 當前這一輪方向 | 無專屬 hook | steering（人）/ 程式注入（背景結果、外部事件）|
| **③ 單輪結束** | 每一輪 | 秒級 | 整輪產出 | Stop hook | Goal/Outcome 驗收，沿「裁判獨立性」光譜：自我審計→transcript 裁判→獨立 grader |
| **④ 外層 Loop** | 每個 session | 分鐘到小時 | 整個任務 | 排程/外迴圈 | Ralph / Symphony / Cron；進度從 context 搬到磁碟 |

關鍵原則（與本頁既有論述呼應）：
- **核心是回饋迴路不是完美提示**：Prompt → Context → Harness 三層疊加；策略是「先 generate 再 verify」，工程難點在「怎麼確保 verify 真的會發生」。
- **③ 的「裁判獨立性 vs 資訊量」trade-off**：自我審計（Codex /goal，資訊量最大、零獨立）→ transcript 裁判（Claude Code /goal 用 Haiku，居中）→ 獨立 grader（Managed Agents Outcome，獨立性最大、只看 artifact）。獨立性最大者才抓得到 corrupt success（亂改測試、違規操作）。**驗證強度是 harness 可調參數**，隨任務風險與模型能力調整。
- **④ Loop Engineering**：Loop 管 scheduling（何時跑），Goal 管 termination（做到什麼程度才停）；swyx 五層 loop（token→turn→/goal→MetaLoop→open-ended）。
- **harness 會過期（Model-Harness-Fit）**：每個元件都在補某代模型的短處，模型變強後該主動拆掉——這是 [[Ratchet-Pattern|棘輪]]的**反方向**（也會減）。會過期的是具體做法（Bitter Lesson），不會過期的是 Eval 與 Judge。詳見 [[src-ihower-harness-loop-engineering-2026-06]] 篇8。

## 跨工程文化論述對照

| 工程文化 | 代表 | 主要切角 | 來源 |
|---|---|---|---|
| **台灣社群 / 開發者視角** | [[ihower]] | **由內而外四個回饋時機點**（時間軸切角，正交於元件清單）+ Loop Engineering + Model-Harness-Fit | [[src-ihower-harness-loop-engineering-2026-06]] |
| **OpenAI** | Ryan Lopopolo / Mitchell Hashimoto | 三支柱 + 級別實踐路徑 | [[src-harness-engineering-openai]] |
| **Anthropic（雲端 agent 視角）** | 工程團隊 | [[Meta-Harness]]、Long-running app design | [[src-anthropic-managed-agents-engineering]] |
| **Anthropic（Claude Code 視角）** | Applied AI team | **7 個 extension points**（CLAUDE.md / Hooks / Skills / Plugins / LSP / MCP / Subagents）+ 企業導入 DRI / Agent Manager 角色 | [[src-claude-code-in-large-codebases]] |
| **Anthropic（Dynamic Workflows 視角）** | [[Thariq-Shihipar]] + Sid Bidasaria | **Dynamic Harness Construction** + 3 大失敗模式 + 6 種設計模式 + 10 類使用案例 | [[src-anthropic-dynamic-workflows-claude-code-2026-06-02]] |
| **Google** | [[Addy-Osmani]] | 七元件 + Ratchet + Context Rot + HaaS 趨勢 | [[src-addy-osmani-harness-engineering]] |
| **LangChain** | Viv Trivedy | 「Agent = Model + Harness」定義 | （引述於 Addy） |
| **HumanLayer** | — | 「不是模型問題，是設定問題」 | （引述於 Addy） |
| **Cloudflare** | Ryan Skidmore | **七元件 production-grade 標本** + Circuit Breaker for AI + Risk Tier | [[src-cloudflare-ai-code-review]] |

## 相關頁面

- [[src-ihower-harness-loop-engineering-2026-06]] — [[ihower]] 台灣社群/開發者視角，**四個回饋時機點** + Loop Engineering + Model-Harness-Fit（9 篇系列）
- [[src-harness-engineering-openai]] — OpenAI 視角來源
- [[src-addy-osmani-harness-engineering]] — Google Addy Osmani 視角來源
- [[src-cloudflare-ai-code-review]] — Cloudflare production 標本，含 Circuit Breaker for AI
- [[src-anthropic-dynamic-workflows-claude-code-2026-06-02]] — Anthropic **Dynamic Harness Construction** 官方論述（Thariq Shihipar + Sid Bidasaria，2026-06-02）
- [[Meta-Harness]] — Anthropic 的互補設計哲學
- [[Managed-Agents]] — Meta-harness / Harness-as-a-Service 的第一個實作
- [[Agent-Skills]] — Level 1 harness 的具體實踐
- [[DESIGN-md]] — Context Engineering 的實踐案例
- [[Ratchet-Pattern]] — Harness 進化機制的核心
- [[Self-Improving-Agent]] — Ratchet 與 MEMORY.md 形成的另一面範式
- [[Addy-Osmani]] — Google Cloud AI 總監，七元件分解的提出者
- [[OpenCode]] — Cloudflare 系統的底層 agentic CLI
- [[src-claude-code-context-management]] — Claude Code 的 context 管理策略
