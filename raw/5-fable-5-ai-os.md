<!-- source-url: https://denghao.substack.com/p/5-fable-5-ai-os -->
<!-- title: 5 步驟建構 Fable 5 AI 個人作業系統 (OS) -->
<!-- author: 等號 (denghao) -->
<!-- published: 2026-07-04 -->
<!-- fetched: 2026-07-16 -->

# 5 步驟建構 Fable 5 AI 個人作業系統 (OS)

**作者：** 等號
**發布日期：** 2026 年 7 月 4 日
**來源：** Substack (denghao.substack.com)

---

## 為什麼你需要建立自己的 AI OS？

這套系統具備以下三大核心優勢：

- **不綁定特定模型：** 雖然以 Fable 5 為基礎建構，但可自由替換底層的大型語言模型（LLM）。
- **100% 語音全本地端運行：** 對話與指令不需上傳雲端，保障隱私與低延遲。
- **100% 可客製化：** 系統架構清晰，隨時可為不同客戶或團隊成員進行分岔與客製化介面。

---

## 第一步：大腦 (The Brain) —— 建立技能架構 (Skill Architecture)

AI 應需要結構化思維，而非一鍋大雜燴。將工作流程拆解為「分支」(Branches)，再細分為「技能」(Skills)。

**實際操作指南：**

1. **建立根目錄：** 在電腦中建立名為 `jarvis-os` 的主資料夾。
2. **分類工作流：** 建立如 `Content_Creation`、`Data_Analysis`、`Client_Management` 等子資料夾。
3. **撰寫 SKILL.md：** 該技能的「說明書」，需明確定義：
   - **Role (角色設定)：** 例如「10 年經驗的短影音腳本專家」
   - **Inputs (輸入格式)：** 規定接收的資料類型（URL、關鍵字、PDF 報表）
   - **Outputs (輸出格式)：** 規定回傳的格式（JSON、Markdown 表格）
   - **Tools (可用工具)：** 該技能可調用的 API 或本機腳本

---

## 第二步：記憶 (The Memory) —— 打造 Obsidian 知識庫 (Vault)

系統如無記憶，每次對話都像面對失憶症患者。使用純文本 Markdown 檔案作為長期記憶庫。

**實際操作指南：**

1. **安裝 Obsidian：** 在電腦上安裝並建立新 Vault，例如命名為 `Jarvis_Memory`。
2. **設定輸出路徑：** 將 AI 系統的所有報告與日誌預設寫入路徑指向 Obsidian Vault 資料夾。
3. **建立雙向連結網：** 在系統提示詞中規定，AI 生成報告時必須使用 `[[雙向連結]]` 標籤，例如產出「AI 工具」報告時自動標記 `[[AI 趨勢]]`。Obsidian 將自動生成知識圖譜，AI 未來檢索時也能順藤摸瓜。

---

## 第三步：聲音 (The Voice) —— 100% 本地化語音驅動

讓系統擁有「靈魂」的關鍵，不依賴外部 API，而是直接在機器上處理聽與說。

**流程概念：**

- **聽（麥克風輸入）：** 使用 `faster-whisper` 在本地端進行語音轉文字 (STT)。
- **思考（路由）：** 透過正規表示式、本地小模型或輕量級 API 判斷意圖。
- **說（語音輸出）：** 透過 `Kokoro` 進行文字轉語音 (TTS) 回覆。

**實際操作指南：**

1. **環境建置：** 使用 Python 虛擬環境（Anaconda 或 venv）。
2. **安裝與配置 STT：** 執行 `pip install faster-whisper`，撰寫 Python 腳本持續監聽麥克風，當偵測到「喚醒詞」（如 "Hey Jarvis"）時開始錄音並轉錄。
3. **建構意圖路由器 (Router)：**
   - _簡單指令：_ 使用 Regex（捕捉「關機」或「現在幾點」），直接觸發本地腳本，不耗費 AI 算力。
   - _複雜問題：_ 將轉錄文字丟給 LLM 處理。
4. **安裝與配置 TTS：** 整合 `Kokoro` 或其他開源 TTS 引擎（Edge-TTS 或 VITS），將 AI 回應轉為自然語音播出。

---

## 第四步：介面 (The Face) —— 整合進單一 HUD 儀表板

強大的後台需要一目了然的戰術指揮中心，將技能、記憶與語音狀態整合進 V.A.U.L.T. (Voice-Activated Unified Logic Terminal) 儀表板。

介面包含：核心指標 (Metrics)、語音狀態即時視覺化 (Voice)、當前載入技能 (Skills) 與排程 (Schedule)。

**實際操作指南：**

1. **選擇前端框架：** 如熟悉網頁技術，可使用 HTML/CSS 搭配輕量級 JavaScript 框架（Vue 或 React）；若想全用 Python，**Streamlit** 或 **Gradio** 最快速。
2. **建立 API 橋樑：** 使用 FastAPI 或 Flask 在本地建立伺服器，讓 AI 後台邏輯與前端儀表板互相溝通。
3. **即時狀態串接：**
   - 設定 WebSocket 即時顯示語音轉文字進度條。
   - 串接社群平台 API（YouTube、Instagram）讓 Metrics 區塊自動更新追蹤人數與流量。

---

## 第五步：交付與部署 (The Handoff) —— 打包、發布、換皮

當成功打造此系統後，不只能自用，還能成為可擴展的產品。

**實際操作指南：**

1. **版本控制：** 在終端機輸入 `git init` 初始化專案，將所有不含敏感資料的程式碼推送到 GitHub。
2. **安全管理 (.env)：** 絕不把 API Keys 寫死在程式碼！建立 `.env.example` 檔案列出需要的金鑰名稱，讓使用者複製改名為 `.env` 後自行填入。
3. **撰寫自動化安裝腳本：** 建立 `setup.sh` (Mac/Linux) 或 `setup.bat` (Windows)，內含自動建立虛擬環境、執行 `pip install -r requirements.txt` 的指令。
4. **換皮 (Reskin) 邏輯：** 將前端 CSS 變數（主色調、字體、Logo）抽離集中在設定檔（如 `config.json`）。需要賣給另一家公司時，只需修改 JSON，即能瞬間轉換為其品牌視覺。
