---
title: BrowseForge
type: entity
sources: ["Releases · nczzBrowseForge.md", "github-nczz-browseforge.md"]
created: 2026-05-11
updated: 2026-05-11
tags: [browser-automation, anti-detection, mcp, playwright, multi-account, open-source]
confidence: 強
---

# BrowseForge

開源的**跨平台多指紋反偵測瀏覽器**（Go 寫，作者 nczz），每個 Profile 獨立指紋/Cookie/Proxy，並內建三種程式化操作介面——是本知識庫「**AI agent 操作瀏覽器**」這個應用類別的代表工具。

## 基本資訊

- **Repo**：https://github.com/nczz/BrowseForge
- **作者**：nczz
- **語言**：Go
- **License**：MIT
- **形態**：單一 portable 執行檔（首次啟動自動下載瀏覽器引擎 ~440MB）
- **最新版本**：v1.4.0「Playwright Connect」（2026-05-11）

## 雙引擎

| 引擎 | 底層 | 反偵測層級 |
|---|---|---|
| 🦊 **Camoufox** | Firefox | C++ 層級 |
| 🌐 **CloakBrowser** | Chromium | C++ 層級 |

每個 Profile 可選引擎，都支援 macOS x64/arm64、Linux x64/arm64、Windows x64。

## 核心隔離機制

| 機制 | 說明 |
|---|---|
| **指紋** | 每 Profile 自動從指紋池抽不同的瀏覽器指紋 |
| **Cookie** | 各 Profile 登入狀態互不干擾、關閉重開保留 |
| **Proxy** | 每 Profile 可設 SOCKS5/HTTP Proxy |
| **GeoIP** | 根據出口 IP 自動調 Timezone/Language/Geolocation（支援 VPN/WireGuard）|

## 三種程式化介面（差異對照）

| 介面 | 端口/方式 | 功能範圍 | 適合 |
|---|---|---|---|
| **Web Dashboard** | `:19280`（瀏覽器）| 圖形化管理 Profile | 手動操作 |
| **REST API** | `:19280/api`（Bearer Token）| 20 endpoints | 任何 HTTP client、簡單自動化 |
| **[[MCP]] Server** | `:19281`（HTTP）或 `--mcp`（stdio）| 12 tools | AI Agent（Kiro/Claude）|
| **[[Playwright]] Connect** | named pipe（v1.4.0+）| 完整 Playwright API | 複雜腳本、測試框架（需 PW 1.59.x）|
| **YAML Workflow** | API 觸發 | 10 種 action 排程組合 | 自動化流程 |

## MCP 整合（12 tools）

`list_profiles` / `create_profile` / `update_profile` / `delete_profile` / `open_browser` / `close_browser` / `navigate` / `click` / `type_text` / `screenshot` / `get_content` / `evaluate`

在 Kiro 或 Claude Desktop 中註冊後，可用自然語言操作：「建立一個 Firefox profile，開啟瀏覽器到 facebook.com」。

> 這是 [[MCP]] 的一種典型形態——**本地工具暴露 MCP server，AI agent 透過協議呼叫**。對照 [[LM-Studio]]（AI client 端連別人的 MCP server），BrowseForge 是 server 端。

## 「AI agent 操作瀏覽器」應用類別

BrowseForge 屬於一個正在浮現的工具類別：讓 LLM 透過 API/MCP 操控真實瀏覽器。相關生態：

| 工具/方案 | 性質 | 與 BrowseForge 的差異 |
|---|---|---|
| **BrowseForge** | 本頁主題；反偵測 + 多 Profile + MCP | 強項是「多帳號隔離」|
| [[Playwright]] | 底層自動化框架 | BrowseForge 用它當引擎；單純 Playwright 無反偵測/多指紋 |
| Browser-use / Skyvern 等 | LLM 驅動的瀏覽器 agent | 偏「自動完成任務」，BrowseForge 偏「環境隔離」|
| **Vessel Browser**（[[Hermes-Agent]] 生態）| 以 agent 為主角的瀏覽器，Nous Research 黑客松誕生 | 設計哲學差異：BrowseForge 仍以「人開啟瀏覽器 + AI 操作」為前提；Vessel Browser 主張「agent 是主要操作者，人是監督批准角色」|
| Claude in Chrome / Computer Use | 廠商內建的瀏覽器控制 | 雲端服務，非自架 |

## 與本知識庫的關聯

- [[src-browseforge]] — 來源頁，完整功能細節
- [[MCP]] — BrowseForge 作為 MCP server 的實例
- [[Playwright]] — 底層引擎管理 + v1.4.0 開放外部直連
- [[Claude Code]] / [[Agent-Skills]] — AI agent 自動化應用
- [[OpenClaw]] / [[Cloudflare]] — 同為自架/開源開發工具類
- [[Hermes-Agent]] — 另一個 agent-first 生態系，含同類別的 Vessel Browser；[[src-hermes-agent-99-cases]] 中還有「桌面電腦完整控制模組：截圖、滑鼠、鍵盤」等 Browser/桌面控制案例

## 倫理提示

雙用途工具：合法用途含 QA 測試、多環境開發、隱私保護、合規市場研究；但「多指紋 + 多帳號」也常用於違反平台 ToS 的場景。使用需自行確認符合目標平台條款與當地法規。

## 信心評估

- **強**：功能、架構、12 個 tools、v1.4.0 — gh api 直接驗證
- **中**：反偵測實際效果 — 為其宣稱，未實測
- **時效**：2026-05-11 當日發布 v1.4.0
