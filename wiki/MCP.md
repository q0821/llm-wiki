---
title: MCP (Model Context Protocol)
type: concept
sources: ["yt-別再小看本地-aigemma-4-lm-studio-讓你的電腦變成超級離線-ai-工作站而且完全免費-手機也能使用喔.md", "Claude + Obsidian 打造 AI 第二大腦，Karpathy 的知識管理 LLM Wiki 教學｜科技翰林院.md", "scaling-managed-agents-decoupling-the-brain-from-the-hands-anthropic.md", "github-nczz-browseforge.md", "welly-seo-2026-04-full.md", "【直播筆記】用 Claude Design × Claude Code × Figma 重新定義設計工作流程 - AAPD 產品設計學院.md", "Hermes Agent 成功案例 — 你的 AI 代理可以做什麼.md"]
created: 2026-05-10
updated: 2026-05-14
tags: [協議, mcp, anthropic, ai-tools, 互通, figma, hermes]
confidence: 強
---

# MCP（Model Context Protocol）

Anthropic 推出的**開放協議標準**，定義 AI 模型如何與外部工具/資料來源溝通——把「AI 接外掛」這件事**標準化**，讓任何支援 MCP 的 AI 客戶端都能用同一套伺服器。

可視為 AI 工具世界的「**USB**」或「**翻譯機**」（[[PAPAYA-電腦教室]] 的白話定義）。

## 核心概念

| 角色 | 職責 |
|---|---|
| **MCP Client** | AI 應用端（[[Claude Code]]、Claude Desktop、[[LM-Studio]]、Continue 等）|
| **MCP Server** | 提供具體能力的服務（Brave Search、Filesystem、Gmail、Obsidian vault 等）|
| **Protocol** | 標準化的訊息格式，讓 client 與 server 解耦 |

## 與既有方案的對比

| 方案 | 性質 | 限制 |
|---|---|---|
| **MCP** | 開放協議、跨家相容 | 較新（2024-2025 起推廣）|
| OpenAI Function Calling | 廠商 API | 鎖在 OpenAI 生態 |
| Tools API（各家）| 廠商 API | 互不相容 |
| Plugin store（如 GPTs）| 鎖在單一平台 | 無法跨 client |

> MCP 的設計目標：**寫一次 MCP server，所有支援 MCP 的 AI 都能用**。

## 客戶端與伺服器覆蓋（截至 2026）

### MCP Client（AI 應用端）

| 客戶端 | MCP 支援 | 來源 |
|---|---|---|
| **Claude Desktop** | 原生支援 | Anthropic |
| **[[Claude Code]]** | 原生支援 | [[src-techhanlin-llm-wiki-tutorial\|科技翰林院 LLM Wiki 教學]]提到 |
| **[[LM-Studio]]** | 原生支援 | [[src-papaya-gemma-lm-studio\|PAPAYA Gemma 教學]]實測 |
| **Continue（VS Code 擴充）** | 支援 | 同上 |
| **Kiro CLI** | 支援 | [[src-browseforge\|BrowseForge README]]提到 |
| **[[Managed-Agents]]** | 內建 tool orchestration | [[src-anthropic-managed-agents-engineering\|Anthropic 工程部落格]]提到 |

### MCP Server（提供能力端）— 範例

| Server | 提供什麼 | 來源 |
|---|---|---|
| Brave Search | 連網搜尋（免費 1000 次/月）| [[src-papaya-gemma-lm-studio]] |
| Filesystem | 本機檔案操作 | 同上 |
| **[[BrowseForge]]**（內建）| 多指紋瀏覽器操作（12 tools：建 profile、開瀏覽器、navigate、click、screenshot…）| [[src-browseforge]] |
| Obsidian vault（obsidian-claude-code-mcp）| 操作筆記庫 | [[src-techhanlin-llm-wiki-tutorial]] |
| **[[Figma]] MCP** | 雙向操作 [[Figma]]：建立 component / variables / layout，或讀取設計檔反映到程式碼 | [[src-aapd-claude-design-figma-workflow]] |
| **[[Hermes-Agent]] mcp serve** | 把 Hermes 包裝成 MCP server，讓其他 agent 呼叫 Hermes 能力 | [[src-hermes-agent-99-cases]] |
| **jMunch MCP** | 52 個程式碼智能工具，token 效率極高（Hermes 周邊）| 同上 |
| **Firecrawl** | 爬網、搜尋、與網頁互動的 MCP server | 同上 |
| **OSV Scanner**（MCP 套件用）| MCP 套件安裝前自動執行惡意軟體掃描，過濾敏感憑證 | 同上 |

> 觀察：MCP server 端正在從「Anthropic 官方提供」擴散到「**第三方工具自帶**」——[[BrowseForge]] 把「我這個工具能做的事」直接包成 MCP server，AI agent 不必知道它的 REST API 細節。

## 採用現況：極早期

[[Cloudflare]] Radar 2026-04-13 掃 108,774 個 top 200,000 domains：

| 標準 | 採用率 |
|---|---|
| robots.txt | 78% |
| Link headers | 8.7% |
| Markdown negotiation | 4.6% |
| [[Agent-Skills\|Agent Skills]] | 0.015% |
| **MCP Server Card** | **0.0092%** |
| WebMCP | 0% |

> 意思：MCP 在「AI client 端」（Claude Desktop / Claude Code / LM Studio…）已是標配，但在「**網站作為 MCP server 端**」幾乎沒人做（0.0092%）。對照 [[GEO]]：這是 Agent-Ready 網站的 Level 4，先行者紅利期。詳見 [[src-welly-seo-2026-04]]。

## 在本地 AI 的關鍵價值

[[PAPAYA-電腦教室]] [[src-papaya-gemma-lm-studio|示範]]：MCP 補足本地小模型的兩大缺口——

1. **連網搜尋**：[[Gemma]] 本身沒有 internet → 透過 Brave Search MCP（每月 1000 次免費）獲取即時資訊
2. **檔案系統權限**：Gemma 本身不能存取本機檔案 → 透過 Filesystem MCP 整理資料夾

> 沒有 MCP，本地小模型只能聊天；有 MCP，它變成可執行任務的助理。

## 在雲端 AI 的關鍵價值

對 [[Claude Code]] / [[Managed-Agents]] 等已有強推理能力的雲端 AI：

- **連接專屬資料源**：例如 Obsidian vault、公司內部資料庫
- **跨工具整合**：Gmail、Calendar、Linear、GitHub 等
- **可組合性**：不必每家 AI 廠商重做一份整合

## 在設計工作流的應用：Figma MCP（[[Simon-Lin|Simon]] [[src-aapd-claude-design-figma-workflow|Demo]]）

[[Simon-Lin|Simon]] 用「**萬用插頭**」比喻 MCP——AI 可以接上任何工具跟它溝通。透過 [[Figma]] MCP，[[Claude Code]] 可以：

| 方向 | 操作 |
|---|---|
| Code → Figma | 新增 component、建立 variables、設定 layout、直接畫新頁面；指令範例 `Figma capture` + `Figma delay` |
| Figma → Code | 在 Figma 端調整設計（如版位左右對調），複製選取連結貼回 Claude Code，AI 自動讀取 Figma 最新狀態同步到程式碼 |

**現況限制**（信心：強）：
- MCP 串接還有不少 bug
- Auto layout 處理得不夠漂亮，色彩可能 hard-coded
- 需要設計師事後手動檢查跟補強
- 「堪用但離完美、乾淨還有一段距離」

這驗證了 [[BrowseForge]] 之外的另一個典型「**工具自帶 MCP server**」模式——[[Figma]] 把自家能力暴露為 MCP server，AI 不必知道 Figma REST API 細節。

## 安全議題：工具描述會進到 prompt

[[src-addy-osmani-harness-engineering|Addy Osmani]] 提出的重要警示：

> 「一個品質很差、甚至有惡意的外部整合，例如未驗證的 MCP server，可能在 agent 開始工作之前，就已經把不該有的指令注入進去。」

對應的影響：**工具不只是工具，它的說明文字也會影響 agent 的判斷**。挑 MCP server 時要看：

| 評估點 | 為什麼重要 |
|---|---|
| **作者/發佈者**信譽 | 未驗證來源可能藏 prompt injection |
| **工具描述的健康度** | 描述本身就是 prompt 的一部分 |
| **權限範圍** | 是否要操作敏感資源（檔案、網路、credentials） |
| **掃描機制** | [[Hermes-Agent]] 的 OSV Skill Scanner 就是針對此議題的對策 |

> 對應 Addy 引述「**10 個職責清楚、描述精準的工具，永遠比 50 個功能重疊的工具更好用**」——MCP server 不是越多越好。

## Agent 把自己包成 MCP server：hermes mcp serve

[[src-hermes-agent-99-cases]] 中的「**hermes mcp serve：把 Hermes 從單體代理變成可組合能力層**」案例代表 MCP 的進一步擴散——**agent 本身可以成為 MCP server**，讓其他 agent（如 [[Claude Code]]、Cursor）呼叫它的能力。

「工具自帶 MCP server」與「agent 自帶 MCP server」一起形成 MCP 生態系的兩個典型方向：
- 工具方向（[[Figma]]、[[BrowseForge]]）：把工具能力暴露給 AI
- agent 方向（[[Hermes-Agent]]）：把 agent 能力暴露給其他 agent，形成可組合的 agent 網

## 設定範例（影片實戰）

### Brave Search MCP（連網）

1. 註冊 Brave Search 帳號 + 申請 API key（綁信用卡身份驗證、免費 1000 次/月）
2. **去 Claude / ChatGPT 請它寫 MCP 設定 JSON**（meta 工作流）
3. LM Studio → 工具標籤 → 編輯 MCP → 貼設定 + API key → 儲存
4. 側邊欄開啟 Brave Search 開關 → 測試提問「找最新 AI 新聞」

### Filesystem MCP（檔案管理）

注意點：**路徑必須絕對路徑**，不能寫 `Downloads`，AI 會誤判為相對路徑。

修正方式：在 system prompt 內補充絕對路徑（如 `/Users/xxx/Downloads`）。

## meta 工作流：用 AI 設定 AI

[[PAPAYA-電腦教室]] 點出的有趣現象：

> 「==看起來似乎很麻煩，但實際上我們只需到 ChatGPT 或 Claude 的網站，直接請 AI 幫我們做好設定就 OK 了==。」

雲端 AI（會寫 JSON、知道 MCP 規範）→ 幫使用者設定本地 AI（執行 token 重活）的 MCP server。**人類只負責決定「要連什麼」，配置細節交給 AI**。

## 信心評估

- **強**：協議定位、客戶端支援清單 — Anthropic 官方文件 + 多來源驗證
- **強**：本地 / 雲端兩種使用情境 — 多影片與部落格實測
- **中**：「廠商比較表」中其他方案的描述 — 為簡述，深度比較需另查

## 相關頁面

- [[Claude Code]] — MCP 主要客戶端之一
- [[LM-Studio]] — 本地 AI 透過 MCP 接外部工具（client 端範例）
- [[BrowseForge]] — 工具自帶 MCP server（server 端範例）
- [[Playwright]] — 瀏覽器類 MCP server 的常見底層
- [[Gemma]] — 透過 MCP 突破本地模型限制的代表
- [[Managed-Agents]] — Anthropic 雲端 agent 服務也用 MCP
- [[Agent-Skills]] — 概念對照：Skills 封裝工作流，MCP 連接外部工具
- [[GEO]] — 網站暴露 MCP Server Card 是 Agent-Ready 的 Level 4
- [[Cloudflare]] — Radar 追蹤 MCP Server Card 採用率
- [[Figma]] — 透過 Figma MCP 雙向操作設計檔的代表案例
- [[Hermes-Agent]] — `hermes mcp serve` 把 agent 包成 MCP server 的代表
- [[Harness-Engineering]] — MCP 是七元件中「Tools / 工具箱」的代表
- [[Addy-Osmani]] — 提出 MCP 工具描述安全議題
- [[Cloudflare]] — `@opencode-reviewer/gitlab` 外掛中的「MCP 評論伺服器」與 GitLab MR 整合（[[src-cloudflare-ai-code-review]]）
- [[src-papaya-gemma-lm-studio]] / [[src-browseforge]] / [[src-anthropic-managed-agents-engineering]] / [[src-techhanlin-llm-wiki-tutorial]] / [[src-welly-seo-2026-04]] / [[src-aapd-claude-design-figma-workflow]] / [[src-hermes-agent-99-cases]] / [[src-addy-osmani-harness-engineering]] / [[src-cloudflare-ai-code-review]] — 提及 MCP 的來源
