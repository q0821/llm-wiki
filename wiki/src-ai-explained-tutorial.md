---
title: ai-explained — Learn AI Layer by Layer（Rob Ennals）
type: source
sources: ["robennalsai-explained Tutorial to deeply understand AI.md", "github-robennals-ai-explained.md"]
created: 2026-05-11
updated: 2026-05-11
tags: [ai-education, learning-resource, neural-networks, transformers, embeddings]
confidence: 強
---

# ai-explained — Learn AI Layer by Layer

**作者**：Rob Ennals（newsletter：messyprogress.substack.com）
**Repo**：https://github.com/robennals/ai-explained
**Live site**：https://ai-explained.com（beta：ai-explained-beta.vercel.app）
**抓取於**：2026-05-11（fetch-url.sh 超時，改用 gh api 萃取 README + curriculum）
**性質**：互動式視覺化 AI 教學網站

## 核心定位

「**Learn AI Layer by Layer**」——從 first principles 解釋現代 AI 的運作，**不假設任何數學或資工背景**。每章是獨立文章 + inline 互動 widgets，每章配一個 Jupyter notebook 可在 Google Colab 跑真 PyTorch 程式碼。

技術棧：Next.js + MDX + React widgets。

## AI 底層學習路徑（章節地圖）

✅ = 已完成可讀（`ready: true`）；其餘開發中。

### 基礎層

| # | 標題 | 主題 | 一句話 | 狀態 |
|---|------|------|--------|------|
| 0 | Introduction | 導論 | 這是什麼、怎麼用 | ✅ |
| 1 | Everything Is Numbers | Computation | 文字/圖像/聲音都是數字；思考是 function；模型是有旋鈕的機器 | ✅ |
| 2 | The Power of Incremental Improvement | Optimization | **演化 / A-B testing / gradient descent 是同一個演算法**——小改動、用現實測試、保留或丟棄 | ✅ |
| 3 | Building a Brain | Neural networks | neuron = 平滑的 logic gate；疊成 layers 可算任何東西；backpropagation 一次訓練所有 weights | ✅ |
| 4 | Describing the World with Numbers | Vectors | vector 就是一串數字；dot product 量相似度；單一 neuron = pattern detector | ✅ |
| 5 | From Words to Meanings | **[[Embedding]]** | one-hot → learned representations；word analogies；meaning 的幾何 | ✅ |

### Transformer 層

| # | 標題 | 主題 | 狀態 |
|---|------|------|------|
| 6 | Understanding by Predicting | Next-word prediction | ✅ |
| 7 | Paying Attention | Attention | ✅ |
| 8 | Where Am I? | Positional encoding | ✅ |
| 9 | One Architecture to Rule Them All | Transformers | ✅ |

### 進階層（開發中）

| 標題 | 主題 |
|------|------|
| Thinking by Rotating | Matrix math |
| Why Training Almost Doesn't Work | Making training work |
| Only Wake the Specialists You Need | **Mixture of experts**（呼應 [[Gemma]] 的 A3B 解釋）|
| Remembering a Million Words | Long context（呼應 [[src-claude-code-context-management]]）|
| Running Models Fast | Inference and hardware |
| Looking Inside the Mind | Interpretability |
| Learning from Experience | Reinforcement learning |
| Getting Better by Beating Yourself | Self-play |
| Thinking by Talking to Yourself | Reasoning models |
| Teaching AI Right from Wrong | **Alignment** |
| Models Teaching Models | Distillation and synthetic data |
| Teaching Machines to See | Image comprehension |
| （標題未取得）| Image generation |

> 觀察：這個 curriculum 幾乎涵蓋了 LLM 從底層數學到對齊的完整地圖——可作為「想真正搞懂某個 AI 概念」的查詢起點。

## 與本知識庫的關聯

本知識庫多數 AI 頁面是**應用導向**（怎麼用 [[Claude Code]]、[[NotebookLM]]、[[RAG]]），ai-explained 補的是**原理導向**的學習資源：

| 本知識庫頁面 | ai-explained 對應章節 |
|---|---|
| [[Embedding]] | #5 From Words to Meanings |
| [[RAG]]（檢索增強生成）| #4 Vectors（dot product 相似度）+ #5 Embeddings |
| [[Gemma#MoE 模型說明（影片範例 A3B）\|Gemma 的 A3B（MoE）]] | Mixture of experts 章（開發中）|
| [[src-claude-code-context-management\|百萬上下文]] | Long context 章（開發中）|
| AI 對齊議題（散見各頁）| Alignment 章（開發中）|

> 用途定位：把這個網站放進 `references` 類別，當作「**底層原理的查詢工具書**」——讀本知識庫的應用頁時，想深入某個概念就來這裡。

## 信心評估

- **強**：repo 結構、章節列表、技術棧 — gh api 直接驗證
- **中**：教學品質本身 — 未實際讀過各章內容，但作者 Rob Ennals 是業界知名（前 Intel/Facebook 研究者）、6 stars 為新專案初期
- **時效**：2026-05-11 為 beta 階段，部分章節開發中

## 相關頁面

- [[Embedding]] — 直接對應章節，已加延伸學習連結
- [[RAG]] — 底層仰賴 vectors / embeddings
- [[Gemma]] — MoE 概念互相印證
- [[src-claude-code-context-management]] — long context 主題
