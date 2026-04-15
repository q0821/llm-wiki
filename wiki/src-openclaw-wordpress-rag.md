---
title: OpenClaw × WordPress 輕量內部知識 RAG 系統
type: source
sources: [2026-04-07-OpenClaw × WordPress 輕量內部知識 RAG 系統.md]
created: 2026-04-15
updated: 2026-04-15
tags: [技術, RAG, WordPress, Cloudflare, AI, Embedding]
confidence: 強
---

# OpenClaw × WordPress 輕量內部知識 RAG 系統

> 來源：WordPress 小聚 2026.03.30 筆記｜講者：Nelson Chen（得寬科技）｜記錄日期：2026-04-07

## 摘要

一套將 WordPress/WooCommerce 內容轉為 AI 可語意搜尋知識庫的 [[RAG]] 系統。使用 [[Cloudflare]] 免費方案（Workers + Vectorize + D1）部署，搭配 [[Embedding]] 語意搜尋與 LLM 內容增強。實際案例：lovensake.com（日本酒電商，~5,000 件商品）。

## 系統架構

```
WordPress REST API
       │
       ▼
 rag-indexer（排程）          rag-query（即時）
 ① 抓取商品              ① LLM 意圖分析
 ② LLM 內容增強           ② 向量語意搜尋
 ③ Embedding 向量化       ③ 多階段篩選
 ④ 寫入 Vectorize+D1      ④ LLM 生成推薦
       │                      │
       ▼                      ▼
   Cloudflare 免費方案
   Vectorize + D1 + KV + Pages
```

**關鍵設計**：索引與查詢完全分離

## 核心技術要點

### LLM 先於 Embedding

原始資料（「純米大吟醸、精米歩合 45%」）→ LLM 增強（「送禮適合、新手友善、果香甜口」）→ 再 Embedding。搜尋「送禮」能命中原本只有規格資料的商品。

### 信心度機制

| 問題 | 信心度 | 動作 |
|------|--------|------|
| 「推薦清酒」 | 0.3 | 追問 |
| 「兩千送禮清酒」 | 0.8 | 推薦 |
| 「預算兩千、果香、送禮」 | 0.95 | 直接推薦 |

### 模型分工

| 用途 | 模型 | Temperature |
|------|------|-------------|
| 意圖分析 | gpt-4o-mini | 0.1 |
| 推薦文案 | gpt-4o-mini | 0.7 |
| 內容增強 | gpt-4o-mini | 0.3 |
| Embedding | text-embedding-3-small | - |

## 費用

- Cloudflare 免費方案可跑整套
- 5,000 件商品索引費用：約 $0.10-$0.30 USD（Batch API 再打五折）
- text-embedding-3-small：$0.02/1M tokens

## 開發速度

- OpenClaw MVP：16 天
- 從零到基本搜尋：約 6 小時
- 加語意搜尋：約 12 小時

## 踩過的坑

| 坑 | 對策 |
|----|------|
| WooCommerce API 403 | 改用 query string 認證 |
| BM25 找不到語意相關商品 | 升級 Embedding |
| LLM 推薦前端看不到的商品 | Prompt 限制只寫 Top 5 |
| JSON 大檔記憶體爆 | 改用 Vectorize |

## Admin 後台

4 個 Tab：基本設定、聊天外觀、AI 行為、領域知識。最關鍵的是**語意擴展**設定——教 AI 說行話，不需改程式碼。

## 關鍵引用

> WordPress REST API 就是那本手冊，而且已經結構化好了。

> 一開始就知道「先 BM25 → 再 Embedding → 最後部署」，所以升級只花 20 分鐘，因為路徑早就想好了。

## 相關連結

- 投影片：https://wp-openclaw-rag-ppt.pages.dev/
- 講者 Email：nelson.chen@theqwan.com
- Zeabur 優惠：https://zeabur.com/events?code=wp0330

## 相關頁面

- [[RAG]] — 核心技術概念
- [[Embedding]] — 向量化概念
- [[Cloudflare]] — 部署平台
