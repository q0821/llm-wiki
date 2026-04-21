---
title: Asgard Skills Repository
type: source
sources: [asgard-ai-platform-skills.md]
created: 2026-04-16
updated: 2026-04-16
tags: [技術, 工具, AI, Agent-Skills, 股票分析, 策略, 設計, SEO]
confidence: 強
---

# Asgard Skills Repository

> 來源：GitHub repo `asgard-ai-platform/skills`｜擷取日期：2026-04-16

## 摘要

[[Asgard-AI-Platform]] 開源的 [[Agent-Skills]] 技能庫，包含 **263 個 coding agent skills**，以 Markdown 檔案（`SKILL.md`）形式存在，遵循 Claude Agent Skills 規範。定位為 Asgard 平台的「食材庫」(ingredient library)，搭配 MCP (Model Context Protocol) servers 組合成特定場景的 AI agent 外掛。

## 分類結構（21 類，以前綴區分）

| 前綴 | 數量 | 領域 | 與我相關的重點 |
|------|------|------|---------------|
| `grad-` | 87 | 研究所等級理論模型（RBV, CAPM, SEM, DID） | CAPM 可用於股票估值 |
| `algo-` | 62 | 演算法（PageRank, BM25, ARIMA, EOQ） | ARIMA 可用於時間序列預測；PageRank/BM25 與 SEO 相關 |
| `biz-` | 22 | 商業框架（SWOT, Porter's Five Forces, DCF） | DCF 現金流折現可用於股票估值；SWOT/Porter 可用於策略分析 |
| `hum-` | 9 | 人文與批判思考 | — |
| `tw-` | 9 | 台灣在地知識 | 台灣相關資料 |
| 其他 | ~73 | 經濟、設計、財務等 | 設計與財務分析 |

## Skill 設計模式

每個 skill 遵循統一結構：

1. **Overview / Framework** — 概念框架
2. **When to Use** — 適用情境
3. **Methodology** — 方法論步驟
4. **Iron Law** — 非顯而易見的限制（這是特色設計，強調 agent 容易忽略的陷阱）
5. **Output Format** — 輸出格式
6. **Gotchas** — 常見錯誤與注意事項
7. **Scripts** — 確定性計算腳本（選填）
8. **References** — 參考文獻

## 確定性計算腳本

20 個 skill 附帶純 Python 腳本，處理 LLM 容易算錯的計算：
- **財務**：DCF、CAPM 等估值模型
- **統計**：SEM、DID 等計量方法
- **供應鏈**：EOQ 等最佳化計算
- **排名 / 電商**：排序與推薦演算法

> 設計理念：LLM 擅長推理與框架應用，但數值計算容易出錯。將確定性計算抽離為 Python 腳本，讓 agent 呼叫腳本取得精確結果。

## 與我的應用場景關聯

### 股票分析
- `biz-` 類的 DCF (Discounted Cash Flow) — 現金流折現估值
- `grad-` 類的 CAPM (Capital Asset Pricing Model) — 資產定價模型
- `algo-` 類的 ARIMA — 時間序列預測

### 策略分析
- `biz-` 類的 SWOT、Porter's Five Forces — 競爭分析框架
- `grad-` 類的 RBV (Resource-Based View) — 資源基礎觀點

### 網站規劃與 SEO
- `algo-` 類的 PageRank、BM25 — 搜尋排名核心演算法理解
- 可與 [[src-marketing-skills-ai-agents|marketingskills]] 互補：marketingskills 偏實務操作，Asgard 偏理論基礎

### 設計
- 設計相關 skills（具體 skill 清單待進一步探索 repo）

## 安裝方式

```bash
npx skills add asgard-ai-platform/skills
```

## 關鍵引用

> This repository serves as the "ingredient library" for the Asgard AI Platform, combining with MCPs (Model Context Protocol servers) to create specialized coding agent plugins for specific scenarios (stock analysis, e-commerce operations, policy research).

## 相關頁面

- [[Asgard-AI-Platform]] — 開發此技能庫的平台
- [[Agent-Skills]] — 技能規範概念
- [[src-marketing-skills-ai-agents]] — 另一套 Agent Skills 集合（行銷導向），可互補使用
- [[src-claude-code-notebooklm]] — 另一種 skill 應用模式（自製 + 整合外部工具，與 Asgard 的「理論模型 + 計算腳本」對照）
