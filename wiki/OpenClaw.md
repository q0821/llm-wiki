---
title: OpenClaw
type: entity
sources: [2026-04-07-OpenClaw × WordPress 輕量內部知識 RAG 系統.md]
created: 2026-04-16
updated: 2026-04-16
tags: [技術, AI, 工具, 框架]
confidence: 中
---

# OpenClaw

## 概要

AI Agent 框架，支援 Telegram / Discord / Slack 等平台。在 [[src-openclaw-wordpress-rag|WordPress RAG 筆記]] 中作為 MVP 快速驗證工具使用。

## 技術資訊

- 可在 [Zeabur](https://zeabur.com) 上快速部署
- 支援 BM25 關鍵字搜尋與 [[Embedding]] 語意搜尋
- MVP 開發速度：16 天完成，基本搜尋約 6 小時、語意搜尋約 12 小時

## 在 RAG 專案中的角色

作為第一代 MVP 使用，後續升級為 [[Cloudflare]] Workers 生產環境：

| | OpenClaw MVP | Cloudflare Production |
|--|--|--|
| 部署 | Zeabur（本機） | 全球邊緣（Workers） |
| 資料儲存 | JSON 檔 | Vectorize + D1 |
| 前端 | Telegram + 試運行頁面 | Chat Widget + 獨立頁 |
| 後台 | 無 | Admin UI |

## 相關頁面

- [[src-openclaw-wordpress-rag]] — 完整 RAG 實作筆記
- [[RAG]] — 核心技術概念
- [[Cloudflare]] — 生產環境部署平台
