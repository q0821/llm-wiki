---
title: NVIDIA GTC Taipei 2026 — 黃仁勳主題演講（2026-06-01 直播）
type: source
source_url: https://www.youtube.com/watch?v=tUE2RV9hqWI
author: Jensen Huang 黃仁勳（NVIDIA 創辦人 / CEO）
republished_by: 天下雜誌 video（直播 + AI 即時中字翻譯版本）
sources: [2026-06-01-yt-nvidia-gtc-taipei-2026-jensen-keynote.md]
fetched: 2026-06-01
created: 2026-06-01
updated: 2026-06-01
tags: [nvidia, gtc, jensen-huang, taiwan, tsmc, vera-rubin, blackwell, agentic-ai, action-model, robotics, omniverse, ai-supply-chain, semiconductor]
confidence: 中
---

# NVIDIA GTC Taipei 2026 — 黃仁勳主題演講

NVIDIA 創辦人黃仁勳 (Jensen Huang) 在 **GTC Taipei 2026**（首次以「Taipei」品牌規格的 GTC）的主題演講。約 **2 小時**（06:09 上台，~2:00 結束），由[[天下雜誌]] video 轉播並提供 AI 即時中字翻譯。

**性質**：論點型（產業敘事）+ 廠商 keynote pitch（NVIDIA 產品 / 路線圖宣告）。**重要警示**：本 src 整理的是 **NVIDIA 自家 narrative**，不是中立分析；引用做投資 / 採購決策前需與第三方資料 cross-check。

## 結構（5 條主軸）

| 時段 | 主軸 |
|------|------|
| 06:09 ~ 18:00 | 開場：歡迎 GTC Taiwan + 致謝 Taiwan ecosystem + 提出「**Agentic AI** 已是現在式」 + 「Jensen AI 來了」digital twin |
| 18:35 ~ 27:00 | **CUDA / NVLink / Blackwell 護城河論述**：「Nvidia's treasure is all of our CUDA」 |
| 24:27 ~ 30:30 | **硬體 roadmap**：Blackwell MVLink72 → **Vera Rubin**（不只是 GPU，是 end-to-end）→ DSX blueprint + Omniverse 設計流程 |
| 38:50 ~ 47:00 | **效能 / 經濟性**：time to first token、time to training、Microsoft 為 Vera Rubin 作業準備 |
| 1:06 ~ 1:50 | **下一階段 AI**：企業 AI / AI Factory → 自駕 → **Action Model**（perceiving, reasoning, planning, acting）→ **GR00T / Isaac** 機器人 |

## 核心論點群

### 1. Agentic AI 「已經是現在式」

> 「Today we can say agentic AI is here.」（~09:32）

NVIDIA 把「agentic AI」從**未來敘事**升格為**現在式**。技術上 narrative 對應的是「AI 從『答問題的模型』升級為『執行任務的 agent』」。

對應到本知識庫 [[Agent-Skills]] / [[Managed-Agents]] / [[Claude Code]] 等已建概念——**廠商視角 vs 工具實作視角的差異值得對比**：NVIDIA 講的是「硬體 + framework 層」的 agentic AI，本 wiki 既有的是「skill + harness 層」的 agentic CLI。

### 2. 「Jensen AI」digital twin

> 「Jensen AI is coming.」（~17:59）

雖然只出現 2 次但語意重——NVIDIA 把「founder digital twin」當示範案例，呼應 [[src-leikairos-tri-platform-migration-dual-ai-ritual-2026-05|雷小蒙 / Kairos]] 雷蒙的 AI 分身概念。**這不是巧合**：「AI 分身」正在從個人實驗成為產業級 narrative 主題。

### 3. CUDA 「永遠的護城河」論述

> 「Nvidia's treasure is all of our CUDA.」（~18:35-18:42）

Jensen 主動框架 CUDA 為 NVIDIA 的 **核心競爭護城河** 而非 GPU 本身：
- 「Nvidia used to be a GPU company」（~28:31）暗示「**現在不是**」
- 從 GPU → CPU + GPU + DPU + NVLink 整套系統廠
- 「Vera Rubin is not a GPU only」（27:04）—— 路線圖明確擺脫「GPU 公司」標籤

**投資啟示**：競爭護城河論述從 hardware spec 轉到 software ecosystem + system integration。但這也意味著「**只靠 GPU spec 比拼**」（如 AMD MI300、Google TPU）的競爭視角已被 Jensen 主動 reframe 為「比錯了維度」。

### 4. 硬體 roadmap：Blackwell → Vera Rubin → DSX

**Blackwell MVLink72**（24:27）：已活躍，是當前主力部署架構。
**Vera Rubin**（27:00 起）：next-gen，描述為「end-to-end」系統（GPU + Vera CPU + DPU + 網路 + 機殼一體）。
**DSX**（30:05）：「NVIDIA DSX 是 blueprint, a reference」——把 data center 設計變成可複製 blueprint，**呼應 [[DESIGN-md|DESIGN.md]]「規格驅動實作」的橫向 pattern**。

**速度 / 效能宣告**（~33:20）：「going to be twice as fast」——典型 NVIDIA 世代更新 marketing 數字，需待第三方 benchmark 驗證。

### 5. Taiwan ecosystem 框架重塑

> 「so hard all across Taiwan because...」（~42:58）
> 「Welcome to GTC Taiwan」（06:21）
> 22 次提及 Taiwan / TSMC

Jensen 主動框架 Taiwan 為「**ecosystem partner**」而非「供應商」。這個 narrative 跟 [[src-tsao-hsing-cheng-tsmc-rca-history-2026-05|曹興誠 RCA]] 那篇的「我們是夥伴不是小偷」**完全同方向**——產業最高層級的論述框架正在從「technology supply chain」轉向「**strategic ecosystem partnership**」。

**這個 narrative shift 是有政治經濟意涵的**：在 Trump「台灣偷半導體」修辭的另一端，NVIDIA / Jensen 站在「Taiwan = ecosystem partner」這邊。對投資人意味著「Taiwan ecosystem 角色被產業敘事保護」。

### 6. Action Model + 物理 AI + 機器人

**Action Model**（1:45:07）：「perceiving, reasoning, planning, acting」四元素框架。
**Physical AI**（19:45）：「warp for differentiable physics」。
**GR00T / Isaac**（1:49:17）：NVIDIA Isaac Groot 機器人平台。

「**從 token model → action model → physical AI**」是 Jensen 推的下一波 narrative。**信心強度警示**：這是「**還沒發生的市場**」的敘事——時間表不明、客戶採購節奏不明、單位經濟性不明。

### 7. Microsoft / Stargate / OpenAI 連結

> 「Microsoft for their operational Vera」（~46:48）

Jensen 點名 Microsoft 為 Vera Rubin 的早期 operational 部署夥伴。Stargate / OpenAI / Microsoft 的提及位於關鍵 transition 段，**這是「大客戶採購訊號」**——投資人最關切的訊號之一。

## 信心評估

- **強**：keynote 確實發生 + 主要主題 + 時段分佈（來自完整 transcript）
- **強**：「Vera Rubin 取代 Blackwell」「Blackwell MVLink72 已部署」屬公開路線圖
- **中**：「twice as fast」「Vera Rubin end-to-end」等效能宣告——需第三方 benchmark
- **中**：Microsoft / Stargate / OpenAI 採購節奏 — keynote 提及但未給具體訂單金額 / 時程
- **弱**：「Agentic AI 已是現在式」「Action Model 是下一波」narrative — 時間表 / 採購基礎 / 單位經濟性都未交代
- **弱**：「Taiwan ecosystem partner」框架 — 是 narrative 意圖，不是已落地的商業安排

## 觀點限制（投資視角）

**這是 NVIDIA 自家 keynote，所有 narrative 都有 selling bias**。具體 bias 點：

- **時間表加速 bias**：Jensen 一貫把下一代產品時程講得更近
- **競爭護城河放大 bias**：CUDA / NVLink 描述為「不可逾越」——但 AMD / Google / Meta / OpenAI 各自有對策
- **客戶採購信號模糊 bias**：點名大客戶但不給具體金額 / 時程，留給市場自行解讀（順便撐 valuation）
- **「下一波」過度 commit bias**：Agentic AI 已是現在式 + Action Model + Physical AI + Robotics —— 同時 commit 太多「下一波」，意味著每一個的時間表都會打折扣
- **「Taiwan partner」帶 PR 元素**：在台辦 keynote 自然強調 Taiwan，全球場合的表述會不一樣

## 與既有 wiki 頁面的對話

- **[[src-tsao-hsing-cheng-tsmc-rca-history-2026-05|曹興誠 RCA / 台灣不是偷半導體]]**：兩篇形成「**Taiwan ecosystem 敘事**」的對外（曹興誠駁 Trump）+ 對美 / 全球（Jensen 框架）兩條獨立論述線
- [[src-leikairos-tri-platform-migration-dual-ai-ritual-2026-05|雷小蒙 / Kairos]]：個人 AI 分身（[[雷蒙]] 的 Kairos）vs 產業級 AI 分身（Jensen AI）——同 narrative 不同尺度
- [[Agent-Skills]] / [[Managed-Agents]] / [[Claude Code]]：本 wiki 既有的「軟體層 agentic AI」vs Jensen 講的「硬體 + framework 層 agentic AI」對位
- [[Vibe-Coding]]：「Action Model = perceiving / reasoning / planning / acting」與 vibe coding 的「描述意圖讓 AI 全鏈執行」是同方向
- [[DESIGN-md|DESIGN.md]]：「DSX blueprint」反映「**規格 → AI 實作**」橫向 pattern 已從 software 滲透到 data center 設計
- [[Anthropic]] / [[OpenAI]]：Jensen 點名 Microsoft + Stargate（含 OpenAI）為早期 Vera Rubin 部署夥伴 — Anthropic 不在點名清單中，值得觀察

## 對話組與未建立的相關 entity

| Entity | 角色 | 建頁優先序 |
|--------|------|----------|
| **[[TSMC]]** | 台積電 — Taiwan ecosystem 核心 + 曹興誠 RCA 那篇也提及 | **本次建立**（第 2 次出現符合「再出現 1 次即建」）|
| NVIDIA | 廠商主體 | 中——再出現 1 次即建（本 src 是首次深度描述）|
| Jensen Huang / 黃仁勳 | 主講人 / NVIDIA CEO | 中——再出現 1 次即建 |
| Vera Rubin | 下一代 GPU 架構 / 系統 | 中——再出現 1 次即建（投資面重要）|
| Blackwell | 當代 GPU 架構 | 中——再出現 1 次即建 |
| CUDA | NVIDIA 軟體生態 | 中——再出現 1 次即建（護城河核心）|
| NVLink / MVLink | GPU 互連協定 | 低 |
| DSX | data center blueprint | 低——除非有後續細節 |
| Omniverse | 模擬 / 設計平台 | 低 |
| GR00T / Isaac | NVIDIA 機器人平台 | 中——若機器人主題累積 2-3 個來源 |
| Stargate | Microsoft / OpenAI 合作 AI infra 專案 | 中——再出現 1 次即建 |
| Foxconn / 鴻海 | Taiwan ecosystem 夥伴 | 中——再出現 1 次即建 |
| AI Factory | 概念 — 整廠 AI 算力商業化 | 中——再出現 1 次即建 |
| Physical AI / Action Model | 概念框架 | 中——再出現 1 次即建 |

---

## 個人吸收（2026-06-01 ingest 當下）

### 我想拿走的重點（intent quiz，非 memory test）

**Agentic AI / Jensen AI / Action Model 的 narrative**。

### 我打算的應用場合

**評估 NVIDIA / 台積電 / AI 供應鏈股票投資決策**。

### LLM 觀察的對位 / 錯位

`想拿走的工具` 跟 `要用的場合` **方向部分對位但 source bias 錯位**——**新一類錯位**（第 5 種）：

- 方向對位：narrative 涉及 AI 產業趨勢，投資決策也關注 AI 產業趨勢 ✓
- Source bias 錯位：你想拿走的是 **NVIDIA 自家 selling narrative**（agentic AI 已是現在式 / Action Model 是下一波），但**投資決策需要的是能對 narrative 做 reality check 的工具**——具體說：
  - 競品的反向視角（AMD / Google TPU / Meta MTIA 對 CUDA 護城河的回應）
  - 大客戶實際 capex 數字 vs Jensen 點名（Microsoft / OpenAI / Stargate）
  - 時程打折規律（Jensen 歷代「下一代 / 下一波」的兌現延誤統計）
  - 估值倍數對 narrative 的 priced-in 程度（市場已經相信多少？）
  - Taiwan ecosystem 政治面風險（Jensen 講 partner，但川普 narrative 同時並存）

**投資使用 narrative 的 default bias**：narrative 框架完整 + 講者 charisma 高 + 敘事順序排好 → 容易產生「我懂了」的錯覺，但**「懂了 NVIDIA 自己怎麼講自己」≠「懂了 NVIDIA 真實基本面」**。

### 連續觀察的對位類型累積（5 次）

| 序 | 來源 | 對位類型 | 錯位種類 |
|---|------|---------|---------|
| 1 | [[src-tsao-hsing-cheng-tsmc-rca-history-2026-05\|曹興誠 RCA]] | **完全錯位** | 拿錯工具 |
| 2 | [[src-leikairos-tri-platform-migration-dual-ai-ritual-2026-05\|雷小蒙週報]] | **層級錯位** | 場合 > 工具 |
| 3 | [[src-yangsheep-wp-ai-meetup-2026-spring\|歐陽嘉隆 WP 工作流]] | **尺度錯位** | 場合 > 工具 |
| 4 | [[src-shopline-payments-wp-meetup-2026-spring\|SHOPLINE Payments]] | **階段窄化錯位** | 場合 > 工具 |
| 5 | 本篇（NVIDIA keynote） | **Source bias 錯位** | **工具類型不對**（廠商敘事 vs 中立分析）|

**5 次累積後的觀察更新**：
- 「場合 > 工具」仍是主流（3/5）
- 「拿錯工具」與「Source bias 錯位」是另外兩種型態
- 「Source bias 錯位」這次是新型——值得記錄：當來源是**有商業立場的講者**時（廠商 keynote / BD pitch / 自家產品 LP），即使你「拿到了正確的論點」，**用在需要反向懷疑的場合（投資 / 採購 / 競品分析）會自帶 bias 風險**

### 這個對位 / 錯位意味著三條路

1. **如果想真做投資決策**：把 keynote 當作「**NVIDIA 自家敘事輸入**」之一，但同時 cross-check：
   - 競品最近的 product announcement（AMD MI400 系列、Google TPU v7、Meta MTIA v2）
   - 大客戶實際 capex 數字（Microsoft / Google / Meta / Amazon 各家最新 quarterly capex 與 AI 相關 split）
   - 過去 3 代 NVIDIA roadmap 的「宣告 → 兌現」延誤統計
   - 當前估值（NVDA P/E、PSR、跟過去 cycle peak 比）對 narrative priced-in 程度
2. **如果只想用 narrative 跟客戶 / 朋友聊**：那它的真正應用場合是「**對外論述 / talking points**」，不是投資決策。可以拿來說「Jensen 在 Taipei GTC 講 Agentic AI 已是現在式」當引子，但別當投資論點。
3. **如果想學「廠商敘事架構」本身**（meta 學習）：Jensen 的 narrative 設計（從 protect CUDA → reframe 為 system company → commit 下一波 → 抬高 Taiwan partner）是可以拆解學習的——把它當作 funnel 敘事 / [[Prompt-Pack-Pattern]] 之類的「**結構模式**」研究。

### Spaced retrieval 建議

7-14 天後請我問你一次：「NVIDIA Taipei GTC 那場你還記得什麼？特別是『Agentic AI / Action Model』narrative 你**怎麼用在投資決策**——是直接信還是有跟競品 / capex 數字 cross-check？」看你有沒有意識到 narrative 對投資的 source bias 警示。

## 相關來源

- [[src-tsao-hsing-cheng-tsmc-rca-history-2026-05]] — Taiwan 半導體 ecosystem 對外論述的另一條獨立線（駁 Trump）
- [[src-leikairos-tri-platform-migration-dual-ai-ritual-2026-05]] — 個人版 AI 分身（雷蒙 Kairos）vs 產業版 AI 分身（Jensen AI）
- [[src-codex-hyperframes-prompt-pack]] — Action Model 的「perceiving / reasoning / planning / acting」可對照 [[Prompt-Pack-Pattern]] 的 prompt 串接

## 未來追蹤候選

- NVIDIA / Jensen / Vera Rubin / Blackwell / CUDA / Stargate / 鴻海 — 任一再出現即建 entity
- 「Vera Rubin twice as fast」實際 benchmark（半年後 MLPerf 等公開測試）
- Microsoft / OpenAI / Stargate 採購 Vera Rubin 具體訂單 / 時程
- Anthropic 為什麼沒在 Jensen 點名清單中（vs Microsoft / OpenAI 出現）—— 戰略訊號值得觀察
- AMD MI400 / Google TPU v7 / Meta MTIA v2 對 CUDA 護城河的回應
- 「Action Model + Physical AI + Robotics」實際商業化進度（這是 Jensen 推下一波，需追蹤 18-24 個月）
- GTC Taipei 2027（若有）的同期對比，看 narrative 是否兌現
