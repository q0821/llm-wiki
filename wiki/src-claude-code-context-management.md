---
title: Claude Code 工作階段管理與百萬上下文攻略
type: source
sources: [Claude Code 工作階段管理與百萬上下文攻略.md]
created: 2026-04-16
updated: 2026-04-16
tags: [Claude Code, AI工具, 上下文管理, 工作效率]
confidence: 強
---

# Claude Code 工作階段管理與百萬上下文攻略

> 來源：Anthropic 工程師 Thariq 實戰教學，轉載自 X (Twitter)｜記錄日期：2026-04-16

## 摘要

Claude Code 的核心使用技巧在於**上下文視窗管理**，而非功能操作。擁有 100 萬 token 的上下文不代表越多越好——上下文衰損（Context Rot）才是影響輸出品質的關鍵變數。

## 核心概念

### 上下文衰損（Context Rot）
- 上下文越長，模型效能越下降
- 注意力被分散到更多 token，舊的不相關內容干擾當前任務
- 達到上限時必須「壓縮」後在新視窗繼續

### 每個回覆都是分支點
完成一個任務後，有五種選擇：

| 選項 | 說明 | 適用情境 |
|------|------|---------|
| Continue | 繼續在同一 session 發訊息 | 任務連貫、上下文仍乾淨 |
| /rewind（雙擊 Esc）| 跳回之前某則訊息重新 prompt | 方向走偏、想換路線 |
| /clear | 自己寫交接摘要後全新開始 | 任務轉換、上下文雜亂 |
| /compact | 讓 Claude 自動壓縮歷史 | 任務中途、不想中斷 |
| Subagents | 派子代理處理，只回傳結果 | 中間產出龐大但結果才重要 |

## 關鍵技巧

### 用回溯取代修正
最重要的習慣：**遇到方向錯誤，回溯而非修正**

- 不好的做法：「那個方法沒用，試試 X」（讓錯誤的工具呼叫留在上下文）
- 好的做法：回溯到錯誤發生前，重新 prompt「不要用方法 A，直接用 B」
- 進階：讓 Claude 在回溯點「summarize from here」，產生交接訊息

### 何時開新工作階段
> 新任務 → 新工作階段

- 相關任務（如剛寫的功能要寫文件）→ 可保留舊 session，省去重讀檔案的成本
- 不相關任務 → 開新 session

### /compact vs /clear 的差異
- `/compact`：Claude 自動決定摘要內容，有損但省力；可加指令引導「focus on X, drop Y」
- `/clear`：自己寫交接內容，掌控度高但需要心力；壓縮品質完全由你決定

### 壞壓縮的成因
- 自動壓縮在上下文衰損最嚴重時觸發（模型最不聰明的時刻）
- 模型無法預測下一步時，會丟掉你之後需要的資訊
- 解法：**主動提早觸發 /compact**，並帶指令說明方向

### 子代理的判斷標準
> 「這個工具輸出，之後還需要嗎？還是只需要結論？」

若只需結論 → 用子代理，讓中間產出不污染主上下文

實用指令：
- 「生成子代理驗證這個工作的結果」
- 「生成子代理研究 X repo 的 Auth Flow，然後你在這裡實作」
- 「生成子代理根據 git 變更寫文件」

## 關鍵引用

> 把上下文管理好，是用好 Claude Code 最關鍵卻最容易被忽略的能力。

> 隨著時間推移，我們期待 Claude 本身會幫助你處理這件事，但目前為止，這是你少數能主動引導 Claude 輸出結果的方式之一。

## 相關頁面

- [[Agent-Skills]] — Claude Code 作為 Agent 的能力框架
- [[RAG]] — 上下文管理與 RAG 在資訊注入上的比較
- [[src-claude-code-notebooklm]] — 同主題（節省 Claude token）的另一種策略：把研究任務外包給 [[NotebookLM]]
- [[Managed-Agents]] — 更徹底的 context 策略：把 session 整個外部化為 event log，不讓「壓縮」成為不可逆決策
- [[Meta-Harness]] — 此文的 compact/rewind 屬於 harness 內部策略，Managed Agents 則是把 harness 抽象化的上位設計
