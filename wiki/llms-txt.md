---
title: llms.txt
type: concept
sources: ["welly-seo-2026-04-full.md", "2026-06-02-google-ai-search-optimization-guide-zh-tw.md"]
created: 2026-06-02
updated: 2026-06-02
tags: [seo, geo, ai-search, llms-txt, anthropic, stripe, google, source-bias-platform-gatekeeper]
confidence: 中（規範強，採用率與「對 LLM 是否真有用」待長期驗證）
aliases: ["llms.txt", "LLMS.txt", "/llms.txt", "llms-full.txt", "llms-ctx-full.txt"]
---

# llms.txt

放在網站根路徑 `/llms.txt` 的 Markdown 檔案，**目的是在 LLM 推理時提供網站的結構化內容索引**（不是訓練 / 不是排名）。由 [[Jeremy-Howard]]（answer.ai / fast.ai 創辦人）於 **2024-09-03** 提出，類比 robots.txt 與 sitemap.xml，但解決的是另一個問題：**LLM 的 context window 太小，無法吃下整個網站的 HTML**。

本頁是 [[GEO]] / [[src-welly-seo-2026-04]] / [[src-google-ai-search-optimization-guide-2026-05]] 累積的對話組焦點 —— 三方立場對撞，且**有「實際部署投票」資料可佐證**（見「採用率追蹤」段）。

## 一句話定義

> "A proposal to standardise on using an `/llms.txt` file to provide information to help LLMs use a website at inference time."
> —— [llmstxt.org](https://llmstxt.org/)

注意關鍵字 **inference time**（推理時） —— 不是訓練時（vs `robots.txt` 控訓練爬蟲）、不是搜尋排名時（vs Google AI Overview 索引）。這個定位差別是與 Google 立場衝突的根源（見下方「對話組與三方立場」段）。

## 解決什麼問題

> "Large language models increasingly rely on website information, but face a critical limitation: context windows are too small to handle most websites in their entirety."

具體痛點：
1. **Context window 限制**：整個網站 HTML 通常超過 LLM context window（即使 200K+ token 模型）
2. **HTML → LLM-friendly 轉換成本高**：解析 nav / footer / JS-rendered content / ads 噪訊大
3. **缺乏「網站對 LLM 的官方索引」**：sitemap.xml 是給搜尋引擎爬蟲，沒有「給 LLM 的版本」

## 格式規範

### 基本結構（Markdown，**為了人類與 LLM 都好讀**）

| 區塊 | 必要性 | 說明 |
|---|---|---|
| H1 標題 | **必要** | 唯一必要的區塊；項目或網站名稱 |
| Blockquote（`>`）| 選用 | 項目簡短摘要（一段話）|
| 段落 / 列表 | 選用 | 更詳細的背景說明 |
| H2 區塊（多個）| 選用 | 分組的檔案 / 連結清單 |
| `## Optional` 區塊 | **特殊** | 此標題下的 URL 可在需要更短上下文時跳過 |

H2 區塊內每項格式：

```markdown
- [連結名稱](https://example.com/page.md): 選用說明
```

注意連結建議指向 `.md` 版本（原始 URL 加 `.md` 副檔名，或無檔名 URL 加 `index.html.md`）—— 這意味著要部署 llms.txt 還隱含要**提供每個頁面的 Markdown 版本**。

### 官方範例（FastHTML）

```markdown
# FastHTML

> FastHTML is a python library which brings together Starlette, Uvicorn,
HTMX, and fastcore's `FT` "FastTags" into a library for creating
server-rendered hypermedia applications.

Important notes:

- Although parts of its API are inspired by FastAPI, it is *not* compatible
with FastAPI syntax and is not targeted at creating API services
- FastHTML is compatible with JS-native web components and any vanilla JS
library, but not with React, Vue, or Svelte.

## Docs

- [FastHTML quick start](https://fastht.ml/docs/tutorials/quickstart_for_web_devs.html.md):
A brief overview of many FastHTML features
- [HTMX reference](https://github.com/bigskysoftware/htmx/blob/master/www/content/reference.md):
Brief description of all HTMX attributes, CSS classes, headers, events,
extensions, js lib methods, and config options

## Examples

- [Todo list application](https://github.com/AnswerDotAI/fasthtml/blob/main/examples/adv_app.py):
Detailed walk-thru of a complete CRUD app in FastHTML

## Optional

- [Starlette full documentation](https://...):
A subset of the Starlette documentation useful for FastHTML development.
```

### 變體與配套檔

| 檔案 | 內容 | 用途 |
|---|---|---|
| **`/llms.txt`** | 索引 + 結構化連結列表 | 主要規範檔，LLM 先讀這個決定要不要進一步抓 |
| **`/llms-full.txt`** | 所有頁面內容**直接拼進來**（單一檔案）| 給 context window 足夠大的場景；Stripe 採用此命名 |
| **`/llms-ctx.txt`** | 由 `llms_txt2ctx` 工具生成 | XML 結構供 LLM 使用 |
| **`/llms-ctx-full.txt`** | 同上但包含所有連結完整內容 | XML 結構供 LLM 使用 |

> 注意：`llms-full.txt` 並非 Jeremy Howard 原始規範裡的官方檔名（原規範用 `llms-ctx-full.txt`），但 Stripe 等實際部署採用了 `llms-full.txt` 命名 —— **業界部署形成的事實標準與規範文件略有分岔**。

## vs 既有標準

| 標準 | 主要用途 | 預期使用時機 | LLM 友善程度 |
|---|---|---|---|
| **robots.txt** | 訪問政策（誰可以爬）| 訓練爬蟲 / 搜尋爬蟲 | 低（純規則）|
| **sitemap.xml** | URL 清單 | 搜尋引擎索引 | 中（XML 機器可讀但量大）|
| **schema.org** | 結構化資料標記 | 搜尋引擎理解內容 | 中 |
| **`llms.txt`** | LLM 推理時的內容索引 | **LLM 推理時**（chat / RAG / agent）| **高（Markdown 直接可讀）**|

關鍵差別：llms.txt 是 **inference-time** 工具，**不取代** 任何上面三者。Jeremy Howard 原規範也明確說「llms.txt 可補充參考 schema.org 等標記」。

## 採用率追蹤（實際部署投票）

**「行動 > 表態」原則**：與其看誰口頭支持 / 反對，看 **誰實際在自家網站部署了 llms.txt**。這是判斷規範生命力最客觀的指標。

### 大廠實測快照（2026-06-02 抓取）

| 域名路徑 | 狀態 | 觀察 |
|---|---|---|
| **`https://platform.claude.com/docs/llms.txt`**（[[Anthropic]] 開發者文檔）| ✅ **部署** | 11 語言 / 1557 頁 / 3000+ 連結；格式略不標準（缺 blockquote）但結構符合 |
| `https://docs.anthropic.com/llms.txt` | ↗️ **301 redirect** 到 platform.claude.com | 等同部署 |
| **`https://stripe.com/llms.txt`** | ✅ **部署** | 含 `llms-full.txt` 雙檔策略 |
| `https://www.anthropic.com/llms.txt` | ❌ 404 | 只在 docs 子域部署，行銷站未做 |
| `https://platform.openai.com/llms.txt` | ❌ 404 | 未部署 |
| `https://docs.perplexity.ai/llms.txt` | ⚠️ 403 / fetch 含糊 | 無法明確判斷 |

### 大環境採用率（Cloudflare Radar 2026-04-13）

來自 [[src-welly-seo-2026-04|Welly 月報引用的 Cloudflare 數據]]，掃描 top 200,000 domains：

- robots.txt：**78%**（飽和）
- Sitemap：**62%**（飽和）
- Markdown negotiation：**4.6%**（極早期）
- 註：Cloudflare 那份報告未直接列 llms.txt 採用率，但 Markdown negotiation 可作為「網站準備好讓 AI agent 用簡潔格式讀」的 proxy 指標

### 投票暗示的立場

- **[[Anthropic]] = 行動支持派**：把工程資源投入維護 3000+ 連結 / 11 語言版本 → 對「LLM 推理時讀 llms.txt 有 ROI」這個假設**用行動買單**
- **Stripe = 行動支持派**：金融基礎設施大廠採用，提供 `llms-full.txt` 雙檔
- **OpenAI = 模糊** ：未部署 但也未明確反對；可能因為 ChatGPT 用自家搜尋 + 連結擷取機制，llms.txt 沒立即價值
- **Google = 明確反對**（見 [[src-google-ai-search-optimization-guide-2026-05]]）

## 對話組與三方立場（本知識庫主要 ingest 來源）

| 立場 | 主張 | 主要來源 | 動機 / Bias |
|---|---|---|---|
| **推薦派** | 應採用 llms.txt + 補 Markdown 版本 | [[src-welly-seo-2026-04\|Welly SEO 月報]]（2026-04）+ [[Cloudflare]] agent-readiness 工具 | SEO 廠商視角：先行者紅利期 + 多平台 audience |
| **反對派** | 不需要 llms.txt / 為 AI 重寫內容 | [[src-google-ai-search-optimization-guide-2026-05\|Google AI 搜尋指南]]（2026-05-21）| **平台守門人 bias**：llms.txt 普及對 Google 不利、對 OpenAI / Anthropic / Perplexity 有利 |
| **行動派**（隱含）| 自家部署但未公開大聲推廣 | [[Anthropic]] docs + Stripe（2026-06-02 直接抓取驗證）| 工程資源投入 = 對 ROI 假設買單 |

### 三方立場的結構性矛盾

- 推薦派 vs 反對派：**框架不同**（多平台 audience vs Google 單平台 audience）—— 兩者都不算錯但適用情境不同
- 反對派 vs 行動派：**最有意思的矛盾** —— Google 說「沒人需要」，但 Anthropic 真的部署了；Anthropic 沒對 Google 立場公開回應，但**用工程投入回答了**

### Source bias 三角驗證

判斷立場可信度的 heuristic（從本知識庫 [[Ratchet-Pattern]] 第 6 次吸收檢核衍生）：

| 問題 | Google 反對 llms.txt 套用 | Anthropic 部署 llms.txt 套用 |
|---|---|---|
| 「這個立場如果反過來成立，誰會受損？」 | 反過來（llms.txt 普及）→ Google AI Overview 失去資訊優勢 → **Google 自家受損** | 反過來（llms.txt 沒用）→ Anthropic 浪費了工程資源 → 但 Anthropic 仍部署 = **行動對「ROI 為正」投票** |
| 「行動 vs 表態哪個成本更高？」 | Google 只需發文表態，成本低 | Anthropic 部署 3000+ 連結 + 11 語言，**成本高 → 信號強** |

**結論**：對「llms.txt 對 LLM 推理是否有用」這個技術問題，Anthropic 的部署是比 Google 的反對**更強的信號**。

## 信心評估

- **強**：格式規範細節 —— 來自 llmstxt.org 官方
- **強**：起源（Jeremy Howard 2024-09-03 提出，answer.ai）
- **強**：Anthropic / Stripe 已部署（直接抓取驗證 2026-06-02）
- **中**：「對 LLM 推理是否有實質效益」—— 缺乏「採用 llms.txt 後 AI 引用率 X% 上升」這類量化證據
- **中**：採用率整體規模 —— Cloudflare Radar 未直接列 llms.txt 採用率
- **中（含 bias）**：Google 反對立場 —— 是平台守門人立場，未必純粹技術判斷
- **待補**：OpenAI / Perplexity / Mistral / Google Gemini 等其他 LLM 公司的官方表態（目前只有實測未部署的 OpenAI）

## 待補資料缺口

1. **量化效益**：採用 llms.txt 後（vs 未採用對照組），LLM 引用率 / agentic 任務完成率有無差別？
2. **跨 LLM 公司表態**：OpenAI / Mistral / Cohere / Google Gemini 官方有無對 llms.txt 表態（目前只有 Google AI 搜尋指南反對）？
3. **規範演進**：Jeremy Howard 規範 vs 業界部署（Stripe `llms-full.txt`）的分岔未來會怎麼收斂？
4. **與 Markdown negotiation 的關係**：兩者是替代還是互補？
5. **MCP / Agent Skills 時代的位置**：當 LLM agent 直接用 [[MCP]] 連結網站操作能力時，llms.txt 還有相對價值嗎？

## 自家 wiki 是否要做 llms.txt 的決策框架

本知識庫（GitHub public repo）是否要部署 llms.txt？決策維度：

| 維度 | 評估 | 偏向 |
|---|---|---|
| 真正 audience | 「未來自己搜尋 + Claude / ChatGPT 引用 + Anthropic / OpenAI agent」 | **支持** llms.txt（這些 LLM 公司是受益方）|
| 維護成本 | wiki 頁面已是 Markdown，理論上 llms.txt 就是 index 列表 | 低 |
| 風險 | GitHub Pages 環境是否支援 `/llms.txt` 路徑？ | 待驗證 |
| 對 Google 搜尋影響 | Google 表態「不需要」但不會懲罰 | 中性 |
| 隱含義務 | 需要為每個頁面提供 `.md` 版本 —— GitHub markdown 已天然滿足 | 已滿足 |
| **結論建議** | **可試做，先建 minimal `/llms.txt` 列出主要 src / concept / synthesis 頁** | 暫不急，等 1-2 家其他 LLM 公司也部署再做 |

## 與本知識庫的關聯

- [[GEO]] — 本概念是 GEO Level 2 推薦清單之一；該頁含對話組對撞段
- [[src-welly-seo-2026-04]] — 推薦派的主要來源
- [[src-google-ai-search-optimization-guide-2026-05]] — 反對派的主要來源
- [[Anthropic]] — 行動派代表（platform.claude.com/docs/llms.txt 實測部署）
- [[Cloudflare]] — agent-readiness 工具的提供者，含 llms.txt 採用率 proxy 數據
- [[Jeremy-Howard]] — llms.txt 提案者（answer.ai / fast.ai 創辦人；目前無獨立 entity 頁，**再出現 1 次即建**）
- [[Ratchet-Pattern]] — 「行動 > 表態」與「Source bias 平台守門人型」兩個 heuristic 來自累積吸收檢核
- [[DESIGN-md]] — 同樣是「給 AI 讀的純文字檔案」設計哲學的姊妹案例；DESIGN.md 給 coding agent，llms.txt 給 inference-time LLM
- [[AGENTS-md]] — 給 agentic CLI 的規範檔；llms.txt 是給 LLM 認識整個網站，兩者位置不同
- [[CLAUDE-md]] — 同上，CLAUDE.md 是 project 級規範，llms.txt 是 site 級索引
- [[MCP]] — 未來可能取代部分 llms.txt 用途（agent 直接用 MCP 操作 vs 用 llms.txt 讀內容）
- [[RAG]] — llms.txt 可作為 RAG corpus 的 entry point（先讀 llms.txt 決定 retrieval 範圍）

## 未來追蹤 trigger

- 任何 LLM 公司新增 / 移除 llms.txt 部署 → 更新本頁「採用率追蹤」段
- Cloudflare Radar 發布新一輪採用率報告且含 llms.txt 直接數據 → 更新
- Jeremy Howard 規範改版 → 更新格式段
- 出現量化效益研究 → 升級「信心評估」
- OpenAI / Perplexity / Mistral 任一家官方表態 → 更新「對話組與三方立場」
