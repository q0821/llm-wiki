---
title: Context Engineering
type: concept
sources: ["zeuikli-claude-code-best-practices.md", "Harness Engineering（AI駕馭工程）入門篇：OpenAI最新編程標準，教你輕鬆做到Lv.1.md"]
created: 2026-05-20
updated: 2026-05-20
tags: [context, prompt-engineering, harness, anthropic, moat]
confidence: 強
---

# Context Engineering

> **「在執行時組裝正確資訊並正確排序」**——是 AI agent 真正的工程護城河，遠比單次 prompt 撰寫技巧更重要。

由 [[src-zeuikli-claude-code-best-practices|zeuikli 報告]]整理為整篇核心論點：「Context Engineering 是 Claude Code 真正的工程護城河」。

## 定義

Context Engineering 不是「**寫好一個 prompt**」，而是「**設計一套機制，讓 agent 在每次 inference 時都拿到正確的 context**」。

| 層面 | Prompt Engineering | Context Engineering |
|---|---|---|
| **單位** | 一次對話 / 一個 prompt | 一個系統 / 整個 agent loop |
| **時序** | 寫的當下決定內容 | 執行時動態組裝 |
| **變動性** | 靜態 | 隨任務動態改變 |
| **可重用** | 個人收藏 | 跨 session / 跨任務工程化 |
| **核心問題** | 「怎麼寫好這個 prompt」 | 「**怎麼確保每次 inference 時拿到剛好夠用、剛好相關、剛好排序的 context**」 |

## 在 Harness 框架中的位置

對應 [[src-harness-engineering-openai|OpenAI Harness Engineering]] 的**第一根支柱**：

> 「**Context Engineering**：代理在 context 裡看不到的東西 = 不存在。」

也對應 [[src-claude-code-in-large-codebases|Anthropic 官方 Claude Code blog]]：

> 「Claude Code uses agentic search... However, this approach **requires sufficient starting context** to navigate effectively.」

不同工程文化的論述同源——Context Engineering 是 [[Harness-Engineering]] 的核心子集。

## 元件分解

依 zeuikli 整理 + 既有 wiki 概念：

| 元件 | 載體 | 對應 wiki |
|---|---|---|
| **靜態 context**：規範 / 慣例 / 規則 | [[CLAUDE-md\|CLAUDE.md]] / [[AGENTS-md\|AGENTS.md]] | 已紀錄 |
| **動態 context**：當前任務 / 變化資料 | [[src-akiraxclaw-app-flow-trick\|App Flow JSON]] / 即時讀檔 | 已紀錄 |
| **持久記憶**：跨 session 學習 | [[MEMORY-md\|MEMORY.md]] | 已紀錄 |
| **工具描述**：MCP / Skills frontmatter | [[MCP]] / [[Agent-Skills]] | 已紀錄 |
| **檢索層**：codebase 導覽 / 結構化 search | grep / [[LSP-Integrations]] / MCP for structured search | 已紀錄 |
| **快取策略**：分層 cache breakpoints | Prompt caching layered structure（見下方）| 本頁新增 |

## 分層快取結構（Thariq Shihipar 視角）

[[Thariq-Shihipar]]：「**Cache rules everything. We treat it like uptime.**」

```
層 1（最穩定，cache 效益最高）：System Prompt + Tools 定義
層 2（中度穩定）：專案檔案（CLAUDE.md、codebase 概述）
層 3（每 session 不同）：當次任務 context
層 4（每次請求不同）：對話訊息（Messages）
```

設 `cache_control: {"type": "ephemeral"}` 在**最穩定層**作 breakpoint。

成本對比（Sonnet 4.6）：一般輸入 $3/MTok → cache 命中 **$0.30/MTok（節省 90%）**。

**Cache Hit Rate 監控指標化**：應與服務可用率同等重要，命中率下降立即排查根因。

## 與其他 Engineering 範式的層次關係

依 [[src-harness-engineering-openai|OpenAI Ryan Lopopolo]] 的分層：

```
Prompt Engineering    → 單次互動：怎麼寫 prompt
Context Engineering   → 上下文視窗：給什麼資訊（Harness 的子集）← 本頁
Harness Engineering   → 整個系統：環境 + 約束 + 回饋迴圈
Agent Engineering     → 代理內部：路由、記憶、工具呼叫
```

Context Engineering 是 [[Harness-Engineering]] **三支柱第一支柱**的細部展開。

## 五個禁止操作（會破 Cache）

依 zeuikli 章 3.3（詳細列表見 [[src-zeuikli-claude-code-best-practices]]）：

1. System prompt 動態插入時間戳（破層 1）
2. Session 中增刪工具定義（破層 1）
3. Mid-session 切換模型（破所有層）
4. CLAUDE.md 改動但沒重啟 session（破層 2）
5. 在最穩定層**之後**才放 breakpoint（順序錯）

## 與 [[Prompt-Pack-Pattern]] 的關係

[[Prompt-Pack-Pattern]] 是 Context Engineering 在**對話介面層**的具體實踐——但只解決「**怎麼串多段 prompt**」，沒解決「**整個 session 的 context 怎麼分層**」。Context Engineering 是上位範式。

## 在各來源中的角色

- [[src-zeuikli-claude-code-best-practices]]：整篇核心論點「真正的工程護城河」
- [[src-harness-engineering-openai]]：定位為 Harness 第一支柱
- [[src-claude-code-in-large-codebases]]：Anthropic 官方確認 agentic search 需要 sufficient starting context
- [[src-addy-osmani-harness-engineering]]：Addy Osmani 七元件中的「Memory + Search」「System prompt 系列」屬於 Context Engineering 範疇
- [[src-claude-code-context-management]]：[[Thariq-Shihipar]] 第一手實戰

## 信心評估

- **強**：作為「Harness 第一支柱」的論述—— OpenAI / Google / Anthropic / 個人工程師多個獨立來源同源
- **強**：分層快取結構與 cache 經濟學—— Thariq 引言 + Sonnet 4.6 具體數字
- **強**：作為 Claude Code 護城河—— zeuikli 整篇核心 + Anthropic 官方確認
- **中**：「五個禁止操作」具體清單—— zeuikli 整理，需與 Anthropic 官方 cache 文件交叉驗證

## 相關概念

- [[Harness-Engineering]] — 上位範式
- [[Prompt-Pack-Pattern]] — 對話介面層的具體實踐
- [[Context-Rot]] — Context Engineering 失敗時的具體症狀
- [[CLAUDE-md]] / [[AGENTS-md]] — 靜態 context 載體
- [[MEMORY-md]] — 持久記憶層
- [[MCP]] / [[Agent-Skills]] / [[LSP-Integrations]] — 工具與檢索層
- [[PGE-Principle]] — Generator 與 Evaluator 各自的 context 需要獨立工程化

## 相關實體

- [[Thariq-Shihipar]] — Cache as uptime 論述
- [[Boris-Cherny]] — 完成驗證心法強調事前定義成功條件（事前 context）
- [[Addy-Osmani]] — Harness 七元件分解
