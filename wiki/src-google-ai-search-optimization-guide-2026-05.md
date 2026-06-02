---
title: Google 搜尋生成式 AI 功能最佳化指南（2026-05-21 更新版）
type: source
sources: ["2026-06-02-google-ai-search-optimization-guide-zh-tw.md"]
created: 2026-06-02
updated: 2026-06-02
tags: [seo, geo, aeo, ai-search, google, llms-txt, structured-data, source-bias, platform-gatekeeper]
confidence: 強
aliases: ["Google AI 搜尋指南", "Google AI Search Optimization Guide", "Google 反 llms.txt 立場"]
---

# Google 搜尋生成式 AI 功能最佳化指南（2026-05-21 更新版）

**來源**：Google 官方搜尋中心 Developer 文件
**原始連結**：https://developers.google.com/search/docs/fundamentals/ai-optimization-guide?hl=zh-tw
**文件最後更新**：2026-05-21（世界標準時間）
**抓取於**：2026-06-02
**來源類型**：官方文件型 + 強論點型（含 5 個明確「不要做」+ 對 AEO/GEO 的官方定論）
**來源商業立場**：Google 是 search 平台守門人，**對「站長應該做什麼」有直接商業利益** —— 見最末「個人吸收」段討論

> 本來源與既有 [[GEO]] / [[src-welly-seo-2026-04]] 形成**對話組**（雙方在 llms.txt、為 AI 重寫內容、AEO/GEO 是否獨立策略等議題立場相反），詳見「對話組」段。

## 為什麼這份文件值得獨立成頁

過去一年坊間 GEO / AEO 顧問業興起，賣點包括：「需要建立 llms.txt」「需要為 AI 重寫內容」「需要新一代 schema 強化」「需要做 AI 引用 mention 散布」等。Google 在 2026-05-21 這次更新的指南裡，**對其中 5 項明確說「不要做」**，並把 AEO/GEO 直接定義為 SEO 子集。這個立場與本知識庫既有 [[GEO]] 頁（基於廠商月報觀點）的方向相反，必須並列保存。

## 5 個明確「不要做」清單（核心）

| 不該做的做法 | Google 原文立場（2026-05-21）|
|-----------|---------------------------|
| **建立 llms.txt 或特殊 AI 標記** | 「您不需要建立新的機器可讀檔案、AI 文字檔案、標記或 Markdown，即可在生成式 AI 搜尋中顯示」|
| **「分塊」（chunking）內容** | 「不必將內容分成小塊，AI 就能瞭解」 |
| **專為 AI 重寫內容** | 「不需要專為生成式 AI 搜尋撰寫內容」 |
| **尋找不實「提及」（mentions）** | 「在網路上尋找不實的『提及』內容，可能不如您想像的有用」|
| **過度依賴結構化資料** | 「生成式 AI 搜尋不需要結構化資料，您也不需要新增任何特殊的 schema.org 標記」|

> 注意第 5 項措詞 ——「**不需要新增任何特殊的 schema.org 標記**」（強調**特殊** / **新增**）。Google 並未反對既有 schema.org 作為「整體 SEO 策略一部分」（見「應該做」段）。這個區別容易被 GEO 顧問業話術扭曲為「Google 反對所有 schema」，原文不是這意思。

## GEO / AEO = SEO 的官方定論

Google 原文：

> 「『AEO』代表『答案引擎最佳化』，『GEO』則代表『生成引擎最佳化』。這兩個詞彙都可用來描述工作，特別是著重於提升 AI 搜尋體驗的曝光度。**從 Google 搜尋的角度來看，針對生成式 AI 搜尋進行最佳化，就是針對搜尋體驗進行最佳化，因此仍屬於 SEO**」

關鍵：「**從 Google 搜尋的角度來看**」—— Google 自己也意識到自己的立場有限定詞。**對其他 LLM 平台（OpenAI、Anthropic、Perplexity）這論述未必成立**，但坊間轉述常省略限定詞。

## RAG + 查詢擴展機制（Google 自己描述）

Google 在指南開頭交代生成式 AI 功能的運作機制：

- **RAG（檢索增強生成）**：從 Google 搜尋索引中檢索相關網頁，提升回覆品質與準確度
- **查詢擴展**：模型產生並行相關查詢集合，擷取額外相關結果

兩者都建立在「**現有搜尋索引**」之上 —— 這是為什麼 Google 主張傳統 SEO 仍有效：能被 Google index 的內容才會被 AI Overview 引用。

> 對照 [[RAG]] 概念頁的一般化 RAG 定義 —— Google 的 RAG 是「對自家 web index 做 RAG」，跟企業內部知識庫 RAG 是同一技術用法，不同 corpus。

## 「應該做」清單（仍是傳統 SEO 那一套）

### 內容策略
- 製作獨特、實用、優質的內容，**提供獨特觀點而非重述**
- 避免同質化內容（如「首次購屋者必知的 7 個訣竅」這種泛濫主題）
- 為人類讀者撰寫（清楚的段落、章節、標題結構）
- 納入高品質相關圖片與影片
- 著重使用者需求，避免過度宣傳或操控排名

### 技術架構
- 符合 Google 搜尋技術相關規定
- 使用語意式 HTML（semantic HTML）
- 遵循 JavaScript SEO 最佳做法
- 良好的網頁體驗（跨裝置響應、減少延遲）
- 減少重複內容

### 商務優化
- Google Merchant Center + 商家檔案優化
- **繼續使用結構化資料**（作為整體 SEO 策略一部分 —— 與第 5 項「不要新增特殊 schema」並不衝突）

## AI Overview 引用條件（隱含）

Google 沒有直接列出「AI Overview 怎麼決定引用誰」，但從應該做 / 不該做兩面可以反推隱含條件：

1. 內容**可被 Google index**（基本門檻）
2. 內容具備 **獨家觀點 / 數據 / 案例**（避免同質化）
3. 技術層滿足 **semantic HTML + 跨裝置 + 載入速度** 基本盤
4. 滿足 **E-E-A-T**（[[GEO#E-E-A-T|GEO 頁有完整定義]]）
5. **不需要**為 AI 特別做額外工程（不需要 llms.txt / 不需要為 AI 改寫）

> 隱含訊息：Google AI Overview 把「**好內容 = 好排名 = 易被引用**」當成單一管線，不打算開額外「給 AI 看的後門」。

## 對話組（與既有頁面立場對撞）

這份指南與本知識庫既有頁形成直接對話：

| 議題 | 既有 [[GEO]] 立場（[[src-welly-seo-2026-04|Welly 月報]] / Cloudflare 來源，2026-04 / 2026-05-11） | Google 指南立場（2026-05-21） |
|---|---|---|
| **llms.txt** | 推薦 Level 2 必備 | **明確反對**「不需要建立」|
| **Markdown negotiation** | 推薦（讓 AI agent 用較少成本理解）| **明確反對**「不需要為 AI 重寫內容」|
| **AEO / GEO 是否獨立策略** | **是**（與 SEO 不同的目標讀者、成功指標、互動模式）| **否**「就是 SEO，不是獨立策略」|
| **Schema 強化** | 建議 Level 3（Website / Article / FAQ）| 反對**新增特殊 schema**；既有 schema.org 仍可用 |
| **chunking 內容** | 未直接討論 | 明確反對 |
| **MCP Server Card / WebMCP / UCP 等新標準** | 推薦 Level 4（先行者紅利）| 未提及 MCP；只提 UCP（Universal Commerce Protocol） |

**雙方都不算錯**，但**框架不同**：
- Welly / Cloudflare 框架：「網站需準備好被**所有 AI agent**理解與互動」（多平台視角）
- Google 框架：「網站需準備好被**Google 搜尋系統 + AI Overview**引用」（單一平台視角）

當你的 audience 是「Google 搜尋 + AI Overview」→ 採 Google 立場
當你的 audience 是「ChatGPT / Claude / Perplexity / Copilot 多平台」→ Welly 立場仍有效

### 時間軸對照

- 2026-04：Welly 月報出（推薦 llms.txt 等）
- 2026-04-13：Cloudflare Radar 數據（llms.txt 採用率仍極低）
- 2026-05-11：本知識庫 ingest Welly 月報 → 建 [[GEO]] 頁
- **2026-05-21：Google 官方指南更新，明確反對 llms.txt**
- 2026-06-02：本知識庫 ingest Google 指南 → 形成對話組

## 信心評估

- **強**：5 個「不要做」清單 —— Google 官方原文白紙黑字
- **強**：GEO/AEO = SEO 定論 —— Google 自己的官方框架
- **強**：RAG + 查詢擴展機制描述 —— Google 公開技術文件
- **中（但有 bias）**：「llms.txt 沒效果」—— 這是 Google 主張，**未必對其他 LLM 平台成立**。Google 有商業誘因弱化平台無關標準（見下方個人吸收段）
- **中**：「為 AI 重寫內容沒必要」—— 對 Google AI Overview 場景成立；對 ChatGPT / Perplexity / Claude 引用場景未必
- **時效**：2026-05-21 更新，2026-06-02 ingest 仍新鮮；AI 搜尋是高頻演變主題，半年內可能再次改寫

## 相關概念與來源

- [[GEO]] — **對話組核心**（Google 反論直接改寫了既有 Level 2 / Level 3 / Level 4 框架的解讀）
- [[src-welly-seo-2026-04]] — **對話組核心**（廠商視角 vs 平台守門人視角）
- [[llms-txt]] — 三方立場交鋒焦點的獨立 concept 頁；證據之一即本 src 頁 Google 反對立場
- [[RAG]] — Google AI Overview 也是 RAG 的一種應用
- [[Cloudflare]] — agent-readiness 工具的提供者，與 Google 立場分流
- [[MCP]] — Google 指南未提及 MCP，但 MCP 是給 LLM agent 用，不是給 Google index 用，立場不衝突
- [[Agent-Skills]] — 同上，給 agent 用，不在 Google 指南射程內
- [[DESIGN-md]] — 「為 AI 提供 markdown」與 Google「不需為 AI 重寫」直接相反；但 DESIGN-md audience 是 coding agent 不是 search

## 未來追蹤候選 entity / concept

- **Google**（搜尋）entity —— Google 在本知識庫出現次數很多但無獨立 entity 頁；下次再實質出現時建議建立
- ✅ **llms.txt** concept —— 已於 2026-06-02 建頁 [[llms-txt]]，含格式規範 + 三方立場 + Anthropic / Stripe 實際部署證據 + 自家 wiki 決策框架
- **AI Overview** concept —— Google 自家功能名稱
- **E-E-A-T** —— 目前在 [[GEO]] 頁有子段，看後續是否需獨立
- **Generative AI Search** vs **Agent-Ready Web** 框架對比 concept

---

## 個人吸收（第 6 次 / spaced retrieval 預定 2026-06-15）

### Quiz 答案

**Q1（intent）：你想拿走什麼？**
- 5 個「不要做」清單（全選）
- GEO / AEO = SEO 的官方定論
- RAG + 查詢擴展機制
- AI Overview 引用條件

**Q2（application）：用在什麼場合？**
- 客戶網站 SEO / AI 搜尋優化建議
- 自家 wiki / 個人發表內容優化
- 對抗 GEO / AEO 顧問業話術

### LLM 觀察：對位類型分析

**對位類型：Source bias 錯位（平台守門人型）—— 新亞型**

這是吸收檢核第 6 次發現的對位風險。前 5 次累積出 3 大類錯位：

1. 拿錯工具型（曹興誠 RCA）
2. 場合 > 工具型（雷小蒙 / 歐陽嘉隆 / SHOPLINE Payments）
3. **Source bias 錯位（賣方敘事型）**（NVIDIA GTC）

這次（Google 指南）擴充第 3 類為兩個亞型：

| Source bias 亞型 | 機制 | 案例 |
|---|---|---|
| **賣方敘事型** | 廠商賣自家產品時，selling narrative 框架完整但帶 bias | [[src-nvidia-gtc-taipei-2026-jensen-keynote\|NVIDIA GTC]] —— Jensen 賣 NVIDIA / CUDA / Vera Rubin 路線圖 |
| **平台守門人型**（新）| 平台對「平台無關 / 跨平台標準」有結構性反對動機 | **Google AI 搜尋指南反對 llms.txt** —— 如果開發者普遍用 llms.txt，OpenAI / Anthropic / Perplexity 可選擇優先抓 llms.txt，Google 在「平台無關優化」這條 axis 上會輸給對手；所以 Google 把 llms.txt 框成「沒必要 / 沒效果」是**自然的競爭立場**，未必純粹是技術判斷 |

### 對位細節：3 個應用場合各自的對位風險

**場合 1：客戶網站 SEO / AI 搜尋優化建議**
- ✅ 對位：客戶大部分仍以 Google 搜尋 + AI Overview 為主要曝光管道 → 5 個「不要做」清單可直接用
- ⚠️ 風險：若客戶 audience 明顯偏 ChatGPT / Perplexity（例如 B2B SaaS 比較研究情境），Google 立場不足以涵蓋

**場合 2：自家 wiki / 個人發表內容優化**
- ⚠️ **較大對位風險**：本 wiki 的真正讀者是「未來自己搜尋 + Claude / ChatGPT 引用」。Google 不是唯一裁判
- 例如：本 wiki 是否要做 llms.txt？按 Google 立場「不需要」，但按 Anthropic / OpenAI 的爬蟲行為可能受惠
- **建議：本 wiki 的 llms.txt 決策不應只看 Google 立場**

**場合 3：對抗 GEO / AEO 顧問業話術**
- ✅ 主要對位：Google 官方明確「不需要」清單可直接駁斥「需要做 llms.txt 才能被 AI 引用」這類話術
- ⚠️ 風險：顧問若說「為 Perplexity / Claude 引用做優化」，Google 立場不能直接駁斥（這不在 Google 射程內）
- ⚠️ 風險：「需要為 AI 寫 markdown 版本」這類話術，若是針對 coding agent（[[DESIGN-md]] 那套）而非 search engine，Google 立場無關

### 重組路徑建議

1. **拆「audience」維度**：把網站優化問題依「目標讀者」拆 3 套
   - 給 Google 搜尋 + AI Overview → 用本指南立場
   - 給其他 LLM search agent（ChatGPT search / Perplexity / Claude）→ 仍可考慮 llms.txt / Markdown negotiation（無平台立場文件，需多源驗證）
   - 給 coding agent → [[DESIGN-md]] / [[MCP]] 那套

2. **追蹤 Source bias 平台守門人型**：本次後 3 個月內，注意 OpenAI / Anthropic / Perplexity 是否有「我們有用 llms.txt」的官方表態（如有，會是 Google 立場的反證）

3. **個人發表優化做法**：本 wiki 因為是 GitHub public repo，建議
   - 保留現有 markdown 結構（對 search engine 是 semantic HTML 一部分，對 LLM 是直接可讀）
   - **暫不建 llms.txt**（等 Anthropic / OpenAI 正式立場明朗再決定）
   - 提升內容獨特性與第一手經驗（[[GEO#E-E-A-T|E-E-A-T]]，這點 Google 與 Welly 兩派**一致**）

### Spaced retrieval 約定（~2026-06-15）

回測題：
1. 不看本頁，你能講出 Google 那 5 個「不要做」嗎？
2. Google 反對 llms.txt 的**商業動機**是什麼？（不是只記「Google 說不要」，要記得**為什麼會這樣說**）
3. 你最後幫客戶/自家 wiki 做了 llms.txt 沒有？理由？

### 對應 [[Ratchet-Pattern]]

第 6 次吸收檢核促成的擴充：
- **錯位 taxonomy 從 3 大類 → 細化第 3 類為 2 亞型**（賣方敘事型 / 平台守門人型）
- **平台守門人型**特殊性：比賣方敘事型**更難察覺**，因為立場藏在「客觀技術判斷」的外衣下，且 Google 是「裁判」身分權威感強
- **平台守門人型診斷問題**：「**這個立場，如果反過來成立的話，誰會受損？**」—— 如果 llms.txt 普及對 Google 有損但對 OpenAI 有利，那 Google 的反對就有結構性 bias
