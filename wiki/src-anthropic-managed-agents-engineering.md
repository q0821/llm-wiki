---
title: Scaling Managed Agents - Decoupling the brain from the hands
type: source
sources: [scaling-managed-agents-decoupling-the-brain-from-the-hands-anthropic.md]
created: 2026-04-20
updated: 2026-04-20
published: 2026-04
tags: [Managed Agents, Anthropic, Meta-Harness, 架構設計, Claude Platform]
confidence: 強
---

# Scaling Managed Agents: Decoupling the brain from the hands

> 來源：Anthropic 工程部落格｜作者：Lance Martin, Gabe Cemaj, Michael Cohen｜發佈：2026-04
> 原始連結：https://www.anthropic.com/engineering/managed-agents

## 核心主張

- Harnesses（agent 外殼邏輯）會在模型進化中**失效**——需要隨時質疑其假設
- Managed Agents 設計為 **meta-harness**：對「介面形狀」有意見，對「背後實作」無意見
- 正交分離三個介面：**Session / Harness / Sandbox**，各自可獨立失敗、替換、擴展

## 關鍵概念

### Meta-Harness：為尚未想出的程式而設計

與作業系統虛擬化硬體（`process`、`file`）的思路一致：

> Managed Agents follow the same pattern. We virtualized the components of an agent: a session (the append-only log of everything that happened), a harness (the loop that calls Claude and routes Claude's tool calls to the relevant infrastructure), and a sandbox (an execution environment where Claude can run code and edit files).

舉例：Claude Sonnet 4.5 有「context anxiety」（感覺 context 將滿時提前結束任務），他們為此加了 context reset；但換到 Opus 4.5 時發現 reset 變多餘了——**harness 的假設會因模型進化而過期**。

### Pets vs Cattle：容器設計教訓

初期把 session / harness / sandbox 全塞同個 container，結果變成「寵物」：

| | Pet（舊設計） | Cattle（新設計） |
|---|---|---|
| Container 失敗 | session 全失，要 nurse 回來 | harness 捕捉為 tool-call 錯誤，重啟就好 |
| Debugger | 工程師要 shell 進 container | session 外存，可任意重啟 harness 讀回 |
| 連接客戶 VPC | 要網路 peering | 不綁定，`execute(name, input)` 即用 |

**關鍵介面：** `execute(name, input) → string`
- 任何 sandbox / MCP server / 自定義工具都只是「手」
- Harness 不知道手是 container、手機、還是 Pokémon emulator

### Session ≠ Context Window

常規做法（compaction、context trim）都是**不可逆決策**——丟掉的不知道未來會不會需要。

Managed Agents 的解法：
- Session 是持久化的事件 log，**存在 Claude context window 之外**
- `getEvents()` 讓 brain 按需查詢：跳到最後讀取點、回溯幾步、重讀特定動作前的 context
- Harness 可對 fetched events 做任意變換（例如 prompt cache 優化）才送進 Claude context

> 不是 session 主動決定要留什麼，而是它保證「永遠查得到」，context engineering 推給 harness 處理。

### 安全邊界：Tokens 永不進 sandbox

舊設計：Claude 生成的程式碼跑在同個 container，prompt injection 只要說服 Claude 讀自己的環境變數就能偷 token。

新設計：
- **Git**：用 repo token 在 sandbox 初始化時 clone + 設定 remote，之後 push/pull 不需要 agent 碰 token
- **MCP**：OAuth token 放 vault，Claude 透過 MCP proxy 呼叫，proxy 從 vault 取 credentials
- **Harness 全程不知道任何 credentials**

### Many Brains, Many Hands

Decoupling 的效能收益：

| 指標 | 改善幅度 |
|------|---------|
| p50 TTFT（time to first token） | -60% |
| p95 TTFT | -90% |

原因：Brain 跟 Container 拆開後，**不需要 container 就可以先開始 inference**，只在需要工具時才 provision。

進階能力：
- 一個 brain 可接多個 hands（多 sandbox、多環境）
- Brain 之間可傳遞 hands

## 摘要

| 元件 | 介面 | 職責 |
|------|------|------|
| **Session** | `getEvents()`, `emitEvent(id, event)` | 事件 append-only log，持久狀態 |
| **Harness (Brain)** | `wake(sessionId)` | Claude + agent loop，stateless cattle |
| **Sandbox (Hand)** | `execute(name, input) → string`, `provision({resources})` | 執行 code、編輯 file，stateless cattle |

## 關鍵引用

> Harnesses encode assumptions that go stale as models improve. Managed Agents—our hosted service for long-horizon agent work—is built around interfaces that stay stable as harnesses change.

> The harness leaves the container. Decoupling the brain from the hands meant the harness no longer lived inside the container. It called the container the way it called any other tool: `execute(name, input) → string`. The container became cattle.

> Meta-harness design means being opinionated about the interfaces around Claude: we expect that Claude will need the ability to manipulate state (the session) and perform computation (the sandbox).

## 與 Wiki 的關聯

- 補充 [[Managed-Agents]] 的架構設計細節（本頁是其最主要的理論來源）
- 建立 [[Meta-Harness]] 概念，作為 agent 架構的一般性模式
- 與 [[src-claude-code-context-management]] 對照：Claude Code 用 compact/rewind 處理 context，Managed Agents 用外部 session log 徹底繞過問題
- 與 [[Agent-Skills]] 互補：Skills 是 agent 能力單位，Managed Agents 是 agent 的基礎設施層
- 與 [[RAG]] 對照：session event log 與 RAG 外部知識庫在「外部狀態」概念上相近
