---
title: Claude Code 降本 — Advisor / Orchestrator 兩模式（@zhong_yea Threads）
type: source
sources: ["Threads 上的 Zhong_yea（22）（@zhong_yea）.md"]
created: 2026-07-11
updated: 2026-07-11
tags: [claude-code, 多模型, orchestration, 降本, threads]
confidence: 中
---

# Claude Code 降本：Advisor / Orchestrator 兩模式（@zhong_yea）

**作者**：zhong_yea
**平台**：Threads（`DaiUBjYkoZo`）
**抓取於**：2026-07-11

介紹在 Claude Code 中避免全程使用 Fable 5 的兩種降本方案，是 [[多模型角色編排]] 的**手動實作教學版**（對照打包工具 [[src-nanako-pilotfish|pilotfish]]）。

## 兩模式

| 模式 | 配置 | 口訣 | 效能 | 成本 |
|---|---|---|---|---|
| **Advisor** | Sonnet 5 主 + Fable 5 顧問 | 「Fable 思考、Sonnet 執行」，Fable 只在關鍵決策介入 | 92% | 63% |
| **Orchestrator** | Fable 5 規劃/拆解/指派 + Sonnet 5 執行 | 思考者 vs 執行者分工 | 96% | 46% |

## 實作方式

- 建自訂指令 `/orchestrator`
- 在 [[CLAUDE-md|CLAUDE.md]] 預設工作模式
- 支援參數傳遞直接指定任務

## 核心論點

透過角色分工（思考者 vs 執行者），可在保持品質前提下大幅降低成本。與 [[src-nanako-pilotfish|pilotfish]] 引用**同一組 Anthropic benchmark 數字**。

## 關聯

- [[多模型角色編排]] — 本來源與 pilotfish 共同支撐此概念頁（個人吸收段在該頁）
- [[src-nanako-pilotfish]] — 同主張的打包工具版
- [[Claude Code]]、[[CLAUDE-md]]

## 信心評估

- **中**：Threads 短貼文，數字與 pilotfish 互撐（兩獨立來源同引 Anthropic benchmark）；但屬個人分享、細節有限，實際效益依工作負載而定
