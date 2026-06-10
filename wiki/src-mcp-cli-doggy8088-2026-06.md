---
title: mcp-cli README — 與 MCP 伺服器互動的輕量 CLI（doggy8088 Rust fork, GitHub 2026-06）
type: source
sources: ["mcp-cli-doggy8088-github-readme.md"]
created: 2026-06-10
updated: 2026-06-10
tags: [mcp, cli, rust, agent-skills, token-efficiency, open-source, mcp-cli]
confidence: 強
---

# mcp-cli README（doggy8088 Rust fork）

> 來源：https://github.com/doggy8088/mcp-cli ｜ npm `@willh/mcp-cli`
> 作者 doggy8088（Will 保哥 / Will Huang）｜ **Rust** ｜ MIT ｜ 建立 2026-06-08
> **Fork 自** [philschmid 原版](https://github.com/philschmid/mcp-cli)（Bun/TypeScript），由 Antigravity（Google DeepMind）重寫為純 Rust、零外部 runtime。

主條目見實體頁 [[mcp-cli]]。本頁保留來源原文重點與關鍵引用。

## 一句話定位

> 輕量的 Rust CLI 與 library，用來和 [MCP](https://modelcontextprotocol.io/) 伺服器互動——在 shell 裡 discover / inspect / call MCP server 的 tools。設計給 AI coding agents（Gemini CLI、Claude Code）使用。

## 核心命令

```text
mcp-cli                              列出所有 servers 與 tools
mcp-cli info <server> [<tool>]       顯示 server tools / tool schema
mcp-cli grep <pattern>               用 glob 搜尋 tools
mcp-cli call <server> <tool> [json]  呼叫 tool；無 args 時從 stdin 讀 JSON
```

- `call` 輸出 JSON → 適合 `| jq`、pipe、shell script。
- 設定檔 `mcp_servers.json` **相容 Claude Desktop / Gemini / VS Code 格式**；支援 `${VAR}` 環境變數替換。
- 安裝：`install.sh` / `cargo install` / `npm i -g @willh/mcp-cli`（npm 是薄 wrapper，下載對應版本的原生 binary）。

## 關鍵論點：為什麼 MCP + CLI（原文）

> 「傳統 MCP integration 會把完整 tool schemas 載入 AI 的 context window，可能耗用數千 tokens。」

CLI 模式對策：
- **按需載入**：只有需要時才取 schema。
- **節省 tokens**：context overhead 很低。
- **可與 shell 組合**：搭 `jq`、pipes、scripts。
- **可 script 化**：AI 可寫 shell script 處理複雜工作流程。

> 這正是 [[MCP|MCP 頁「Tool Search 按需載入工具 Schema」]]概念在 **shell 層**的具體實作——把「不要一次塞 schema 進 system prompt」落地成一支指令。

## 架構（原文重點）

- **lazy-spawn 連線池 daemon**：首次呼叫 fork 背景 daemon、建 Unix socket、60 秒 idle 自動終止；後續呼叫走既有 socket（避免重複啟動 MCP server 的延遲）。`MCP_NO_DAEMON=1` 可關閉改用 direct connection。
- **Tool filtering**：`allowedTools` / `disabledTools`（glob），`disabledTools` 優先；套用到 info / grep / call 所有操作。
- **錯誤處理**：對短暫錯誤（`ECONNREFUSED` / `429` / `502-504`）exponential backoff 自動 retry；config / auth(`401/403`) / tool 錯誤立即失敗。
- **可操作錯誤訊息**：結構化 error code + Suggestion，同時給人與 AI 看（如 `AMBIGUOUS_COMMAND` 提示用 `call`）。

## 給 AI agent 的兩種整合

1. **System Prompt 注入**：把指令清單 + Discover→Inspect→Execute 工作流寫進 agent system prompt。
2. **Agents Skill**：放 `mcp-cli/SKILL.md` 到 skills 目錄（Gemini CLI / OpenCode / Claude Code 等）。

## 信心評估

- **強**：定位、命令面、架構、token 論點 — 官方 README 一手。
- **中**：與其他 MCP CLI 工具的效能/穩定度比較 — README 未提供基準，未實測。

## 相關頁面

- [[mcp-cli]] — 實體主條目
- [[MCP]] — 本工具是 MCP **client**（CLI 形態）；對應「Tool Search 按需載入」省 token 概念
- [[Agent-Skills]] — 以 SKILL.md 形式給 AI agent 使用
- [[Claude Code]] / [[OpenCode]] — 可整合 mcp-cli 的 agentic CLI 宿主
- [[OpenCLI]] — 同樣「把某層能力變 CLI」，但操作對象是網站而非 MCP server（不同 stack 層）
