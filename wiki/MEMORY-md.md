---
title: MEMORY.md（AI Agent 持久記憶層）
type: concept
sources: ["Hermes Agent 成功案例 — 你的 AI 代理可以做什麼.md", "科技翰林院怎麼用 Claude Code 終端機？8 個實戰設定全公開.md", "未命名.md"]
created: 2026-05-14
updated: 2026-05-14
tags: [memory, agent, persistent-state, claude-code, hermes, self-improving]
confidence: 強
---

# MEMORY.md（AI Agent 持久記憶層）

AI agent 跨 session 保留上下文與偏好的**主要載體**。與 [[CLAUDE-md|CLAUDE.md]] 形成互補對：

| 檔案 | 誰寫 | 內容 |
|---|---|---|
| **[[CLAUDE-md\|CLAUDE.md]]** | **人類** | 行為規則、硬規則、流程護欄（從失敗中累積） |
| **MEMORY.md** | **AI** | Agent 互動中累積的偏好、上下文、學到的工作風格 |

不同 agent 框架對這個層有不同稱呼（USER.md、Memory directory、AGENTS.md memory file），但核心功能一致——**跨 session 注入歷史學習**。

## 不同框架的實作

### Claude Code（Anthropic）

依 [[src-techhanlin-claude-code-8-settings|科技翰林院 8 個設定]]整理：

- **位置**：`~/.claude/projects/<project>/memory/`
- **類型**：四類（user / feedback / project / reference），與 Anthropic 內建 memory schema 一致
- **觸發方式**：使用者糾正 AI 時自動存、或主動說「記住：...」
- **索引檔**：`MEMORY.md`

[[Claude Code]] 的記憶機制：人類糾正 → 自動分類存檔 → 下次 session 啟動時注入相關記憶。

### Hermes Agent

依 [[src-hermes-agent-99-cases]] 多個 case 整理：

- **位置**：`MEMORY.md` / `USER.md`
- **特色**：**AI 主動寫入**（無需人類糾正觸發）
- **跨 case 用途**：
  - 寫作風格自動萃取：「分析創作者既往文章 → 提取風格特徵 → 存入持久記憶」
  - Code Review 偏好學習：第 1 次標準執行 → 第 5 次完全內化
  - 自學交易策略：「每次交易後檢視績效、撰寫策略筆記、調整下次參數」
- **跨代理共用**：「跨代理統一記憶：Hermes + [[Claude Code]] + Cursor」案例顯示 MEMORY.md 可成為多 agent 共享的記憶層

### Anthropic 工程視角（[[src-addy-osmani-harness-engineering]]）

[[Addy-Osmani]] 七元件中對應 **Memory + Search**：

> 「像 AGENTS.md 這類 memory file，可以在每次 session 開始時注入專案知識、團隊慣例、過去踩過的坑。這就像把團隊經驗寫成備忘錄，讓 agent 不用每次都從零開始理解環境。」

對 Addy 而言，MEMORY.md / AGENTS.md memory file 是 **Memory + Search** 元件的「持久知識」分支，與 Web search 的「即時知識」分支互補。

## 在 [[Self-Improving-Agent]] 範式中的角色

MEMORY.md 是「**AI 自動學習路徑**」的主要載體，與 [[Ratchet-Pattern]]（人類引導路徑）對照：

| 路徑 | 動力 | 載體 | 觸發 |
|---|---|---|---|
| **AI 自動** | Agent 自己累積 | **MEMORY.md** / USER.md / Skill Factory 寫的 SKILL.md | 互動中自動寫入 |
| **人類引導** | 人類觀察錯誤 | CLAUDE.md / hook / reviewer subagent | 失敗事件後手動編碼 |

兩者**不互斥**——成熟系統會混用：
- AI 自動處理「使用者個人偏好」「日常工作風格」
- 人類引導 Ratchet 處理「曾經出事的失敗模式」「不能繞過的硬規則」

## 與 Handoff 機制的差異（Claude Code 視角）

[[src-techhanlin-claude-code-8-settings]] 區分兩種跨 session 機制：

| 機制 | 主要解決 | 觸發點 |
|---|---|---|
| **Memory（MEMORY.md）** | 偏好與經驗的長期累積 | 互動中自動 / 使用者糾正時 |
| **Handoff（`~/.claude/tasks/handoff.md`）** | 解決 auto-compaction 把 CLAUDE.md 規則壓掉的問題 | session 結束前主動寫、下次 session 開頭讀 |

Handoff 是「**session 間的顯性接力**」，作者實測 auto-compaction 後規則遵守率接近 0%，需要 handoff 補救。Memory 則是「**長期偏好累積**」，兩者層次不同但搭配使用。

## 安全與隱私考量

MEMORY.md 累積使用者互動記錄——三個值得注意的議題：

1. **敏感資訊洩漏**：如果 AI 自動存入過 credentials、私人對話，下次 session 啟動會自動載入，可能在不該出現的情境暴露
2. **跨專案污染**：若 MEMORY.md 不分專案累積，個人偏好可能洩漏到客戶專案的工作環境
3. **記憶污染**：惡意 prompt 可能誘導 AI 寫入錯誤偏好，影響後續判斷（對應 [[MCP]] 工具描述安全議題的延伸版本）

[[Hermes-Agent]] 的「OSV 惡意軟體掃描配置」case 暗示了這層風險——MCP 套件安裝前掃描，是把同樣概念延伸到記憶層的對策。

## 信心評估

- **強**：核心定義（跨 session 持久記憶層）與在三個獨立框架（Claude Code、Hermes、Anthropic Addy 視角）中的實作一致性
- **強**：與 [[CLAUDE-md]] 的互補對照（AI 寫 vs 人類寫）
- **中**：「跨代理統一記憶」案例的實際機制 — 來自 [[src-hermes-agent-99-cases]] 二次整理
- **弱**：安全與隱私風險 — 推測性整理，未見具體 incident 報導

## 相關概念

- [[CLAUDE-md]] — 平行的「人類寫」規則層
- [[Self-Improving-Agent]] — MEMORY.md 是該範式的主要載體
- [[Ratchet-Pattern]] — 對立路徑（人類引導 vs AI 自動）
- [[Harness-Engineering]] — Memory + Search 七元件之一
- [[Agent-Skills]] — Skill Factory 自動生成的 SKILL.md 是 MEMORY.md 的「能力版」
- [[Hermes-Agent]] — MEMORY.md 機制的代表實作
- [[Claude Code]] — Memory + Handoff 雙機制
- [[src-techhanlin-claude-code-8-settings]] / [[src-hermes-agent-99-cases]] / [[src-addy-osmani-harness-engineering]] — 主要來源
