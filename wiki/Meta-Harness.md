---
title: Meta-Harness
type: concept
sources: [scaling-managed-agents-decoupling-the-brain-from-the-hands-anthropic.md]
created: 2026-04-20
updated: 2026-04-20
tags: [架構設計, AI, Agent, 設計哲學]
confidence: 中
---

# Meta-Harness

**Meta-harness** 是 Anthropic 在 [[Managed-Agents]] 中提出的設計模式——為「尚未想出的程式」設計系統。對介面形狀有意見，對背後實作無意見。

## 核心定義

Harness 指 AI agent 的外殼邏輯——**loop + 工具呼叫 + 狀態管理**的組合。典型 harness 會內嵌許多對「模型能/不能做什麼」的假設。

Meta-harness 不同：它**只定義抽象介面**，讓具體 harness 可隨模型進化被替換，而介面本身保持穩定。

## OS 類比

這個模式與作業系統的演進一致：

| 層級 | 抽象 | 實作可變 |
|------|------|---------|
| 硬體 | `process`、`file` | 1970 磁帶 → 現代 SSD |
| Agent 基礎設施 | `session`、`sandbox`、`harness` | 具體執行引擎可替換 |

OS 的 `read()` 指令無論底層是磁帶或 SSD 都照用。Meta-harness 追求同樣的介面穩定性。

## 為什麼需要

### Harness 假設會過期

Anthropic 的實例：

- Claude Sonnet 4.5 有 **context anxiety**（感覺 context 快滿時提前結束任務）
- 他們在 harness 加了 **context reset** 機制處理
- 換到 Claude Opus 4.5 時發現 reset 變多餘——模型已不會有此行為
- 「硬編碼進 harness 的假設」反而變成 **dead weight**

> We expect harnesses to continue evolving. So we built Managed Agents: a hosted service... through a small set of interfaces meant to outlast any particular implementation—including the ones we run today.

### Decoupling 的具體好處

從「單 container 綁全部」改為「brain / hands / session 分離」後：

| 維度 | 單 container | Decoupled |
|------|------------|-----------|
| 失敗隔離 | 全部一起死 | 各元件獨立失敗 |
| 連接 VPC | 要 peering | 不綁定 |
| TTFT p50 | 基準 | **-60%** |
| TTFT p95 | 基準 | **-90%** |
| 多 hands | 不支援 | 一個 brain 接多 sandbox |
| Brain 互傳 hands | 不支援 | 支援 |

## 原則：Pets vs Cattle

Meta-harness 堅持所有組件都是 **cattle**（可替換的牛群），不是 **pet**（心愛的寵物）：

- Container 壞了 → harness 當作 tool error 處理，重啟新 container
- Harness 壞了 → `wake(sessionId)` 開新的，從 session log 接續
- **Session 是唯一「必須持久」的元件**——它也是 append-only log，天然可恢復

## 核心介面設計

只有三個介面需要穩定：

```
Sandbox:  execute(name, input) → string
Sandbox:  provision({resources}) → sandbox_id
Session:  getEvents(sessionId, range) → events[]
Session:  emitEvent(sessionId, event)
Harness:  wake(sessionId) → harness_instance
```

任何 sandbox / MCP server / 自定義工具都是 `execute` 的一個實作——harness 不需要知道它是 container、手機、還是 emulator。

## 適用判斷

**適合採用 meta-harness 設計：**
- 系統預期存活時間 > 主要依賴的變化速度（例如：要撐過多代模型）
- 多樣化的執行環境需求（container / VPC / 邊緣裝置）
- 對失敗隔離、水平擴展有需求
- 介面穩定性比介面完整性更重要

**不適合：**
- 需求已穩定、不預期大變動
- 系統壽命短、只需要完成單一任務
- 介面抽象化的複雜度 > 帶來的彈性

## 衍生觀察

這個模式與以下設計哲學呼應：

- **Unix 哲學**：每個工具做一件事、透過穩定介面組合
- **微服務**：獨立失敗、獨立擴展
- **Pets vs Cattle**（原見於雲原生）：基礎設施應該可拋可重建

差異點：meta-harness 特別強調「**對未來未知的變化**（如新模型能力）保持開放」，這是 AI 系統設計的新挑戰。

## 相關頁面

- [[Managed-Agents]] — 第一個 meta-harness 實作
- [[src-anthropic-managed-agents-engineering]] — 原始設計文件
- [[Agent-Skills]] — 可視為 harness 層對 agent 能力的模組化抽象
- [[src-claude-code-context-management]] — Claude Code 的 harness 設計中的 context 處理策略
