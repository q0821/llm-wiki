---
title: Claude Code
type: entity
sources: ["Claude + Obsidian 打造 AI 第二大腦，Karpathy 的知識管理 LLM Wiki 教學｜科技翰林院.md", "科技翰林院怎麼用 Claude Code 終端機？8 個實戰設定全公開.md", "只要 5 分鐘！Claude Code 無縫整合 NotebookLM 實戰.md", "【直播筆記】用 Claude Design × Claude Code × Figma 重新定義設計工作流程 - AAPD 產品設計學院.md", "Hermes Agent 成功案例 — 你的 AI 代理可以做什麼.md", "未命名.md"]
created: 2026-05-09
updated: 2026-05-14
tags: [agent, cli, anthropic, claude, second-brain, design-workflow, harness]
confidence: 強
---

# Claude Code

Anthropic 於 **2025 年**推出的 **agentic CLI 工具**，住在使用者的終端機，以自然語言驅動完成讀檔/改檔/跑指令/管 git 的完整 agent 級任務。

本知識庫所有 LLM 操作（[[LLM-Wiki|`/llm-wiki` 三步驟工作流]]、編輯 wiki 頁、跑 build）都依賴 Claude Code 執行。

## 基本資訊

- **發行**：Anthropic, 2025
- **介面**：終端機（macOS / Linux / Windows）
- **訂閱前提**：Claude Pro（$20/月）或 API
- **官方文件**：https://code.claude.com/docs/

## 與 GitHub Copilot 的根本差異

不是「自動完成下一行」，而是 **agent 級自主操作**：

> 你說「幫我把這個資料夾裡所有 Markdown 檔案加上 YAML frontmatter」，它就真的會掃描整個目錄、判斷哪些檔案缺少 metadata、然後一個一個補上。

## 核心能力（[[科技翰林院]] 整理）

| 能力 | 說明 | 知識管理用途 |
|---|---|---|
| **檔案讀寫** | 直接讀取、建立、編輯任何本機檔案 | 操作 [[Obsidian]] vault 裡的所有 .md 筆記 |
| **CLAUDE.md 持久記憶** | 每次啟動自動載入專案根目錄的 CLAUDE.md | 記住 vault 結構、筆記規範、偏好設定 |
| **Slash Commands** | 自訂指令放在 `.claude/commands/` 目錄 | 一鍵執行常用工作流 |
| **Subagent 平行處理** | 把複雜任務拆給多個子代理同時執行 | 同時掃描多個資料夾、批次加標籤 |
| **[[MCP]] 協議** | 透過 Model Context Protocol 連接外部服務 | 橋接 Obsidian 插件、外部資料來源 |
| **Scheduled Agents**（2026 新增）| 定時自動執行任務 | 每日整理昨天筆記、每週五自動產回顧 |

> 截至 2026-04，GitHub 上每天約 **13.5 萬筆公開 commit** 來自 Claude Code，佔全平台 4%。

## 三大設定機制

### 1. [[CLAUDE-md|CLAUDE.md]] — 持久記憶層

兩層分層：
- **全域** `~/.claude/CLAUDE.md`：跨專案通用偏好（語言、commit 格式、安全規則）
- **專案** `<root>/CLAUDE.md`：該專案特定規範（API endpoint、部署流程）

詳見 [[CLAUDE-md]] 概念頁。

### 2. [[Agent-Skills|Skills]] / `.claude/commands/`

Skills 是封裝化工作流範本，`/<name>` 觸發。比 prompt 優勢：流程化、可共用、不漏步驟。

詳見 [[Agent-Skills]] 概念頁。

### 3. Memory + Handoff（跨 session 記憶）

- **Memory**（`~/.claude/projects/`）：使用者糾正 → 自動學習；類型分 user / feedback / project / reference
- **Handoff**（`~/.claude/tasks/handoff.md`）：session 結束前主動寫紀錄、新 session 開頭先讀，繞過 auto-compaction 遺失規則的問題

詳見 [[src-techhanlin-claude-code-8-settings]]、[[src-claude-code-context-management]]。

## 實戰技巧

- **拖放圖片**：直接拖檔進終端機（多模態），免存檔找路徑
- **cmux 多 session 管理**：`brew install cmux`，多分頁不亂、可 detach/attach
- **狀態列自訂**：`~/.claude/statusline.sh` + `settings.json` 顯示模型/git 分支/額度倒數
- **Token 體檢**：定期掃 Skills 重複（[[科技翰林院]]實測 4 個重複 Skill 浪費 ~20k Token）

## 與其他 agentic CLI 的關係

| 工具 | 廠商 | 與 Claude Code 的差異 |
|---|---|---|
| **Claude Code** | Anthropic | 本頁主題；CLAUDE.md / Skills / Memory 三大機制最完整 |
| OpenAI Codex CLI | OpenAI | `AGENTS.md` 規範檔；harness 設計參考 [[Harness-Engineering]] |
| Gemini CLI | Google | 整合 [[NotebookLM]] 等 Google 生態 |
| Cursor | Anysphere | 編輯器級而非 CLI；用 `.cursorrules` |

中文圈推廣者：[[科技翰林院]]（方法論導向）、[[HC-AI-說人話]]（白話實作）。

## 與 [[LLM-Wiki]] 的核心關係

[[Andrej-Karpathy]] 的精準比喻：

> "Obsidian is the IDE; the LLM is the programmer; **the wiki is the codebase**."

Claude Code 即扮演那個 "programmer" 角色——在 [[Obsidian]] 上編輯本知識庫的 wiki 檔案。

## 與 [[Managed-Agents]] 的關係

Managed Agents 的設計哲學「Python SDK 薄層 + 重活 delegate Claude Code CLI subprocess」：本機 Claude Code 與雲端 Managed Agents 共用同一個底層 agent loop。詳見 [[src-az9713-managed-agents-tutorial]]。

## 作為 Harness 的元件拆解（[[Addy-Osmani]] / Fareed Khan 視角）

[[src-addy-osmani-harness-engineering|Addy Osmani]] 引述 Fareed Khan 對 Claude Code 架構的估計拆解，可作為理解 Claude Code 為何「比同底層模型的 agent 更穩」的工程視角：

| 架構元件 | 角色 | 與本知識庫機制的對應 |
|---|---|---|
| **Context injection** | 知識層——把必要背景送進 agent | `CLAUDE.md` 自動載入機制 |
| **Loop state** | memory store + worktree isolator | session 持久層 + 隔離工作區 |
| **Destructive-action hooks** | permission gate——危險操作前安全檢查 | 編輯前 read、執行前 confirm |
| **Subagent context firewall** | 多 agent 隔離——避免看到不該看的資訊 | Subagent 平行處理時的 context 切割 |
| **Tool dispatch registry** | 「工具總機」——MCP servers + bash 的接入點 | [[MCP]] 註冊與工具調用 |

> Addy 結論：「Claude Code 的演進，不只是底層模型變強，至少同樣程度是 harness 的演進。」這對應本知識庫觀察到的「Claude Code 三大設定機制」（CLAUDE.md / Skills / Memory + Handoff）就是 harness 七元件的具體實作。

## 與 [[Claude-Design]] 的 Hand-off 關係（[[Simon-Lin|Simon]] [[src-aapd-claude-design-figma-workflow|Demo]]）

[[Claude-Design]] 右上角 share → 「**Hand off to Claude Code**」自動產生 prompt 銜接。這條原生通道是「Claude 生態系真正的價值所在」（Simon 語）：

- [[Claude-Design]]：適合 0→1 探索與快速 Demo
- [[Claude Code]]：產品化階段的主力（解決 Claude Design 的 hard-coded、無 component、無版本控制問題）

可在 Claude Desktop App、Cursor、VS Code、Google Antigravity 等 IDE 的 terminal 呼叫。

**搭配 [[Figma]] [[MCP]]**：Claude Code 透過 Figma MCP 雙向操作 [[Figma]]（指令 `Figma capture` + `Figma delay`），實現 Code↔Figma 同步迭代。

## 信心評估

- **強**：核心能力與三大機制 — 多來源（[[科技翰林院]] 兩篇、[[HC-AI-說人話]]、Anthropic 官方文件）一致
- **強**：本知識庫即現行使用案例
- **中**：「2026 新增 Scheduled Agents」— 來源轉述，需確認官方文件是否仍是該稱呼

## 相關頁面

- [[CLAUDE-md]] — 主要設定檔規範
- [[Agent-Skills]] — Skill 系統
- [[MCP]] — 連接外部工具/資料的標準協議（Anthropic 推出）
- [[Obsidian]] — 配合的「IDE」
- [[LLM-Wiki]] — 本知識庫採用的方法論
- [[Managed-Agents]] — 雲端版 agent 託管
- [[Meta-Harness]] / [[Harness-Engineering]] — 背後的設計範式
- [[Gemma]] / [[LM-Studio]] — 本地 AI 對照組
- [[BrowseForge]] / [[Playwright]] — AI agent 操作瀏覽器的工具（透過 MCP / 自動化框架）
- [[Claude-Design]] — Hand off 來源
- [[Figma]] — 透過 [[MCP]] 雙向操作的設計工具
- [[Simon-Lin]] — 提供 Claude Design × Claude Code × Figma 整合工作流的實作 Demo
- [[Hermes-Agent]] — 互補的開源 agent；[[src-hermes-agent-99-cases]] 「跨代理統一記憶」case 將 Claude Code + Hermes + Cursor 串成同記憶層
- [[Harness-Engineering]] — Claude Code 是 harness 七元件的成熟實作；[[Addy-Osmani]] 引 Fareed Khan 對其架構分解
- [[Addy-Osmani]] — 對 Claude Code 架構提出元件拆解視角
- [[src-claude-code-context-management]] / [[src-techhanlin-claude-code-8-settings]] / [[src-aapd-claude-design-figma-workflow]] / [[src-hermes-agent-99-cases]] / [[src-addy-osmani-harness-engineering]] — 詳細工作流來源
