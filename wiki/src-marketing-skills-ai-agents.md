---
title: Marketing Skills for AI Agents
type: source
sources: [2026-03-12-Marketing-Skills-for-AI-Agents.md]
created: 2026-04-15
updated: 2026-04-15
tags: [技術, 工具, AI, Agent-Skills, 行銷]
confidence: 強
---

# Marketing Skills for AI Agents

> 來源：GitHub repo `coreyhaines31/marketingskills`｜記錄日期：2026-03-12

## 摘要

一套給 AI coding agents 使用的行銷技能集合，符合 [[Agent-Skills]] 規範。涵蓋 SEO、CRO (Conversion Rate Optimization)、文案、A/B test、付費投放、分析追蹤、定價、Launch、RevOps 等。以 `product-marketing-context` 作為共用基底，確保所有產出符合產品脈絡。

## 技能範圍

- **SEO / Content**：`seo-audit`, `ai-seo`, `schema-markup`, `programmatic-seo`, `site-architecture`, `content-strategy`
- **CRO**：`page-cro`, `signup-flow-cro`, `form-cro`, `popup-cro`, `onboarding-cro`, `paywall-upgrade-cro`
- **文案**：`copywriting`, `copy-editing`, `cold-email`, `email-sequence`, `social-content`
- **廣告與測量**：`paid-ads`, `ad-creative`, `ab-test-setup`, `analytics-tracking`
- **策略 / GTM**：`launch-strategy`, `pricing-strategy`, `competitor-alternatives`, `revops`, `sales-enablement`, `marketing-ideas`, `referral-program`, `churn-prevention`, `free-tool-strategy`

## 核心設計

- **`product-marketing-context`** 是所有技能的基底，先建立產品/受眾/定位/競品脈絡
- 其他技能執行前會先讀取此 context，確保產出一致

## 安裝方式

```bash
# 全部安裝
npx skills add coreyhaines31/marketingskills

# 選裝特定技能
npx skills add coreyhaines31/marketingskills --skill page-cro copywriting
```

## 關鍵引用

> 設計理念是以 `product-marketing-context` 作為共用的產品/受眾/定位基底，其它技能在執行前會先讀取該 context，確保產出符合產品脈絡。

## 相關連結

- GitHub：https://github.com/coreyhaines31/marketingskills
- Agent Skills spec：https://agentskills.io

## 相關頁面

- [[Agent-Skills]] — 技能規範概念
- [[src-photography-studio-proposal]] — 提案中的 SEO 策略可搭配這套工具執行
