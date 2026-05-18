---
title: OpenCode
type: entity
sources: ["cloudflare-ai-code-review.md"]
created: 2026-05-18
updated: 2026-05-18
tags: [agentic-cli, open-source, sdk, opencode, cloudflare, ai-coding]
confidence: 中
---

# OpenCode

開源 **agentic CLI / SDK**，以**伺服器優先架構**為特色——允許程式化建立 session、SDK 傳送 prompt、JSONL 輸出與插件式擴充。本知識庫先前 agentic CLI 地圖（[[Claude Code]] / [[OpenAI-Codex-CLI]] / [[Hermes-Agent]]）的缺角。

## 基本資訊

- **形態**：開源 agentic CLI + SDK
- **架構特點**：**伺服器優先**——允許 host 程序透過 SDK 建立 session、傳 prompt、聽 JSONL 事件
- **大型 production 使用者**：[[Cloudflare]]（提交 45+ pull requests，內部 AI code review 系統就建在其上）
- **CLI 範例執行**：`bun opencode --agent <agent_name> --format json run`（透過 stdin 傳 prompt 避免 ARG_MAX 限制）
- **TUI 模式**：支援 `/<command>`（如 `/fullreview`）形式的本地互動

## 關鍵能力

| 能力 | 說明 |
|---|---|
| **Session SDK** | `client.session.create(parentID, directory)` → 在父 session 下開子 session |
| **promptAsync** | `client.session.promptAsync({ path, body: { parts, agent, model } })` 啟動非同步 prompt |
| **Agent 概念** | 用 `--agent` 旗標指定 agent 角色，agent 提示詞檔（如 `review_coordinator.md`）動態組裝 |
| **JSONL 輸出** | 每行一個 JSON event；可 streaming 處理，無需等整個 JSON 陣列載完 |
| **session.idle 事件** | 判斷 LLM 工作階段「完成」的主要訊號（備援：輪詢 + 60 秒無輸出強制終止）|
| **`step_finish` 事件** | 含 token usage + finish reason；`reason: "length"` 表示達 `max_tokens` 上限可自動重試 |
| **`opencode.json` 設定** | 可熱交換協調者模型；遇到「overloaded」「503」等可重試錯誤時換模型重試 |
| **Plugin 介面** | `ReviewPlugin` 三段生命週期（Bootstrap / Configure / postConfigure）|

## 與其他 agentic CLI 對照

對應 [[Claude Code#與其他 agentic CLI 的關係]] 的補強：

| 工具 | 廠商 | 規範檔 | 特色 |
|---|---|---|---|
| [[Claude Code]] | Anthropic | `CLAUDE.md` | CLAUDE.md / Skills / Memory 三大機制 |
| [[OpenAI-Codex-CLI]] | OpenAI | `AGENTS.md` | `codex adversarial-review`；ChatGPT 訂閱綁定 |
| **OpenCode**（本頁） | **開源**（社群）| [[AGENTS-md\|AGENTS.md]] | **伺服器優先架構** + SDK 可程式化呼叫；Cloudflare 提交 45+ PR |
| [[Hermes-Agent]] | Nous Research | （自己機制）| 跨 13 訊息平台 + 自我改進 |
| Cursor | Anysphere | `.cursorrules` | 編輯器級而非 CLI |

**OpenCode 在四強中的獨特性**：唯一**完全開源** + **SDK 友善**——適合像 Cloudflare 這種「把 agentic CLI 當基礎建設」的場景，可程式化包裝成內部產品。Claude Code 與 Codex CLI 偏「終端使用者工具」，OpenCode 偏「**可被包裝的引擎**」。

## 在 Cloudflare AI Code Review 系統的角色

[[src-cloudflare-ai-code-review]] 整套系統建在 OpenCode 上，運用的關鍵能力：

| OpenCode 能力 | Cloudflare 使用方式 |
|---|---|
| Server-first SDK | `client.session.create` 開子 session 跑專精 subagent |
| `Bun.spawn` 子處理序 | 起 OpenCode 跑 `review_coordinator` agent |
| JSONL 輸出 | 串流 parse + 監看 `step_finish` / `error` 事件 |
| `session.idle` 事件 | 判斷 subagent 完成 |
| `opencode.json` 熱交換 | 協調者層的故障回退（換模型重試） |
| TUI `/<command>` | 本地版 `/fullreview` 使用同一套 agents + prompts |

## 在各來源中的角色

- [[src-cloudflare-ai-code-review]]：本知識庫首次紀錄 OpenCode，透過 Cloudflare production case study 推斷其核心能力與 API。詳述：
  - 為何選 OpenCode（廣泛使用 / 開源 / 優秀 SDK / 伺服器優先）
  - 兩層協調流程（Bun.spawn + spawn_reviewers tool）
  - 7 個 `@opencode-reviewer/*` 外掛
  - 本地 TUI 整合

## 信心評估

- **強**：core SDK 能力（session / promptAsync / JSONL）—— 來源含具體 code snippet
- **強**：與 [[Cloudflare]] AI code review 系統的整合方式 —— 第一手 production 文件
- **中**：開源狀態與社群活躍度 —— 透過「Cloudflare 提交 45+ PR」推斷活躍開源專案，未獨立查證 OpenCode GitHub repo
- **弱**：與 Anthropic Claude API / OpenAI API 的關係 —— OpenCode 是 model-agnostic agentic CLI 但模型 routing 細節未深究

## 相關實體

- [[Claude Code]] — Anthropic 同類產品
- [[OpenAI-Codex-CLI]] — OpenAI 同類產品；OpenCode 透過 `@opencode-reviewer/codex` 外掛整合
- [[Hermes-Agent]] — 開源 agent 框架同類，但走訊息平台路線
- [[Cloudflare]] — 主要 production 使用者，提交 45+ PR

## 相關概念

- [[AGENTS-md]] — 配合 OpenCode 的規範檔（與 [[CLAUDE-md|CLAUDE.md]] 對照組）
- [[Harness-Engineering]] — OpenCode 提供 harness 七元件中 Tools / Orchestration / Observability 元件
- [[Subagent-Driven-Development]] — OpenCode 的 `client.session.create(parentID)` 是該 pattern 的天然 SDK
- [[Adversarial-Code-Review]] — OpenCode + [[Cloudflare]] AI code review 是該 pattern 的 production case
- [[MCP]] — Cloudflare 系統用 OpenCode + MCP 評論伺服器整合 GitLab

## 未來可延伸

- 補抓 OpenCode 官方 GitHub repo / 文件作獨立來源
- 評估與 Remotion / Hermes 等其他開源 agent 框架的相互定位
