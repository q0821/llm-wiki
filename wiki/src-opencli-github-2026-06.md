---
title: OpenCLI README — Make Any Website into CLI（GitHub 2026-06）
type: source
sources: ["opencli-github-readme.md"]
created: 2026-06-10
updated: 2026-06-10
tags: [browser-automation, cli, agent-skills, web-scraping, open-source, opencli]
confidence: 強
---

# OpenCLI README（GitHub）

> 來源：https://github.com/jackwener/opencli ｜ 官網 https://opencli.info/
> 作者 jackwener ｜ JavaScript（76.6%）/ TypeScript ｜ Apache-2.0 ｜ Node.js ≥ 20
> 建立 2026-03-14 ｜ 擷取時 23,970 stars（成長極快）

主條目見實體頁 [[OpenCLI]]。本頁僅保留來源原文重點與關鍵引用。

## 一句話定位

> **Convert any website into a CLI & run Browser Use on your logged-in Chrome.**
> Turn websites, browser sessions, Electron apps, and local tools into deterministic interfaces for humans and AI agents.

一個介面、三種自動化：
1. **內建 adapters** — Bilibili、小紅書、知乎、Reddit、HackerNews、Twitter/X 等 [100+ 網站](https://github.com/jackwener/opencli)。
2. **讓 AI agent 操作任意網站** — 在 Claude Code / Cursor 裝 `opencli-browser` skill，透過你登入的瀏覽器 navigate / click / fill / extract。
3. **寫新 adapter** — `opencli browser` + `opencli-adapter-author` skill 從偵察到驗證走完。

也是**本地工具的 CLI hub**（`gh` `docker` `vercel` `wrangler` `obsidian` `tg` `discord` `wx` `ntn(Notion)` 等）＋ **桌面 app adapter**（Electron 程式如 Cursor / Codex / ChatGPT App，走 CDP）。

## 關鍵設計（原文重點）

- **靠「你已登入的真實 Chrome」**：透過輕量 Browser Bridge 擴充 + 本地 daemon（預設 port `19825`）連 Chrome，經 CDP 操作 → 能取得需登入才看得到的內容。
- **AI agent 用 DOM snapshot 而非截圖**：「Read page content via structured DOM snapshots (not screenshots)」。
- **Agent Skills 安裝**：`npx skills add jackwener/opencli`（含 `opencli-browser` / `opencli-adapter-author` / `opencli-autofix` / `opencli-browser-sitemap` / `opencli-sitemap-author` / `opencli-usage` 六個 skill）。
- **輸出格式**：所有內建指令支援 `--format` `table`（預設）/ `json` / `yaml` / `md` / `csv`。`-f json` 可直接 pipe 給 jq 或 LLM。
- **Unix exit codes（sysexits.h）**：`0` 成功 / `66` 空結果 / `69` Bridge 未連 / `75` timeout / `77` 需登入 / `78` config 錯 → CI / script 可依失敗模式分支。
- **下載支援**：小紅書 / B站 / Twitter / 豆瓣 / pixiv / 1688 / 小宇宙（音檔＋逐字稿）/ 知乎 / 微信公眾號（圖片、影片、文章 Markdown）。
- **擴充模型**：plugin（`opencli plugin install github:user/repo`）/ 私人 adapter（`~/.opencli/clis/`）/ eject 官方 adapter / `opencli external register` 包裝既有 binary。

## 給 AI agent 的命令面

`opencli browser <session>` 系列：`open` `state` `click` `type` `fill` `select` `keys` `wait` `get` `find` `extract` `frames` `screenshot` `scroll` `back` `eval` `network` `tab list/new/select/close` `init` `verify` `close`。

> 「OpenCLI's browser commands are designed to be used by AI Agents — not run manually.」

## 信心評估

- **強**：定位、三種用途、安裝與命令面、輸出/exit code 設計 — 官方 README 一手。
- **中**：「100+ 網站」實際覆蓋與穩定度 — 依 adapter 維護狀況，未實測。

## 相關頁面

- [[OpenCLI]] — 實體主條目
- [[BrowseForge]] / [[Playwright]] — 「AI agent 操作瀏覽器」應用類別的並列工具
- [[Agent-Skills]] — OpenCLI 以 skill 形式給 AI agent 使用
- [[Claude Code]] / [[OpenAI-Codex-CLI]] / [[OpenCode]] — 安裝 OpenCLI skill 的 agentic CLI 宿主
- [[mcp-cli]] — 同樣「把某層能力變 CLI」的工具，但操作對象是 MCP server 而非網站（不同 stack 層）
