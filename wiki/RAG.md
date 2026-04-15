---
title: RAG (Retrieval-Augmented Generation)
type: concept
sources: [2026-04-07-OpenClaw × WordPress 輕量內部知識 RAG 系統.md]
created: 2026-04-15
updated: 2026-04-15
tags: [技術, AI, 概念]
confidence: 強
---

# RAG (Retrieval-Augmented Generation，檢索增強生成)

## 概念說明

讓 AI 只根據你自己的資料回答，避免幻覺 (Hallucination)。三個步驟：

1. **Retrieval（檢索）**：從知識庫找出相關內容
2. **Augment（增強）**：把找到的資料塞進 Prompt 當參考
3. **Generate（生成）**：AI 根據參考資料寫出回答

> 類比：新進員工拿到一本公司手冊，客人問什麼就翻手冊回答，不是憑猜的。

## 與傳統搜尋的差異

| | 傳統關鍵字 (BM25) | 語意搜尋 ([[Embedding]]) |
|--|--|--|
| 比對方式 | 比對文字 | 比對意思（向量距離）|
| 優點 | 快速、免費 | 理解語意、找同義詞 |
| 缺點 | 字對不上就找不到 | 需要 Embedding 費用和向量 DB |

## 適用場景

- 電商商品推薦（100 件以上）
- 企業內部文件 / SOP / FAQ
- 客服自動化
- 任何有大量結構化內容的網站

## 不適合的場景

- 即時庫存/訂單查詢（RAG 是靜態索引）
- 個人化帳戶資料
- 圖片辨識
- 高風險法律合規場景

## 相關頁面

- [[Embedding]] — RAG 的核心技術之一
- [[src-openclaw-wordpress-rag]] — 完整實作案例筆記
- [[Cloudflare]] — 免費方案可部署整套 RAG
