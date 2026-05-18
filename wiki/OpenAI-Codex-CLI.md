---
title: OpenAI Codex CLI
type: entity
sources: ["課後 Prompt & 資源懶人包：Codex × HyperFrames 30 秒 Demo 3615edfc91bd80d19acee2ae9f0c5547.md", "Harness Engineering（AI駕馭工程）入門篇：OpenAI最新編程標準，教你輕鬆做到Lv.1.md"]
created: 2026-05-15
updated: 2026-05-15
tags: [openai, agentic-cli, codex, harness-engineering, agents-md]
confidence: 中
---

# OpenAI Codex CLI

OpenAI 推出的 **agentic CLI 工具**，需訂閱 ChatGPT 並安裝 codex 後使用（`https://openai.com/zh-Hant/codex/`）。是 OpenAI 對應 [[Claude Code]]（Anthropic）的同類產品——同為「住在終端機、以自然語言驅動的 agent 級 CLI」。

## 基本資訊

- **發行方**：OpenAI
- **存取前提**：ChatGPT 訂閱
- **規範檔**：`AGENTS.md`（對應 [[Claude Code]] 的 `CLAUDE.md`）
- **設計哲學**：[[Harness-Engineering]]（OpenAI 提出，Codex CLI 是其代表工程實踐）

## 與 Claude Code 的對照

對應 [[Claude Code#與其他 agentic CLI 的關係]] 的擴充版：

| 維度 | [[Claude Code]] | **OpenAI Codex CLI** |
|---|---|---|
| 廠商 | Anthropic | OpenAI |
| 模型 | Claude 系列 | OpenAI 系列（GPT / O 系列）|
| 規範檔 | `CLAUDE.md` | `AGENTS.md` |
| 持久記憶機制 | Memory + Handoff | post-training 把 harness 包進 loop（[[src-addy-osmani-harness-engineering]] 提到）|
| Adversarial Review | 透過 subagent 設計 | `codex review` / `codex adversarial-review` |
| 設計哲學 | [[Meta-Harness]]（介面 outlast 實作）| [[Harness-Engineering]]（約束 + 上下文 + 熵管理） |

兩者**互補不互斥**——[[src-hermes-agent-99-cases]] 中有「跨代理統一記憶：Hermes + Claude Code + Cursor」案例，類似邏輯適用於 Hermes / Claude Code / Codex 三聯協作。

## 在各來源中的角色

- [[src-harness-engineering-openai]]：[[Harness-Engineering]] 範式提出方，Codex CLI 是該範式的代表實踐。資料中提到 Codex CLI + 100 萬行 code / 零行人類手寫的 OpenAI 內部實驗
- [[src-codex-hyperframes-prompt-pack]]：典型的領域應用——用 Codex CLI 驅動 [[HyperFrames]] 生成短影片；展示 [[Prompt-Pack-Pattern]] 在 Codex 上的具體運作
- [[src-addy-osmani-harness-engineering]]：[[Addy-Osmani]] 把 Codex CLI 列為「不同 harness 的代表案例」之一（與 Claude Code、Cursor、Aider、Cline 並列）

## Adversarial Review 模式

[[Adversarial-Code-Review]] 概念頁中提到的 `/codex:adversarial-review` 是 Codex CLI 的特色：

- **`codex review`**：一般 diff review，不接受 focus text
- **`codex adversarial-review --scope branch --base <初始 commit>`**：對抗式 review，可傳自訂 focus prompt（如「以 OWASP Top 10 為審查框架」）

這在「跨檔組合 bug」「silent backdoor」「狀態紀錄不可信」這類 human review 看不見的問題上有具體價值。

## 在 Harness Engineering 論述中的位置

Codex CLI 是 OpenAI [[Harness-Engineering]] 的「**工程紀律**」面向的具體實踐：
- **Context Engineering**：透過 `AGENTS.md` 載入專案規範
- **Architectural Constraints**：linter / 結構測試 / LLM 審計員 / pre-commit hooks
- **Entropy Management**：定期清潔代理修文件漂移、命名分歧、死 code

## 信心評估

- **強**：與 [[Claude Code]] 同類「agentic CLI」定位，多個來源獨立佐證（[[src-harness-engineering-openai]] / [[src-addy-osmani-harness-engineering]] / [[src-codex-hyperframes-prompt-pack]]）
- **中**：與 ChatGPT 訂閱的綁定方式、版本快照——透過 [[src-codex-hyperframes-prompt-pack]] 提到「訂閱 chatgpt 並安裝 codex」推斷，未獨立驗證 2026-05 當下的訂閱結構

## 相關實體

- [[Claude Code]] — 同類產品（Anthropic 對應方）
- [[OpenCode]] — 開源 agentic CLI 同類；[[Cloudflare]] 系統用 `@opencode-reviewer/codex` 外掛整合 Codex 做合規檢查
- [[HyperFrames]] — Codex CLI 的領域應用代表（短影片生成）
- [[Hermes-Agent]] — 開源 agent 框架，可與 Codex CLI 互通
- [[Cloudflare]] — Codex CLI 在 Cloudflare AI code review 系統中扮演合規檢查角色

## 相關概念

- [[Harness-Engineering]] — OpenAI 提出的設計範式，Codex CLI 是其代表
- [[Adversarial-Code-Review]] — `codex adversarial-review` 是該模式的工具實作
- [[Prompt-Pack-Pattern]] — Codex CLI 上的具體運作範式
- [[Agent-Skills]] — Codex 也有 skill 機制，但細節待補
