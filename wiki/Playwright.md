---
title: Playwright
type: entity
sources: ["github-nczz-browseforge.md", "yt-別再小看本地-aigemma-4-lm-studio-讓你的電腦變成超級離線-ai-工作站而且完全免費-手機也能使用喔.md", "robennalsai-explained Tutorial to deeply understand AI.md"]
created: 2026-05-11
updated: 2026-05-11
tags: [browser-automation, testing, e2e, microsoft, tooling]
confidence: 強
---

# Playwright

Microsoft 開源的**跨瀏覽器自動化框架**，用於 E2E 測試與瀏覽器自動化，支援 Chromium / Firefox / WebKit，提供 Node.js / Python / Java / .NET / Go（社群）綁定。

在本知識庫中，Playwright 是多個工具的底層基礎——[[BrowseForge]] 用它管理瀏覽器引擎、本知識庫的瀏覽器自動化測試也用它。

## 基本資訊

- **廠商**：Microsoft
- **官網**：https://playwright.dev/
- **支援瀏覽器**：Chromium、Firefox、WebKit
- **語言綁定**：Node.js（主）、Python、Java、.NET；Go 為社群 fork（`playwright-community/playwright-go`）
- **核心 API**：navigate / click / fill / evaluate / screenshot / locator / wait_for 等

## 與其他自動化工具的關係

| 工具 | 性質 | 與 Playwright 對照 |
|---|---|---|
| **Playwright** | 本頁主題；跨瀏覽器、現代 API | — |
| Selenium | 老牌、WebDriver 協議 | Playwright 較快、API 較現代、自帶等待邏輯 |
| Puppeteer | Google，僅 Chromium | Playwright 多瀏覽器支援 |
| Cypress | 偏前端測試、跑在瀏覽器內 | Playwright 跑在瀏覽器外、可多 tab/多 context |
| Browser Use / Skyvern | LLM 驅動瀏覽器 agent | 常以 Playwright 為底層執行層 |

## 在本知識庫中的角色

### 1. [[BrowseForge]] 的引擎層

[[BrowseForge]] 用 Playwright 管理多個瀏覽器實例（Camoufox / CloakBrowser），每個 Profile = 一個獨立 Playwright context。

v1.4.0「**Playwright Connect**」（2026-05-11）開放外部 Playwright 腳本直連 BrowseForge 管理的瀏覽器：
- 用 `Browser.Bind()`（named pipe，不暴露 CDP）
- client 須用 Playwright **1.59.x**（major.minor 須匹配）
- 依賴 `nczz/playwright-go` fork（PR #591 待 upstream merge）

### 2. [[MCP]] 工具的常見底層

許多瀏覽器類 MCP server（含 Claude in Chrome 的 playwright fallback、本知識庫環境的 `mcp__plugin_playwright_playwright__*` 工具）以 Playwright 為執行引擎。

### 3. AI agent 操作瀏覽器的執行層

LLM 產生「點這裡、填那裡」的指令 → 透過 Playwright API 實際執行。Browser-use、Skyvern、BrowseForge MCP tools 都是此模式。

## 與 [[src-ai-explained-tutorial|Rob Ennals 的 ai-explained]] 的關聯

ai-explained repo 的 E2E 測試用 `npx playwright test`——Playwright 作為現代前端專案的標準測試工具的縮影。

## 信心評估

- **強**：Playwright 本身的定位、API、語言綁定 — 業界共識、Microsoft 官方
- **強**：BrowseForge 的 Playwright Connect 機制 — release note 直接陳述
- **中**：「Browser-use/Skyvern 以 Playwright 為底層」— 一般情況屬實，個別工具實作可能不同

## 相關頁面

- [[BrowseForge]] — 以 Playwright 為瀏覽器引擎管理層
- [[MCP]] — 瀏覽器類 MCP server 常用 Playwright
- [[Claude Code]] / [[Agent-Skills]] — AI agent 操作瀏覽器
- [[src-browseforge]] / [[src-papaya-gemma-lm-studio]] / [[src-ai-explained-tutorial]] — 提及 Playwright 的來源
