---
title: OpenCLI
type: entity
sources: ["opencli-github-readme.md"]
created: 2026-06-10
updated: 2026-06-10
tags: [browser-automation, cli, agent-skills, web-scraping, open-source, cdp]
confidence: 強
---

# OpenCLI

開源工具（作者 jackwener，JS/TS，Apache-2.0），把**任何網站變成 CLI 指令**，並讓 AI agent 用**你已登入的真實 Chrome session** 操作網頁。是本知識庫「**AI agent 操作瀏覽器**」應用類別中，與 [[BrowseForge]]、[[Playwright]] 並列的第三種代表——但它走的是「**已登入、確定性 adapter**」路線。

## 基本資訊

- **Repo**：https://github.com/jackwener/opencli ｜ 官網 https://opencli.info/
- **安裝**：`npm install -g @jackwener/opencli`（Node.js ≥ 20）+ Chrome「Browser Bridge」擴充
- **語言 / License**：JavaScript（76.6%）/ TypeScript ｜ Apache-2.0
- **架構**：Browser Bridge 擴充 ＋ 本地 daemon（port `19825`）＋ Chrome DevTools Protocol（CDP）
- **熱度**：2026-03 建立，數月內逾 2.3 萬 stars

## 三種用途（一個介面）

| 用途 | 怎麼用 | 對象 |
|---|---|---|
| **內建 adapters** | `opencli bilibili hot` / `opencli twitter timeline` … 100+ 網站 | 人類想要穩定指令取代開瀏覽器 |
| **AI agent 操作任意網站** | 裝 `opencli-browser` skill，agent 經登入瀏覽器 navigate/click/fill/extract | Claude Code / Cursor 等 |
| **CLI hub** | `opencli <tool>` 透傳本地工具（`gh` `docker` `obsidian` `tg`…）+ Electron app（CDP） | 統一指令發現面 |

## 關鍵差異點：吃「已登入的真實 session」

OpenCLI 最大的識別特徵：它不是無頭瀏覽器、也不是反指紋多帳號工具，而是**接管你日常在用、已登入的 Chrome profile**。因此能取得需登入才看得到的內容（小紅書通知、LinkedIn 收件匣、知乎收藏…）。這也決定了它的適用邊界——單人、單一登入身分、確定性操作，而非大量帳號養號。

對照同類工具：

| 工具 | 路線 | 典型場景 |
|---|---|---|
| **OpenCLI** | 已登入單人 Chrome + 確定性 adapter + CLI 化 | 個人帳號的跨站擷取 / 操作 / 下載 |
| [[BrowseForge]] | 多指紋反偵測、每 profile 獨立身分/proxy | 多帳號養號、反偵測 |
| [[Playwright]] | 通用瀏覽器自動化底層 / 測試 | E2E 測試、被其他工具當底層 |

## 對 AI agent 的設計

- 透過 [[Agent-Skills]] 安裝：`npx skills add jackwener/opencli`（六個 skill：browser / adapter-author / autofix / browser-sitemap / sitemap-author / usage）。
- agent 讀頁面用 **structured DOM snapshot 而非截圖** → 省 token、定位穩。
- `opencli browser <session>` 提供 open/click/type/fill/extract/network/tab… 原語，agent 用自然語言驅動、內部翻成指令。

## 工程友善設計

- **輸出格式**：`-f table|json|yaml|md|csv`，`-f json` 直接餵 jq / LLM。
- **Unix exit codes（sysexits.h）**：`66` 空結果 / `69` Bridge 未連 / `75` timeout / `77` 需登入 / `78` config 錯 → CI/script 可依失敗模式分支。
- **媒體下載**：小紅書 / B站 / Twitter / pixiv / 1688 / 小宇宙（含逐字稿）/ 知乎 / 微信公眾號。

## 適用範圍

適合：個人帳號的跨網站資料擷取、社群操作自動化、媒體下載、把零散本地工具與桌面 app 收進單一 CLI 發現面、給 agentic CLI 一個「確定性操作網站」的工具層。
不適合：需要大量帳號 / 反偵測養號（→ [[BrowseForge]]）、需要無 GUI 的 server 端純自動化測試（→ [[Playwright]]）。

## 在知識庫地圖的位置

- 與 [[mcp-cli]] 形成有趣對照：兩者都是「**把某層能力 CLI 化給人與 AI 用**」，但操作對象不同——OpenCLI 在**網頁存取層**（對象：網站/瀏覽器），mcp-cli 在 **MCP 協定存取層**（對象：MCP server）。兩者可疊：OpenCLI 本身可包成 MCP server，再由 mcp-cli 呼叫測試。
- 與 [[Claude Code]] / [[OpenCode]] / [[OpenAI-Codex-CLI]]：OpenCLI 不是 agentic CLI 本體，而是「裝進這些 agent 的網站操作能力」。

## 信心評估

- **強**：定位、架構、三種用途、與同類工具差異 — 官方 README 一手。
- **中**：100+ 網站實際覆蓋與長期穩定度 — 依各 adapter 維護狀況，未實測。

## 相關頁面

- [[src-opencli-github-2026-06]] — 來源 README 摘要
- [[BrowseForge]] / [[Playwright]] — 同「AI 操作瀏覽器」類別的並列工具
- [[Agent-Skills]] — OpenCLI 的 AI 使用形式
- [[Claude Code]] / [[OpenCode]] / [[OpenAI-Codex-CLI]] — 安裝 OpenCLI skill 的 agentic CLI 宿主
- [[mcp-cli]] — 不同 stack 層的「能力 CLI 化」對照
- [[MCP]] — OpenCLI 可被包成 MCP server 的潛在路徑
