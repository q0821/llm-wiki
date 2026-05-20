---
title: OpenAI
type: entity
sources: [harness-engineering-openai.md, codex-hyperframes-prompt-pack.md]
created: 2026-05-20
updated: 2026-05-20
tags: [vendor, ai-lab, openai]
confidence: 強
---

# OpenAI

AI 研究實驗室與 GPT 系列模型母公司，由 Sam Altman 等人於 2015 年創立，原為非營利後轉混合營利結構。本知識庫中是 [[Anthropic]] 的主要對標廠商。

## 基本資訊

- **創辦人團隊**：Sam Altman / Greg Brockman / 等（[[Andrej-Karpathy]] 為共同創辦成員之一，後離開）
- **創立**：2015 年（非營利）→ 2019 年成立 OpenAI LP（capped-profit）
- **核心定位**：消費端 AI 主導者（ChatGPT 為大眾市場代表產品）+ 開發者工具（API / Codex）
- **代表模型**：GPT 系列（GPT-3 / 3.5 / 4 / 4o / o1 / o3 / 5）

## 產品家族（本 wiki 涵蓋）

| 產品 | 性質 | 本 wiki 頁 |
|---|---|---|
| **ChatGPT** | 消費端 LLM 對話介面 | （未獨立建頁） |
| **OpenAI API** | 開發者 API | （未獨立建頁） |
| **Codex CLI** | Agentic CLI（對應 [[Claude Code]]） | [[OpenAI-Codex-CLI]] |
| **Codex** | 早期程式生成模型（已併入 GPT 系列） | 同上頁覆蓋 |
| **Function Calling** | Tools 規範 | 在 [[MCP]] 頁中對照討論 |

## OpenAI 在本知識庫的核心論述

| 來源頁 | 主題 |
|---|---|
| [[src-harness-engineering-openai]] | **Harness Engineering 範式**：OpenAI 提出的 AI 代理工程紀律（約束 / 上下文 / 熵管理三根支柱） |
| [[src-codex-hyperframes-prompt-pack]] | Codex CLI + HyperFrames 短影片產製工作流（7-prompt 鏈） |
| [[src-cloudflare-ai-code-review]] | Cloudflare 用 [[OpenCode]]（OpenAI 系開源 agentic CLI）打造 production code review 系統 |

## 跨廠商共識中的 OpenAI 位置

本 wiki 中 OpenAI 與其他工程社群共識的對應：

| 原則 | OpenAI 視角 | 對應 Anthropic | 對應 Google | 對應個人工程師 |
|---|---|---|---|---|
| **[[Ratchet-Pattern]]** | OpenAI Mitchell Hashimoto | Anthropic Applied AI team | [[Addy-Osmani]] | Mnimiy |
| **[[Harness-Engineering]]** | OpenAI 原始提出方（三支柱）| [[Boris-Cherny]] Claude Code 7 extension points | Google Addy 七元件 | （個人實作 CLAUDE.md / Skills 等） |
| **[[Agentic-AI-Workflow]]** | 透過 Codex CLI 的 [[Prompt-Pack-Pattern]] 實踐 | Claude Cowork + Managed Agents | （未直接涵蓋）| 同心圓迭代範式 |

## 與 [[Anthropic]] 的對標關係

| 維度 | Anthropic | OpenAI |
|---|---|---|
| 主打族群 | 企業 / Pro 用戶 / 編程社群 | 消費端 + 廣域開發者 |
| 旗艦對話產品 | Claude.ai | ChatGPT |
| 開發者 agentic CLI | [[Claude Code]] | [[OpenAI-Codex-CLI]] |
| 規範檔約定 | [[CLAUDE-md\|CLAUDE.md]] | [[AGENTS-md\|AGENTS.md]] |
| 工程論述代表 | [[Boris-Cherny]] / [[Thariq-Shihipar]] | Mitchell Hashimoto（Harness Engineering 提出方） |
| 設計工具 | [[Claude-Design]] | （無對應產品） |
| 知識工作 surface | [[Claude-Cowork]] | （ChatGPT Projects 為對應，但本 wiki 未深入） |
| 對外論述風格 | 強調 safety + engineering best practices | 強調 capability + product velocity |

## 與本知識庫的關係

OpenAI 在本 wiki 中的涵蓋度低於 [[Anthropic]]（92 次 vs 195 次提及），這反映使用者的工具偏好——但**對標思考**始終存在：

- [[OpenAI-Codex-CLI]] 與 [[Claude Code]] 的對比經常出現
- [[AGENTS-md]] 與 [[CLAUDE-md]] 形成「平行協議」對話
- [[Harness-Engineering]] 是 OpenAI 原始提出但跨廠商通用的工程紀律

## 相關連結

- 對標廠商：[[Anthropic]]
- 主要產品：[[OpenAI-Codex-CLI]]
- 規範檔：[[AGENTS-md]]
- 工程範式：[[Harness-Engineering]] / [[Ratchet-Pattern]]
- 開源衍生：[[OpenCode]]（Cloudflare 用於 production code review）
- 共同創辦成員（已離開）：[[Andrej-Karpathy]]
