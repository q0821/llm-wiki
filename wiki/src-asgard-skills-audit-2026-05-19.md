---
title: Asgard Skills Repo 本地審計（2026-05-19 快照）
type: source
sources: []
created: 2026-05-19
updated: 2026-05-19
tags: [audit, asgard, agent-skills, taiwan-smb, skeleton, security-scan]
confidence: 強
---

# Asgard Skills Repo 本地審計（2026-05-19 快照）

> **來源**：本地 `git clone --depth 1 https://github.com/asgard-ai-platform/skills` 於 2026-05-19 進行 A（結構）+ B（安全）+ D（品質抽樣）+ E（適用性）四向審計。
> 補強既有兩個 source：[[src-asgard-skills]]（2026-04 客觀整理）+ [[src-honglong0420-asgard-x-thread]]（2026-05 內部人員親述）。

## 審計動機

2026-05-19 完成 [[src-honglong0420-asgard-x-thread|@honglong0420 X 推文]] ingest 後，使用者問「**repo 裡面的 skill 是不是都沒有問題**」——觸發本地實測審計。

審計範圍涵蓋：

- **A. 結構/格式一致性**（frontmatter、必有區塊、檔案分佈）
- **B. 安全性掃描**（可疑外連、危險指令、script 依賴）
- **D. 品質抽樣**（10+ 個 skill 內容詳看）
- **E. 適用性清單**（對使用者接案 / 投資 / 思維三主題的 install 候選）

## A. 結構檢查 ✅

| 檢查項 | 結果 |
|---|---|
| Skill 目錄總數 | **304**（含 tools / eval / docs 三個 repo 工具目錄）|
| SKILL.md 檔案數 | **301**（304 - 3 工具目錄）|
| 前綴分類數 | **25**（25 個 prefix；推文當下為 22）|
| 前綴分佈前 5 | `grad-`(87) / `algo-`(62) / `tw-`(38) / `biz-`(22) / `med-`(9) |
| YAML frontmatter | ✅ 301/301（100%） |
| 必填欄位（name / description / category / tags） | ✅ 抽樣 5 個全有 |
| Output Format 區塊 | ✅ 301/301 |
| Gotchas 區塊 | ✅ 301/301 |
| References 區塊 | ✅ 272/301（90%） |
| **Iron Law 設計慣例** | ✅ **301/301（100%）** —— 含 `IRON LAW:` 全大寫 / `Iron Law` heading / 中文「鐵律」/「核心法則」各種寫法 |
| 行數分佈 | 中位數 ~80 行、最短 59、最長 265 |
| Root meta 檔 | ✅ `LICENSE` / `README.md` / `README.en.md` / `CONTRIBUTING.md` / `CLAUDE.md` / `TODO.md` |
| **License** | ✅ MIT，Copyright **Asgard Inc. 肆佳科技股份有限公司** |

## B. 安全掃描 ✅

| 檢查項 | 結果 |
|---|---|
| 可疑外連 URL（過濾白名單後）| ✅ 僅 ezpay / newebpay（台灣金流，`tw-` skill 合理引用）+ 範例 `example.com` |
| `curl \| sh` / `wget \| sh` 一行式安裝 | ✅ **0 個** |
| 動態執行函式 | ✅ 僅 PyTorch `model.eval` 推論模式切換（與動態 code 執行無關） |
| `base64` 解碼 | ✅ 僅 OAuth PKCE `code_challenge` 範例 |
| `subprocess` | ✅ 僅在 `tools/` 與 `eval/`（repo 自家工具，不會跟 skill install） |
| Python 腳本依賴 | ✅ 僅 `json` / `argparse` / `math` / `statistics` 等標準庫 |

**結論：無紅旗，repo 安全可信。**

## D. 品質抽樣（10 個 skill 詳看 + 統計）

### ✅ 抽樣通過的 skill（內容紮實）

| Skill | 行數 | 品質觀察 |
|---|---|---|
| `hum-dialectics`（推文四件套）| 84 | Iron Law（Synthesis ≠ Compromise）+ 4 步驟方法論 + Output Format 完整 |
| `ops-business-model-canvas`（推文四件套）| 103 | Iron Law（All Nine Blocks Must Be Completed and Consistent）|
| `ux-lean-startup`（推文四件套）| 104 | Iron Law（Validate Before You Build）|
| `hum-narrative`（推文四件套）| 100 | Iron Law（Every Story Needs Tension）|
| `tw-stock-analysis` | 109+ | 8 個關鍵指標 + 台灣專屬資料來源（MOPS / TWSE / Goodinfo）|
| `biz-cac-ltv` | 205 | Iron Law（LTV:CAC > 3）+ 4 段比率區間 + Python 計算腳本 `cac_ltv.py` |
| `algo-seo-pagerank` | 80+ | Damping factor / Convergence invariant Iron Law + 明確 algorithm 階段 |

### ⚠️ 26 個 `tw-ecom-*` skeleton 完整清單

`status: "skeleton"` 標記 + body pending，**全部集中在 tw-ecom-* 分類**：

**Payment**（4）：`tw-ecom-payment-jkopay` / `ecpay` / `tappay` / `dispute`
**Invoice**（3）：`tw-ecom-invoice-carrier` / `universalec` / `void`
**Logistics**（4）：`tw-ecom-logistics-cold-chain` / `cross-border` / `cvs` / `home`
**Analytics**（2）：`tw-ecom-analytics-benchmarks` / `ga4`
**Compliance**（4）：`tw-ecom-compliance-consumer` / `cross-border` / `pdpa` / `product`
**DTC**（2）：`tw-ecom-dtc-91app` / `shopify-localization`
**Marketplace**（2）：`tw-ecom-marketplace-momo` / `shopee`
**Operations**（4）：`tw-ecom-operations-customer-service` / `line-oa` / `pricing` / `promotion`
**Channel**（1）：`tw-ecom-channel-strategy`

→ Skeleton 比例佔 `tw-ecom-*` **68%（26/38）**，意味著「**主打台灣中小企業電商**」的承諾在 2026-05-19 當下大部分還是 push 進 repo 但 body pending。

### 12 個非 skeleton 的 `tw-*`（可立即使用）

- 投資 / 財務：`tw-stock-analysis` / `tw-fintech-compliance` / `tw-tax-basics` / `tw-einvoice-guide`
- 產業：`tw-manufacturing` / `tw-healthcare-regulations` / `tw-retail-landscape`
- 法律：`tw-startup-legal`
- 金流：`tw-payment-integration` / `tw-ecom-payment-newebpay` / `tw-ecom-invoice-ezpay`
- 電商：`tw-ecom-dtc-shopline`

### 推文「Iron Law」誤判更正

審計過程中前期 grep 用 case-sensitive `^#{1,3} Iron Law` heading 只找到 55 個 → 誤判「Iron Law 普及率 18%」。後改用寬鬆掃描（含 `IRON LAW:` 全大寫 + 中文「鐵律」/「核心法則」）→ **實際 301/301（100%）**。既有 [[src-asgard-skills]] 描述「Iron Law — 特色設計」**完全正確**，誤判已修正在審計報告本身。

## E. 對使用者主題的適用性清單

詳見獨立綜整頁 [[synthesis-asgard-install-for-my-topics]]。

簡表：

| 主題 | 強相關 skill 數 | 範例 |
|---|---|---|
| 🏢 接案 / WordPress / SEO | ~26 | `algo-seo-*` 7 個 / `ecom-*` 7 個 / `mkt-*` 4 個 / `pr-*` 5 個 |
| 📈 投資 | ~11 | `tw-stock-analysis` / `biz-dcf` / `biz-cac-ltv` / `fin-*` |
| 🧠 商業思維 / 決策 | ~14 | 推文四件套 + `biz-` 經典框架 10 個 |
| 🇹🇼 台灣專屬完成版 | 12 | 上方 D 段列表 |

## 規模時間線（跨三個 source 整合）

| 時間點 | skill 總數 | 分類數 | Source |
|---|---|---|---|
| 2026-04-16（首次 ingest）| 263 | 21 類 | [[src-asgard-skills]] |
| 2026-05（作者推文）| 263 | 22 個分類 | [[src-honglong0420-asgard-x-thread]] |
| **2026-05-19（本審計）** | **301** | **25 個前綴** | 本頁 |

→ Repo 持續成長中；數字會繼續變動。下次審計建議至少間隔 3 個月（除非有重大新聞）。

## 關鍵引用（審計者觀察）

> **「整體可信、品質高、安全乾淨」**——audit 結論一句話

> **「26 個 skeleton 全部集中在 tw-ecom-*」**——不是隨機分佈，是個強訊號：Asgard 真正在做的工作是「電商分類 push 進 repo 但 body pending」，其他分類（`hum-` / `biz-` / `algo-` / `grad-`）相對成熟

> **「Iron Law 是真正的設計特色」**——301/301 全有；我前面 grep 誤判是 case-sensitive 限制，不是 repo 問題

## 信心評估

- **強**：A 結構 / B 安全結論——bash 命令掃 301 個檔的客觀結果
- **強**：D 抽樣品質——10 個 skill 詳看，覆蓋推文四件套 + 你 3 主題各抽 1-2 個
- **強**：26 個 skeleton 清單——`grep -l 'status: "skeleton"'` 客觀統計
- **中**：規模時間線推斷——以三個獨立來源時間切片，repo 持續成長的歷史是合理推斷但非完整紀錄
- **時效**：2026-05-19 快照，repo 之後會變動

## 與 Wiki 的關聯

### 新建頁面（本次審計觸發）

- [[synthesis-asgard-install-for-my-topics]] — 3 主題 install 候選清單綜整頁

### 更新既有頁面（事實校正）

- [[src-asgard-skills]]：數字校正 + skeleton 警示 + 規模時間線
- [[Asgard-AI-Platform]]：公司資訊 + 承諾 vs 現況落差段
- [[Agent-Skills]]：對照表中「Asgard 263 → 301」校正
- [[src-honglong0420-asgard-x-thread]]：補「2026-05-19 審計校正」對照表
- [[src-hermes-agent-99-cases]]：「Asgard 263 → 301」校正
- [[src-recommended-claude-code-skills]]：同校正

### 形成的對話組

本頁是 Asgard 主題的**第三個來源 / 第三個視角**：

| 來源 | 視角 | 時間 |
|---|---|---|
| [[src-asgard-skills]] | **客觀整理**（GitHub repo 結構描述） | 2026-04 |
| [[src-honglong0420-asgard-x-thread]] | **內部人員親述**（推廣 + 推薦四件套） | 2026-05 |
| **[[src-asgard-skills-audit-2026-05-19]]**（本頁） | **獨立審計**（安全 + 品質 + 適用性 + 校正） | 2026-05-19 |

三來源加起來才完整——客觀面、主觀面、檢驗面。
