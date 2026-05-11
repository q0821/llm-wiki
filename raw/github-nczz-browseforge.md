<!-- source-url: https://github.com/nczz/BrowseForge -->
<!-- title: nczz/BrowseForge — 跨平台多指紋反偵測瀏覽器 -->
<!-- fetched: 2026-05-11 -->
<!-- note: 因 fetch-url.sh 超時，改用 gh api 萃取 README + 最新 release -->

# BrowseForge

🦊🌐 跨平台多指紋反偵測瀏覽器 — 雙引擎（Firefox + Chromium），每個 Profile 獨立指紋、Cookie、Proxy。

- 作者: nczz
- Repo: https://github.com/nczz/BrowseForge
- 語言: Go
- License: MIT
- Stars: 9（2026-05-11）
- 最新版本: v1.4.0「Playwright Connect」（2026-05-11 發布）

## 功能

- **雙引擎**：Firefox (Camoufox) + Chromium (CloakBrowser)，C++ 層級反偵測
- **獨立指紋**：每個 Profile 自動分配不同的瀏覽器指紋
- **獨立 Cookie**：各 Profile 登入狀態互不干擾，關閉重開後保留
- **獨立 Proxy**：每個 Profile 可設定不同的 SOCKS5/HTTP Proxy
- **GeoIP 調配**：根據出口 IP 自動調整 Timezone、Language、Geolocation
- **Web Dashboard**：瀏覽器開啟 `http://127.0.0.1:19280` 管理所有 Profile
- **REST API**：20 個 endpoint，完整程式化控制
- **MCP Server**：12 個 tools，AI Agent（Kiro/Claude）直接操作瀏覽器
- **YAML Workflow**：定義自動化流程，排程執行
- **Portable**：單一執行檔，首次啟動自動下載瀏覽器引擎（~440MB）

## 平台支援

| 平台 | BrowseForge | Firefox (Camoufox) | Chromium (CloakBrowser) |
|------|:---:|:---:|:---:|
| macOS x64 / arm64 | ✅ | ✅ | ✅ |
| Linux x64 / arm64 | ✅ | ✅ | ✅ |
| Windows x64 | ✅ | ✅ | ✅ |

Linux server 無桌面環境用 `xvfb-run ./BrowseForge`；需遠端看畫面（驗證碼）支援 noVNC 與 Docker Compose。

## MCP Server（AI Agent 整合）

兩種模式：
- **HTTP 模式**：隨 server 自動啟動於 `http://127.0.0.1:19281`
- **stdio 模式**：Kiro CLI / Claude Desktop 整合（`--mcp` 參數）

### 12 個 MCP Tools

| Tool | 說明 |
|------|------|
| `list_profiles` | 列出所有 Profile |
| `create_profile` | 建立 Profile（自動分配指紋）|
| `update_profile` | 更新 Profile 設定 |
| `delete_profile` | 刪除 Profile |
| `open_browser` | 開啟瀏覽器視窗 |
| `close_browser` | 關閉瀏覽器 |
| `navigate` | 導航到 URL |
| `click` | 點擊元素 |
| `type_text` | 輸入文字 |
| `screenshot` | 截圖 |
| `get_content` | 取得頁面內容 |
| `evaluate` | 執行 JavaScript |

使用範例（在 Kiro 或 Claude 中直接對話）：「建立一個 Firefox profile，開啟瀏覽器到 facebook.com」

## Playwright Connect（v1.4.0 新功能，2026-05-11）

外部 Playwright 腳本可直接連入操作 BrowseForge 管理的瀏覽器（named pipe，非 WebSocket，不暴露 CDP）。

- `GET /api/playwright/endpoint` 取得 connect endpoint
- 需要 client 端 Playwright **1.59.x**（major.minor 需匹配）
- 依賴 nczz/playwright-go fork（PR #591 待 upstream merge）
- Firefox (Camoufox) 與 Chromium (CloakBrowser) 都支援
- 完整 Playwright API：navigate / click / fill / evaluate / screenshot / locator 等

### 與 REST API 的差異

| | REST API | Playwright Connect |
|---|---------|-------------------|
| 功能範圍 | BrowseForge 定義的 12 個操作 | 完整 Playwright API |
| 適用場景 | 簡單自動化、AI Agent | 複雜腳本、測試框架 |
| 跨語言 | 任何 HTTP client | Playwright client (Go/Node/Python/Java) |
| 版本依賴 | 無 | 需要 PW 1.59.x |

## REST API

Base URL: `http://127.0.0.1:19280/api`，除 `/api/status` 外需 Bearer Token（首次啟動生成於 `data/.api-token`）。

## YAML Workflow

定義自動化流程透過 API 執行，支援 action：`create_profile`、`open_browser`、`close_browser`、`navigate`、`click`、`type`、`eval`、`wait`、`screenshot`、`sleep`。

範例：多帳號登入（建 Profile → 開瀏覽器 → 導航 → 等待 → 關閉）。

## Profile 資料

```
profiles/
  prof_abc123/
    profile.json        ← 指紋、Proxy、名稱、分組設定
    browser-data/       ← Cookie、localStorage、登入狀態
```

備份：打包 `profiles/` 目錄即可。搬到另一台機器啟動即恢復。

## Proxy 建議

| 類型 | 適用場景 | 偵測風險 |
|------|---------|---------|
| Residential Proxy | 社群多帳號 | 低 |
| ISP Proxy | 需要固定 IP | 低 |
| Mobile Proxy | 高風險帳號 | 最低 |
| Datacenter Proxy | 爬蟲、低風險場景 | 高（不建議用於社群）|

無 Proxy 時自動偵測出口 IP 並調整指紋的 Timezone/Language（支援 VPN/WireGuard）。

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

## 從原始碼 Build

需要 Go 1.22+ 和 Node.js 22+：生成指紋池（`scripts/generate-fingerprints.js`）→ `go build -ldflags="-s -w" -o BrowseForge ./cmd/server`。Docker build 可不裝 Go（`make build` / `make package`）。

## v1.4.0 Release Note 摘要

**Playwright Connect** — External Playwright scripts can now directly connect to BrowseForge-managed browsers via named pipe.

- 用 Playwright 1.59.1 `Browser.Bind()`（named pipe，no CDP exposure）
- Firefox (Camoufox) 與 Chromium (CloakBrowser) 都支援
- 不影響既有功能（MCP tools、REST API、cookie persistence）
- Requirements: 外部 client 須用 Playwright 1.59.x；依賴 nczz/playwright-go fork

## License

MIT
