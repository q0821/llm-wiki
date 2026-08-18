---
title: Claude Code
type: entity
sources: ["Claude + Obsidian 打造 AI 第二大腦，Karpathy 的知識管理 LLM Wiki 教學｜科技翰林院.md", "科技翰林院怎麼用 Claude Code 終端機？8 個實戰設定全公開.md", "只要 5 分鐘！Claude Code 無縫整合 NotebookLM 實戰.md", "【直播筆記】用 Claude Design × Claude Code × Figma 重新定義設計工作流程 - AAPD 產品設計學院.md", "Hermes Agent 成功案例 — 你的 AI 代理可以做什麼.md", "未命名.md", "claude-blog-large-codebases.md", "yt-ai-一小時做完電商頁面-uiux-設計師拆解它差在哪裡.md"]
created: 2026-05-09
updated: 2026-08-19
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
- **狀態列自訂**：`~/.claude/statusline.sh` + `settings.json` 顯示模型/git 分支/額度倒數（現成方案見 [[src-coralline-statusline-2026-06|coralline]]：仿 Powerlevel10k、9 主題、可叫 AI 訪談式安裝）
- **Token 體檢**：定期掃 Skills 重複（[[科技翰林院]]實測 4 個重複 Skill 浪費 ~20k Token）

## 與其他 agentic CLI 的關係

| 工具 | 廠商 | 與 Claude Code 的差異 |
|---|---|---|
| **Claude Code** | Anthropic | 本頁主題；CLAUDE.md / Skills / Memory 三大機制最完整 |
| [[OpenAI-Codex-CLI]] | OpenAI | `AGENTS.md` 規範檔；harness 設計參考 [[Harness-Engineering]]；含 `codex adversarial-review` 對抗式 review CLI |
| [[OpenCode]] | 開源（社群）| **伺服器優先 SDK**；Cloudflare 提交 45+ PR；可程式化包裝（[[src-cloudflare-ai-code-review|case]]）|
| Gemini CLI | Google | 整合 [[NotebookLM]] 等 Google 生態 |
| Cursor | Anysphere | 編輯器級而非 CLI；用 `.cursorrules` |

中文圈推廣者：[[科技翰林院]]（方法論導向）、[[HC-AI-說人話]]（白話實作）。

## 與 [[LLM-Wiki]] 的核心關係

[[Andrej-Karpathy]] 的精準比喻：

> "Obsidian is the IDE; the LLM is the programmer; **the wiki is the codebase**."

Claude Code 即扮演那個 "programmer" 角色——在 [[Obsidian]] 上編輯本知識庫的 wiki 檔案。

## 與 [[Managed-Agents]] 的關係

Managed Agents 的設計哲學「Python SDK 薄層 + 重活 delegate Claude Code CLI subprocess」：本機 Claude Code 與雲端 Managed Agents 共用同一個底層 agent loop。詳見 [[src-az9713-managed-agents-tutorial]]。

## Claude 3 個 Product Surfaces（[[src-anthropic-founders-playbook-2026|Anthropic Founder's Playbook]]）

Claude 產品家族官方分工——三者「**共用同一個 Claude，不同的是周圍工作環境**」：

| Surface | 工作環境 | 何時用 |
|---|---|---|
| **Chat** | 純對話（no setup） | 快速問答 / brainstorm / 小任務 |
| **[[Claude-Cowork]]** | folder access + connectors + skills + **scheduled runs** | 跨多來源整合知識工作、運營層 |
| **Claude Code**（本頁主題）| codebase / diffs / git / dev environments | Codebase 級編程任務 |

本頁聚焦 Claude Code；其他兩者見對應 entity 頁。

## Anthropic 官方版 Harness 7 個 Extension Points（[[src-claude-code-in-large-codebases|2026-05-14 官方 blog]]）

> 「**The Harness Matters as Much as the Model.**」 — Anthropic Applied AI team

| Extension Point | 一句話定位 | 對應本 wiki |
|---|---|---|
| **CLAUDE.md Files Come First** | Root + subdirectory layered，「focused on what applies broadly」| [[CLAUDE-md]] |
| **Hooks Make the Setup Self-Improving** | Scripts at key moments；**stop hooks 提議 CLAUDE.md 更新、start hooks 動態載入 context** | （wiki 缺角，本來源首提）|
| **Skills On-Demand（progressive disclosure）** | 特定 workflow 在需要時才載入；can be scoped to specific paths | [[Agent-Skills]]、[[Context-Rot]] |
| **Plugins Distribute What Works** | Bundle skills/hooks/MCP 成可安裝套件；managed marketplaces 分發 | [[Plugins-Claude-Code]] |
| **LSP Integrations** | Symbol-level precision（「go to definition」/「find all references」）| [[LSP-Integrations]] |
| **MCP Servers Extend Everything** | 連接 internal tools / data sources / APIs；最 sophisticated teams 用 MCP 暴露 structured search | [[MCP]] |
| **Subagents Split Exploration from Editing** | Isolated Claude instances + separate context windows | [[Subagent-Driven-Development]] |

### Agentic Search vs RAG Embedding（官方論述）

> 「Claude Code navigates codebases like a software engineer—traversing file systems, reading files, using grep for precise searches, and following cross-codebase references. **It operates locally without requiring a codebase index.**」
>
> 「**Unlike RAG-powered tools that embed entire codebases, Claude Code uses agentic search**, avoiding failures where indices become stale. However, this approach **requires sufficient starting context** to navigate effectively.」

對應本知識庫 [[LLM-Wiki]] vs [[RAG]] 對話組——Anthropic 官方確認 agentic search 的設計選擇。

### 補充機制（[[src-zeuikli-claude-code-best-practices|zeuikli 2026-05 整合報告]]）

| 機制 | 一句話 |
|---|---|
| **Path-Scoped Rules** | [[CLAUDE-md]] 規則可按路徑觸發（如 `WordPress/` 下才啟用） |
| **Auto Memory** | [[MEMORY-md]] 的對外稱呼——使用者糾正時自動存、跨 session 注入 |
| **Routines** | Cron-like 排程任務（[[Boris-Cherny]] 實戰：每日 standup / PR review / backlog 維護）|
| **Effort Level** | low / medium / high reasoning effort 選擇——成本控制機制 |
| **Tool Search**（MCP）| 大量工具時不一次塞 schema，先註冊 search 元 tool |
| **PGE 驗證流程** | [[PGE-Principle]]：generator 與 evaluator 分離，禁止口頭聲稱「測試通過」|

### 核心論述者（Anthropic 內部）

| 人物 | 論述焦點 |
|---|---|
| [[Boris-Cherny]] | 完成驗證心法 / Routines / CLAUDE.md 設計 |
| [[Thariq-Shihipar]] | Cache 與 Context 工程 / Session 管理 |
| Applied AI team | 企業導入 best practices |

### 適用範圍限制（官方標示）

設計給「**conventional software engineering environments**」：工程師為主貢獻者、Git 版控、標準目錄結構。

非傳統 setup（**game engines with large binary assets / unconventional VCS / non-engineers contributing**）需要額外配置——Anthropic 官方明白標示的不適用邊界。

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
- [[src-taony-ai-ecommerce-page-uiux-2026-08]] — 補充 Claude Code 在 AI 設計流程中的角色：先接收產品脈絡，再依具理由的回饋迭代，必要時交由 Figma 人工收斂。
- [[Hermes-Agent]] — 互補的開源 agent；[[src-hermes-agent-99-cases]] 「跨代理統一記憶」case 將 Claude Code + Hermes + Cursor 串成同記憶層
- [[Harness-Engineering]] — Claude Code 是 harness 七元件的成熟實作；[[Addy-Osmani]] 引 Fareed Khan 對其架構分解
- [[Addy-Osmani]] — 對 Claude Code 架構提出元件拆解視角
- [[OpenAI-Codex-CLI]] — 同類 agentic CLI 的對照產品
- [[Plugins-Claude-Code]] / [[LSP-Integrations]] — Anthropic 官方版 Harness 7 個 extension points 中的兩個
- [[Boris-Cherny]] / [[Thariq-Shihipar]] — Anthropic Claude Code 核心論述者
- [[PGE-Principle]] / [[Context-Engineering]] — 統整多個概念的上位原則
- [[src-claude-code-context-management]] / [[src-techhanlin-claude-code-8-settings]] / [[src-aapd-claude-design-figma-workflow]] / [[src-hermes-agent-99-cases]] / [[src-addy-osmani-harness-engineering]] / [[src-claude-code-in-large-codebases]] / [[src-zeuikli-claude-code-best-practices]] — 詳細工作流來源
