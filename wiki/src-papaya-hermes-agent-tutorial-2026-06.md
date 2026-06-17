---
title: Hermes Agent 保姆級教學（PAPAYA 電腦教室，YouTube 2026-06）
type: source
sources: ["yt-hermes-agent-保姆級教學來了最安全的-ai-私人助理造成-opanclaw-大規模棄養潮用過就回不去了.md"]
created: 2026-06-18
updated: 2026-06-18
tags: [hermes-agent, papaya, youtube, tutorial, ai-agent, telegram, hostinger, openrouter, mcp, subagent, 繁體中文, nous-research]
confidence: 強（操作步驟）／中（產品定位主張）／弱（「棄養潮」行銷語）
---

# Hermes Agent 保姆級教學（PAPAYA 電腦教室）

> 來源：https://www.youtube.com/watch?v=-EivK7vpOXY
> 頻道：[[PAPAYA-電腦教室]]（YouTube，繁中入門層教學）｜片長約 27 分鐘
> 主條目見實體頁 [[Hermes-Agent]]。本頁記錄這支「保姆級教學」的操作流程、新增細節與來源偏誤標註。

## 定位

[[PAPAYA-電腦教室]] 首次把 [[Hermes-Agent]]（[[Nous Research]] 開源 AI 助理）做成零技術假設的完整步驟教學。延續該頻道「每個按鍵都拍下來」風格，從安裝到生圖、Notion 串接、備份排程全程示範。對本知識庫意義：**這是 Hermes Agent 既有實體頁從「99 案例轉述」升級到「一手操作可重現」的來源**——多數既有主張在此被具體操作流程佐證。

## 影片開宗：Hermes 的四個優勢（影片框架）

1. **長時間背景待命** — 可常駐獨立運作，手機 App 隨時交辦
2. **自我學習** — 每完成任務回顧改進，下次更熟練
3. **分層記憶** — 記住交辦事項 + 學習工作模式/偏好
4. **安全與穩定** — 內建危險指令審查，遇刪檔等重要指令會停下來要授權

> 第 4 點「安全」是影片主打、也是標題「最安全的 AI 私人助理」的根據。

## 新增/具體化的細節（既有實體頁未記錄者）

- **記憶三檔分工**（既有頁只記 MEMORY.md / USER.md，此處補齊第三個）：
  - `User.md` — 使用者個人檔案卡（你是誰、偏好）
  - `Memory.md` — Hermes 的工作筆記本（累積經驗心得）
  - **`Soul.md`** — 助理人格設定（名字、語氣、扮演角色）→ 教學中命名為「豆豆」
- **模型供應商三選**：Hermes 官方訂閱 / 既有 OpenAI 訂閱授權 / **OpenRouter**（按量、可切模型，示範用 Deepseek）。提到 `gpt-5.5`（比既有實體頁的 GPT-5.4 更新，仍**待獨立驗證**）。
- **本機 vs 雲端部署取捨**：本機（幾乎免費、躲在家用網路後安全）vs 雲端 VPS（24h 穩定、不碰本機私人文件）。雲端示範平台為 **Hostinger**。
- **完整功能棧示範**：Telegram 綁定（BotFather `/newbot` + user ID 白名單 + Home Channel）、Subagent 並行子任務、Tavily 網搜、Google OAuth 串接（Gmail/Calendar/Drive/Docs）、排程（晨報、每日日文單字）、地圖、`/voice` 語音輸入、Skill（SOP）、生圖（FAL.ai + GPT Image 2）、生影片（Seedance 2.0）、Notion（MCP/API）、**Goal**（目標自動拆解推進）、每日凌晨 3 點自動備份打包到 Google Drive、Hostinger 防火牆。

## ⚠️ 來源偏誤標註

延續本知識庫對 [[src-x-taiyo-kimura-html2pptx-2026-06|賣方敘事]] 類來源的紀律：

- **標題行銷語**：「造成 OpenClaw 大規模棄養潮」「用過就回不去了」是情緒化行銷措辭，非可驗證事實。OpenClaw→Hermes 遷移敘事在 [[Hermes-Agent]] 既有頁已記錄，但「大規模棄養潮」的規模主張**無數據佐證**，信心弱。
- **疑似聯盟行銷**：影片大篇幅推 **Hostinger**（雲端部署）、並引導註冊 OpenRouter / Tavily / FAL.ai 等付費服務。教學頻道常含 affiliate link，選 Hostinger 為「最熱門」未必中立。判讀部署選項時，[[Hermes-Agent]] 既有頁列的 Raspberry Pi / Termux / 自有 VPS（Hetzner）等更省成本路徑同樣可行。
- **「最安全」是相對宣稱**：安全機制（危險指令審查、單獨非管理員帳號、防火牆）確實存在且合理，但「最安全」是比較級行銷語，未對比同類工具的安全設計。

## 信心評估

- **強**：操作流程可重現（安裝、Telegram 綁定、Google OAuth、各服務串接步驟）— 一手螢幕示範。
- **中**：產品能力定位（自我學習、分層記憶、Subagent、Goal）— 與既有 99 案例互相佐證，但仍為示範情境（「小芳賣手作飾品」為虛構案例）。
- **弱**：「OpenClaw 棄養潮」規模主張、`gpt-5.5` 等版本號、「最安全」比較級宣稱。

## 相關頁面

- [[Hermes-Agent]] — 實體主條目（本頁佐證並補充 Soul.md 等細節）
- [[PAPAYA-電腦教室]] — 出品頻道（本片為其第二支 wiki 收錄作品，主題從本地 AI 擴及 AI agent）
- [[OpenClaw]] — 影片定位的「被取代」對象
- [[HermesOS]] — Hermes Agent 的商業 managed cloud 包裝層（與本片教的 self-host / VPS 路線對照）
- [[src-hermes-agent-99-cases]] — 社群 99 案例（轉述型），與本片「一手教學」互補
- [[MCP]] — 影片中 Notion 串接示範使用
