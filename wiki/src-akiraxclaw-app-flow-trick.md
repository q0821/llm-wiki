---
title: 讓 Claude 把你的 App 流程畫成一頁 HTML（akiraxclaw / Dave Jeffery）
type: source
sources: ["akiraxclaw-app-flow-trick-content.md", "讓 Claude 把你的 App 流程畫成一頁 HTML：開發者省下一半溝通成本的小技巧.md"]
created: 2026-05-14
updated: 2026-05-14
tags: [claude-code, ai-coding, documentation, app-flow, context-engineering, dual-output]
confidence: 中
---

# 讓 Claude 把你的 App 流程畫成一頁 HTML

**原推文者**：**Dave Jeffery**（X @DaveJ）
**原推連結**：https://x.com/DaveJ/status/2053867258653339746
**akiraxclaw 整理發表**：https://akiraxclaw.com/blog/claude-app-flow-documentation-trick-2026
**擷取方式**：使用者手動複製貼上（會員牆——`fetch-url.sh` 因 robots.txt 被拒，`WebFetch` 因會員牆只拿到殼）

> ⚠️ **二次來源**：本頁論點源自 akiraxclaw 整理 Dave Jeffery 推文。Dave 原推連結未獨立 fetch（推文 ID `2053867258653339746` 未驗證）。

## 核心主張

- 讓 Claude **分析 codebase 後生成「同一份資訊的兩種呈現」**：
  - **HTML**：視覺化流程圖，給人看
  - **JSON**：結構化流程描述，給 AI 看
- 解決痛點：「每次開新對話都要重新解釋系統」的摩擦
- JSON 是「**系統的記憶外掛**」——比讓 AI 每次重讀 codebase 快
- 適用情境：多人協作、長期 codebase 維護、頻繁 AI coding、bug 追蹤
- 不需要對每個 feature 都做——只對**系統核心流程**（用戶認證、核心業務邏輯、狀態管理）維護

## 詳細摘要

### 一、雙輸出設計

| 輸出 | 觀眾 | 用途 |
|---|---|---|
| **單一頁面 HTML** | 人類 | 視覺化流程圖、跨人溝通的系統地圖 |
| **JSON 資料檔** | AI | 結構化系統描述，直接帶進 context |

兩者是「同一份資訊的兩種呈現方式」——同步生成，避免人/AI 文件版本漂移。

### 二、Dave Jeffery 原推引言

> 「JSON 檔在處理新功能或 bug 修復時，能很有效地幫助 AI 理解流程。」

對應的工程痛點：

> 「你開一個新的 Claude Code 對話，模型對你的系統一無所知，你要花大量時間解釋『這個 endpoint 是幹嘛的』、『這個 state 是從哪裡來的』。」

### 三、Prompt 範本

```
請分析這個 codebase 的主要使用者流程，並：
1. 識別所有核心流程（用戶登入、購買流程、核心功能等）
2. 用文字描述每個流程的步驟和狀態轉換
3. 輸出成一個單一頁面 HTML，用視覺化方式呈現這些流程
4. 同時輸出一份 JSON 資料檔，用結構化格式描述同樣的流程

JSON 格式參考：
{
  "flows": [
    {
      "name": "用戶登入",
      "steps": [...],
      "states": [...],
      "transitions": [...]
    }
  ]
}
```

之後每次開新對話：把 JSON 內容貼進 context 開頭，或存成系統說明文件讓 Claude 自動讀取。

### 四、適用場景四例

| 場景 | HTML 的價值 | JSON 的價值 |
|---|---|---|
| **多人協作專案** | 新成員的系統地圖（比 wiki 更易理解） | — |
| **長期維護 codebase** | 自己三個月後也用得到 | 系統「記憶外掛」 |
| **頻繁 AI coding（Claude Code / Cursor）** | — | 不必每次靠 AI 從零讀 code |
| **bug 追蹤** | — | AI 能對照流程圖定位「第 3 步應該到 B 卻到 C」，不用看 stack trace 猜 |

### 五、養成原則

> 「這個技巧本質上是在幫 AI 建立對你系統的長期記憶，用**你能控制的格式**。」

不是每個 feature 都需要——只對**系統核心流程**維護：
- 用戶認證
- 核心業務邏輯
- 狀態管理

> 「做一次，往後省很多次『從頭解釋』的時間。」

## 關鍵引用

> 「JSON 檔在處理新功能或 bug 修復時，能很有效地幫助 AI 理解流程。」 — Dave Jeffery

> 「AI 拿到的是結構化的系統地圖，而不是從你零散的描述裡拼湊理解。」

> 「JSON 文件等於是系統的『記憶外掛』。」

## 信心評估

- **強**：核心技巧（雙輸出設計、prompt 範本）— 邏輯清晰、可直接重現
- **中**：技巧效益（「省下一半溝通成本」「定位 bug 更準」）— 推測性描述，未見實際 A/B 對照
- **中**：Dave Jeffery 原推完整脈絡 — 透過 akiraxclaw 二次整理；**原推於 2026-05-14 嘗試 WebFetch 擷取，X.com 回應 HTTP 402 Payment Required（X 對 unauthenticated 抓取要求 paid API tier），擷取放棄**
- **弱**：「akiraxclaw」整理者背景 — URL 推測為個人部落格，作者身份未知

## 與 Wiki 的關聯

### 同類設計檔家族

這個技巧屬於「**給 AI 看的設計/規格文件**」家族——本知識庫已有的成員：

| 規範檔 | 內容 | 為誰寫 |
|---|---|---|
| [[CLAUDE-md|CLAUDE.md]] | Agent 工作規則、硬規則、流程護欄 | Agent 自己讀 |
| [[DESIGN-md|DESIGN.md]] | 視覺/品牌設計系統 | AI coding agent 生 UI 時參考 |
| `AGENTS.md`（OpenAI Codex）| Agent 任務規則 | Codex / 其他 agentic CLI |
| `.cursorrules` | 編輯器級規範 | Cursor |
| **App Flow JSON**（本來源） | 系統核心流程結構化描述 | AI coding agent 處理新 feature / bug 時讀 |

差異點：CLAUDE.md / DESIGN.md 偏「**行為規範**」（怎麼做事），App Flow JSON 偏「**系統地圖**」（系統長什麼樣）。兩者互補。

### 與 [[Harness-Engineering]] 的關係

對應 [[Addy-Osmani]] 七元件中的 **Memory + Search**：

> 「像 AGENTS.md 這類 memory file，可以在每次 session 開始時注入專案知識、團隊慣例、過去踩過的坑。」

App Flow JSON 是這層的「**系統知識**」分支，與 CLAUDE.md 的「**規則知識**」分支互補。

### 與 [[Ratchet-Pattern]] 的對照

- [[Ratchet-Pattern]]：每次錯誤累積規則（**反應式**累積）
- App Flow Doc：**一次寫好系統地圖**（**前置式**準備）

兩者方向相反但都是給 agent 注入長期知識的策略——成熟系統應該兩者並用：Ratchet 處理「該避免的錯」，App Flow Doc 處理「系統長怎樣」。

### 與 [[LLM-Wiki]] 的對照

`[[LLM-Wiki]]`（本知識庫範式）也是「結構化筆記讓 LLM 持續累積知識」的概念——但**規模與內容不同**：

| 維度 | LLM Wiki | App Flow Doc |
|---|---|---|
| 範圍 | 跨領域知識整合 | 單一專案系統流程 |
| 規模 | 數百頁 | 通常一份 JSON / HTML |
| 更新節奏 | 每次 ingest 累積 | 系統結構變更時重生 |
| 主要消費者 | 人 + AI | 主要是 AI（HTML 給人） |

### 形成的對話組

- 與 [[src-design-md-revolution]]：兩者都是「Markdown / JSON 作為 AI 可讀規範檔」家族，DESIGN.md 偏視覺、App Flow Doc 偏邏輯
- 與 [[src-addy-osmani-harness-engineering]]：本來源是七元件 Memory + Search 的具體實作範例
- 與 [[src-claude-code-context-management]]：App Flow JSON 是 Claude Code 「context injection」的具體載體

### 未來可延伸

- ~~補抓 Dave Jeffery 原推（若 X.com 可擷取）作獨立 source~~ — 2026-05-14 WebFetch 嘗試失敗（X.com HTTP 402），如未來需要可改：登入態瀏覽器手動複製貼上、或透過 X paid API tier
- 觀察是否會浮現「**APP-FLOW.md**」或「**FLOW.json**」這類事實標準命名
- 嘗試實作：對本知識庫專案（`/Users/hd/WORK/study/llm-wiki/`）用該 prompt 範本生成 flow doc，作為實測案例
