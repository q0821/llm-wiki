---
title: AGENTS.md
type: concept
sources: ["cloudflare-ai-code-review.md", "Harness Engineering（AI駕馭工程）入門篇：OpenAI最新編程標準，教你輕鬆做到Lv.1.md"]
created: 2026-05-18
updated: 2026-05-18
tags: [agents-md, agentic-cli, configuration, schema, persistent-memory]
confidence: 強
---

# AGENTS.md

放在專案根目錄的 markdown 規範檔，作為 [[OpenAI-Codex-CLI]] / [[OpenCode]] 等 agentic CLI 啟動時的**專案情境注入**。與 [[Claude Code]] 的 [[CLAUDE-md|CLAUDE.md]] 為平行對照——同範式，不同 agentic CLI 廠商各自的命名。

## 定義

- **位置**：專案根目錄
- **格式**：純 markdown
- **載入時機**：agentic CLI 啟動時自動讀取，作為 system prompt 的一部分
- **內容性質**：專案結構 / 慣例 / 工具 / 套件管理 / 測試框架 / CI/CD / 不可做事項

## 與 [[CLAUDE-md|CLAUDE.md]] 的對照

| 維度 | CLAUDE.md | AGENTS.md |
|---|---|---|
| 主要使用者 | [[Claude Code]] | [[OpenAI-Codex-CLI]] / [[OpenCode]] / 其他 agentic CLI |
| 廠商 | Anthropic | OpenAI（最初）/ 開源 agentic CLI 通用 |
| 範式相同 | 飛行員 checklist 而非冗長指南 | 同 |
| 長度建議 | 100 行以內、200 行就該精簡 | 超過 200 行視為脈絡膨脹反模式 |
| Ratchet 應用 | 每條規則應能追溯到失敗 | 同範式 |

兩者**互通**：許多 AI 工程實踐者把同樣內容兩份檔案並存或建 symlink，讓不同 agentic CLI 都能使用。

## Cloudflare 的 AGENTS.md 審查者（[[src-cloudflare-ai-code-review|production 案例]]）

[[Cloudflare]] AI code review 系統有專門的 **AGENTS.md 審查者**評估 MR 重大程度，提醒開發者更新 AI 指示。變更分三層：

| 層級 | 觸發條件 | 行動 |
|---|---|---|
| **高實質** | 套件管理器 / 測試框架 / 建置工具變更 / 主要目錄重構 / 新增 env / CI/CD 變更 | 強烈建議更新 AGENTS.md |
| **中等實質** | 主要依賴升級 / 新 linting 規則 / API 客戶端變更 / 狀態管理變更 | 值得考慮更新 |
| **低實質** | bug 修復 / 既有模式新增功能 / 次要依賴 / CSS 變更 | 無需更新 |

### 對既有 AGENTS.md 的反模式扣分

| 反模式 | 為什麼扣分 |
|---|---|
| **通用填充內容** | agent 已知的廢話佔脈絡 |
| **超過 200 行** | 脈絡膨脹、auto-compaction 易壓掉 |
| **沒有可執行命令的工具名稱** | 「使用 X 工具」但無 `<command>` 等於沒講 |

> 「簡潔、實用、包含命令與邊界的 AGENTS.md 永遠勝過冗長版本。」

對應 [[CLAUDE-md]] 的「飛行員 checklist」隱喻——兩家工程社群獨立得出**同一準則**。

## 與 [[Harness-Engineering]] 七元件的位置

依 [[Addy-Osmani]] [[src-addy-osmani-harness-engineering|七元件分解]]，AGENTS.md 屬於 **System prompt 系列**（工作說明書），與 CLAUDE.md / skill files / subagent instructions 並列。

[[OpenAI-Codex-CLI]] 的 [[Harness-Engineering|Harness Engineering]] 範式中，AGENTS.md 是 **Context Engineering** 支柱的核心載體——把專案的「靜態上下文」（架構規範、API 合約、coding style）寫進 markdown，agent 啟動自動讀。

## AGENTS.md vs APP-FLOW.md 的分工

對應 [[src-akiraxclaw-app-flow-trick|App Flow Doc]]，本知識庫已記錄的「給 AI 看的設計/規格文件」家族：

| 檔名 | 內容類型 | 性質 |
|---|---|---|
| **CLAUDE.md / AGENTS.md** | Agent 工作規則、硬規則、流程護欄 | 行為規範（怎麼做事） |
| [[DESIGN-md|DESIGN.md]] | 視覺/品牌設計系統 | 行為規範（視覺風格） |
| `APP-FLOW.json`（[[src-akiraxclaw-app-flow-trick]]）| 系統核心流程結構化描述 | 系統地圖（系統長什麼樣） |

三者**互補**——AGENTS.md 講「怎麼做」、DESIGN.md 講「長什麼樣」、APP-FLOW.json 講「系統哪些流程」。

## 在各來源中的角色

- [[src-cloudflare-ai-code-review]]：詳述 AGENTS.md 審查者的三層評估標準與反模式扣分；確認 AGENTS.md 在 [[OpenCode]] 生態中等同 [[CLAUDE-md|CLAUDE.md]] 在 [[Claude Code]] 中的地位
- [[src-harness-engineering-openai]]：[[OpenAI-Codex-CLI]] [[Harness-Engineering]] 範式中提到 AGENTS.md 應該是「目錄」指向 `docs/`，不當「百科全書」

## Ratchet 原則的同源呼應

本知識庫 [[CLAUDE-md]] 頁已記錄「每條規則應能追溯到某個失敗」的 [[Ratchet-Pattern]]。Cloudflare 的 AGENTS.md 審查者反模式扣分（通用填充、超 200 行、無命令工具名稱）是同一原則的具體執行——**ratchet 不只累積規則，也防止「假規則」（無實質作用的填充）累積**。

## 信心評估

- **強**：與 [[CLAUDE-md]] 平行對照定位 —— 兩個獨立來源（[[src-harness-engineering-openai]] / [[src-cloudflare-ai-code-review]]）+ [[src-addy-osmani-harness-engineering]] 提及
- **強**：Cloudflare 三層實質變更分類與反模式扣分標準 —— production case 第一手揭露
- **中**：與 OpenCode / Codex CLI 之外的廣泛 agentic CLI 採用程度 —— 待累積更多來源驗證

## 相關概念

- [[CLAUDE-md]] — 平行對照組
- [[Harness-Engineering]] — System prompt 系列元件
- [[Ratchet-Pattern]] — 規則累積與防腐機制
- [[DESIGN-md]] / [[src-akiraxclaw-app-flow-trick]] — 同類「給 AI 看的設計/規格文件」家族
- [[Context-Rot]] — AGENTS.md 過長就是 context rot 的源頭之一

## 相關實體

- [[OpenAI-Codex-CLI]] / [[OpenCode]] — 主要使用 AGENTS.md 的 agentic CLI
- [[Claude Code]] — CLAUDE.md 的對應廠商；許多實踐者兩份檔案並存
- [[Cloudflare]] — 在 AI code review 系統中設專門的 AGENTS.md 審查者
