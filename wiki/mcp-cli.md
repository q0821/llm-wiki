---
title: mcp-cli
type: entity
sources: ["mcp-cli-doggy8088-github-readme.md"]
created: 2026-06-10
updated: 2026-06-10
tags: [mcp, cli, rust, agent-skills, token-efficiency, open-source]
confidence: 強
---

# mcp-cli

輕量的 **Rust CLI 與 library**，把 [[MCP]] 伺服器的 tools 變成可在 shell 直接 discover / inspect / call 的指令。核心定位是**給 AI coding agent 省 token 地存取 MCP**——把「不要一次把全部 tool schema 塞進 context window」這件事，落地成一支命令列工具。

> 本頁描述的是 **doggy8088（Will 保哥 / Will Huang）維護的 Rust fork**。它 fork 自 [philschmid 的原版](https://github.com/philschmid/mcp-cli)（Bun/TypeScript），由 Antigravity（Google DeepMind）重寫為純 Rust、零外部 runtime。「mcp-cli」這個名字在生態中有多個實作，本頁特指此 Rust 版。

## 基本資訊

- **Repo**：https://github.com/doggy8088/mcp-cli ｜ npm `@willh/mcp-cli`
- **安裝**：`install.sh` / `cargo install --git …` / `npm i -g @willh/mcp-cli`（npm 為薄 wrapper，下載對應版本原生 binary）
- **語言 / License**：Rust ｜ MIT
- **作者**：doggy8088（Will 保哥，台灣 MVP / 講師）

## 核心命令

```bash
mcp-cli                              # 列出所有 servers 與 tools
mcp-cli info <server> [<tool>]       # server 的 tools / 單一 tool schema
mcp-cli grep "<glob>"                # 跨 server 搜尋 tools
mcp-cli call <server> <tool> '{...}' # 呼叫 tool；無 args 時讀 stdin
```

- `call` 輸出 **JSON** → `| jq`、pipe、heredoc 複雜參數、shell script 串接。
- 設定檔 `mcp_servers.json` **相容 Claude Desktop / Gemini / VS Code**；支援 `${VAR}` 環境變數替換；解析順序 `MCP_CONFIG_PATH` → `-c` → `./mcp_servers.json` → `~/.mcp_servers.json` → `~/.config/mcp/`。

## 關鍵論點：MCP + CLI 為何省 token

README 的核心主張，正好是 [[MCP|MCP 頁「Tool Search 按需載入」]]概念在 **shell 層**的實作：

| 傳統 MCP integration | mcp-cli（CLI 模式）|
|---|---|
| 完整 tool schema 一次載入 context window，耗數千 token | **按需載入**：要用才 `info` 取 schema |
| schema 常駐 system prompt → 破 cache、佔 context | context overhead 極低 |
| agent 只能用 client 預設的 tool 呼叫 | **可 shell 組合**：jq / pipe / script 化 |

> 對 [[Context-Engineering]] 的意義：把工具存取從「常駐 schema」改成「指令式按需查詢」，是控制 context window 與 cache 寫入成本的一種具體手段。

## 架構

- **lazy-spawn 連線池 daemon**：首次呼叫 fork 背景 daemon + 建 Unix socket，60 秒 idle 自動清理；後續呼叫走既有 socket，避免重複啟動 MCP server 的延遲。`MCP_NO_DAEMON=1` 改用 direct connection（用完即關）。
- **連線範圍**：`info`/`grep` 平行連所有 server；`info <server>` / `call` 只連指定 server。
- **Tool filtering**：`allowedTools` / `disabledTools`（glob，後者優先），套用到所有操作——可在設定層擋掉破壞性 tool（如 `delete_*`）。
- **錯誤處理**：短暫錯誤（`ECONNREFUSED`/`429`/`502-504`）exponential backoff 自動 retry；config / auth(`401/403`) / tool 錯誤立即失敗。錯誤訊息含結構化 code + Suggestion，人與 AI 都能讀。

## 對 AI agent 的兩種整合

1. **System Prompt 注入**：把指令清單 + Discover→Inspect→Execute 工作流寫進 agent system prompt。
2. **Agents Skill**：放 `mcp-cli/SKILL.md` 到 skills 目錄（[[Claude Code]] / [[OpenCode]] / Gemini CLI 等）。

## 適用範圍

適合：給 AI coding agent 省 token 地存取 MCP server、人類在 shell 快速測試/檢視/串接 MCP tools、CI script 中呼叫 MCP 能力、需要在設定層做 tool 白/黑名單治理。
不適合：需要 GUI / 圖形化管理 MCP 的場景；非 MCP 協定的工具整合。

## 在知識庫地圖的位置

- 是 [[MCP]] 的一種 **client**（CLI 形態），補上 MCP 頁「client 端」清單中「**shell / agent 省 token 存取**」這個角度。
- 與 [[OpenCLI]] 對照：兩者都「把某層能力 CLI 化給人與 AI 用」，但 mcp-cli 操作對象是 **MCP server**（協定存取層），OpenCLI 是**網站/瀏覽器**（網頁存取層）。可疊用：OpenCLI 包成 MCP server → mcp-cli 呼叫。
- 與 [[Agent-Skills]]：兩者都以 SKILL.md 形式封裝給 agent；mcp-cli 偏「連接外部工具」，Skills 偏「封裝工作流」。

## 信心評估

- **強**：定位、命令面、架構、token 論點、fork 沿革 — 官方 README 一手。
- **中**：與其他 MCP CLI 實作的效能比較 — README 未附基準，未實測。

## 相關頁面

- [[src-mcp-cli-doggy8088-2026-06]] — 來源 README 摘要
- [[MCP]] — 本工具是 MCP client；對應「Tool Search 按需載入」省 token 概念
- [[Context-Engineering]] — 按需載入 schema 的 context / cache 成本意義
- [[Agent-Skills]] — 以 SKILL.md 給 agent 使用
- [[Claude Code]] / [[OpenCode]] — 可整合的 agentic CLI 宿主
- [[OpenCLI]] — 不同 stack 層的「能力 CLI 化」對照
