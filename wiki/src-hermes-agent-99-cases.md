---
title: Hermes Agent 成功案例 — 你的 AI 代理可以做什麼（99 個案例）
type: source
sources: ["Hermes Agent 成功案例 — 你的 AI 代理可以做什麼.md"]
created: 2026-05-14
updated: 2026-05-14
tags: [hermes-agent, agent-skills, self-improving, use-cases, ecosystem]
confidence: 中
---

# Hermes Agent 成功案例（99 個）

**整理者**：[[Gas-Khuang]]（gaskhuang.github.io）
**網站**：https://gaskhuang.github.io/hermes-agent-cases/
**原始 clip 日期**：2026-05-14
**規模**：99 個真實案例、15 個使用情境
**整理者數據宣稱**：最高省費 90%、最低運作成本 $10/月

## 核心主張

- [[Hermes-Agent]] 是 **Nous Research 出品的開源 agent 框架**，主打自我改進與跨平台訊息控制
- 99 個社群案例橫跨 13 個分類，從 Raspberry Pi 家庭 Jarvis 到企業 Azure 部署、加密 24/7 交易、自我改進 LLM Wiki 皆有實作
- 關鍵機制：**[[MEMORY-md|MEMORY.md]] 持久記憶 + Skill 自動生成 + [[CLAUDE-md|CLAUDE.md]] 載入專案情境 + 跨模型協作**
- 與 [[OpenClaw]] 的關係從「同類」變成「**被取代**」——多個遷移手冊與「再也不回頭」case
- 訊息平台覆蓋極廣：CLI、Telegram、WhatsApp、Discord、Email、iMessage、LINE、QQ、Feishu、Slack、Web Chat

## 案例分類分佈

| 分類 | 案例數（有原文連結者）| 代表案例 |
|---|---|---|
| **生態系工具** | 12 | Vessel Browser、Hermify 託管、Windows 桌面、awesome-hermes-agent、hermes mcp serve |
| **個人助理** | 10 | WhatsApp 全家共用、Raspberry Pi 家庭大腦、雙女兒睡前故事、Apple Health + Threads 整合 |
| **開發工作流程** | 9 | 多代理建置（規劃→撰碼→QA→上線）、跨代理統一記憶（Hermes + Claude Code + Cursor）、Skill Factory、jMunch MCP |
| **平台整合** | 9 | Firecrawl、Google Slides、Fastmail JMAP、桌面控制（截圖+鍵盤+滑鼠） |
| **企業應用** | 8 | Higress API Gateway、Vertex AI、Kubernetes 重啟交接、Azure 過濾器補丁、Ombre EU AI Act |
| **成本優化** | 5 | $5 VPS、Android 手機 -90% token、Hetzner $10/月 |
| **訊息平台** | 4 | LINE 日本/東南亞 9500 萬、QQ 中國、Feishu、Telegram 私有話題隔離 |
| **研究分析** | 4 | **自我改進 LLM Wiki** 第二大腦、審計 23 天 129 session、API 73% 固定開銷 |
| **商業營運** | 4 | Google Meet 轉錄 + Teams 控制（本地模型）、Supabase CRM |
| **隱私與自架** | 3 | Tailscale Serve、Edge GPU Gemma 4B 處理法律文件、5 防禦模式 |
| **內容創作** | 3 | LinkedIn 風格、每週熱門 AI 工具、影片腳本轉推文 |
| **創意媒體** | 2 | shadcn 金融儀表板 + Manim 動畫、TouchDesigner 視覺 Skill |
| **交易與市場** | 1 | 24/7 跨鏈加密交易代理 |
| **(無分類連結)** | 25 | 多代理建置、Polymarket、UGC 廣告、Jarvis 等早期 Demo case |

99 個 case 中有 74 個附第三方原文連結（HN、Reddit、Substack、Producthunt、gist、medium、tweet）；其餘 25 個應為早期 Demo 或開發者直接示範。

## 跨案例觀察到的模式

### 模式 1：「自我改進」三角

| 元件 | 作用 |
|---|---|
| **MEMORY.md / USER.md** | 跨 session 持久記憶（AI 自動更新） |
| **Skill 自動生成（Skill Factory）** | 靜默監看工作流，自動把有效方法寫成 `SKILL.md` |
| **偏好學習** | 第 1 次標準執行 → 第 5 次完全內化（代表 case：「第 10 天它比我更了解我的程式碼庫」） |

### 模式 2：多模型協作

「多代理自動建置流程（規劃→撰碼→QA→上線）」：
- 主代理（GPT-5.4）拆解需求
- 撰碼代理（MiniMax M2.7）實作
- QA 代理（本地 Qwen 35B）測試
- 「各階段用最適合的模型」省 token

> 具體模型版本未獨立驗證，列為**中度信心**。

### 模式 3：多訊息平台閘道（Gateway 架構）

「CLI/Gateway 優先的企業架構——13 個平台共用一個程序」：一套 Hermes 程序接通 13 個平台，避免每個平台單獨部署。

### 模式 4：成本壓縮極限

| 案例 | 月費 |
|---|---|
| Hetzner VPS + OpenRouter Claude Opus 全功能助理 | $10 |
| $5 VPS 佈建手冊（含避免意外帳單） | $5 |
| Android 手機跑 Hermes，削減 90% Token 費用 | 接近 0 |
| Tailscale Serve 安全遠端，無公開端口 | 0 |

對照 [[NotebookLM]] 免費方案、本地 [[LM-Studio]] + [[Gemma]] → 成本是社群討論的高頻主題。

### 模式 5：替代 SaaS 訂閱

「全家共用一個 WhatsApp AI 助理」直接點名取代「每月 $200 ChatGPT 訂閱」；「24/7 助理搭配 Supabase CRM」聲稱「低於 ChatGPT Plus 月費」。對照 [[src-will-ai-kill-saas-design]] 「Will AI Kill SaaS」主題——Hermes 是該命題的具體實作層證據。

## 代表案例展開

### 1. 自我改進的 LLM Wiki 第二大腦（研究分析）

**痛點**：「個人知識庫需要手動維護，時間久了會腐爛（outdated/incomplete）」

**Hermes 做法**：
- 自動爬取並索引內容
- 根據新資訊更新 Wiki 條目
- 維護知識圖譜，無需人工介入
- 自動發布靜態網站（wiki.ai-biz.app）
- Telegram 控制介面

**Skill**：Telegram 整合 / 網路爬蟲 / Markdown 靜態網站生成 / 知識庫同步 / Hetzner VPS 部署

**原文**：medium "How I built a self-improving LLM wiki with Hermes Agent **and why I'm not using Obsidian**"

> 這個 case 對本知識庫有特殊意義——它代表了與本知識庫（[[Obsidian]] + 人類監督 + [[Claude Code]] + LLM Wiki 範式）**直接的路線分歧**。本知識庫選擇「人類引導 + 來源不可變 + 矛盾並列」，該 case 選擇「全自動 + 永不腐爛」。值得追蹤對照。

### 2. 多代理自動建置流程（規劃 → 撰碼 → QA → 上線）

**痛點**：軟體開發各階段需人工協調；不同任務用相同大模型浪費 token

**Hermes 做法**：
- 主代理（GPT-5.4）拆解需求成執行階段
- 撰碼代理（MiniMax M2.7）逐階段實作
- QA 代理（本地 Qwen 35B）測試，失敗觸發修復迴圈
- 全程通過後自動上線

**對應**：[[Agentic-AI-Workflow]] 的具體實作；驗證「同心圓迭代」可在開源生態系實現。

### 3. 全家共用一個 WhatsApp AI 助理

**痛點**：「全家三人各自付 ChatGPT 訂閱費，每月 $200 美元」

**Hermes 做法**：
- WhatsApp 上架一個 Hermes 三人共用
- 自動識別並切換對應使用情境
- 具備主動行為（主動提醒、詢問、建議）
- WhatsApp 原生體驗，不需學習新 App

**成果**：取代每月 $200 訂閱；每人個人化體驗

### 4. 我自己建的架構跟 Hermes 完全一樣

**情境**：自己開發 AI 代理系統，結果與 Hermes 現成架構完全相同

**列出的 Hermes 核心元件**：
- 背景自我改進持續運作
- 持久記憶跨 session 保留上下文
- 從 CLAUDE.md 載入專案情境
- 自動建立並重用 Skill 函式庫
- 多代理協作處理 PR

**成果**：單週合併 300 個 PR

> 該 case 反向揭露了 Hermes 的架構元件清單——這是理解 [[Hermes-Agent]] 的最佳「骨架」說明。

### 5. 從 OpenClaw 換到 Hermes，再也不回頭

**情境**：[[OpenClaw]] 期間遇到功能限制

**遷移方法**：
- Shadow Mode 並行運行 Hermes 驗證
- 完整遷移手冊
- 切換後「功能更強、成本更低」

**對應**：[[OpenClaw]] 頁面需要記錄此趨勢。

### 6. Vessel Browser：以代理為主角的瀏覽器

**痛點**：「傳統瀏覽器自動化以人為主角、AI 為輔助；這個典範限制了代理的能力」

**Hermes 做法**：
- Hermes 是瀏覽器主要操作者
- 人類扮演監督和批准的角色
- Nous Research 黑客松誕生

**對照**：[[BrowseForge]] 是「人開瀏覽器 + AI 操作」的多指紋反偵測思路；Vessel Browser 走「以代理為主角」的路線——同類別不同設計哲學。

### 7. 跨代理統一記憶：Hermes + Claude Code + Cursor

讓三個獨立 agent 共用同一個記憶層，避免「重複說明偏好」。

**對應 [[Claude Code]]**：本知識庫使用 Claude Code 作為核心 agent；該 case 證實 Hermes 與 Claude Code 不必互斥，可組合。

### 8. Skill Factory：靜默監看工作流，自動生成可重用 Skill

跨多個 case 出現的核心模式——AI 自己生 SKILL.md（與本知識庫 `/llm-wiki` skill 由人類撰寫形成對照）。

### 9. 印刷工廠的任務中心記憶系統（企業應用）

代表 [[Hermes-Agent]] 不只在 AI 玩家社群，也進入傳統製造業 — 領域分散的訊號。

### 10. hermes mcp serve：把 Hermes 從單體代理變成可組合能力層

Hermes 把自己包裝成 [[MCP]] server，讓其他 agent 可呼叫 Hermes 的能力。這驗證了 [[MCP]] 頁面提到的「工具自帶 MCP server」模式擴散到 agent 本身。

### 11. 24/7 跨鏈加密交易代理（Hetzner 上全天候運作）

對應本知識庫的 [[雙幣贏]] / [[加密貨幣收益工具比較]] 主題——加密交易自動化是 Hermes 的常見領域，但與本知識庫的「手動操作 + 觀察」風格形成對照。

### 12. 在 Edge GPU 上處理法律文件，4B Gemma，零雲端 API（隱私與自架）

對應本知識庫 [[Gemma]] / [[LM-Studio]] 主題——驗證本地小模型 + Hermes 框架的可行性。

## 關鍵引用

> 「我們用過最好的自我改進代理。」——Clawdi 團隊（第三方獨立評測）

> 「100 → 216，48 小時獲利 116%；策略自動記錄、持續優化。」（自學天氣交易機器人案例）

> 「越用越聰明，越用越個人化；每次完成任務都可能自動建立新的可重用 Skill。」

> 「審計自己 23 天 129 個 session，發現合規問題。」

## 信心評估

- **強**：99 個案例的標題、分類分佈、案例外部連結存在（HN、Reddit、Substack 等可獨立查證）
- **強**：Hermes 的「跨平台 + MEMORY.md + Skill 自動生成 + CLAUDE.md 載入」核心架構（多 case 反覆出現一致）
- **中**：個別案例的具體績效數字（300 PR / 48 小時 116% / 90% token 省下）— 來自社群投稿，未獨立驗證
- **中**：具體模型版本（GPT-5.4、MiniMax M2.7、Qwen 35B）— 可能是案例描述風格的修辭，不一定是當下真實版本
- **弱**：「Nous Research 出品」推論 — 從 reddit URL 推斷，需另外驗證官方關係

## 與 Wiki 的關聯

### 新建頁面

- [[Hermes-Agent]]（entity，主實體）
- [[Gas-Khuang]]（entity，整理者）
- [[Self-Improving-Agent]]（concept，跨 case 萃取）

### 更新既有頁面

- [[OpenClaw]]：補「Hermes 遷移」段落
- [[Agent-Skills]]：補 Hermes Skill 生態（第三組生態系，與 Anthropic / Asgard 並列）
- [[MCP]]：補 `hermes mcp serve`、jMunch、Firecrawl、OSV 等 Hermes 周邊 MCP server
- [[Claude Code]]：補「跨代理統一記憶」案例（Hermes + Claude Code + Cursor 共用記憶）
- [[BrowseForge]]：補 Vessel Browser 對照
- [[LLM-Wiki]]：補「自我改進 LLM Wiki」路線對照
- [[Managed-Agents]]：補開源 vs 商業託管的對照
- [[Gemma]] / [[LM-Studio]]：補 Edge GPU 處理法律文件案例

### 形成的對話組

- **本來源 vs [[src-asgard-skills]]**：兩個 agent skill 生態系（Asgard 263 skills vs Hermes 99 cases）的並排比較
- **本來源 vs [[src-anthropic-managed-agents-engineering]]**：開源 agent（Hermes）vs 商業託管 agent（Claude Managed Agents）的範式選擇
- **本來源 vs [[src-techhanlin-llm-wiki-tutorial]]**：「自我改進 LLM Wiki」vs「人類引導 + Obsidian 監督」的兩條 LLM Wiki 路線

### 未來可延伸（待 user 確認）

- 為「自我改進 LLM Wiki」case 的 medium 原文做獨立 ingest（如果認同要追蹤對立路線）
- 為 Vessel Browser 做獨立 source（如果關注 agent-first browser 範式）
- 為 Skill Factory 做獨立概念頁
