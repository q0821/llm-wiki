---
title: Welly SEO 月報 — 2026 年 4 月（SEO 行業動態 + AI 趨勢動向）
type: source
sources: ["Welly SEO 【2026.04月 SEO 行業動態｜AI 趨勢動向】.pdf.md", "welly-seo-2026-04-full.md"]
created: 2026-05-11
updated: 2026-05-11
tags: [seo, geo, ai-search, google-core-update, cloudflare, agent-ready]
confidence: 強
---

# Welly SEO 月報 — 2026 年 4 月

**來源**：Welly（SEO 公司）月報，8 頁 PDF
**原始連結**：https://drive.google.com/file/d/1SHOyCZ03ljbAJFZ_6IqZVNlcD_-jIS-q/view
**抓取於**：2026-05-11（Obsidian Web Clipper 只抓到前 3 頁；後從 Google Drive 完整下載 PDF 補齊全 8 頁）

## 三大主題

1. Google 2026 年 3 月核心演算法更新
2. **Cloudflare "Is Your Site Agent-Ready?" 檢測工具**（與本知識庫 [[GEO]] / [[MCP]] 主題直接相關）
3. Google AI Mode 整合進 Chrome

## 一、Google 2026 年 3 月核心演算法更新

- 期間：**2026-03-27 ~ 04-08**，排名系統全面調整；Google 未發布特別說明
- 可能被評低品質的網站：
  - 過多低品質 AI 生成文章
  - 缺乏獨家經驗、第一人稱視角（低 [[GEO#E-E-A-T|E-E-A-T]]）
  - 內容品質參差不齊
- **核心轉向**：SEO 重點從「**內容產量**」→「**內容價值**」
  - 大量產出不再是排名保證
  - AI 內容需搭配人工優化（缺專業觀點易產相似內容傷 E-E-A-T）
  - 過多低品質頁面拉低整站評價

> 對照 [[presentation-攝影工作室A-網站優化]]：那份簡報的 SEO 策略方向與此次更新一致——重視內容品質與整體價值，不需大改動。

## 二、Cloudflare "Is Your Site Agent-Ready?" 檢測工具

> 詳見 [[GEO]] 概念頁。本節記錄月報的具體內容。

- 連結：https://blog.cloudflare.com/agent-readiness/
- 用途：檢測網站是否準備好被 AI agent 爬取與協作

### 四大檢測面向

| 面向 | 檢查項 |
|---|---|
| **Discoverability** | robots.txt、Sitemap、Link headers |
| **Content** | Markdown Negotiation |
| **Bot Access Control** | bot 存取規則 |
| **API, Auth, MCP & Skill Discovery** | OAuth discovery、MCP Server Card、Agent Skills 等 |

### 三個檢查重點（月報展開）

1. **AI agent 喜歡簡潔 Markdown**——品牌網站是否有專給 AI agent 看的文字內容？
   - Markdown：John Gruber 2004 建立；語法比 HTML 簡潔，AI agent 用較少成本理解內容
2. **robots.txt**——是否說明允許哪些 AI agent 爬蟲？是否允許品牌資料作 AI 訓練？
3. **Link headers**——HTTP 層級的「快速導覽說明」
   - vs HTML `<link>`：HTML link 藏在網頁內容裡（需打開）；Link headers 寫在「封面」（不需打開）
   - 對 AI agent：直接從伺服器回傳讀重要資訊，不需解析整個 HTML——**大幅節省 AI 預算並提速**
4. **AI 可直接呼叫「訂購」「查詢訂單」等商業動作**——品牌網站是否準備好串接？

### Cloudflare Radar 數據（2026-04-13，掃 108,774 個 top 200,000 domains）

| 標準 | 採用率 |
|---|---|
| robots.txt | 78% |
| Sitemap | 62% |
| AI rules in robots.txt | 16% |
| Link headers | 8.7% |
| OAuth discovery | 5.1% |
| Markdown negotiation | 4.6% |
| Universal Commerce Protocol | 4.5% |
| Content signals | 4.1% |
| **[[Agent-Skills\|Agent Skills]]** | **0.015%** |
| **[[MCP\|MCP Server Card]]** | **0.0092%** |
| Web Bot Auth | 0.0092% |
| A2A Agent Card / WebMCP / x402 Payment / AP2 | 0% |

> **重要觀察**：robots.txt/Sitemap 已普及（78%/62%），但 [[MCP]] Server Card（0.0092%）、[[Agent-Skills|Agent Skills]]（0.015%）、WebMCP（0%）等「AI agent 互動」層級標準的採用率幾乎是 0——這個賽道**極早期**，現在投入是先行者優勢。

### Welly 建議方向

- SEO 基礎技術優化：robots.txt + sitemap，加入對 AI agent 友好指令
- AI 可讀性技術強化：導入 **LLMs.txt / llms-full.txt**
- 結構化資料：Website / Article / FAQ 等 schema

## 三、Google AI Mode 整合進 Chrome（2026-04-16）

- Google 4/16 將 AI Mode 整合進 Chrome（美國先推出，預計擴展全球）

### 升級功能

- **並排瀏覽（Side-by-side Browsing）**：Chrome 側邊欄 AI Mode，一邊瀏覽一邊對話，不切分頁即可比對/摘要
- **跨分頁整合**：「+」選單把多分頁/圖片/檔案帶入 AI Mode 分析；或把近期瀏覽分頁納入搜尋範圍

### 影響

- 閱讀網頁時可直接問 AI，不離開頁面
- AI 資料來源不再只依賴搜尋引擎爬的內容，而是理解使用者提供的網頁/私人檔案——延伸到個人化工作流程
- **結論**：使用者點擊網站連結的需求可能下降 → **「頁面是否被 AI 引用」變得更重要**

### SEO 因應

- 文章便於 AI 爬取：段落邏輯清晰、H 標籤層次分明
- 提升內容獨特性與深度：AI 彙整多網頁時，同質內容易被取代；獨家觀點/數據/案例更易被引用

## 與本知識庫的關聯

- [[GEO]] — 本來源是建立此概念頁的主要依據（Agent-Ready / AI 搜尋優化）
- [[llms-txt]] — 本月報推薦的核心做法之一，於 2026-06-02 升級成獨立 concept 頁（含 Google 反對 + Anthropic 行動支持的三方對撞）
- [[src-google-ai-search-optimization-guide-2026-05]] — 2026-05-21 Google 官方發布的反論立場，與本月報 Welly 推薦 llms.txt 的立場直接對撞
- [[Cloudflare]] — "Is Your Site Agent-Ready?" 工具 + Cloudflare Radar 數據
- [[MCP]] / [[Agent-Skills]] — Cloudflare Radar 採用率數據顯示這些標準仍極早期
- [[presentation-攝影工作室A-網站優化]] — SEO + GEO 雙軌體檢，本月報補 2026-03 演算法 + agent-ready 時效資訊
- [[DESIGN-md]] — 「AI agent 喜歡簡潔 Markdown」呼應 DESIGN.md 用 markdown 給 AI 讀的設計
- [[Claude Code]] / [[BrowseForge]] — AI agent 與 web 互動的兩端：BrowseForge 是「主動操作網站」，agent-ready 是「網站被動準備好被讀」
- [[src-will-ai-kill-saas-design]] — AI 衝擊 web、點擊率下降的同主題討論

## 信心評估

- **強**：三大主題的事實（演算法更新期間、Cloudflare 工具、AI Mode 功能）— 月報附完整參考來源連結
- **強**：Cloudflare Radar 數據 — 來自 Cloudflare 官方掃描報告（2026-04-13）
- **中**：Welly 對「自家策略已符合方向」的自我評估 — 屬廠商觀點
- **時效**：2026-04 月報，2026-05-11 ingest 仍新鮮；演算法更新與 AI Mode 推進為持續演變主題

## 忽略區段

無——已抓到完整 8 頁，全部納入。
