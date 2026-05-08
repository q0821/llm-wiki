---
title: AI 品質共謀（AI Quality Collusion） — SPT Wiki
type: source
sources: ["AI 品質共謀（AI Quality Collusion）.md", "ai-品質共謀ai-quality-collusionsearch暗色模式亮色模式閱讀模式.md"]
created: 2026-05-09
updated: 2026-05-09
tags: [ai-anti-pattern, testing, software-quality, agent, vibe-coding]
confidence: 強
---

# AI 品質共謀（AI Quality Collusion） — SPT Wiki

**來源網站**：SPT Wiki（https://shingo0620.github.io/SPT/）
**頁面**：https://shingo0620.github.io/SPT/AI-品質共謀
**類型**：他人 Quartz wiki 上的概念頁
**原始概念出處**：被歸給「敏捷三叔」2026-04 的 `src-AI時代的測試管理` 文章
**抓取於**：2026-05-09

> 元觀察：SPT Wiki 是另一個 [[LLM-Wiki]] 實踐者（用 Quartz v4 + 中文知識庫架構，與本站同源 jackyzha0/quartz）。這意味著 LLM Wiki 範式在中文圈已經有可比較的實作。

## 核心概念（詳見 [[AI-Quality-Collusion]]）

當 AI 同時負責**生成程式碼**與**生成測試**，產生隱形共謀關係：

> AI 根據自己對規格的理解去寫程式碼，然後再根據**同樣的理解**去寫測試——結果測試只是在**驗證它自己的邏輯**，而不是在挑戰系統的真實需求。

結果是「集體幻覺」：CI 綠燈、覆蓋率達標、PR 通過——直到上線後被真實使用者炸掉。

## 為什麼是「共謀」而不是「錯誤」

- **同源理解** → 測試與實作共享同一套誤解
- **形式完整** → 覆蓋率、綠燈、code review 都通過
- **外觀勤勞** → 比「沒寫測試」還難被質疑
- **集體沉默** → 既然測試過，團隊不會主動質問

## 形成條件（三項同時成立）

1. 同一個 AI 做 code 與 test（context 相同）
2. 缺乏獨立的人類驗證層
3. CI 綠燈被當作品質終點

## 對策摘要

**結構性**：
- 隔離 code / test 生成的 context（不同 session / subagent / 甚至不同模型）
- 用 [[Specification-by-Example|SBE]] 凍結需求，code 與 test 各自只依規格
- 保留**人類定義的黃金測試**作為獨立通關條件

**流程性**：
- **探索性測試**作為最後一道牆（人類手動撞 AI 想不到的路徑）
- 生產環境觀察（「沒報 bug」≠「沒 bug」）

## 關鍵原文引用

> 「AI 根據自己對規格的理解去寫程式碼，然後再根據**同樣的理解**去寫測試——結果測試只是在**驗證它自己的邏輯**，而不是在挑戰系統的真實需求。」
> — SPT Wiki, 2026-04-21

## 與本知識庫的關聯

- [[AI-Quality-Collusion]] — 提取出來的概念頁（本次新建）
- [[Vibe-Coding]] / [[Agentic-AI-Workflow]] — AI 主導的開發範式，本反模式正是其風險之一
- [[Meta-Harness]] / [[Managed-Agents]] — subagent 隔離 context 是結構性對策的核心
- [[Agent-Skills]] — 隔離 code 與 test 生成的 context 可透過不同 skills 實現

## 元層級觀察：SPT Wiki vs 本知識庫

兩者皆採 Quartz v4 + 中文 wiki：

| 面向 | SPT Wiki | 本知識庫 |
|---|---|---|
| 主題 | 軟體生產技術（Software Production Techniques）反模式 / 工具評估 / 月綜整 | 多領域第二大腦 |
| 操作範式 | LLM Wiki + 月/週綜整節奏（src-* + 月綜整-* + 週綜整-*） | LLM Wiki + ingest/query/lint 三步驟 |
| 來源頁命名 | `src-{slug}` | `src-{slug}`（一致）|
| 反向連結展示 | 頁尾「反向連結」清單 | 由 Quartz 自動產生 |

> 啟示：SPT Wiki 的「**月綜整**」與「**週綜整**」是本知識庫尚未採用的時間維度組織方式，值得參考。

## 信心評估

- **強**：核心概念（共謀的定義、形成條件、對策）— 邏輯完整、與既有測試反模式的區別清晰
- **中**：原始出處（敏捷三叔 2026-04 文章）— 來源頁未實際讀到，靠 SPT Wiki 二手轉述
- **強**：與本知識庫的概念連結（subagent context 隔離、SBE 規格凍結）— 與既有頁面對應自然
