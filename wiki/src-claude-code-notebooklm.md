---
title: 只要 5 分鐘！Claude Code 無縫整合 NotebookLM 實戰
type: source
sources: [只要 5 分鐘！Claude Code 無縫整合 NotebookLM 實戰.md]
created: 2026-04-20
updated: 2026-04-20
published: 2026-04-17
tags: [Claude Code, NotebookLM, RAG, AI工具, Skills, 工作流]
confidence: 強
---

# 只要 5 分鐘！Claude Code 無縫整合 NotebookLM 實戰

> 來源：[[HC-AI-說人話]] YouTube 教學影片｜發佈日期：2026-04-17
> 影片連結：https://www.youtube.com/watch?v=22bjps4LMmU

## 核心主張

- Claude Code 處理影片能力不足、且 token 配額（rate limit）很快用完
- 把研究/分析類任務外包給 [[NotebookLM]]，由 Gemini 模型負責，不消耗 Claude token
- 5 分鐘設定即可建立完整工作流：YT Search → NotebookLM 深度分析 → 視覺化圖表

## 三大價值面向

### (a) 工具整合教學

完整安裝 workflow：

1. 安裝 [[notebooklm-py]] CLI（讓 Claude Code 自動裝，或貼 GitHub 連結請它安裝）
2. 安裝 NotebookLM Skill：`agent setup notebooklm`
3. `notebooklm login` 完成 Google 認證（瀏覽器視窗會跳出）
4. 自製 yt-search Skill（基於 yt-dlp 工具）
5. 重啟 Claude Code，輸入 `/notebooklm` 即可使用

### (b) Token 經濟學

| 任務 | 原本 Claude 處理 | 整合後 |
|------|------|------|
| YouTube 影片爬取 | 不支援（要靠 web scraping 祈禱）| yt-dlp（本地、免 token）|
| 深度分析 | Claude 處理 → 大量 token | NotebookLM (Gemini) → 0 Claude token |
| 心智圖、圖表、podcast | 不擅長 | NotebookLM 內建生成 |
| 整體 token 消耗 | 高 | 接近零（只需協調指令）|

> Claude Code 的 rate limit 很快——把重活外包給 NotebookLM，相輔相成

### (c) Skill 自我優化的 meta-pattern

- 用 Anthropic 內建的 **skill-creator** skill（Opus 4.6 自動觸發）建立新 skill
- 給予清楚的目的與成功標準（input、output、邊界條件）
- skill-creator 會自動：建初版 → 測試 → 修正腳本 → 優化 SKILL.md
- 「目的越清楚，skill 建得越好」——meta 層面的自舉現象

## 完整流程實戰

### 1. NotebookLM 整合

- 林探（影片中稱「林先生」）的開源工具 [[notebooklm-py]] 提供 CLI 介面
- 透過 NotebookLM Skill 讓 Claude Code 知道如何呼叫 CLI
- 一個 Claude Code 指令就能完成：建 source、提問、生成圖表、取回結果

### 2. yt-search Skill 設計

Skill 規格：

- 預設返回 **20 個影片**（可調整）
- 取得欄位：標題、頻道名稱、訂閱數、觀看次數、時長、上傳日期、影片連結
- 預設只搜 **6 個月內**的影片
- 計算「觀看數 / 訂閱數」比率，找出爆款影片（小頻道大觀看數）
- 用 Python 腳本實作確定性計算（避免 LLM 算錯）

### 3. 整合 demo 結果

- 任務：搜尋「Claude Code Skills」相關熱門影片
- yt-search 抓到 20 個 → Claude 從中精選 5 個推送到 NotebookLM
- NotebookLM 深度分析後生成：摘要、心智圖、Info Graphic、CSV 表格、Study Guide、Quiz
- 全程不消耗 Claude Code 的研究 token，只用協調 token

### 4. 常見小坑

- 自製 skill 沒被 Claude 偵測到 → 確認檔案放在 `.claude/skills/` 下，不在的話請 Claude 修正
- skill 創建完要重啟 Claude Code 才能使用
- NotebookLM 內 source 重複時，請 Claude 自行去重

## 關鍵引用

> Claude Code 的 rate limit 很快嘛 那我們把這些 outsource 到這個 notebooklm 去 而且 notebooklm 又是非常厲害的一個 RAG 系統 所以呢 這個完全就是相輔相成的一個使用方式

> 我們不只幫 Claude code 建立了一個 RAG 的系統 他可以利用 RAG 系統 他還可以產生報告 資訊圖表 甚至是 podcast 還有影片摘要 語音摘要 那重點是 這些摘要 或是內容的產出 都是依據我們給他的這些 source 的來源 這個極大的解決 AI 的幻覺問題

> 我上一支影片呢 有結合 obsidian LLM wiki 分享如何用 hotcode notebooklm 結合一個資料整理的方式 LLM wiki 建構本地端的第二大腦

## 與本知識庫的特殊關聯

作者 [[HC-AI-說人話]] 在影片結尾提到，他**上一支影片**講 LLM wiki + Obsidian + Claude Code 結合本地第二大腦——正是當前 wiki 採用的方法論基礎。建議追蹤其他影片以建立完整的方法論脈絡。

## 與 Wiki 的關聯

- 補充 [[NotebookLM]] 的應用案例與整合方法
- 補充 [[notebooklm-py]] 的功能與安裝方式
- 補充 [[Agent-Skills]] 的「自製 skill」與「skill 自我優化」meta-pattern
- 與 [[src-claude-code-context-management]] 同主題：節省 Claude token / 上下文預算
- 與 [[src-asgard-skills]] 對照：skill 生態的不同應用案例（理論模型 vs 工作流整合）
- 與 [[RAG]] 對照：[[NotebookLM]] 是免費商用 RAG 的代表（vs [[OpenClaw]] 自建方案）
