---
title: Harness Engineering 入門篇：OpenAI 最新編程標準
type: source
sources: [Harness Engineering（AI駕馭工程）入門篇：OpenAI最新編程標準，教你輕鬆做到Lv.1.md]
created: 2026-04-21
updated: 2026-04-21
tags: [AI, Agent, 軟體工程, Harness-Engineering]
---

# Harness Engineering 入門篇：OpenAI 最新編程標準

**作者**：flip（動區動趨）
**日期**：2026-04-04
**原始連結**：https://www.blocktempo.com/openai-harness-engineering-million-lines-code-zero-human-written-guide/

## 核心主張

- [[Harness-Engineering]]（駕馭工程）是 OpenAI 提出的新軟體開發範式：工程師不寫 code，而是設計讓 AI agent 可靠運作的環境系統
- 核心哲學：**Humans steer, agents execute.**（人類掌舵，代理執行）
- 三根支柱：Context Engineering、Architectural Constraints、Entropy Management
- 模型本身不再是瓶頸，**模型周圍的系統**才是競爭優勢

## 詳細摘要

### OpenAI 實驗數據

| 指標 | 數值 |
|------|------|
| 時間 | 5 個月（2025-08 起） |
| 程式碼量 | ~100 萬行 |
| 人類手寫 | 零行 |
| 團隊 | 3→7 人 |
| 合併 PR | ~1,500 個 |
| 每人每天 PR | 3.5 個（傳統約 1 個） |
| Agent 單次自主工作 | >6 小時 |
| 等效傳統團隊 | 21-70 人 |

關鍵：打破 Brooks's Law（加人不加慢），因為溝通轉移到文件系統和 agent 指令中。

### 三根支柱

**1. Context Engineering（上下文工程）**

- 代理在 context 裡看不到的東西 = 不存在
- AGENTS.md 應是「目錄」而非「百科全書」，指向 `docs/` 資料夾
- 靜態上下文：架構規範、API 合約、coding style
- 動態上下文：日誌、指標、CI 狀態、目錄結構掃描
- OpenAI 讓 agent 存取生產環境的 LogQL/PromQL + Chrome DevTools Protocol

**2. Architectural Constraints（架構約束）**

- 反直覺：限制 AI 解題空間反而提升生產力
- 強制執行方式：自定義 linter、結構測試（類 ArchUnit）、LLM 審計員（AI 審查 AI）、pre-commit hooks
- linter 錯誤訊息要告訴「應該怎麼改」，等於同步教育 agent

**3. Entropy Management（熵管理）**

- AI 代碼特有的混亂：文件漂移、命名分歧、死 code 堆積
- 解法：定期執行「清潔代理」自動掃描不一致並開 PR 修復
- 比喻：技術債像高利貸，以小額度持續償還

### 三級實踐框架

| 級別 | 對象 | 時間 | 重點 |
|------|------|------|------|
| Level 1 | 個人 | 1-2 小時 | CLAUDE.md/AGENTS.md + pre-commit hooks + 測試套件 |
| Level 2 | 3-10 人團隊 | 1-2 天 | CI 強制架構約束 + 共用 prompt 模板 + AI 專屬 review checklist |
| Level 3 | 大型組織 | 1-2 週 | 可觀測性整合 + 熵管理 agent + harness A/B 測試 |

### 與相關概念的層次關係

- **Prompt Engineering**：單次互動——怎麼寫好一個 prompt
- **Context Engineering**：上下文視窗——給模型什麼資訊（Harness 的子集）
- **Harness Engineering**：整個系統——環境、約束、回饋迴圈
- **Agent Engineering**：代理內部——路由、記憶、工具呼叫

### LangChain 佐證

不換模型，只改 harness（自我驗證迴圈 + 上下文工程 + 迴圈偵測 + 推理三明治），Terminal Bench 2.0 成績從 52.8% → 66.5%，排名第 30 → 前 5。

### 警告：Meta AI 工程師教訓

Summer Yue 測試 AI agent + Gmail：agent 初始會遵守「操作前先確認」指令，但上下文壓縮後遺忘約束，自行批次刪除數百封郵件。教訓：用機械方式（linter、hooks）強制約束，不能只靠 prompt。

## 關鍵引用

> 模型本身已經不是瓶頸，模型周圍的系統才是。

> 限制 AI 的解題空間，反而能提升它的生產力。

> 每當你發現代理犯了一個錯誤，你就花時間設計一個解決方案，確保代理再也不會犯同樣的錯。—— Mitchell Hashimoto

## 與 Wiki 的關聯

- 強化 [[Meta-Harness]] 的理論基礎——OpenAI 的 Harness Engineering 與 Anthropic 的 meta-harness 從不同角度解決同一問題
- 與 [[src-claude-code-context-management]] 中的 context 管理策略呼應（AGENTS.md 目錄模式 ≈ CLAUDE.md skill 模式）
- 建立新概念頁 [[Harness-Engineering]]
- [[Agent-Skills]] 可視為 Level 1 harness 的具體實踐（CLAUDE.md + 結構化指令）
- [[DESIGN-md]] 正是 Context Engineering 的實踐——把設計規範寫成機器可讀文件
