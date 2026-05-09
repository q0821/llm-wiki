---
title: PAPAYA — Gemma 4 + LM Studio 本地 AI 工作站教學
type: source
sources: ["yt-別再小看本地-aigemma-4-lm-studio-讓你的電腦變成超級離線-ai-工作站而且完全免費-手機也能使用喔.md"]
created: 2026-05-10
updated: 2026-05-10
tags: [本地-ai, gemma, lm-studio, mcp, edge-ai, 中文教學]
confidence: 強
---

# PAPAYA — Gemma 4 + LM Studio 本地 AI 工作站教學

**作者**：[[PAPAYA-電腦教室]]
**平台**：YouTube
**影片 ID**：r5M0W66xcGc
**原始連結**：https://youtube.com/watch?v=r5M0W66xcGc
**抓取於**：2026-05-10（透過 youtube-transcript-api，繁中字幕完整）
**長度**：約 17 分鐘 / 856 段逐字稿

## 核心主張

- **本地 AI 已可勝任日常複雜任務**——隨技術進步，本機跑的小模型不必再小看
- 三大優勢相對雲端：**隱私（資料不上傳）、離線可用、零訂閱費**
- LM Studio（GUI）vs Ollama（CLI）：前者對非工程師更友善
- [[MCP]] 是本地 AI 連到外部世界（搜尋、檔案系統）的關鍵橋樑
- meta 工作流：**用雲端 AI（Claude/ChatGPT）幫你設定本地 AI 工具**——人機協作的另一層

## 雲端 vs 本地 AI 對立軸（本次強調）

| 面向 | 雲端 AI（[[Claude Code]] / [[NotebookLM]] / [[Managed-Agents]]）| 本地 AI（Gemma + LM Studio） |
|---|---|---|
| 模型能力 | 頂級（Opus / GPT-5 級）| 中等（受硬體限制）|
| 隱私 | 資料上傳到供應商 | **資料完全留在本機** |
| 網路依賴 | 必需 | 不需要 |
| 訂閱費 | $20/月 起 | **完全免費** |
| 額度限制 | 有（Pro 5 hr / 7 day）| **無限**（受硬體效能限制）|
| 工具呼叫 | 內建多 | 需用 [[MCP]] 自己接 |
| 適合場景 | 需要強推理、多模態、最新資訊 | 隱私敏感、離線、低成本長期使用 |

> 兩者**不互斥**：影片中作者展示「用 Claude 幫忙寫 MCP 設定」、「用 Gemma 跑日常任務」的混合工作流——Pro 使用者可同時利用雲端與本地。

## 具體可操作步驟（本次強調）

### 1. 硬體適配檢查

去 **Can I Run AI Locally**（網站）→ 自動偵測 GPU / VRAM → 顯示能跑哪個模型
- `Runs Great` = 可順利執行
- `Too Heavy` = 跑不動

[[Gemma]] 4 四個版本：

| 版本 | 適合硬體 | 用途 |
|---|---|---|
| **E2B** | 手機/平板 | 入門、輕量任務 |
| **E4B** | 一般筆電 | 日常使用、教學示範 |
| **26B / 31B** | 高階電腦 | 程式設計等需推理任務 |

### 2. 安裝與下載

1. 下載 [[LM-Studio]]（GUI）
2. 在「搜尋模型」找 Gemma 4 → 看綠色標籤確認可跑 → Download
3. 模型旁三個圖示說明能力：**視覺 / 工具使用 / 推理**

### 3. 基本使用

| 設定 | 位置 | 建議值 |
|---|---|---|
| **Context Length** | 模型參數面板 | 預設 4096，文件分析時調高 |
| **System Prompt** | Inference 標籤 | 寫「用繁體中文回覆」「不確定就說不知道」 |
| **推理模式** | 對話頁開關 | 預設啟用 |

**Branch（分支）功能**：保留上下文切出新對話，比較不同 prompt 效果，不弄亂主對話脈絡。

### 4. 上傳檔案分析

- Word / CSV / 圖片 / 音訊 都可
- 大型 CSV 會超出 context length → 提示後調高 → 重新載入模型
- **多模態**：Gemma 可分析圖片（影片示範用韓文雜誌做翻譯）、可分析音訊（影片示範錄一段中文 → 產生英文表達）

### 5. 手機端

下載 **Google AI Edge Gallery** App → 直接內建 Gemma E2B → 拍照即時翻譯。

### 6. 透過 [[MCP]] 接外部工具

#### 連網搜尋（Brave Search）

1. 註冊 Brave Search API（綁信用卡身份驗證、免費 1000 次/月）
2. **去 Claude / ChatGPT 請它寫 MCP 設定 JSON**（meta 工作流）
3. LM Studio 工具標籤 → 編輯 MCP → 貼設定 + API key → 儲存
4. 側邊欄開啟 Brave Search 開關 → 測試提問

#### 檔案系統管理

1. 同樣請雲端 AI 改 MCP 設定加上檔案系統
2. **重要陷阱**：路徑必須是絕對路徑，不能寫 "Downloads"——要在 system prompt 補絕對路徑
   - macOS：對資料夾按 Option + 右鍵 → 拷貝路徑名稱
   - Windows：右鍵 → 複製路徑

### 7. 寫程式（影片實戰：瀏覽器便利貼擴充功能）

- 用 26B / 31B 版本（推理需求高）
- 開 LM Studio 「開發者」頁 → Load Model + 開啟本地 server
- VS Code 裝 **Continue** 擴充 → 連到 LM Studio → 選 Gemma 4
- 寫 prompt → Gemma 產生程式 → 載入瀏覽器測試 → 發現 bug → 回報給 Gemma 修
- 「**通常需要來回溝通好幾個回合**」——本地小模型推理能力的真實限制

## 關鍵原文引用

> 「==當然本機 AI 的聰明程度仍比不上頂級的雲端模型==，但隨著這幾年技術的大幅進步，本機 AI 已能勝任許多複雜的任務。」
> — PAPAYA, 開場定調本地 AI 的當前定位

> 「==它就像是一個翻譯機==，能讓 AI 與其它的軟體工具進行對話，並執行特定的工作。」
> — PAPAYA 對 [[MCP]] 的白話定義

> 「實際上我們只需到 ChatGPT 或 Claude 的網站，==直接請 AI 幫我們做好設定就 OK 了==。」
> — 用雲端 AI 設定本地 AI 的 meta 工作流

> 「Gemma 此時會回報它並沒有存取該資料夾的權限...造成這個錯誤的原因，是因為 Gemma 把 Downloads 資料夾誤當成相對路徑來處理...我們只需跟 Gemma 做個提醒，==在它的系統提示詞內說明 Downloads 資料夾的正確位置==。」
> — 系統提示詞作為運行時調試手段

> 「一般來說，這通常需要來回溝通好幾個回合，==很大程度取決於 AI 模型本身的推理能力==。」
> — 對小模型寫程式真實能力的誠實說明

## 與本知識庫的關聯

- [[PAPAYA-電腦教室]]、[[Gemma]]、[[LM-Studio]]、[[MCP]] — 新建頁
- [[Claude Code]] — 雲端 AI 對照組；本影片提到「請 Claude 幫忙寫 MCP 設定」
- [[NotebookLM]]、[[Managed-Agents]] — 雲端 AI 對照組
- [[HC-AI-說人話]]、[[科技翰林院]] — 同為中文 AI 創作者，PAPAYA 屬最基礎入門層級
- [[Agent-Skills]] — Continue（VS Code 擴充）的補充

## 信心評估

- **強**：操作步驟與工具名稱（LM Studio、Continue、Google AI Edge Gallery、Brave Search MCP）— 影片即時示範可驗證
- **強**：MoE 解釋（A3B = 350 億參數每次啟用 30 億）— 技術描述準確
- **中**：「本機 AI 已能勝任許多複雜任務」— 影片自身 demo 寫程式時也提到「通常需要來回好幾個回合」，能力邊界仍存
- **時效性**：Gemma 4 為 2026 推出當期內容，2026-05-10 觀看仍新鮮

## 忽略區段

無——本次 ingest 將具體操作步驟全部納入（依使用者強調軸 d）。
