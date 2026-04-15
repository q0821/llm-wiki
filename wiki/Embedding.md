---
title: Embedding (向量化)
type: concept
sources: [2026-04-07-OpenClaw × WordPress 輕量內部知識 RAG 系統.md]
created: 2026-04-15
updated: 2026-04-15
tags: [技術, AI, 概念]
confidence: 強
---

# Embedding (向量化)

## 概念說明

把文字轉成一組數字（向量），代表這段文字的「語意位置」。意思越接近的文字，向量距離越近。

```
「新手適合」      → [0.12, -0.87, 0.33, ...]
「入門清爽低酒精」 → [0.15, -0.82, 0.31, ...]
→ 兩組數字很接近 → 搜尋命中
```

## 常見模型費用

| 模型 | 維度 | 費用/1M tokens | 備註 |
|------|------|---------------|------|
| text-embedding-3-small | 1,536 | $0.02 | 95% 場景夠用 |
| text-embedding-3-large | 3,072 | $0.13 | 高精度場景 |
| text-embedding-ada-002 | 1,536 | $0.10 | 舊版，不建議 |
| Cohere embed-v4 | 1,024 | $0.10 | 多語言、圖文混合 |
| CF @cf/baai/bge-base-en-v1.5 | 768 | 免費 | Cloudflare 內建，英文為主 |

## 實務要點

- **LLM 增強應在 Embedding 之前**：先讓 LLM 補充語意標籤，再向量化，大幅提升命中率
- 5,000 件商品索引費用約 $0.10-$0.30 USD

## 相關頁面

- [[RAG]] — Embedding 是 RAG 的核心技術
- [[src-openclaw-wordpress-rag]] — 實作案例
