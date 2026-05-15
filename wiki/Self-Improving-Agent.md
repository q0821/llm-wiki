---
title: Self-Improving Agent
type: concept
sources: ["Hermes Agent 成功案例 — 你的 AI 代理可以做什麼.md", "未命名.md"]
created: 2026-05-14
updated: 2026-05-14
tags: [agent, self-improvement, memory, skill-generation, agentic-ai, ratchet]
confidence: 中
---

# Self-Improving Agent（自我改進代理）

AI agent 的一種設計範式：**agent 能在使用中自動累積 Skill 與記憶，越用越貼合使用者**。代表實作 [[Hermes-Agent]]，但同樣模式已在 [[Claude Code]] 的 Memory + [[MEMORY-md|MEMORY.md]]、[[Managed-Agents]] 的 session 機制中出現。

## 定義

不同於「靜態 agent」（今天能做的事與三個月後一樣），**自我改進代理**滿足三個條件：

1. **記憶持久化**：跨 session 保留上下文與偏好（典型載體：MEMORY.md / USER.md / Memory directory）
2. **Skill 自動生成**：從完成的工作流自動萃取有效方法，寫成可重用的 `SKILL.md`
3. **偏好學習**：第 N 次執行任務時，無需重新說明使用者風格

## 跨案例觀察的三角結構

來自 [[src-hermes-agent-99-cases]]：

| 元件 | 載體 | 作用 |
|---|---|---|
| **持久記憶** | MEMORY.md / USER.md | AI 自動更新，跨 session 保留 |
| **Skill 工廠（Skill Factory）** | 靜默監看工作流，自動寫 SKILL.md | 把每次有效行為固化為可重用 skill |
| **偏好學習** | 持久記憶 + 持續觀察 | 第 1 次標準執行 → 第 5 次完全內化 |

## 兩條改進路徑：AI 自動 vs 人類引導（Ratchet）

「自我改進」是個籠統概念——進一步拆解，**改進的動力來自哪裡** 是關鍵分歧：

| 路徑 | 動力來源 | 代表載體 | 對應範式 |
|---|---|---|---|
| **AI 自動學習** | Agent 自己從互動中累積 | MEMORY.md / USER.md / Skill Factory | [[Hermes-Agent]] |
| **人類引導 Ratchet** | 人類觀察錯誤後，把修正編碼進系統 | CLAUDE.md / hook / reviewer subagent | [[Ratchet-Pattern]]（[[Harness-Engineering]] 系列）|

兩者**不互斥**——成熟系統會混用：
- AI 自動處理「使用者個人偏好」「日常工作風格」
- 人類引導 Ratchet 處理「曾經出事的失敗模式」「不能讓 agent 繞過的硬規則」

[[Addy-Osmani]] 的克制原則同時適用兩條路徑：「**每一條規則都應該能追溯到某個曾經發生過的失敗**」，避免無限累積導致系統臃腫。

## 代表 case

- **「第 10 天：它比我更了解我的程式碼庫」**（[[src-hermes-agent-99-cases]]）：第 1 次標準 Code Review；第 5 次完全內化偏好（檔案優先順序、標記類型、輸出格式）
- **「自動學習我的語氣幫我寫文章」**：分析創作者既往文章 → 提取風格特徵 → 存入持久記憶 → 新請求自動套用
- **「Skill Factory：靜默監看工作流，自動生成可重用 Skill」**：跨 case 反覆出現的模式

## 不同觀點與實作

- **[[Hermes-Agent]]**（[[src-hermes-agent-99-cases]]）：將自我改進設計為核心賣點，第三方獨立評測稱為「最佳自我改進代理」（Clawdi 團隊）
- **[[Claude Code]]**（[[src-techhanlin-claude-code-8-settings]]）：Memory 機制收斂為 user / feedback / project / reference 四類，依靠使用者糾正觸發學習；Skill 仍以人類撰寫為主
- **[[Managed-Agents]]**（[[src-anthropic-managed-agents-engineering]]）：session / harness / sandbox 三層架構，記憶託管在雲端 session 中

## 與「人類監督」的張力

自我改進並非沒有風險：

| 立場 | 主張 | 代表 |
|---|---|---|
| **全自動派** | AI 自動更新 Wiki/Skill 才不會「腐爛」 | [[src-hermes-agent-99-cases#代表案例展開]] 的「自我改進 LLM Wiki 第二大腦」 |
| **人類監督派** | 來源不可變、矛盾並列、人類引導摘要 | 本知識庫的 [[LLM-Wiki]] 範式（[[Andrej-Karpathy]] + [[Obsidian]]） |

這個張力對應 [[AI-Quality-Collusion]]——AI 自動生成 code + test 的「共謀」風險，在 wiki 維護領域也適用：AI 自動爬取 + AI 自動更新 → 失去人類審視的對抗力。

## 相關概念

- [[Agent-Skills]] — Skill Factory 是 Agent Skills 範式的自動化版本
- [[CLAUDE-md]] — 人類寫的規則；MEMORY.md 是 AI 寫的學習結果，兩者並用
- [[LLM-Wiki]] — 本知識庫範式 vs 全自動 LLM Wiki 的路線分歧
- [[Agentic-AI-Workflow]] — 多代理協作與自我改進是 agentic 範式的兩根支柱
- [[AI-Quality-Collusion]] — 自我改進若失去人類審視可能形成的反模式
- [[Harness-Engineering]] — 約束 + 上下文 + 熵管理三支柱是自我改進的「健康邊界」
- [[Ratchet-Pattern]] — 自我改進的人類引導版本：每次錯誤編碼成永久規則

## 應用與案例

- [[src-hermes-agent-99-cases]] 中至少 15+ 個 case 直接展示自我改進機制（Code Review 偏好學習、語氣學習、Skill Factory、跨代理共享記憶等）
- [[Claude Code]] 的 [[CLAUDE-md|CLAUDE.md]] + memory + skill 三件套是該範式的另一種實作
