---
title: WordPress 接案工作筆記（綜整）
type: synthesis
sources: [2026-03-20-胖哥攝影工作室_網站提案.md, 2026-04-07-OpenClaw × WordPress 輕量內部知識 RAG 系統.md, 2026-04-23-接手專案檢查sop.md]
created: 2026-04-24
updated: 2026-04-24
tags: [WordPress, 接案, 工作流, 綜整, SEO, 資安, RAG]
confidence: 強
---

# WordPress 接案工作筆記（綜整）

> 綜整視角：把 wiki 中散佈於三個 WordPress 接案來源的經驗，串成一條工作流——**怎麼接 → 怎麼收 → 怎麼加值**。

## 三個階段

| 階段 | 工作重點 | 對應頁面 |
|------|---------|---------|
| **接案前**（定位與獲客） | 讓對的客戶找到你 | [[src-photography-studio-proposal]] |
| **接手時**（交接與稽核） | 確認站況、清理前人遺產 | [[WordPress-接手檢查SOP]] |
| **加值階段**（延伸服務） | 把 WordPress 站升級為 AI 應用 | [[src-openclaw-wordpress-rag]] |

## 階段 1：接案前 — 內容定位決定能接到什麼客戶

來自 [[胖哥攝影工作室]] 的網站優化提案（詳見 [[src-photography-studio-proposal]]）：

**核心洞察**：搜尋引擎把網站定位成什麼，決定誰找得到你。430 篇文章中 67% 是婚禮 → Google 認定是「婚禮攝影師」→ 企業客戶搜尋商業攝影時找不到。

**三層策略（可遷移到任何 WordPress 接案）**：

1. **讓人找得到**：副標題關鍵字、知識型內容（SEO）、服務頁補強
2. **讓人看得懂**：作品加背景說明、獨立作品集頁
3. **讓人敢聯繫**：客戶名單、推薦語、明確詢價入口

延伸連結：[[src-customer-diagnostic-50-questions]]（讓人敢聯繫後的客戶經營）→ [[顧客終身價值]]（成效最終反映在 CLV）。

## 階段 2：接手時 — 先掃遺產再動工

來自 [[src-wordpress-handover-sop]] 的第一手經驗（作者 Jackie Yeh）。完整流程詳見 [[WordPress-接手檢查SOP]]。

**最省時的兩個指令**（皆依賴 [[WP-CLI]]）：

```bash
wp core verify-checksums          # 一次搞定「多餘檔盤點」+「核心檔竄改」
wp search-replace '舊網域' '新網域' --all-tables --dry-run   # 安全處理 serialized data
```

**必檢四處**（按風險由高到低）：

1. `wp-content/uploads/*.php`（出現 PHP 即可疑）
2. `wp-content/` 內 `/var/www/` 或 `/home/` 路徑殘留（別家伺服器的決定性證據）
3. 設定檔 `*.ini` / `*.env` / `*.conf` 中硬編碼的 `password = 'xxx'` 字面指派
4. 外掛功能重疊（追蹤碼、備份、SEO、快取類裝超過一個的要整理）

**倫理底線**：撿到別家帳密 → 不利用、不傳播、視認識程度決定通知。真正該負責的是複製舊專案的前手工程師。

## 階段 3：加值階段 — 把 WordPress 升級為 AI 應用

來自 Nelson Chen（得寬科技）在 WordPress 小聚的分享（詳見 [[src-openclaw-wordpress-rag]]）。

**技術核心**：WordPress REST API 已經把內容結構化好了，是最理想的 [[RAG]] 資料來源。用 [[Cloudflare]] 免費方案（Workers + Vectorize + D1）部署完整 RAG，5,000 件商品索引費用約 $0.10-0.30 USD。

**關鍵設計模式**：

- **LLM 先於 Embedding**：原始資料（規格）→ LLM 增強（送禮、果香甜口）→ 再 [[Embedding]]
- **索引/查詢完全分離**：排程的 rag-indexer + 即時的 rag-query
- **信心度分級回應**：低信心追問、高信心直接推薦

**接案意義**：原本只是做網站的人，可以往上加值為「會做 AI 搜尋的 WordPress 專家」，費用結構從「一次性建站」延伸到「持續運算費 + 技術顧問」。

## 三階段相互支撐的關係

```
接案前（SEO 獲客）──┐
                    ├──→ 接手時（乾淨站況）──→ 加值（RAG / AI 整合）
                    │                              │
                    └──→ 收更好的客戶                └──→ 建立長期關係
```

- 階段 1 決定**接到什麼客戶**
- 階段 2 決定**接手後是否能好好做事**（遺產清乾淨省下大量 debug 時間）
- 階段 3 決定**能提供多深的服務**（從建站 → AI 應用）

每個階段都依賴前一個階段的成功。

## 可跨階段使用的工具

| 工具 | 階段 | 用途 |
|------|------|------|
| [[WP-CLI]] | 階段 2、3 | 檢查、資料遷移、批次操作 |
| [[src-marketing-skills-ai-agents\|marketingskills]] | 階段 1 | SEO / CRO / 文案自動化 |
| [[Cloudflare]] | 階段 3 | 免費 RAG 部署平台 |
| [[OpenClaw]] | 階段 3 | AI Agent 框架，支援 Telegram / Discord / Slack |

## 尚未涵蓋的議題（wiki 缺口）

- **報價與估算**：目前 wiki 沒有接案報價的參考資料
- **WordPress 效能優化**：僅在接手檢查 SOP 觸及「多餘外掛拖累效能」，沒有專門的效能調校頁
- **合約與 NDA 範本**：撿到別家帳密的倫理處理是一種實務，但合約怎麼寫可以預防此類問題目前沒有資料
- **維運階段**（交接後的長期維護流程）：SOP 聚焦「接手當下」，沒有涵蓋日常維運 checklist

## 相關頁面

- [[src-photography-studio-proposal]] — 階段 1 主要案例
- [[WordPress-接手檢查SOP]] — 階段 2 核心 SOP
- [[src-wordpress-handover-sop]] — 階段 2 原始經驗來源
- [[src-openclaw-wordpress-rag]] — 階段 3 主要案例
- [[WP-CLI]] — 跨階段工具
- [[胖哥攝影工作室]] — 階段 1 客戶 entity
- [[RAG]]、[[Embedding]]、[[Cloudflare]]、[[OpenClaw]] — 階段 3 技術組件
