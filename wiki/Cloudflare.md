---
title: Cloudflare
type: entity
sources: [2026-04-07-OpenClaw × WordPress 輕量內部知識 RAG 系統.md]
created: 2026-04-15
updated: 2026-04-15
tags: [技術, 平台, 部署]
---

# Cloudflare

## 與知識庫的關聯

在 [[src-openclaw-wordpress-rag|WordPress RAG 筆記]] 中作為完整部署平台，免費方案即可跑整套 [[RAG]] 系統。

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

## 相關頁面

- [[RAG]] — 可在 Cloudflare 免費部署
- [[Embedding]] — Vectorize 儲存向量
- [[src-openclaw-wordpress-rag]] — 完整實作筆記
