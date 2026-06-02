---
title: GEO (Generative Engine Optimization) / Agent-Ready 網站
type: concept
sources: ["welly-seo-2026-04-full.md", "2026-03-20-攝影工作室A_網站提案.md", "2026-06-02-google-ai-search-optimization-guide-zh-tw.md"]
created: 2026-05-11
updated: 2026-06-02
tags: [seo, geo, ai-search, agent-ready, e-e-a-t, llms-txt, cloudflare, source-bias-platform-gatekeeper]
confidence: 中
---

# GEO（Generative Engine Optimization）/ Agent-Ready 網站

把網站優化的目標從「**被搜尋引擎找到並排名**」（傳統 SEO）延伸到「**被 AI / LLM 理解、引用、存取並執行互動**」——也就是讓網站對 AI agent 與生成式搜尋引擎友善。

> 術語注意：業界用詞尚未統一——「GEO」(Generative Engine Optimization)、「AEO」(Answer Engine Optimization)、「AI SEO」、「Agent-Ready」大致指同一件事的不同切面。本頁用 GEO 為主詞。

## SEO vs GEO

| 面向 | 傳統 SEO | GEO / Agent-Ready |
|---|---|---|
| 目標讀者 | 搜尋引擎爬蟲 + 人類 | **AI agent / LLM** + 人類 |
| 成功指標 | 排名、自然流量、點擊率 | **被 AI 引用的次數**、出現在 AI 回答中 |
| 內容格式 | HTML，關鍵字優化 | 同時提供簡潔 **Markdown**；結構化資料 |
| 探索機制 | robots.txt、sitemap.xml | + **LLMs.txt / llms-full.txt**、Link headers、MCP Server Card |
| 互動 | 無（單向被讀）| AI 可呼叫「訂購」「查訂單」等商業動作 |

> 兩者核心邏輯一致——都在「**提升網站內容的可發現性與可理解性**」（Welly 月報觀察）——GEO 是 SEO 的延伸而非取代。

## Google 官方反論（2026-05-21）

**重要對話組更新**：Google 在 2026-05-21 更新的官方 [[src-google-ai-search-optimization-guide-2026-05|AI 搜尋指南]] 中，對本頁前面採用的廠商立場（Welly 月報 / Cloudflare）**明確採取反對立場**。雙方框架未改變既有對 SEO vs GEO 概念差異的描述，但對「**應採取哪些具體技術做法**」有直接衝突。本知識庫採並列保存策略，不擅自取捨。

### 立場對撞表

| 議題 | Welly / Cloudflare 立場（本頁原本採用，2026-04 / 2026-05-11）| [[src-google-ai-search-optimization-guide-2026-05\|Google 官方指南]]（2026-05-21）|
|---|---|---|
| **llms.txt** | 推薦 Level 2 必備 | 「不需要建立新的機器可讀檔案、AI 文字檔案、標記或 Markdown」|
| **Markdown negotiation** | 推薦（讓 AI agent 用較少成本理解）| 「不需要專為生成式 AI 搜尋撰寫內容」|
| **AEO/GEO 是否為獨立策略** | **是**（與 SEO 不同的目標讀者、成功指標、互動模式）| **否**：「就是針對搜尋體驗最佳化，仍屬於 SEO」|
| **新增特殊 schema** | 建議 Level 3（Website / Article / FAQ）| 「不需要新增任何特殊的 schema.org 標記」（既有 schema 仍可用）|
| **MCP Server Card / WebMCP / Agent Skills** | 推薦 Level 4（先行者紅利）| 未提及 |

### 兩派如何同時為真

雙方都不算錯，但**目標讀者框架不同**：

- **Welly / Cloudflare 框架**：「網站需準備好被**所有 AI agent**理解與互動」（多平台 + agent operation 視角）
- **Google 框架**：「網站需準備好被**Google 搜尋系統 + AI Overview**引用」（單一平台 + retrieval 視角）

選用建議：

| 你的真實 audience | 建議採用立場 |
|---|---|
| 主要靠 Google 搜尋 + AI Overview 曝光 | Google 立場 → 把 llms.txt / 為 AI 重寫等 effort 省下 |
| 主要靠 ChatGPT / Claude / Perplexity 引用 | Welly 立場仍有效（Google 立場不射程內）|
| 想被 AI agent 主動操作（MCP / WebMCP）| Welly Level 4 立場仍有效（Google 指南未提）|
| 多平台都在乎 / 不確定 | 雙軌（基本 SEO + 選擇性試做 llms.txt 等）|

### 為什麼 Google 會反對 llms.txt：**Source bias 平台守門人型**

如果開發者普遍採用 llms.txt 等**平台無關標準**，OpenAI / Anthropic / Perplexity 可以選擇優先抓 llms.txt，Google 在「平台無關優化」這條 axis 上會輸給對手。因此 Google 把 llms.txt 框成「沒必要 / 沒效果」是**自然的競爭立場**，未必純粹是技術判斷。

這是本知識庫累積的**第 6 次吸收檢核**辨識出的新型 Source bias 亞型（**平台守門人型**），詳見 [[src-google-ai-search-optimization-guide-2026-05#個人吸收（第 6 次 / spaced retrieval 預定 2026-06-15）|該頁個人吸收段]] 與 [[Ratchet-Pattern]]。

### 立場演化時間軸

- 2026-04：Welly 月報出，推薦 llms.txt / Markdown negotiation 等
- 2026-04-13：Cloudflare Radar 數據（llms.txt 採用率仍極低，先行者紅利期）
- 2026-05-11：本頁建立，採 Welly / Cloudflare 立場
- **2026-05-21：Google 官方指南更新，明確反對 llms.txt 等**
- 2026-06-02：本知識庫 ingest Google 指南 → 本段並列保存

## 為什麼現在重要

### 1. Google AI Mode 整合進 Chrome（2026-04-16）

使用者在閱讀網頁時可直接問 AI，不離開頁面 → **對額外點擊網站連結的需求下降** → 「頁面是否被 AI 引用」變得比「頁面排第幾」更重要。

詳見 [[src-welly-seo-2026-04#三、Google AI Mode 整合進 Chrome（2026-04-16）]]。

### 2. Google 核心演算法更新趨勢（2026-03）

SEO 重點從「內容產量」轉「內容價值」——大量低品質 AI 內容、低 [[#E-E-A-T]] 的網站被降評。這與 GEO 同向：AI 引用時偏好獨家觀點/數據/案例，同質內容易被取代。

### 3. AI agent 生態正在成形

[[Claude Code]] / [[BrowseForge]] / [[Managed-Agents]] 等 AI agent 越來越會主動爬取與操作網站——網站若沒準備好（無 Markdown 版本、robots.txt 沒 AI 規則、無 Link headers），AI 爬取成本高、理解差。

## Cloudflare "Is Your Site Agent-Ready?" 檢測

[[Cloudflare]] 推出的免費檢測工具（https://blog.cloudflare.com/agent-readiness/），四大面向：

| 面向 | 檢查項 | 說明 |
|---|---|---|
| **Discoverability** | robots.txt、Sitemap、Link headers | AI agent 能否找到並快速定位內容 |
| **Content** | Markdown Negotiation | 是否提供簡潔 Markdown 版本 |
| **Bot Access Control** | bot 存取規則 | 是否明確允許/拒絕哪些 AI 爬蟲 |
| **API, Auth, MCP & Skill Discovery** | OAuth discovery、[[MCP]] Server Card、[[Agent-Skills]] | 網站是否暴露可被 AI 呼叫的工具 |

### Cloudflare Radar 採用率（2026-04-13，108,774 個 top 200,000 domains）

| 已普及 | 早期 | 幾乎為零 |
|---|---|---|
| robots.txt 78% | AI rules in robots.txt 16% | Web Bot Auth 0.0092% |
| Sitemap 62% | Link headers 8.7% | **MCP Server Card 0.0092%** |
| | Markdown negotiation 4.6% | **Agent Skills 0.015%** |
| | | WebMCP / x402 / A2A / AP2 0% |

> **先行者觀察**：robots.txt/sitemap 是「上一代」標準（已飽和）；Markdown negotiation、Link headers 是「現在進行式」（<10%）；[[MCP]] Server Card、[[Agent-Skills]]、WebMCP 是「下一代」（趨近 0%）。現在投入 GEO 仍是早期紅利期。

## 實作清單（Welly 月報建議）

### Level 1：SEO 基礎（多數網站已有）

- robots.txt 設置 + 提交 sitemap.xml
- 在 robots.txt 加入對 AI agent 友好的指令（允許哪些 AI 爬蟲、是否允許作訓練資料）

### Level 2：AI 可讀性

- 導入 **LLMs.txt / llms-full.txt**——類似 robots.txt 但專給 LLM，列出網站的關鍵內容索引，提升被 AI 正確引用與收錄的機會
- 提供頁面的 **Markdown 版本**（Markdown Negotiation）
- 設置 **Link headers**——讓 AI agent 不需解析整個 HTML 就拿到頁面關鍵資訊

### Level 3：結構化資料

- 設置 schema.org 結構化資料：`Website`、`Article`、`FAQ` 等
- 提升 AI 對網頁的理解，加強爬取與引用

### Level 4（前沿）：可被 AI 操作

- 暴露 [[MCP]] Server Card——讓 AI agent 知道你的網站提供哪些可呼叫的工具
- Universal Commerce Protocol——讓 AI 可直接執行「訂購」「查訂單」等商業動作
- 採用率趨近 0%，但這是「AI agent 經濟」的入口

## E-E-A-T

Google 評估內容品質的框架，影響傳統 SEO 與 GEO 雙方：

| 字母 | 含義 |
|---|---|
| **E**xperience | 第一手經驗（作者真的用過/做過/去過）|
| **E**xpertise | 專業知識（領域權威性）|
| **A**uthoritativeness | 權威性（網站/作者在領域中的地位）|
| **T**rustworthiness | 可信度（資訊正確、來源透明、安全）|

低 E-E-A-T 的網站（無第一人稱視角、純 AI 拼湊）在 2026-03 核心演算法更新中被降評。GEO 場景下，AI 引用也偏好高 E-E-A-T 內容。

> 對照本知識庫 CLAUDE.md：「原文引用：需要，重要論點附原文引用區塊」「信心標注：標注證據等級」——這些規則本質上就是在強化本知識庫頁面的 E-E-A-T。

## 與本知識庫的關聯

- [[src-welly-seo-2026-04]] — 本概念頁的廠商立場主要來源（Welly 2026-04 月報）
- [[src-google-ai-search-optimization-guide-2026-05]] — **對話組對手**（Google 官方反論，2026-05-21，明確反對 llms.txt / 為 AI 重寫內容等做法）
- [[llms-txt]] — 兩派交鋒焦點的獨立 concept 頁；含實際部署投票證據（[[Anthropic]] 與 Stripe 已部署）+ 三方立場對撞 + 自家 wiki 決策框架
- [[Cloudflare]] — agent-readiness 檢測工具的提供者
- [[presentation-攝影工作室A-網站優化]] — 該簡報已含「SEO + GEO 雙軌體檢」
- [[MCP]] / [[Agent-Skills]] — GEO Level 4 的核心標準（採用率仍極低）
- [[DESIGN-md]] — 「給 AI 讀的 markdown」概念互通
- [[Claude Code]] / [[BrowseForge]] — AI agent 爬取/操作網站的另一端
- [[src-will-ai-kill-saas-design]] — AI 衝擊 web、點擊率下降的同主題

## 信心評估

- **強**：SEO vs GEO 的差異、Cloudflare 工具的四面向、Radar 數據 — 來自 Cloudflare 官方 + Welly 月報
- **強**：E-E-A-T 框架 — Google 官方長期沿用
- **中**：「現在投入 GEO 是早期紅利」— 合理推論，但 GEO 對排名/曝光的實際 ROI 尚無大規模驗證資料
- **中**：術語（GEO vs AEO vs AI SEO）— 業界用詞未統一，本頁取較常見者

## 待補資料缺口

- LLMs.txt / llms-full.txt 的具體格式規範（目前只知道概念，未深入）
- Cloudflare agent-readiness 工具的實際檢測範例（拿自己/客戶網站跑一次）
- WebMCP、Universal Commerce Protocol 等新標準的細節
