---
title: Asgard Skills Repository
type: source
sources: [asgard-ai-platform-skills.md]
created: 2026-04-16
updated: 2026-05-19
tags: [技術, 工具, AI, Agent-Skills, 股票分析, 策略, 設計, SEO]
confidence: 強
---

# Asgard Skills Repository

> 來源：GitHub repo `asgard-ai-platform/skills`｜擷取日期：2026-04-16｜2026-05-19 [[src-asgard-skills-audit-2026-05-19|本地審計]]更新數字

## 摘要

[[Asgard-AI-Platform]] 開源的 [[Agent-Skills]] 技能庫，以 Markdown 檔案（`SKILL.md`）形式存在，遵循 Claude Agent Skills 規範。定位為 Asgard 平台的「食材庫」(ingredient library)，搭配 MCP (Model Context Protocol) servers 組合成特定場景的 AI agent 外掛。

### 規模時間線

| 時間點 | skill 總數 | 分類數 | 來源 |
|---|---|---|---|
| 2026-04-16（本頁初版）| 263 | 21 類 | 當時 GitHub repo 抓取 |
| 2026-05 推文 | 263 | 22 個分類 | [[src-honglong0420-asgard-x-thread]] |
| **2026-05-19 審計** | **301** | **25 個前綴**（含 tools / eval / docs 三個 repo 工具目錄）| [[src-asgard-skills-audit-2026-05-19]] |

> Repo 持續成長中。以下分類結構為 2026-04-16 快照（21 類），審計版見 audit 來源頁。

## ⚠️ Skeleton 狀態警示（2026-05-19 審計）

**26 個 SKILL.md 標記 `status: skeleton`，內文「body pending」**——全部集中在 `tw-ecom-*` 分類（佔該分類 38 個中的 68%）。

意味著：作者推文「主打台灣中小企業電商」的承諾**現階段大部分還是骨架**。完成版的 12 個 `tw-` 都不是電商主題（stock-analysis / einvoice / fintech / healthcare / manufacturing / payment-integration / retail / startup-legal / tax-basics / ecom-dtc-shopline / ecom-invoice-ezpay / ecom-payment-newebpay）。

詳完整 skeleton 清單與適用性建議見 [[src-asgard-skills-audit-2026-05-19]]。

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

## 作者推薦四件套思維模型（依 [[src-honglong0420-asgard-x-thread|2026-05 X 推文]]）

[[Asgard-AI-Platform]] 內部人員 @honglong0420 推薦串成「**爭議路線 → 商業模型 → 驗證 → 說服**」完整決策路徑的四支 skill：

| Skill | 經典方法論 | Iron Law |
|---|---|---|
| `hum-dialectics` | 辯證法（正反合）| **Synthesis ≠ Compromise**——各退一步不算解答，重新 frame 問題才算 |
| `ops-business-model-canvas` | Alex Osterwalder 商業模式九宮格 | **漏一格就是許願** |
| `ux-lean-startup` | Eric Ries 精實創業 | 列風險最高假設、做 MVP、**直接逼你看數據** |
| `hum-narrative` | 敘事方法論 | **Every Story Needs Tension**——沒衝突的不是故事，是報告 |

「重點不是 AI 多懂方法論，而是這套方法論終於可以**按一個鍵就跑一遍**」——對應 [[Agent-Skills]] 「啟動成本是瓶頸」論點。

## 相關頁面

- [[Asgard-AI-Platform]] — 開發此技能庫的平台
- [[src-honglong0420-asgard-x-thread]] — 內部人員親述視角，補本頁客觀整理
- [[Agent-Skills]] — 技能規範概念
- [[src-marketing-skills-ai-agents]] — 另一套 Agent Skills 集合（行銷導向），可互補使用
- [[src-claude-code-notebooklm]] — 另一種 skill 應用模式（自製 + 整合外部工具，與 Asgard 的「理論模型 + 計算腳本」對照）
