---
title: Cloudflare
type: entity
sources: [2026-04-07-OpenClaw × WordPress 輕量內部知識 RAG 系統.md, welly-seo-2026-04-full.md]
created: 2026-04-15
updated: 2026-05-11
tags: [技術, 平台, 部署, geo, ai-agent]
confidence: 強
---

# Cloudflare

## 與知識庫的關聯

兩個面向：
1. **部署平台**：在 [[src-openclaw-wordpress-rag|WordPress RAG 筆記]] 中作為完整部署平台，免費方案即可跑整套 [[RAG]] 系統
2. **AI agent 標準推手**：推出 "Is Your Site Agent-Ready?" 檢測工具與 Cloudflare Radar 的 AI agent 標準採用率報告（見下方）

## 免費方案服務一覽

| 服務 | 用途 | 免費額度 |
|------|------|---------|
| Workers | 無伺服器運算 | 100,000 req/天、10ms CPU |
| D1 | SQLite 資料庫 | 10 GB |
| Vectorize | 向量資料庫 | 10M 向量、1,536 維度 |
| Pages | 前端靜態站 | 500 builds/月、無限流量 |
| KV | Key-Value 設定 | 100K reads/天、1 GB |

## 限制

- Workers CPU 時間限制：免費方案 10ms/請求
- Vectorize 不支援複雜過濾查詢
- 無法做向量即時更新（需重新索引）
- 冷啟動延遲

## Is Your Site Agent-Ready? 檢測工具

- 連結：https://blog.cloudflare.com/agent-readiness/
- 用途：免費檢測網站是否準備好被 AI agent 爬取與協作
- 四大面向：**Discoverability**（robots.txt/Sitemap/Link headers）、**Content**（Markdown Negotiation）、**Bot Access Control**、**API/Auth/MCP & Skill Discovery**
- 詳見 [[GEO]] 概念頁

### Cloudflare Radar — AI agent 標準採用率（2026-04-13）

掃 108,774 個 top 200,000 domains：robots.txt 78% / Sitemap 62% / AI rules in robots.txt 16% / Link headers 8.7% / Markdown negotiation 4.6% / **[[Agent-Skills\|Agent Skills]] 0.015% / [[MCP\|MCP Server Card]] 0.0092%** / WebMCP·x402·A2A·AP2 0%。

> 結論：「AI agent 互動」層級的標準幾乎還沒人用——早期紅利期。

## 相關頁面

- [[RAG]] — 可在 Cloudflare 免費部署
- [[Embedding]] — Vectorize 儲存向量
- [[GEO]] — Cloudflare agent-readiness 工具與 Radar 數據的概念頁
- [[MCP]] / [[Agent-Skills]] — Cloudflare Radar 追蹤其採用率
- [[src-openclaw-wordpress-rag]] / [[src-welly-seo-2026-04]] — 來源
