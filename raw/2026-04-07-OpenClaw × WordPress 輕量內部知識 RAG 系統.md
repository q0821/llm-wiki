

> 來源：WordPress 小聚 2026.03.30｜講者：Nelson Chen（得寬科技 資深前端工程師）
> 實際案例：[lovensake.com](https://lovensake.com)（日本酒電商，~5,000 件商品）

---

## 📌 目錄

1. [核心問題與動機](#1-核心問題與動機)
2. [關鍵概念解釋](#2-關鍵概念解釋)
3. [系統架構總覽](#3-系統架構總覽)
4. [索引流程（rag-indexer）](#4-索引流程-rag-indexer)
5. [查詢流程（rag-query）](#5-查詢流程-rag-query)
6. [前端整合](#6-前端整合)
7. [Admin 後台](#7-admin-後台)
8. [開發歷程與版本演進](#8-開發歷程與版本演進)
9. [費用與技術選型](#9-費用與技術選型)
10. [應用場景與適用範圍](#10-應用場景與適用範圍)
11. [優點](#11-優點)
12. [缺點與技術限制](#12-缺點與技術限制)
13. [踩過的坑與對策](#13-踩過的坑與對策)
14. [可立即執行的行動清單](#14-可立即執行的行動清單)

---

## 1. 核心問題與動機

WordPress / WooCommerce 網站裡有大量**結構化知識**（商品描述、文章、FAQ、分類），卻只能靠關鍵字搜尋框存取。

### 痛點
- 使用者問法各異，關鍵字對不上 → 搜不到
- 直接問 ChatGPT → 推薦你沒賣的商品、連結是假的（幻覺 Hallucination）
- 人工客服成本高，無法 24 小時即時回應

### 目標
讓 AI 只根據**你自己的資料**回答，不幻覺、不捏造。

---

## 2. 關鍵概念解釋

### RAG（Retrieval-Augmented Generation，檢索增強生成）
```
使用者提問 → ① 先去知識庫「查資料」 → ② 把查到的資料塞進 Prompt → ③ LLM 根據資料生成回答
```

> 類比：新進員工拿到一本公司手冊，客人問什麼就翻手冊回答，不是憑猜的。
> WordPress REST API 就是那本手冊，而且已經結構化好了。

三個步驟：
- **Retrieval（檢索）**：從知識庫找出相關內容
- **Augment（增強）**：把找到的資料塞進 AI 的 Prompt 當「參考資料」
- **Generate（生成）**：AI 根據參考資料寫出回答

---

### Embedding（向量化）

把文字轉成一組數字（向量），代表這段文字的「語意位置」。  
例：`[0.12, -0.87, 0.33, ...]`

**關鍵原理**：意思越接近的文字，向量距離越近。
```
「新手適合」    → [0.12, -0.87, 0.33, ...]
「入門清爽低酒精」→ [0.15, -0.82, 0.31, ...]
→ 兩組數字很接近 → 搜尋命中 ✓
```

---

### 傳統搜尋 vs Embedding 搜尋

| | 傳統關鍵字（BM25） | Embedding 語意搜尋 |
|--|--|--|
| 比對方式 | 比對文字（有無這幾個字） | 比對意思（向量距離） |
| 優點 | 快速、不需額外費用 | 理解語意、找得到同義詞 |
| 缺點 | 字對不上就找不到 | 需要 Embedding 費用和向量 DB |
| 適合 | 精確查詢（商品編號、姓名） | 模糊查詢（推薦、場合、感覺） |

> 一句話：BM25 比對文字，Embedding 比對意思。

---

## 3. 系統架構總覽
```
WordPress / WooCommerce REST API
         │
         ▼
┌─────────────────────┐      ┌───────────────────────┐
│   rag-indexer        │      │   rag-query            │
│   （排程 CRON）      │      │   （即時查詢）          │
│                      │      │                        │
│ ① 抓取商品資料       │      │ ① LLM 意圖分析         │
│ ② LLM 內容增強       │      │ ② 向量語意搜尋          │
│ ③ Embedding 向量化   │      │ ③ 多階段篩選            │
│ ④ 寫入 Vectorize+D1  │      │ ④ LLM 生成推薦文案      │
└──────────┬──────────┘      └──────────┬─────────────┘
           │                            │
           ▼                            ▼
   ┌───────────────────────────────────────────┐
   │  Cloudflare 免費方案                       │
   │  Vectorize（向量 DB）+ D1（SQLite）        │
   │  KV（設定）+ Pages（前端）                 │
   └───────────────────────────────────────────┘
```

**設計原則**：索引排程（rag-indexer）與即時查詢（rag-query）**完全分離**，索引不影響查詢效能。

---

## 4. 索引流程（rag-indexer）

> 目的：把 WooCommerce 商品資料轉換成 AI 可語意搜尋的向量索引

### 流程步驟（順序很重要）
```
① WooCommerce REST API 拉商品（分頁批次）
↓
② LLM 內容增強（gpt-4o-mini, temp 0.3）
   生成：
   - semantic_tags（5-10 個）：送禮適合、新手友善、果香甜口…
   - use_cases（2-5 個）：送老闆、搭配海鮮、日常小酌…
   - flavor_profile：感官描述
   - summary：一句話推薦語
↓
③ 增強結果 + 原始文字 → 組成 semantic text
↓
④ semantic text → text-embedding-3-small → 向量
↓
⑤ 向量 → Vectorize｜增強欄位 → D1 metadata
```

### 為什麼 LLM 要在 Embedding 之前跑？

原始商品資料：`「純米大吟醸、精米歩合 45%、山田錦」`  
→ 規格式的冷資料，顧客不會這樣搜尋

LLM 增強後：新增「送禮適合、新手友善、果香甜口」等標籤  
→ 搜尋「送禮」能命中本來只寫「山田錦」的商品

---

## 5. 查詢流程（rag-query）

> 目的：即時處理使用者提問，回傳精準推薦

### 完整流程

**Step 1：LLM 意圖分析**（gpt-4o-mini, temp 0.1）
- `intent`：recommend / knowledge / compare / greeting / clarify
- `confidence`：0~1，低於 0.7 自動追問
- `search_queries`：把人話拆成 3-5 組多角度搜尋語句
- `preferences`：抽取預算、場合、口味、排除詞

> 例：「送女友 2000 內 甜的」→ 拆成「甜口 送禮 紅酒」「水果風味 女性喜愛」

**Step 2-4：搜尋 + 篩選**
- 用 3-5 組語句分別做向量搜尋（可能撈出 50+ 筆）
- 多階段篩選：預算 / 分類 / 語意標籤 / 排除詞
- 信心度判斷：夠高 → 推薦；太低 → 生成追問問題

**Step 5：LLM 生成推薦文案**（gpt-4o-mini, temp 0.7）
- 只根據「精選 Top 5」撰寫推薦理由
- 嚴禁提到延伸商品、嚴禁捏造名稱/價格
- 推薦類 ≤ 200 字／知識類 ≤ 300 字

**Step 6：回傳 JSON → 前端渲染**
- 商品卡片（精選 Top 5）+ 延伸推薦 5
- AI 推薦文案
- 👍👎 回饋按鈕

### 信心度機制
| 問題 | 信心度 | 動作 |
|--|--|--|
| 「推薦清酒」 | 0.3 | 追問 |
| 「新手清酒」 | 0.5 | 追問 |
| 「兩千送禮清酒」 | 0.8 | 推薦 |
| 「預算兩千、果香、送禮」 | 0.95 | 直接推薦 |

---

## 6. 前端整合

### 兩種形式
1. **Chat Widget**：一段 `<script>` 嵌入任何 WordPress 網站，浮動在右下角
2. **獨立網頁**：完整對話頁面（Vue 3 + 品牌 Header/Footer）

兩者共用同一個 `ChatView` 核心元件。

### 商品卡片（ProductCard.vue）
- 商品圖片（無圖顯示 emoji fallback）
- 商品名稱（2 行截斷）
- 價格（格式化 + 幣值）
- Top 3 語意標籤（來自 Indexer LLM 增強）
- 風味描述摘要
- 「AI enriched」徽章
- 點擊 → 直接前往 WooCommerce 商品頁

### 模型分工
| 用途 | 模型 | Temperature |
|--|--|--|
| 意圖分析 | gpt-4o-mini | 0.1（穩定） |
| 推薦文案 | gpt-4o-mini | 0.7（自然流暢） |
| 內容增強（Indexer） | gpt-4o-mini | 0.3 |
| Embedding | text-embedding-3-small | - |
| 追問生成 | gpt-4o-mini | 0.2（精確） |

---

## 7. Admin 後台

> 核心理念：讓管理員/產品人員自己調整，**不需要每次都找工程師**

### 4 個 Tab

| Tab | 設定內容 | 適合誰 |
|--|--|--|
| 基本設定 | 站名、商品名詞、幣值、API 連線 | 工程師（初次） |
| 聊天外觀 | 圖示、主題色、歡迎語、建議問題 | 設計師/行銷 |
| AI 行為 | AI 人設 Prompt、溫度、追問問題 | 產品/管理員 |
| 領域知識 | 分類對應、語意擴展、信心度校準 | 產品/領域專家 |

### 語意擴展（最關鍵的設定）

教 AI 說「你的行話」，不需改程式碼：
```
概念：「新手」
同義詞：入門、第一次喝
展開搜尋：果香 甜口 清酒、易飲 柔和
避開：辛口過重、酒精感強
```

---

## 8. 開發歷程與版本演進

### 1st Iteration（OpenClaw MVP，16 天）

| 日期 | 事件 |
|--|--|
| 03/08 | 開始，用 OpenClaw 建立 Skill |
| 03/13 | 先上 BM25，發現問題，20 分鐘內升級 Embedding |
| 03/17 | 建立 Shared Retriever API（Port 3100） |
| 03/23 | MVP 完成，927 文章 + 4,798 商品 |

**心態重點**：一開始就知道「先 BM25 → 再 Embedding → 最後部署」，所以升級只花 20 分鐘，因為路徑早就想好了。

### 2nd Iteration（速度驗證）

| 時間 | 事件 |
|--|--|
| 18:19 | Bot 配對上線 |
| 20:10 | API 403 問題排查完畢（4 分鐘） |
| 21:41 | 知識庫同步完成（87 分鐘，4,969 商品 + 944 文章） |
| 00:00 | 基本搜尋可用（~6 小時） |
| 06:53 | Embedding 語意搜尋上線（~12 小時） |

> **結論：從零到基本搜尋約 6 小時，加語意搜尋約 12 小時。**

### 版本對比

| | OpenClaw MVP | Cloudflare Production |
|--|--|--|
| 開發時間 | 16 天 | 持續 |
| 搜尋方式 | BM25 → Embedding | Vectorize 語意搜尋 |
| 部署 | Zeabur（本機） | 全球邊緣（Workers） |
| 前端 | Telegram + 試運行頁面 | Chat Widget + 獨立頁 |
| 資料儲存 | JSON 檔（~百MB） | Vectorize + D1 |
| 後台 | 無 | Admin UI（4 Tab） |
| 特色 | 含 Telegram Bot | 回饋機制 👍👎、LLM 內容增強 |

---

## 9. 費用與技術選型

### Cloudflare 免費方案

| 服務 | 用途 | 免費額度 |
|--|--|--|
| Workers | 無伺服器運算 | 100,000 req/天、10ms CPU |
| D1 | SQLite 資料庫 | 10 GB 儲存 |
| Vectorize | 向量資料庫 | 10M 向量、1,536 維度 |
| Pages | 前端靜態站 | 500 builds/月、無限流量 |
| KV | Key-Value 設定 | 100K reads/天、1 GB |

> **整套 RAG 系統在免費額度內就能跑起來，全球邊緣部署**

### 常見 Embedding 模型費用

| 模型 | 維度 | 費用/1M tokens | 建議 |
|--|--|--|--|
| text-embedding-3-small | 1,536 | $0.02 | ✅ 本專案使用，95% 場景夠用 |
| text-embedding-3-large | 3,072 | $0.13 | 高精度場景 |
| text-embedding-ada-002 | 1,536 | $0.10 | 不建議（舊版） |
| Cohere embed-v4 | 1,024 | $0.10 | 多語言、圖文混合 |
| CF @cf/baai/bge-base-en-v1.5 | 768 | 免費 | Cloudflare 內建，英文為主 |

> **5,000 件商品索引費用：約 $0.10~$0.30 美元（Batch API 再打五折）**

---

## 10. 應用場景與適用範圍

### ✅ 最適合的場景

**電商類**
- WooCommerce 垂直電商（服裝、食品、3C、美妝等）
- 商品數量龐大（100件以上），描述複雜，用戶查詢模糊
- 需要「推薦型」對話（預算、場合、口味、用途）

**知識庫類**
- 企業內部文件、SOP、FAQ 查詢
- 部落格、技術文件的智慧搜尋
- 客服自動化（退換貨政策、配送說明）

**垂直領域**
- 任何有大量結構化 WordPress 內容的網站
- 產品複雜、需要專業諮詢的行業（酒、藥妝、食材、設備）

### 適用規模

| 規模 | 商品/文章數 | 適合程度 |
|--|--|--|
| 小型 | < 100 | ⚠️ RAG 效益不大，一般搜尋即可 |
| 中型 | 100 ~ 1,000 | ✅ 最佳甜蜜點 |
| 大型 | 1,000 ~ 10,000 | ✅ 非常適合（免費方案可支撐） |
| 超大型 | > 10,000 | ⚠️ 需升級付費方案，評估成本 |

### 不適合的場景
- 需要**即時庫存/訂單狀態**查詢（RAG 是靜態索引，需搭配即時 API）
- 需要**個人化帳戶資料**（需額外整合用戶系統）
- 圖片辨識（本架構純文字，需另外加視覺模型）
- 需要**嚴格法律合規**審查的回答（醫療、法律等高風險領域）

---

## 11. 優點

### 技術優點
- **零資料遷移**：直接用 WordPress REST API 當資料源，不用搬資料、不改現有架構
- **語意搜尋**：Embedding 讓 AI 理解意思，不只比對文字
- **LLM 語意增強**：索引前先讓 LLM 補充語意標籤，大幅提升搜尋命中率
- **全球低延遲**：Cloudflare Workers 邊緣部署，查詢回應快
- **資料即時性**：CRON 排程自動同步，不需手動維護

### 成本優點
- **幾乎零成本啟動**：Cloudflare 免費方案 + 極低 Embedding 費用
- **按量計費**：沒人用就幾乎不花錢
- **開發速度快**：OpenClaw MVP 12 小時可驗證，Claude Cowork 協助快速生產

### 管理優點
- **非技術人員可操作**：Admin UI 讓行銷、產品人員自己調教 AI
- **可控性高**：嚴格的 Prompt 控制，AI 只能推薦實際有的商品
- **回饋機制**：👍👎 收集使用者回饋，持續優化

### 對比市售外掛的優點
- 商品即知識庫（其他外掛多需手動建 FAQ）
- 有真正的向量搜尋（多數外掛 Pro 版才有，且功能有限）
- 有商品卡片直連商品頁（其他外掛無此功能）
- 整套跑在 Cloudflare 免費方案（其他外掛月費 $8~$49/月不等）

---

## 12. 缺點與技術限制

### 技術限制

**Cloudflare Workers 限制**
- CPU 時間限制：免費方案每個請求 10ms CPU 時間，複雜邏輯需特別優化
- 無法長時間執行：大型索引任務需拆成批次，或改用 Workers Cron Triggers
- 冷啟動延遲：Workers 有冷啟動問題（雖然比傳統 Serverless 短）

**Vectorize 限制**
- 免費方案 10M 向量、1,536 維度，超過需付費
- 不支援複雜的過濾查詢（相較於 Pinecone、Weaviate 等完整向量 DB）
- 無法做向量的即時更新（需重新索引）

**RAG 本身的限制**
- **知識截止時間**：索引是快照，新商品需等下次 CRON 同步才能查到
- **長文本限制**：Embedding 模型有 token 上限，超長描述需切段（chunking），切法影響品質
- **多輪對話記憶**：目前架構無狀態，每次查詢獨立，無法記住對話脈絡
- **圖片搜尋**：純文字向量，無法「拍照找商品」

**LLM 依賴風險**
- 依賴 OpenAI API，有停機/漲價風險
- gpt-4o-mini 的內容增強品質不如 gpt-4o，複雜商品描述可能增強效果有限
- Prompt 設計不當仍可能產生幻覺（雖然有資料 grounding）

### 開發與維護複雜度

- 需要具備基本 JavaScript / Node.js 能力來部署 Workers
- 架構涉及多個 Cloudflare 服務，初次設定有一定學習成本
- API 金鑰管理（OpenAI Key、WooCommerce Key）需妥善保管
- 需要自己維護、監控，無商業支援

### 適用邊界
- 資料量太少（< 100 筆）：ROI 低，一般搜尋即可
- 非 WordPress 網站：需要另外處理資料源
- 多語言混合內容：Embedding 模型對中英混合的處理品質不一
- 需要嚴格審計追蹤的場景：LLM 生成結果難以完全預測

---

## 13. 踩過的坑與對策

| 坑 | 原因 | 對策 |
|--|--|--|
| WooCommerce API 回 403 | Basic Auth 被防火牆擋 | 改用 query string 認證（`?consumer_key=&consumer_secret=`） |
| 關鍵字搜尋找不到（「備蓄米」） | BM25 只比對文字，不理解語意 | 升級 Embedding 語意搜尋 |
| LLM 推薦了前端看不到的商品 | LLM 看到 8 件，前端只顯 5 件 | Prompt 明確限制「只能寫精選 Top 5 的商品」|
| JSON 大檔載入慢、記憶體爆 | 所有向量存在單一 JSON | 改用 Vectorize 等專業向量資料庫 |
| 服務不定時掛掉 | Node 進程異常退出 | 用 `quiz-monitor.sh` 每 10 秒監聽，自動重啟 |
| 搜尋結果答非所問 | 意圖分析不夠精確 | 多組 search_queries + 信心度機制追問 |

---

## 14. 可立即執行的行動清單

### Phase 1：評估（今天）
- [ ] 確認 WordPress/WooCommerce 的內容規模（文章數、商品數）
- [ ] 測試 REST API：`你的網域/wp-json/wp/v2/posts?per_page=1`
- [ ] 在 WooCommerce 後台新增「讀取」權限 API 金鑰備用

### Phase 2：MVP 快速驗證（~12 小時）
- [ ] 在 [Zeabur](https://zeabur.com) 部署 OpenClaw
- [ ] 提供 WooCommerce API Key，同步商品（約 87 分鐘）
- [ ] 測試 `/search 商品名` 基本搜尋
- [ ] 確認搜尋品質 → 啟用 Embedding 語意搜尋

### Phase 3：生產部署（Cloudflare）
- [ ] 申請 Cloudflare 帳號，開通 Workers / D1 / Vectorize / Pages
- [ ] 部署 rag-indexer Worker（CRON 排程 + LLM 增強 + Embedding）
- [ ] 部署 rag-query Worker（意圖分析 + 向量搜尋 + 文案生成）
- [ ] 在 WordPress 嵌入 Chat Widget `<script>`

### Phase 4：調教 AI（持續）
- [ ] 在 Admin UI 設定 AI 人設 Prompt
- [ ] 建立語意擴展規則（你的行話 → 搜尋展開）
- [ ] 校準信心度閾值
- [ ] 根據 👍👎 回饋資料分析優化

---

## 🔗 相關資源

- **投影片原始網址**：https://wp-openclaw-rag-ppt.pages.dev/
- **講者 Email**：nelson.chen@theqwan.com
- **OpenClaw**：AI Agent 框架，支援 Telegram / Discord / Slack
- **Zeabur 活動優惠**：https://zeabur.com/events?code=wp0330
- **Cloudflare Vectorize 文件**：https://developers.cloudflare.com/vectorize/
- **OpenAI Embeddings**：https://platform.openai.com/docs/guides/embeddings

---

*筆記整理日期：2026-04-07*