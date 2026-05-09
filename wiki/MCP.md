---
title: MCP (Model Context Protocol)
type: concept
sources: ["yt-別再小看本地-aigemma-4-lm-studio-讓你的電腦變成超級離線-ai-工作站而且完全免費-手機也能使用喔.md", "Claude + Obsidian 打造 AI 第二大腦，Karpathy 的知識管理 LLM Wiki 教學｜科技翰林院.md", "scaling-managed-agents-decoupling-the-brain-from-the-hands-anthropic.md"]
created: 2026-05-10
updated: 2026-05-10
tags: [協議, mcp, anthropic, ai-tools, 互通]
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

## 客戶端覆蓋（截至 2026）

| 客戶端 | MCP 支援 | 來源 |
|---|---|---|
| **Claude Desktop** | 原生支援 | Anthropic |
| **[[Claude Code]]** | 原生支援 | [[src-techhanlin-llm-wiki-tutorial\|科技翰林院 LLM Wiki 教學]]提到 |
| **[[LM-Studio]]** | 原生支援 | [[src-papaya-gemma-lm-studio\|PAPAYA Gemma 教學]]實測 |
| **Continue（VS Code 擴充）** | 支援 | 同上 |
| **[[Managed-Agents]]** | 內建 tool orchestration | [[src-anthropic-managed-agents-engineering\|Anthropic 工程部落格]]提到 |

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
- [[LM-Studio]] — 本地 AI 透過 MCP 接外部工具
- [[Gemma]] — 透過 MCP 突破本地模型限制的代表
- [[Managed-Agents]] — Anthropic 雲端 agent 服務也用 MCP
- [[Agent-Skills]] — 概念對照：Skills 封裝工作流，MCP 連接外部工具
- [[src-papaya-gemma-lm-studio]] / [[src-anthropic-managed-agents-engineering]] / [[src-techhanlin-llm-wiki-tutorial]] — 提及 MCP 的來源
