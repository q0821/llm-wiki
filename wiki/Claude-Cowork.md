---
title: Claude Cowork
type: entity
sources: ["anthropic-founders-playbook-2026-05.md"]
created: 2026-05-20
updated: 2026-05-20
tags: [anthropic, claude-product, cowork, productivity, agent-orchestration]
confidence: 中
---

# Claude Cowork

Anthropic Claude **3 個 product surfaces** 之一——介於 Chat（純對話）與 [[Claude Code]]（codebase 編程）之間的「**知識工作 + 流程自動化**」工作環境。本知識庫先前 Claude 產品地圖中的缺角。

## 基本資訊（依 [[src-anthropic-founders-playbook-2026|Anthropic Founder's Playbook]]）

- **發行方**：Anthropic
- **定位**：知識工作 + 流程自動化的 Claude surface
- **適用情境**：「**Research、analysis、a finished document built from your files and systems**」

## 三 Claude Surfaces 對照

| Surface | 工作環境 | 何時用 | 對應產出 |
|---|---|---|---|
| **Chat** | 對話介面（無 setup） | 快速問答、小任務、brainstorm | 對話回應 |
| **Claude Cowork**（本頁） | **folder access + connectors + skills + scheduled runs** | 跨多來源整合知識工作 | 文件、deck、spreadsheet、kpi brief |
| [[Claude Code]] | codebase / git / IDE / sandboxed cloud | 寫 / 改 / 測試 production code | code diff / commit / PR |

> 「The three share the same Claude underneath; **what changes is the workspace around it**.」 —— Anthropic Founder's Playbook

## 核心能力

依 playbook 揭露：

| 能力 | 描述 |
|---|---|
| **Folder access** | 直接讀取本地 / 雲端資料夾 |
| **Connectors** | 連接 Gmail / Calendar / CRM / 專案管理工具等 |
| **Skills** | 同 Claude Code 的 [[Agent-Skills|Skill]] 機制——可定義 reusable 工作流 |
| **Scheduled runs** | **Cron-like 排程任務**（對應 [[Claude Code]] Routines 概念） |
| **MCP 整合** | 透過 [[MCP]] 連接 Gmail / Google Calendar 等外部系統 |

## 在 4 階段創業 lifecycle 中的角色

依 [[src-anthropic-founders-playbook-2026]] 4 階段：

| Stage | Cowork 的具體用途 |
|---|---|
| **Idea** | Synthesize industry reports / 萃取競品資訊 / TAM-SAM-SOM 建模 / 自動化 customer outreach + scheduling（透過 Gmail / Calendar via MCP）|
| **MVP** | Manage discovery + user feedback（draft outreach / schedule sessions / track iteration cycles / weekly synthesis）|
| **Launch** | Run structured audit of operational load（route incoming bug reports / compile weekly metrics / 維護 feedback loop）|
| **Scale** | Operational layer 主力——「**hand off day-to-day to Claude Cowork**」 |

## Customer Case：Airtree

依 playbook Resources 段：

> 「**Airtree uses Claude Cowork as the center of its operations infrastructure**, uniting data that used to be scattered across a dozen different tools and teams. Now, when one person builds a workflow automation with skills, **everyone in the organization can use it to do all the things on their to-do list that never got done**.」

這是 Cowork 用法的「中央運營層」典型——對應 playbook「**Skills 把個人工作流變組織工作流**」的論點。

## 與其他 Claude 產品的關係

| 關係 | 描述 |
|---|---|
| vs [[Claude Code]] | Cowork 偏「**知識工作 + 排程**」，Code 偏「**codebase 編程**」；但兩者輸出可互為輸入（如 Code 跑 audit → 結果餵給 Cowork 做 sequencing） |
| vs Chat | Cowork 有 persistent context（folder + connectors），Chat 是 ephemeral |
| vs [[Claude-Design]] | Design 偏 UI / Prototype 視覺輸出，Cowork 偏文件與運營 |
| vs [[Managed-Agents]] | Managed Agents 偏「**API agent 服務**」（後端），Cowork 偏「**桌面 / 雲端工作環境**」（前端）|

## 在各來源中的角色

- [[src-anthropic-founders-playbook-2026]]：本知識庫首次紀錄。在 4 階段都被列為主力 surface 之一；Airtree case 證實「中央運營層」可行

## 信心評估

- **強**：定位（3 surface 之一）、核心能力（folder / connectors / skills / scheduled runs）——Anthropic 官方文件
- **強**：Airtree case 用法 —— playbook 直接引述
- **中**：與 Claude Code Skills 機制是否完全相同 —— playbook 用同名「skills」，但具體實作可能略異
- **時效**：2026-05 當下；產品還在演化

## 相關實體

- [[Claude Code]] —— 同 Claude 產品家族 codebase surface
- [[Claude-Design]] —— 同家族 design / prototype surface
- [[Managed-Agents]] —— 後端 agent 服務對照

## 相關概念

- [[Agent-Skills]] —— Cowork 中 Skills 機制
- [[MCP]] —— 與外部工具整合（Gmail / Calendar）
- [[Prompt-Pack-Pattern]] —— Cowork 工作流的設計範式
- [[AI-Native-Startup]] —— Cowork 是該範式的主要工作環境
- [[Context-Engineering]] —— folder access / connectors 是 context 動態組裝的具體載體

## 未來可延伸

- 補抓 Anthropic Cowork 官方文件（playbook 提到「Get started with Claude Cowork」連結）
- Cowork Skills 與 [[Claude Code]] Skills 是否互通的具體機制
- 是否有 LSP / Tool Search 等 Claude Code 進階機制的對應版本
