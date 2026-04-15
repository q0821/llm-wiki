---
date: 2026-03-12
category: article
tags: [工具]
source: GitHub
type: AgentSkills
status: 值得關注
---

# Marketing Skills for AI Agents（marketingskills）

**來源**: https://github.com/coreyhaines31/marketingskills

> **備註**
> 一套給 AI coding agents 使用的行銷工作技能集合，涵蓋：SEO、CRO（轉換率優化）、文案、A/B test、付費投放、分析追蹤、定價、Launch、RevOps 等。適合技術行銷（technical marketing）與新創 founder，把常見行銷任務流程化讓 agent 按框架執行。

---

## 摘要

這個 repo 提供一系列符合 Agent Skills spec 的「技能（skills）」markdown，讓支援 skills 的 AI agent 在面對行銷任務時可以套用對應的框架、檢查清單與工作流程。設計理念是以 **`product-marketing-context`** 作為共用的產品/受眾/定位基底，其它技能在執行前會先讀取該 context，確保產出符合產品脈絡。

---

## 重點整理

- **定位**：行銷任務導向的 AgentSkills 集合（給 Claude Code、OpenAI Codex、Cursor、Windsurf 等支援 skills 的 agent 使用）
- **核心依賴**：`product-marketing-context` 是底層基礎；其他技能通常會先讀它
- **技能範圍**（節錄）：
  - SEO / Content：`seo-audit`, `ai-seo`, `schema-markup`, `programmatic-seo`, `site-architecture`, `content-strategy`
  - CRO：`page-cro`, `signup-flow-cro`, `form-cro`, `popup-cro`, `onboarding-cro`, `paywall-upgrade-cro`
  - Copy：`copywriting`, `copy-editing`, `cold-email`, `email-sequence`, `social-content`
  - Ads & Measurement：`paid-ads`, `ad-creative`, `ab-test-setup`, `analytics-tracking`
  - Strategy / GTM：`launch-strategy`, `pricing-strategy`, `competitor-alternatives`, `revops`, `sales-enablement`, `marketing-ideas`, `marketing-psychology`, `referral-program`, `churn-prevention`, `free-tool-strategy`
- **安裝方式（repo 提供）**：
  - `npx skills add coreyhaines31/marketingskills`（全裝）
  - `npx skills add coreyhaines31/marketingskills --skill page-cro copywriting`（選裝）

---

## 使用範例

> 概念：先建立/更新 `product-marketing-context`，再讓 agent 根據任務自動挑對應 skill。

### 範例 1：先建立產品脈絡（所有技能的底座）

- 目標：把你的產品、受眾、定位、競品、語氣等寫進 context，後續文案/SEO/CRO 才不會「寫得很像但不對」。
- 你可以這樣跟 agent 說：
  - 「幫我建立 product-marketing-context：產品是 ____，主要受眾是 ____，核心價值是 ____，主要競品是 ____。」

### 範例 2：SEO 健檢（seo-audit）

- 目標：找出技術 SEO / 內容 SEO 的優先修正點。
- 你可以這樣說：
  - 「請用 seo-audit 幫我檢查 https://example.com，列出 10 個最高優先修正項目（含原因與建議作法）。」

### 範例 3：落地頁轉換率優化（page-cro）

- 目標：改善首頁/落地頁轉換率（CTA、訊息架構、信任元素、表單摩擦等）。
- 你可以這樣說：
  - 「請用 page-cro 審視這個頁面（貼文案/截圖/網址），提出 5 個可以立刻改的 CRO 改動與預期影響。」

### 範例 4：寫/改文案（copywriting / copy-editing）

- 目標：產出更聚焦的主標/副標/段落，或把現有文案改得更精準。
- 你可以這樣說：
  - 「請用 copywriting 幫我寫 5 組首頁 hero 區塊（主標＋副標＋CTA），語氣：____，受眾：____。」
  - 「請用 copy-editing 把這段文案改得更短、更有行動力（貼上原文）。」

### 範例 5：規劃 A/B Test（ab-test-setup）

- 目標：把假設、指標、樣本量、實作方式寫清楚，讓實驗可執行。
- 你可以這樣說：
  - 「請用 ab-test-setup 幫我設計一個測試：把 CTA 從『免費試用』改成『立即開始』，主要指標是註冊率。」

### 範例 6：分析追蹤（analytics-tracking）

- 目標：定義事件、命名規範、漏斗、追蹤缺口。
- 你可以這樣說：
  - 「請用 analytics-tracking 幫我規劃註冊漏斗事件（view → click CTA → signup → activation），並給我事件命名建議。」

---

## 相關連結

- GitHub repo：https://github.com/coreyhaines31/marketingskills
- Agent Skills spec：https://agentskills.io
