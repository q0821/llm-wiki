---
title: MUKI 06-04 工作坊 — AI 協同開發與系統架構轉型（Plaud 錄音）
type: source
sources: ["2026-06-04-plaud-workshop-ai-codev-summary.md", "2026-06-04-plaud-workshop-ai-codev-transcript-FULL.md"]
created: 2026-06-05
updated: 2026-06-05
tags: [muki, hi-day, ai-codev, system-architect, cicd, tdd, claude-md, design-token, deep-wiki, mcp, frontend-design, superpowers, understand-anything, agree-with-docs, plaud, stt-error-flagged]
confidence: 中（STT 錯誤已標註，講師論述強但部分工具名稱待校）
aliases: ["MUKI 06-04 工作坊", "Hi Day 工作坊", "MUKI AI 協同開發工作坊"]
---

# MUKI 06-04 工作坊 — AI 協同開發與系統架構轉型（Plaud 錄音）

**來源**：Plaud 錄音分享頁
**原始連結**：https://web.plaud.ai/s/pub_a603637d-b309-4503-be01-c3e2774040f0::pg1VSEEyaVReIwZ7KnGLwak-Sfg1Wp0R6ieF3AkOCHVjaEd4UpmPos3o1JGVII1yM5S_PGFXOOqBdg0C
**講師**：[[MUKI]]（張惠玲，台灣前端社群知名講者，部落格 muki.tw 自 2008 起）
**錄音日期**：2026-06-04 19:37（單場 58:50）
**主辦**：URMeetup 預告活動（正式活動為 6/3 下午）
**抓取於**：2026-06-05 via Playwright MCP
**來源類型**：論點型 + 實戰經驗型 + 高密度工具鏈介紹
**配套原始檔**：
- `raw/2026-06-04-plaud-workshop-ai-codev-summary.md`（Plaud 自動 AI summary）
- `raw/2026-06-04-plaud-workshop-ai-codev-transcript-FULL.md`（轉錄逐字稿 19K 字）

> 本 src 頁採**聚焦對位**寫法：因 quiz 使用者明示唯一 application 是「**Hi Day vs LLM-wiki 兩個實作對話**」，本頁主軸放在這條對話組；其他 4 個面向（MUKI 工具鏈 / 26 作業 / 三大架構 / 5 大主題）以摘要形式收錄並標明對位強度，避免雜訊。

## ⚠️ Plaud STT 系統性錯誤校正表

中文 Plaud STT 把「Claude」系列術語**一律聽成「Cloud」**。校正後正確術語：

| Plaud STT 寫法 | 校正後 | 出現次數 |
|---|---|---|
| Cloud Code / cloud code | **Claude Code** | 4+ |
| cloud.md | **CLAUDE.md** | 多次 |
| Cloud 中的回溯 / Cloud 自動建立 / Cloud 的 web app | **Claude** | 多處 |
| Cloud 擴充功能（開 console） | **Claude 擴充功能**（Claude in Chrome）| 1 |
| Cloud Word | **Claude.ai web** 或 ChatGPT type 產品（context 不明）| 1 |
| **Clocko** / Clocko Channel | **Claude？** 或某 API gateway（待校）| 4 |
| **Codeless** | **Codex？**（OpenAI Codex）| 2 |
| NCP | **MCP**（Model Context Protocol）| 多次 |
| super product / Super Prose | **Superpowers** | 1-2 |
| Front End Design（Cloud Code 官方技能）| **`frontend-design` skill**（Claude Code 官方）| 1 |

> **重要**：本知識庫 ingest 後，所有「Cloud」「cloud.md」「NCP」均已替換為正確術語（Claude / CLAUDE.md / MCP），讀者不必再校。Clocko / Codeless 兩個 API 供應商名稱**未確認**，待後續來源驗證。

---

## 核心對話組：Hi Day vs LLM-Wiki —— 兩個實作的並排比較（**本頁主軸**）

[[MUKI]] 的 Hi Day 與本知識庫採用的 [[LLM-Wiki]] 範式（[[Andrej-Karpathy]] + [[Obsidian]] + [[Claude Code]]），是**兩種「累積個人知識 + 讓 AI 可讀」的不同設計選擇**。並排比較：

| 維度 | Hi Day（MUKI 開發）| LLM-Wiki（本知識庫範式） |
|---|---|---|
| **產品定位** | 自建 SaaS 筆記軟體（封閉系統，自家後端）| 文字檔知識庫（純檔案、Git 版控、GitHub Public）|
| **載體** | Web app + 雲端後端 + AI 代理 | Markdown + YAML frontmatter + `[[wikilink]]` |
| **AI 整合方式** | 內建 AI agent（透過 Claude / Codex 等 API 供應商）+ Clocko Channel 常駐側邊欄 | 由 [[Claude Code]] / [[Obsidian]] 外掛從外部讀寫，**不綁特定 LLM** |
| **資料主權** | SaaS 用戶資料在 MUKI 後端 | **檔案 100% 自有**，硬碟即離線存活 |
| **可移植性** | 弱（綁定 Hi Day 服務）| 強（純 markdown，任何工具可讀）|
| **檢索 / 串連機制** | AI 標籤分析（90 天總覽 / 時間軸 / 重點摘要）| `[[wikilink]]` 網路 + grep + Claude Code agentic search |
| **AI 介入時機** | 自動 —— AI 持續處理（標籤、洞察、摘要）| 半手動 —— `/llm-wiki ingest` 觸發 |
| **痛點來源** | MUKI 反 Obsidian「**3/4 注意力花在設定外掛而非寫筆記**」 | 本知識庫設計**接受外掛 / 設定成本**換取可移植性 |
| **分類系統** | AI 自動處理（不用維護卡片盒 / PARA / MOC）| 手動 + LLM 協助維護 entity / concept / src / synthesis 分類 |
| **AI 失控時的回復** | Hi Day 內建「跳出鍵」中斷 + 重申目標 | Claude Code 的 checkpoint 雙擊跳出回退 + git reset |
| **共同語言建立** | （此功能透過 Understand Anything + Agree with Docs 外掛達成）| 透過 [[CLAUDE-md\|CLAUDE.md]] schema + 主動 quiz + 個人吸收段 |
| **與作者的關係** | MUKI 既是 user 也是 developer，dogfood 自家產品 | 你是 user + LLM 是 maintainer，**不寫筆記軟體**寫筆記 |

### 兩條路的設計哲學差異

| 哲學軸 | Hi Day | LLM-Wiki |
|---|---|---|
| 「**筆記軟體應該幫使用者做多少事**」 | 多（AI 自動標籤、洞察、摘要、行事曆整合）| 少（純檔案 + 外部工具）|
| 「**封閉產品 vs 開放格式**」 | 封閉 SaaS（便利優先）| 開放格式（自由優先）|
| 「**痛點：花在設定外掛太多**」 | 透過自建產品避免（內建一切）| 透過**少做事**避免（不裝外掛、不維護 plugin 鏈）|

### 兩條路都同意的事

- AI 寫程式 / 寫摘要速度遠超人類 → **人類獨特價值在判斷而非執行**
- AI 自動分析比手動分類 ROI 高 —— 但實作不同：Hi Day 內建，LLM-Wiki 用 `/llm-wiki` skill
- 共同語言（詞彙表）對 AI 協作至關重要 —— Hi Day 內建 Understand Anything 工作流，LLM-Wiki 用 CLAUDE.md schema + 個人吸收段

### MUKI 反 Obsidian 痛點 vs 你的 LLM-Wiki 實踐

MUKI 反對 Obsidian 的兩大痛點：
1. **3/4 注意力花在設定外掛與調整佈景**
2. **分類系統需要持續維護才能串連**

對位你的 LLM-Wiki：
- 痛點 1 你**部分共感**：你 wiki 的 Obsidian 用法很 minimal（沒裝堆積如山的外掛），主要靠 Claude Code 維護 → 反而 MUKI 那條路是「**用一個複雜 SaaS 取代複雜外掛**」
- 痛點 2 你**主動共感**：你 wiki 也不維護 PARA / 卡片盒，分類用 LLM 動態做（按主題 + 因果關係連結）

**對話結論**：MUKI 走「**封閉 SaaS + AI 內建** + 自己 dogfood**」，你走「**開放格式 + AI 外接** + Karpathy 範式**」—— 兩者都是合理選擇但**沒有正面對決**（不能說誰贏）。如果你想避免「自建 SaaS 的維運負擔」（Hi Day 需要 MUKI 自己維護後端 + AI API 計費 + 用戶資料），LLM-Wiki 路線是省事的；如果你想「**體驗自動 AI 標籤分析**」效果，Hi Day 有現成產品可訂閱。

---

## 其他 4 個面向（摘要 + 對位強度標記）

> 以下 4 段對使用者實際 application（Hi Day vs LLM-wiki 對話）**弱對位**，僅作為 src 完整性保留，不過度展開。完整內容見 `raw/2026-06-04-plaud-workshop-ai-codev-summary.md`。

### 面向 A：MUKI 實作工具鏈全幅（⚠️ 對 LLM-wiki 對話弱對位 / 對自家 Claude Code workflow 強對位）

5 套工具：
- **Superpowers**（Anthropic Skill）：規劃階段腦力激盪 + 計劃拆解 + 子代理開發
- **`frontend-design`**（Claude Code 官方 skill）：A/B/C 三版 HTML 設計 + 混搭
- **Deep Wiki + Deep Wiki MCP**：對 GitHub 公開專案問答（[deepwiki.com](https://deepwiki.com)）
- **Understand Anything + Agree with Docs**：知識圖譜 + 詞彙表 + 業務邏輯文件
- **Git Work Tree**：多任務獨立工作目錄

對位本知識庫：
- 對 [[Agent-Skills]]：補強「Anthropic 公開 Superpowers skill」這條資訊
- 對 [[NotebookLM]] / [[OpenClaw]]：補強「對 codebase 問答」另一條路徑（Deep Wiki）
- 對 [[using-git-worktrees]]：MUKI 確認「已成為 AI 開發常用模式」

### 面向 B：26 個作業任務清單（⚠️ 對使用者實際 application 弱對位 / 部分可用作個人實作 checklist）

完整 26 項見 raw summary。對本知識庫 ingest 直接可用的 2-3 個：
- #13「在測試專案中建立 `CLAUDE.md` 或 `settings.json` 練習設定規則」—— 你本來就在做
- #14「研究 Git Hook 建立 pre-commit 自動檢查」—— [[Ratchet-Pattern]] 已涵蓋
- #22「演練一次人工中斷與回退」—— Claude Code checkpoint 用法

剩 23 個多屬「給做產品的人」，對使用者實際 application 對位弱。

### 面向 C：「定義 / 決定 / 負責」三大核心架構（⚠️ 弱對位 / 對客戶溝通強對位）

系統架構師在 AI 時代的角色三分：
- **定義**：明確化模糊需求、制定可上線準則、設計系統規格
- **決定**：判斷 AI 程式碼是否通過、AI 介入範圍與時機
- **負責**：系統出事真人承擔、親自審閱、必要時人類接管

> 這個三分對「**幫客戶寫 proposal**」或「**化解客戶『AI 取代我嗎』焦慮**」場合**極對位**，但這次 quiz 你沒選這個 application。可作未來重組路徑。

### 面向 D：Hi Day 產品具體設計（✅✅ 對 LLM-wiki 對話完美對位 —— 已詳列在「核心對話組」段）

- 五指標 Life Log（開始 / 結束 / 當前 / 想法 / 重要）
- AI 標籤分析三層（總覽 / 時間軸 / 90 天重點摘要）
- Dashboard 首頁洞察 + 任務 + 日記
- Clocko Channel 常駐側邊欄（**STT 待校：可能是 Claude Code 整合**）
- Google 行事曆串接

對位本知識庫 LLM-Wiki 範式詳見「核心對話組」段。

---

## 對話組（與既有頁面）

| 既有頁 | 對話面向 | 本次是否實質更新 |
|---|---|---|
| [[LLM-Wiki]] | **核心對話對手** —— Hi Day vs LLM-Wiki 兩種累積個人知識 | ❌ 不更新（主軸保留在本 src 頁；等第二個「自建 SaaS 筆記」案例出現時再升級）|
| [[Obsidian]] | MUKI 反 Obsidian「3/4 注意力花外掛」痛點 vs 你 minimal 外掛用法 | ❌ 不更新（單一資料點不改 entity）|
| [[Claude Code]] | Hi Day 內 AI agent 透過 Claude API + Claude Code workflow（Checkpoint / cloud.md）| ❌ 不更新 |
| [[CLAUDE-md]] | MUKI 確認「強烈措辭列不得修改項目」是常見用法 | ❌ 不更新（已含此實踐）|
| [[Agent-Skills]] | Superpowers / frontend-design / Understand Anything 等具體 skill 案例補強 | ❌ 不更新（弱對位，等更多案例再補）|
| [[Ratchet-Pattern]] | Pre-commit Hook + TDD 三步驟 + cloud.md 強制讀取 = ratchet 編碼具體實踐 | ❌ 不更新 |
| [[using-git-worktrees]] | MUKI「AI 開發常用模式」確認 | ❌ 不更新 |
| [[Andrej-Karpathy]] | 兩條範式（Karpathy LLM-Wiki vs MUKI Hi Day SaaS）的對標 | ❌ 不更新 |
| [[NotebookLM]] / [[OpenClaw]] | Deep Wiki 是另一條「對 codebase 問答」路徑 | ❌ 不更新（弱對位）|

**策略**：本 ingest 主軸是 Hi Day vs LLM-Wiki 對話組，**全部既有頁不實質更新**（只反向 link from src 頁），等下次同主題第二來源出現再升級。對應前次 [[src-anthropic-dynamic-workflows-claude-code-2026-06-02|Anthropic Workflows ingest]] 確立的「對話組擴展紀律」。

## 未來追蹤候選 entity / concept

| 候選 | 等級 | 建立 trigger |
|---|---|---|
| **MUKI** entity（張惠玲）| 中 | 本次第 1 次出現；再出現 1 次即建（目前以本 src 頁的「講師背景」段標記） |
| **Hi Day** entity（產品）| 中 | 同上 |
| **Deep Wiki** entity / concept | 中 | 對 [[NotebookLM]] / [[OpenClaw]] 形成「**公開 GitHub 專案 RAG**」第三條獨立來源；再出現 1 次即建 |
| **「定義 / 決定 / 負責」三大核心** concept | 高 | 對客戶溝通 / proposal 撰寫極對位；再出現 1 次即建 |
| **Understand Anything skill family** concept | 中 | 「知識圖譜 + 詞彙表 + 業務邏輯」工作流；如使用者實際試用 1 次再建 |
| **Checkpoint / 雙擊回退** concept | 低 | Claude Code 機制細節，目前 [[Claude Code]] 頁未必有單獨段；累積 2 次再建 |
| **Clocko / Codeless API 供應商** | 低 | STT 不確定，先擱置 |

## 信心評估

- **強**：MUKI 講師背景 + Hi Day 產品大致功能 + 5 大主題框架 — Plaud summary + transcript 雙重交叉
- **強**：CLAUDE.md / Pre-commit / TDD / Git Work Tree / Effort 等級等廣為人知工具的論述 — 與多個本知識庫既有頁對齊
- **強**：Hi Day vs LLM-Wiki 兩個實作的設計哲學差異 — 結構性對比清楚
- **中**：Superpowers / frontend-design / Understand Anything 等具體 skill 細節 — 第一手實作分享但缺第三方對照
- **中**：Clocko / Codeless 兩個 API 供應商名稱 — STT 不確定
- **時效**：2026-06-04 錄音，06-05 ingest 仍新鮮；Hi Day 是 active 產品，半年內可能改版

## 相關概念與來源

- [[LLM-Wiki]] — **核心對話組對手**
- [[Andrej-Karpathy]] — LLM-Wiki 範式提出者
- [[Obsidian]] — MUKI 痛點來源 vs 本知識庫實踐對位
- [[Claude Code]] — Hi Day 內 AI agent 的 API 之一
- [[CLAUDE-md]] — cloud.md（STT）= CLAUDE.md
- [[Ratchet-Pattern]] — Pre-commit / TDD / hook 對應
- [[Agent-Skills]] — Superpowers / frontend-design / Understand Anything 多 skill 補強
- [[using-git-worktrees]] — Git Work Tree 用法確認
- [[NotebookLM]] / [[OpenClaw]] — Deep Wiki 對位
- [[OpenAI-Codex-CLI]] — Effort 等級 High/XHigh/Low 對位

---

## 個人吸收（第 8 次 / spaced retrieval 預定 2026-06-19）

### Quiz 答案

**Q1（intent）：你想拿走什麼？（4 個全選）**
- MUKI 實作工具鏈全幅
- Hi Day 產品設計 + AI 筆記軟體實作
- 26 個作業任務清單
- 「定義 / 決定 / 負責」三大核心架構

**Q2（application）：用在什麼場合？（1 個）**
- **Hi Day vs 你 LLM-wiki 兩個實作對話**

### LLM 觀察：4×1 對位分析

| Intent ↓ \ Application → | Hi Day vs LLM-wiki 對話 |
|---|---|
| MUKI 工具鏈全幅 | ⚠️ **弱對位**：工具鏈是給「寫 SaaS 產品」用的，LLM-wiki workflow 對得上的只有 Deep Wiki 一條 |
| **Hi Day 產品設計** | ✅✅ **完美對位** —— 兩個都是「筆記累積系統」的設計選擇 |
| 26 作業任務清單 | ⚠️ **錯位**：給做產品的人，可用的只有 #13 / #14 / #22 三條 |
| 「定義 / 決定 / 負責」三大核心 | ⚠️ **錯位**：是「給客戶解釋」框架，跟「兩個實作對話」這個個人 reflection application 對位無關 |

**真正會啟動的 1 cell + 3 dead cell + 3 個「期待型」cell**：4 個 intent 都「想拿走」但其中 3 個對應到「**這次選的 application**」是 dead 的。

### 新型對位類型浮現（第 8 次發現）：「Intent 廣 / Application 窄錯位」

**延續第 7 次的「矩陣未對位錯位」（N×M 全選 → 多 dead cell），本次浮現新變體**：

| 對位類型 | 觸發條件 | 機制 | 案例 |
|---|---|---|---|
| 矩陣未對位錯位（第 7 次）| intent N + application M 都全選（N≥3, M≥3）| 對角線 cell 啟動 / 其他 cell dead | NVIDIA / Anthropic Workflows |
| **Intent 廣 / Application 窄錯位（第 8 次候選）**| intent N 全選 + **application 只選 1** | **「想學很多」但「只用在 1 個場合」→ N-1 個 intent 是「裝飾性期待」（讀過就好，不會真的用）**| **本次 MUKI 工作坊** |

### 兩種錯位的危險性比較

| 軸 | 矩陣未對位錯位 | Intent 廣 / Application 窄錯位 |
|---|---|---|
| **危險性** | 中 —— 多 cell dead 但 main diagonal 啟動 | **較高** —— 75-90% intent 完全不啟動，但讀完容易誤以為「全部都吸收了」|
| **常見場合** | 高密度 N×M 矩陣型 source（廠商 keynote）| **個人學習 / 累積認知** type ingest（這類 source 在 wiki 累積佔多數）|
| **偵測 heuristic** | 「如果只能用其中 1 cell，會選哪個？」| **「N-1 個 intent 對應到你選的這 1 個 application 真的會啟動嗎？是不是只是『讀過就好』？」**|
| **對策** | 矩陣化拆解標 dead cell | **強制承認「裝飾性期待」存在 → src 頁寫對位但弱對位部分不展開** |

### 完整對位 taxonomy（8 次後 → 4 大類 + 候選擴充 + 1 個亞型細分）

| 序 | 來源 | 大類 | 亞型 / 變體 |
|---|------|------|------|
| 1 | 曹興誠 RCA | 拿錯工具 | — |
| 2 | 雷小蒙週報 | 場合 > 工具 | — |
| 3 | 歐陽嘉隆 WP 工作流 | 場合 > 工具 | — |
| 4 | SHOPLINE Payments | 場合 > 工具 | — |
| 5 | NVIDIA GTC keynote | Source bias 錯位 | 賣方敘事型 |
| 6 | Google AI 搜尋指南 | Source bias 錯位 | 平台守門人壓制型 |
| 7 | Anthropic Dynamic Workflows | **矩陣未對位錯位** | — |
| 8 | **MUKI Plaud 工作坊** | **矩陣未對位錯位** | **Intent 廣 / Application 窄變體（候選）** |

> **注意**：本次只算第 7 類「矩陣未對位錯位」的**變體候選**，**尚未升級成獨立第 5 類**。原因：(1) N=1 case 只 1 次，樣本不足；(2) 跟第 7 類的「N×M 都全選」結構共同點是「intent 過多 vs application 過少」，本質可能是同類。**待第 9-10 次 ingest 再出現 1-2 次同樣 pattern 才升級**。

### 重組路徑建議

1. **「Hi Day vs LLM-wiki 對話」的後續實踐**：
   - 是否要訂閱 Hi Day 試用，實測「AI 自動標籤分析」對「累積筆記」的真實效益？
   - 還是繼續你 LLM-Wiki 路線，用 Claude Code 跑 ingest workflow？
   - 兩條路平行存在不衝突（Hi Day 給每天 life log，LLM-wiki 給知識庫）

2. **裝飾性期待 vs 實際 application 的紀律**：
   - 下次 quiz 答案出現「intent 全選 + application 1 個」時，**主動承認「N-1 個 intent 是期待型」**
   - 不要讓 src 頁因「想吸收很多」而塞進不會啟動的內容
   - 本 src 頁示範：3 個弱對位面向用 1 段標明對位強度 + 不展開細節

3. **未對應到本次 application 的 3 個面向去處**：
   - 「定義 / 決定 / 負責」三大核心 → 留候選 concept，**遇到客戶 proposal 撰寫時主動 recall**
   - MUKI 工具鏈全幅 → 留作 [[Agent-Skills]] 補強樣本
   - 26 作業任務 → 直接擱置（除 #13 / #14 / #22 三條對位你已實作項目）

### Spaced retrieval 約定（~2026-06-19）

回測題：
1. 不看本頁，**Hi Day 跟 LLM-Wiki 的核心差別**你能講出 2-3 條嗎？
2. 你最後**試了 Hi Day 嗎？**理由？
3. 「**Intent 廣 / Application 窄錯位**」這個觀念你還記得嗎？最近的 ingest / 學習有沒有這種「**想學很多但只有 1 個場合會用**」的情況？
4. MUKI 那「定義 / 決定 / 負責」三大核心你最後**真的拿去跟客戶講過嗎**？（這是第 1 次 ingest 時標明「對 client 強對位但未選的 application」的延伸觀察）

### 對應 [[Ratchet-Pattern]]

第 8 次吸收檢核促成的擴充：
- **新型對位錯位候選**：「Intent 廣 / Application 窄錯位」變體
- **新 heuristic**：「N-1 個 intent 對應到你選的這 1 個 application 真的會啟動嗎？是不是只是『讀過就好』？」
- **寫作紀律**：src 頁面對「intent 全選 / application 唯一」情境時，**主動承認裝飾性期待存在 → 對位強的部分深入展開、弱對位的部分用 1 段標明強度 + 不展開細節**（本 src 頁示範）
- **觀察延伸**：個人吸收型 ingest 比廠商型來源**更容易遇到 Intent 廣 / Application 窄錯位**（廠商型 source bias 顯性，個人學習裝飾性期待**隱性**）
