---
title: RAG (Retrieval-Augmented Generation)
type: concept
sources: [2026-04-07-OpenClaw × WordPress 輕量內部知識 RAG 系統.md, 只要 5 分鐘！Claude Code 無縫整合 NotebookLM 實戰.md]
created: 2026-04-15
updated: 2026-04-20
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

## RAG 解決方案類別

| 類別 | 代表 | 特性 |
|------|------|------|
| 自建 | [[OpenClaw]] + [[Cloudflare]] | 完全掌控、可客製化、需開發成本 |
| 免費商用閉合式 | [[NotebookLM]] | Google 提供、Gemini 模型、限定 source、開箱即用 |
| 框架內建 | LangChain / LlamaIndex | 程式化拼裝、彈性大 |

> 兩種策略並非互斥——[[NotebookLM]] 適合研究類「給定來源做深度分析」，[[OpenClaw]] 自建方案適合內部 SOP 等需要高度客製化的場景。

## 相關頁面

- [[Embedding]] — RAG 的核心技術之一
- [[src-openclaw-wordpress-rag]] — 完整自建實作案例筆記
- [[NotebookLM]] — Google 免費 RAG 工具
- [[src-claude-code-notebooklm]] — 用 NotebookLM 作為 Claude Code 的外部 RAG
- [[Cloudflare]] — 免費方案可部署整套自建 RAG
- [[Managed-Agents]] — 概念對照：session event log 是「agent 執行歷程」的外部記憶，與 RAG 的「外部知識」是不同面向的 externalization
