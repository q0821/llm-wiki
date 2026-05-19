---
title: Asgard Skills 個人 install 候選清單（接案 / 投資 / 思維三主題）
type: synthesis
sources: ["src-asgard-skills-audit-2026-05-19", "src-asgard-skills", "src-honglong0420-asgard-x-thread"]
created: 2026-05-19
updated: 2026-05-19
tags: [asgard, agent-skills, personal-install-list, taiwan-smb]
confidence: 強
---

# Asgard Skills 個人 install 候選清單（接案 / 投資 / 思維三主題）

> **背景**：[[src-asgard-skills-audit-2026-05-19|2026-05-19 本地審計]]從 301 個 Asgard skill 中挑出與使用者三主題（接案 / WordPress / SEO、投資、商業思維）強相關者，作為「不必全裝 301 個，先裝這 ~50 個就涵蓋」的精選清單。
>
> **本知識庫使用者背景**（依 CLAUDE.md / dev-principles）：WordPress / Filament 接案、SEO + RAG 加值、投資（個股 + 加密 + 雙幣贏）、AI 工程實作。

## 整體規模

| 主題 | 強相關 skill 數 | 安裝建議 |
|---|---|---|
| 🏢 接案 / WordPress / SEO | **26** | **強烈建議全套** |
| 📈 投資 | **11** | 強烈建議全套 |
| 🧠 商業思維 / 決策（含推文四件套）| **14** | 建議全套 |
| 🇹🇼 台灣專屬完成版（非 skeleton）| 12 | 視接案客戶而定，可挑 |
| **總計（去重）** | **~50** | 約佔 301 個的 17% |

## 🏢 接案 / WordPress / SEO（26 個強相關）

### SEO 演算法層（7 個）

Repo 中 `algo-seo-*` 全套，建議整組裝：

- `algo-seo-pagerank` — PageRank 演算法（Iron Law：damping factor < 1、sum = 1.0 invariant）
- `algo-seo-tfidf` — TF-IDF 關鍵字權重
- `algo-seo-bm25` — BM25 排名（同 `algo-ecom-bm25`，看 repo 是否兩處都有）
- `algo-seo-crawl` — 爬蟲行為建模
- `algo-seo-technical` — 技術 SEO 檢查
- `algo-seo-backlink` — 反向連結分析
- `algo-seo-content` — 內容相關性
- `algo-seo-schema` — Schema.org 結構化資料

### 行銷 / 廣告（4 個）

- `mkt-seo-audit` — SEO 體檢 SOP（與 [[GEO|Agent-Ready 體檢]]互補）
- `mkt-ab-testing` — A/B 測試
- `mkt-ad-optimization` — 廣告優化
- `mkt-content-calendar` — 內容行事曆

### 電商（7 個）

- `ecom-analytics` — 電商分析
- `ecom-rfm-analysis` — RFM 客戶分群
- `ecom-promo-roi` — 促銷 ROI
- `ecom-inventory-health` — 庫存健康度
- `ecom-multilingual-listing` — 多語商品上架
- `ecom-sea-strategy` — 東南亞市場策略
- `ecom-conversational` — 對話式商務

### 電商演算法（3 個）

- `algo-ecom-bm25`
- `algo-ecom-ranking`
- `algo-ecom-search`

### 公關 / 危機溝通（5 個）

- `pr-press-release` — 新聞稿撰寫
- `pr-crisis-communication` — 危機溝通
- `pr-crisis-response` — 危機回應
- `pr-media-monitoring` — 媒體監測
- `pr-social-copywriting` — 社群文案

---

## 📈 投資（11 個強相關）

### 台股專屬（1 個）

- **`tw-stock-analysis`** — Taiwan Stock Fundamental Analysis（含 MOPS / TWSE / Goodinfo / 證交所月營收）；對應本 wiki [[src-taiwan-stock-2026-03-09|台股換股實操]]

### 估值 / 公司基本面（6 個）

- `biz-dcf` — DCF 折現現金流估值
- `biz-cac-ltv` — CAC/LTV 單位經濟學（Iron Law：LTV:CAC > 3）；對應本 wiki [[顧客終身價值]]
- `biz-unit-economics` — 單位經濟學總覽
- `biz-financial-ratios` — 財務比率
- `biz-dupont` — DuPont 分解
- `biz-breakeven` — 損益兩平分析

### 財務分析 / 預測（4 個）

- `fin-earnings-summary` — 財報摘要
- `fin-modeling` — 財務建模
- `data-financial-analysis` — 財務數據分析
- `algo-forecast-arima` — ARIMA 時間序列（可用於股價短期預測——但注意 [[src-dual-currency-truth|定價折價]]中提到「市場效率假設」）

---

## 🧠 商業思維 / 決策（14 個）

### @honglong0420 推文四件套（決策完整路徑）

依 [[src-honglong0420-asgard-x-thread]] 推薦串連——「**爭議路線 → 商業模型 → 驗證 → 說服**」：

1. `hum-dialectics` — 辯證法正反合（Iron Law：Synthesis ≠ Compromise）
2. `ops-business-model-canvas` — 商業模式九宮格（Iron Law：All Nine Blocks Must Be Completed and Consistent）
3. `ux-lean-startup` — 精實創業（Iron Law：Validate Before You Build）
4. `hum-narrative` — 敘事方法論（Iron Law：Every Story Needs Tension）

### 經典商業框架（10 個）

`biz-` 類精選：

- `biz-swot` — SWOT
- `biz-porters-five-forces` — Porter 五力
- `biz-pestel` — PESTEL
- `biz-bcg-matrix` — BCG 矩陣
- `biz-blue-ocean` — 藍海策略
- `biz-stp` — STP 市場定位
- `biz-4p-7p` — 4P/7P 行銷組合
- `biz-ansoff` — Ansoff 成長矩陣
- `biz-customer-journey` — 顧客旅程
- `biz-toc` — TOC 限制理論

---

## 🇹🇼 台灣專屬完成版（12 個，視接案客戶取用）

依 [[src-asgard-skills-audit-2026-05-19#12 個非 skeleton 的 `tw-*`（可立即使用）]] 列表：

### 投資 / 財務（4）

- `tw-stock-analysis`
- `tw-fintech-compliance`
- `tw-tax-basics` — 台灣稅務基礎（接案客戶常問）
- `tw-einvoice-guide` — 電子發票指南（接案客戶常問）

### 產業（3）

- `tw-manufacturing`
- `tw-healthcare-regulations`
- `tw-retail-landscape`

### 法律（1）

- `tw-startup-legal`

### 金流（3）

- `tw-payment-integration` — 通用金流整合
- `tw-ecom-payment-newebpay` — 藍新金流
- `tw-ecom-invoice-ezpay` — ezPay 電子發票

### 電商 DTC（1）

- `tw-ecom-dtc-shopline` — Shopline DTC

> ⚠️ **避雷**：26 個 `tw-ecom-*` skeleton 暫不裝（jkopay / ecpay / tappay / momo / shopee 等 marketplace / payment / logistics / compliance / analytics 都是 body pending）。詳完整 skeleton 清單見 [[src-asgard-skills-audit-2026-05-19#26 個 tw-ecom-* skeleton 完整清單]]。

---

## 安裝方式

依 [[src-asgard-skills|既有 wiki 紀錄]]：

```bash
# 安裝整個 repo（301 個 skill）
npx skills add asgard-ai-platform/skills
```

如要 **selective install**（只裝這 ~50 個強相關），看 Asgard 是否支援個別 skill 安裝：
- 看 `npx skills` 是否有 `--include <pattern>` 或 `--only <skill-names>` 旗標
- 或自行 git clone 後手動 `cp` 個別 SKILL.md 到 `~/.claude/skills/`

## 與 Wiki 的關聯

### 主要交叉引用

- 計算腳本與 wiki 既有概念對應：
  - `biz-cac-ltv` → [[顧客終身價值]]
  - `tw-stock-analysis` → [[src-taiwan-stock-2026-03-09]]
  - `biz-dcf` / `algo-forecast-arima` → [[雙幣贏]] / [[src-dual-currency-truth]]（估值與預測背景）
- 推文四件套 → [[src-honglong0420-asgard-x-thread]]
- 完整 audit → [[src-asgard-skills-audit-2026-05-19]]

### 未來可延伸

- 實際試跑推文四件套，記錄產出作為 case study
- 在做客戶 SEO 體檢時試 `mkt-seo-audit` + `algo-seo-*` 系列
- 投資決策時試 `tw-stock-analysis` + `biz-dcf` 組合
- 三個月後（2026-08 前後）回頭看 26 個 `tw-ecom-*` skeleton 是否完工
