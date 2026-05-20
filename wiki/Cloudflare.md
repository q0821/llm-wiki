---
title: Cloudflare
type: entity
sources: [2026-04-07-OpenClaw × WordPress 輕量內部知識 RAG 系統.md, welly-seo-2026-04-full.md, "cloudflare-ai-code-review.md"]
created: 2026-04-15
updated: 2026-05-18
tags: [技術, 平台, 部署, geo, ai-agent, ai-engineering]
confidence: 強
---

# Cloudflare

## 與知識庫的關聯

三個面向：
1. **部署平台**：在 [[src-openclaw-wordpress-rag|WordPress RAG 筆記]] 中作為完整部署平台，免費方案即可跑整套 [[RAG]] 系統
2. **AI agent 標準推手**：推出 "Is Your Site Agent-Ready?" 檢測工具與 Cloudflare Radar 的 AI agent 標準採用率報告（見下方）
3. **內部 AI 工程文化**：公開大型 production AI 系統的工程實作（[[src-cloudflare-ai-code-review|AI Code Review 系統]]、Agents Week、內部 AI 工程堆棧），是本知識庫第一個有完整 production 案例的「AI engineering at scale」標本

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

## 內部 AI 工程實踐（[[src-cloudflare-ai-code-review|Agents Week 揭露]]）

Cloudflare 自家用 **[[OpenCode]] + AI Gateway + Workers KV** 建了一套 CI 原生 AI code review 系統，作為內部工程基礎建設：

| 元件 | 角色 |
|---|---|
| **[[OpenCode]]** | 底層 agentic CLI / SDK（Cloudflare 提交 45+ PR）|
| **AI Gateway** | 統一 AI 提供者路由、cache 管理（85.7% hit rate） |
| **Workers KV** | 模型路由設定的控制平面，5 秒內全 CI 熱切換 |
| **`@opencode-reviewer/cloudflare`** | 系統的 Cloudflare 整合外掛 |
| **GitLab CI 元件** | 完整封裝為 `component: $CI_SERVER_FQDN/ci/ai/opencode@~latest` |

**Production 數據**（前 30 天）：
- 131,246 次審查 / 48,095 MR / 5,169 個 repo
- 中位數 $0.98 / 審查、85.7% cache hit、1,200 億 tokens
- 7 個專精 subagent（程式碼品質 / 文件 / 效能 / 安全 / Codex 合規 / AGENTS.md / 發布）

這套系統在本知識庫中扮演的角色：
- [[Adversarial-Code-Review]] / [[Subagent-Driven-Development]] 兩個概念頁的 **production-grade 對照組**
- [[Harness-Engineering]] [[Addy-Osmani]] 七元件的具體 production 標本
- Circuit Breaker 機制（Netflix Hystrix 啟發，失敗達門檻自動跳脫降級）的 AI agentic 系統代表案例

## 相關頁面

- [[RAG]] — 可在 Cloudflare 免費部署
- [[Embedding]] — Vectorize 儲存向量
- [[GEO]] — Cloudflare agent-readiness 工具與 Radar 數據的概念頁
- [[MCP]] / [[Agent-Skills]] — Cloudflare Radar 追蹤其採用率
- [[OpenCode]] — Cloudflare 內部 AI 工程的底層 agentic CLI
- [[AGENTS-md]] — Cloudflare AI code review 系統有專門的 AGENTS.md 審查者
- [[src-cloudflare-ai-code-review]] — AI code review 系統第一手揭露
- [[src-openclaw-wordpress-rag]] / [[src-welly-seo-2026-04]] — 來源
