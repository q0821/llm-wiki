---
title: nczz/BrowseForge — 跨平台多指紋反偵測瀏覽器
type: source
sources: ["Releases · nczzBrowseForge.md", "github-nczz-browseforge.md"]
created: 2026-05-11
updated: 2026-05-11
tags: [browser-automation, anti-detection, mcp, playwright, multi-account, go]
confidence: 強
---

# nczz/BrowseForge — 跨平台多指紋反偵測瀏覽器

**作者**：nczz
**Repo**：https://github.com/nczz/BrowseForge
**語言**：Go / **License**：MIT / **Stars**：9（2026-05-11）
**最新版本**：v1.4.0「Playwright Connect」（2026-05-11 發布）
**抓取於**：2026-05-11（fetch-url.sh 超時，改用 gh api 萃取 README + release）
**詳見實體頁**：[[BrowseForge]]

## 核心定位

雙引擎（Firefox Camoufox + Chromium CloakBrowser）反偵測瀏覽器，**每個 Profile 獨立指紋 / Cookie / Proxy**，且內建三種程式化操作介面（REST API / [[MCP]] Server / [[Playwright]] Connect）。

單一 Go 執行檔，首次啟動自動下載瀏覽器引擎（~440MB）。

## 反偵測技術細節

| 機制 | 說明 |
|---|---|
| **雙引擎** | Firefox (Camoufox) + Chromium (CloakBrowser)，C++ 層級反偵測 |
| **獨立指紋** | 每 Profile 自動分配不同瀏覽器指紋（從指紋池抽，可自行用 `scripts/generate-fingerprints.js` 生成）|
| **獨立 Cookie** | 各 Profile 登入狀態互不干擾，關閉重開保留 |
| **獨立 Proxy** | 每 Profile 可設 SOCKS5/HTTP Proxy |
| **GeoIP 調配** | 根據出口 IP 自動調 Timezone / Language / Geolocation（支援 VPN/WireGuard）|

Proxy 偵測風險：Residential / ISP（低）< Mobile（最低）< Datacenter（高，不建議用於社群）。

Profile 資料存 `profiles/prof_xxx/`（`profile.json` 指紋設定 + `browser-data/` Cookie），打包目錄即可備份/搬移。

## 三種程式化操作介面

### 1. REST API（20 endpoints）

`http://127.0.0.1:19280/api`，除 `/api/status` 外需 Bearer Token（`data/.api-token`）。

### 2. [[MCP]] Server（12 tools）— AI Agent 整合

兩種模式：
- **HTTP 模式**：隨 server 啟動於 `:19281`
- **stdio 模式**：Kiro CLI / Claude Desktop 整合（`--mcp` 參數）

12 個 tools：`list_profiles` / `create_profile` / `update_profile` / `delete_profile` / `open_browser` / `close_browser` / `navigate` / `click` / `type_text` / `screenshot` / `get_content` / `evaluate`

使用範例（在 Kiro 或 Claude 中對話）：「建立一個 Firefox profile，開啟瀏覽器到 facebook.com」

> 這是「**AI agent 操作瀏覽器**」的具體案例——LLM 透過自然語言指令操控真實瀏覽器，做多帳號管理、爬蟲、表單填寫等。

### 3. [[Playwright]] Connect（v1.4.0 新功能）

外部 Playwright 腳本直連 BrowseForge 管理的瀏覽器（named pipe，非 WebSocket，不暴露 CDP）：

- `GET /api/playwright/endpoint` 取得 connect endpoint
- client 須用 Playwright **1.59.x**（major.minor 需匹配）
- 依賴 `nczz/playwright-go` fork（PR #591 待 upstream merge）
- Firefox 與 Chromium 都支援，完整 Playwright API

| | REST API | [[Playwright]] Connect |
|---|---|---|
| 功能範圍 | BrowseForge 定義的 12 操作 | 完整 Playwright API |
| 適用 | 簡單自動化、AI Agent | 複雜腳本、測試框架 |
| 版本依賴 | 無 | 需 PW 1.59.x |

## YAML Workflow

定義自動化流程透過 API 排程執行，action：`create_profile` / `open_browser` / `close_browser` / `navigate` / `click` / `type` / `eval` / `wait` / `screenshot` / `sleep`。

## 架構

```
BrowseForge (Go binary)
  ├── REST API (:19280)     ← Profile CRUD + 瀏覽器操作
  ├── MCP Server (:19281)   ← AI Agent 整合
  ├── Web Dashboard         ← 管理介面
  └── Playwright
       ├── Camoufox #1 (Profile A, 指紋α, Proxy X)
       ├── Camoufox #2 (Profile B, 指紋β, Proxy Y)
       └── CloakBrowser #3 (Profile C, 指紋γ, Proxy Z)
```

## 部署形態

| 平台 | 支援 |
|---|---|
| macOS x64/arm64、Linux x64/arm64、Windows x64 | ✅ 全平台（含兩個瀏覽器引擎）|
| Linux server 無桌面 | `xvfb-run ./BrowseForge`；需看畫面（驗證碼）→ noVNC + Docker Compose |

## 與本知識庫的關聯

- [[BrowseForge]] — 對應實體頁
- [[MCP]] — BrowseForge 是「**本地工具暴露 MCP server 給 AI agent**」的具體案例（對照 [[LM-Studio]] 是「AI client 接 MCP server」）
- [[Playwright]] — BrowseForge 底層用 Playwright 管理瀏覽器，v1.4.0 開放外部 Playwright 直連
- [[Claude Code]] / [[Agent-Skills]] — AI agent 操作瀏覽器的應用場景
- [[Cloudflare]] / [[OpenClaw]] — 同為自架/開源的開發工具類

## 信心評估

- **強**：功能清單、12 個 MCP tools、架構、v1.4.0 release — gh api 直接驗證
- **強**：MCP/Playwright 整合 — README 有完整設定範例
- **中**：反偵測實際效果 — 「C++ 層級反偵測」「Camoufox/CloakBrowser」為其宣稱，未實測對抗主流偵測服務的成效
- **時效**：v1.4.0 為 2026-05-11 當日發布，內容最新鮮

## 用途與倫理提示

BrowseForge 屬**雙用途工具**：合法用途包含 QA 測試、多環境開發、隱私保護、合規的市場研究；但「多指紋反偵測 + 多帳號」也常被用於違反平台 ToS 的場景（如社群操縱、刷量）。使用時需自行確認符合目標平台條款與當地法規。
