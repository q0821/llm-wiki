---
title: Hermes Agent
type: entity
sources: ["Hermes Agent 成功案例 — 你的 AI 代理可以做什麼.md"]
created: 2026-05-14
updated: 2026-05-14
tags: [agent, open-source, self-improving, multi-platform, nous-research]
confidence: 中
---

# Hermes Agent

由 **Nous Research** 推出的開源 AI agent 框架，主打**自我改進**與**跨平台訊息控制**。代表性特徵：跨多家模型、多訊息平台、社群可貢獻 Skill 函式庫、MEMORY.md 持久記憶層。透過 [[src-hermes-agent-99-cases]] 整理出的 99 個社群案例可看出生態系規模——從個人 Jarvis、企業 Azure 部署、加密交易代理到「自我改進的 [[LLM-Wiki]] 第二大腦」皆有實作。

## 基本資訊

- **出處**：Nous Research（推測——多個 reddit 連結含 `nousresearch_hermes_agent`）
- **授權**：開源
- **整理案例網站**：https://gaskhuang.github.io/hermes-agent-cases/（[[Gas-Khuang]] 維護）
- **官方/社群網站**：awesome-hermes-agent（GitHub 精選清單）
- **生態網站**：hermesatlas.com（自動爬蟲生成的工具地圖）

## 核心特徵

### 1. 自我改進機制

跨多個 case 反覆出現的核心模式：

- **[[MEMORY-md|MEMORY.md]] / USER.md**：跨 session 持久記憶層，AI 自動更新
- **Skill 自動生成**：從完成的工作流提取有效方法，自動寫成 `SKILL.md`
- **偏好學習**：第 1 次標準執行 → 第 5 次完全內化使用者偏好（如 Code Review 案例）
- **越用越聰明**：第三方獨立評測稱為「最佳自我改進代理」（Clawdi 團隊）

### 2. CLAUDE.md 載入專案情境

與 [[Claude Code]] 同樣使用 [[CLAUDE-md|CLAUDE.md]] 範式：「從 CLAUDE.md 載入專案情境」是反覆出現的 Skill 條目。本知識庫亦使用同樣機制。

### 3. 多模型協作

代表案例：「多代理自動建置流程」
- **主代理（GPT-5.4）**：接需求、拆解階段
- **撰碼代理（MiniMax M2.7）**：逐階段實作
- **QA 代理（本地 Qwen 35B）**：執行測試 + 修復迴圈

設計哲學：「各階段用最適合的模型，大幅節省 token 費用」。

> 注意：來源中提到的具體模型版本（GPT-5.4、MiniMax M2.7、Qwen 35B 等）需另外驗證；2026-05 當下尚未獨立確認。

### 4. 訊息平台覆蓋

| 平台 | 用途 |
|---|---|
| Telegram | 私有話題各綁 Skill、Horse Racing 社群機器人 |
| WhatsApp | 全家共用 AI 助理（取代 ChatGPT $200/月訂閱） |
| Discord | 兒童機器人（DM 審批閘門）、研究簡報分發 |
| LINE | 觸及日本/東南亞 9500 萬用戶 |
| QQ Bot | 進入中國市場 |
| Feishu（飛書） | 工作區整合 |
| iMessage | Mac Studio 永遠在線助理 |
| Email | 每個 Hermes 一個專屬信箱 |
| Slack | 收件匣摘要自動分發 |
| Web Chat | 含深色/淺色主題、MEMORY.md 記憶 |
| CLI | Gateway 模式：13 個平台共用一個程序 |

### 5. MCP 整合

- `hermes mcp serve`：把 Hermes 從單體代理變成可組合能力層（自己當 MCP server）
- **jMunch MCP**：52 個程式碼智能工具，token 效率極高
- **Firecrawl 整合**：爬網、搜尋、與網頁互動
- **OSV 惡意軟體掃描**：MCP 套件安裝前自動安全檢查

詳見 [[MCP]] 概念頁。

### 6. 部署選項

| 環境 | 案例 |
|---|---|
| Raspberry Pi 4 | 家庭 AI 中央大腦 |
| Android Termux | 削減 90% Token 費用 |
| Mac Studio | iMessage 永遠在線助理、M2 Ultra 多代理 Pod |
| $5–$10 VPS | Hetzner、Hostinger 完整設定 |
| Vercel Sandbox | 快照式持久化 |
| Kubernetes Pod | 重啟時無縫交接，上下文零遺失 |
| Google Vertex AI | 企業整合 |
| Azure OpenAI | 含安全過濾器補丁 |
| Edge GPU | Gemma 4B 處理法律文件、零雲端 API |

## 與其他 Agent 工具的對比

| 工具 | 主要載體 | 特徵 | 與 Hermes 的關係 |
|---|---|---|---|
| **Hermes Agent** | CLI + 多訊息平台 | 自我改進、社群 Skill、跨模型 | 本頁主題 |
| [[Claude Code]] | CLI（terminal） | CLAUDE.md / Skills / Memory；Anthropic 親生 | **互補**——「跨代理統一記憶」case：Hermes + Claude Code + Cursor 共用記憶層 |
| [[Managed-Agents]] | Anthropic 雲端 | session / harness / sandbox 三層 | 對比：商業託管 vs 開源自架 |
| [[OpenClaw]] | Telegram/Discord/Slack | 較早的開源 agent 框架 | **被替代**——多個 case 提到「從 OpenClaw 換到 Hermes，再也不回頭」，有完整遷移手冊（Shadow Mode 並行測試） |

## 與 [[OpenClaw]] 的遷移敘事

[[src-hermes-agent-99-cases|99 個案例]] 中有兩個 case 直接記錄 [[OpenClaw]] → Hermes 的遷移：

1. **「從 OpenClaw 換到 Hermes，再也不回頭」**：影子模式（Shadow Mode）並行測試 → 切換 → 「功能更強、成本更低」
2. **「從 OpenClaw 無縫遷移到 Hermes 的完整手冊」**：社群整理的遷移工具

> 對本知識庫而言：[[OpenClaw]] 頁面需要記錄「2026 年起被 Hermes 取代」的趨勢。

## 與 [[LLM-Wiki]] 的關係

「**自我改進的 LLM Wiki 第二大腦**」case：
- 自動爬取並索引內容
- 維護知識圖譜，無需人工介入
- 自動發布靜態網站（wiki.ai-biz.app）
- Telegram 控制介面

> 該 case 連結為 medium 文章標題 "How I built a self-improving LLM wiki with Hermes Agent and why I'm not using Obsidian"——這是與本知識庫（採用 [[Obsidian]] + 人類監督）的直接路線分歧。值得追蹤對照。

詳見 [[src-hermes-agent-99-cases#代表案例：自我改進的 LLM Wiki 第二大腦]]。

## 在各來源中的角色

- [[src-hermes-agent-99-cases]]：99 個社群案例（Gas Khuang 整理），按 13 個使用情境分類

## 信心評估

- **強**：99 個案例的存在與分類分佈、社群生態（Hermes Atlas、awesome-hermes-agent、Hermify 託管）
- **中**：「自我改進」「Skill 自動生成」「MEMORY.md」等核心機制 — 多 case 反覆出現但屬整理者轉述
- **弱**：具體模型版本（GPT-5.4、MiniMax M2.7、Qwen 35B 等）、具體績效數字（48 小時獲利 116%、單週 300 PR 等）— 來自社群投稿，未獨立驗證
- **弱**：Nous Research 是出處 — 從 reddit URL 中的 `nousresearch_hermes_agent` 推斷，需另外驗證官方關係

## 相關實體

- [[Gas-Khuang]] — 99 案例網站的整理者
- [[OpenClaw]] — 被多個 case 標記為遷移來源的舊框架
- [[Claude Code]] / [[Managed-Agents]] — 互補/競爭的 agent 工具
- [[BrowseForge]] — 同類「以 agent 為主角」的瀏覽器工具；對應 case「Vessel Browser」

## 相關概念

- [[Self-Improving-Agent]] — Hermes 是該範式的代表實作
- [[Agent-Skills]] — Hermes 的 Skill 系統屬該範式的第三組生態（與 Anthropic Skills、Asgard Skills 並列）
- [[MCP]] — Hermes 多面向使用 MCP（自己當 server、整合 jMunch / Firecrawl / OSV）
- [[CLAUDE-md]] — Hermes 沿用 CLAUDE.md 範式載入專案情境
- [[LLM-Wiki]] — 99 案例中有「自我改進的 LLM Wiki」path 分歧案例
- [[Agentic-AI-Workflow]] — 多代理協作（主代理 + 撰碼 + QA）是該範式的具體實踐
