---
title: Claude Managed Agents
type: concept
sources: [scaling-managed-agents-decoupling-the-brain-from-the-hands-anthropic.md, claude-managed-agents-github-tutorial-az9713.md, the-ai-corner-claude-managed-agents-guide-2026.md]
created: 2026-04-20
updated: 2026-04-20
tags: [Anthropic, Agent基礎設施, Claude Platform, AI工具]
confidence: 強
---

# Claude Managed Agents

Anthropic 於 **2026-04-08** 在 Claude Platform 推出的 **public beta 託管 agent 服務**。把「Agent loop + 工具執行 + sandbox 容器 + 狀態持久化」打包成 REST API，讓開發者免寫 agent runtime 即可部署 production agent。

## 解決的核心問題

打造 production AI agent 傳統上要兩階段：

1. **設計階段**：定義 agent 要做什麼（較短）
2. **基礎設施階段**：sandbox 執行、狀態管理、憑證處理、錯誤復原、context 管理、tool orchestration、checkpointing ——**通常 3-6 個月**

Managed Agents **消除階段 2**，把部署時間從「數月」壓縮到「數天」。

## 架構：三個正交元件

| 元件 | 類比 | 職責 |
|------|------|------|
| **Session** | 外部記憶 | 事件 append-only log，任何時候可查 |
| **Harness (Brain)** | 大腦 | Claude + agent loop，無狀態、可重啟 |
| **Sandbox (Hand)** | 手 | 執行 code、存取資源，無狀態、可重建 |

每個元件獨立失敗/替換，用 `execute(name, input) → string` 介面串起來。設計哲學詳見 [[Meta-Harness]]。

## 定價結構（2026-04 public beta）

| 項目 | 價格 |
|------|------|
| Agent 運算（runtime） | **$0.08 / 小時** |
| 24/7 不中斷運行 | ~$58 / 月（僅 runtime）|
| Token 消耗 | Sonnet 4.6: $3/$15 per M input/output；Opus 4.6: $5/$25 per M |

實務上大多數 agent 是間歇運作，實際成本遠低於 $58/月。

## Public Beta 功能

- Sandboxed 安全執行（含身份驗證與權限）
- 長時間持久 session
- 內建 tool orchestration
- Session tracing（Claude Console）
- **Multi-agent coordination**（研究預覽）
- **Self-evaluation**（研究預覽）

## 真實企業部署案例

來自 The AI Corner（2026）報告：

| 公司 | 用途 | 成效 |
|------|------|------|
| **Notion** | 讓團隊不離開 workspace 即可委派 coding / 製作投影片 / 試算表 | 支援「數十個」平行任務 |
| **Rakuten** | 5 個部門（產品/業務/行銷/財務/HR）各自部署專家 agent | 每個部門 **不到一週上線** |
| **Asana** | AI Teammates 被指派執行專案任務 | CTO 表示「發布功能顯著加快」 |
| **Sentry** | 從 bug flagging 自動走到開 PR | 全自動化 bug-to-PR 流程 |
| **Vibecode** | 基礎設施 provision 自動化 | 比以往快 10 倍 |

## 快速上手資源

| 資源 | 內容 | 時間成本 |
|------|------|---------|
| [官方 Quickstart](https://platform.claude.com/docs/en/managed-agents/overview) | 原廠文件，model/prompt/tools/MCP/skills 定義 | 10-30 min |
| [GitHub az9713/claude-managed-agents](https://github.com/az9713/claude-managed-agents) | 30 行 hello world + 5 篇教學 | 2.5 小時完整 |
| [Anthropic 工程部落格](https://www.anthropic.com/engineering/managed-agents) | 架構設計原理（見 [[src-anthropic-managed-agents-engineering]]）| 20 min |

### GitHub 教學重點

az9713 的教學 repo 有一個 **capstone 專案**：自動從 arXiv 爬新論文、生成摘要、寄信，跑在 Haiku 上一年只要 **$3**。

5 part 結構：

1. 架構與核心概念（15 min）
2. `run.py` setup（30 min）
3. Agent loop 機制 + streaming（25 min）
4. Tools / permissions / cost controls（25 min）
5. Capstone research agent（45 min）

設計哲學：Python SDK 只做最薄，重活 delegate 給 Claude Code CLI subprocess。

## 與既有工具對照

| | n8n / Zapier | Claude Managed Agents |
|---|---|---|
| 觸發 | 事件驅動、定時 | 目標驅動（自然語言） |
| 定義方式 | 視覺化節點 | API + system prompt |
| 失敗處理 | 要手動設計 retry/branch | 自帶 session recovery |
| 長時間執行 | 受限 | 設計為 long-horizon |
| 成本 | 固定訂閱 | 按 runtime 小時 + token |

## 適用場景

**適合：**
- 長時間執行（hours～days）的研究/監控 agent
- 需要 sandbox 執行不信任程式碼
- 部署時間敏感、不想花 3-6 個月做基礎設施
- 已在 Claude 生態（API、Console、Skills）

**不太適合：**
- 一次性短任務（直接用 API 就好）
- 需要高度客製化 agent loop 行為
- 預算極度敏感、runtime 不間斷

## 相關頁面

- [[src-anthropic-managed-agents-engineering]] — 完整技術架構（官方部落格）
- [[Meta-Harness]] — 背後的設計哲學模式
- [[Agent-Skills]] — Managed Agents 支援 Skills 作為 agent 能力定義
- [[src-claude-code-context-management]] — Claude Code 的 context 管理策略（vs session 外部化）
- [[RAG]] — 概念對照：session event log ↔ RAG 外部知識庫
- [[src-claude-code-notebooklm]] — 同主題：把重活外包給專門服務
