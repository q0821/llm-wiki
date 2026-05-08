---
title: RAG (Retrieval-Augmented Generation)
type: concept
sources: [2026-04-07-OpenClaw × WordPress 輕量內部知識 RAG 系統.md, 只要 5 分鐘！Claude Code 無縫整合 NotebookLM 實戰.md, "Claude + Obsidian 打造 AI 第二大腦，Karpathy 的知識管理 LLM Wiki 教學｜科技翰林院.md"]
created: 2026-04-15
updated: 2026-05-08
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

## RAG vs LLM Wiki：兩種知識利用範式

[[Andrej-Karpathy]] 2026-04 提出 [[LLM-Wiki]] 概念時，直接點名 RAG 的根本缺陷：

> "the LLM is rediscovering knowledge from scratch on every question. **There's no accumulation.**"
> — Karpathy, 2026

### 核心差異

| 面向 | RAG | [[LLM-Wiki]] |
|---|---|---|
| 處理時機 | **查詢時**才從原始文件撈片段 | **匯入時**就消化、提取、整合 |
| 累積性 | **無**，每次從零開始 | **有複利**，wiki 隨使用越來越豐富 |
| 交叉引用 | 動態檢索結果（ad-hoc）| 已建好的 `[[wikilink]]` 網路（persistent）|
| 矛盾處理 | 通常被掩蓋（取最相似 chunk） | 顯性標註並列呈現 |
| 適用場景 | 動態查詢、大量文件、低累積需求 | 個人長期累積、追溯思考脈絡 |

### 並非取代關係

兩者**互補而非取代**：
- RAG 適合「**你不會反覆查同一主題**」的場景（客服 FAQ、SOP 查詢、商品推薦）
- LLM Wiki 適合「**主題會隨時間累積、會回頭找脈絡**」的場景（個人研究、長期決策追蹤）

實務上可疊用：[[NotebookLM]]（RAG）負責「給定一批 source 做深度分析」、[[LLM-Wiki]]（本知識庫即是）負責「跨時間累積與交叉引用」——例如本知識庫的 [[src-claude-code-notebooklm]] 就記錄了「用 RAG 工具當外部 token 倉庫」的混合策略。

## 相關頁面

- [[Embedding]] — RAG 的核心技術之一
- [[LLM-Wiki]] — 對立的另一種範式
- [[src-openclaw-wordpress-rag]] — 完整自建實作案例筆記
- [[NotebookLM]] — Google 免費 RAG 工具
- [[src-claude-code-notebooklm]] — 用 NotebookLM 作為 Claude Code 的外部 RAG
- [[src-techhanlin-llm-wiki-tutorial]] — 提出 LLM Wiki vs RAG 對比的中文來源
- [[Cloudflare]] — 免費方案可部署整套自建 RAG
- [[Managed-Agents]] — 概念對照：session event log 是「agent 執行歷程」的外部記憶，與 RAG 的「外部知識」是不同面向的 externalization
