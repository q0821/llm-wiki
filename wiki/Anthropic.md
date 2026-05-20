---
title: Anthropic
type: entity
sources: [bnext-claude-md-12-rules.md, anthropic-founders-playbook-2026-05.pdf, anthropic-managed-agents-engineering.md, claude-code-in-large-codebases.md]
created: 2026-05-20
updated: 2026-05-20
tags: [vendor, ai-lab, anthropic]
confidence: 強
---

# Anthropic

本知識庫的核心廠商（被 195+ 次提及）。AI 安全研究實驗室與 Claude 模型家族母公司，由 Dario Amodei 與 Daniela Amodei 於 2021 年創立，多名核心員工來自前 OpenAI 團隊。

## 基本資訊

- **創辦人**：Dario Amodei（CEO）/ Daniela Amodei（President）
- **創立**：2021 年
- **核心定位**：AI safety research lab + 商用 LLM 廠商
- **代表模型**：Claude 系列（本知識庫主要關注 Claude 3 / 3.5 / 4 系列）
- **核心員工地圖**（本 wiki 已建頁）：
  - [[Boris-Cherny]] — Claude Code 核心貢獻者（完成驗證心法 / Routines 實戰）
  - [[Thariq-Shihipar]] — Claude Code 核心貢獻者（Cache as Uptime / Context 工程）
  - [[Andrej-Karpathy]] — 共同創辦成員之一（已離開創立其他事業，但仍與 Anthropic 生態緊密相關，是 [[LLM-Wiki]] 範式提出者）

## 產品家族（本 wiki 涵蓋）

Anthropic Claude 的 **3 + 1 個 product surfaces**（[[src-anthropic-founders-playbook-2026|Founder's Playbook]] 列 3 個 + Design 為 Research Preview 第 4）：

| Surface | 工作環境 | 適用場景 | 本 wiki 頁 |
|---|---|---|---|
| **Chat** | 純對話（claude.ai） | 快速問答 / brainstorm | （未獨立建頁） |
| **Claude Cowork** | folder + connectors + skills + scheduled runs | 跨多來源整合知識工作、運營層 | [[Claude-Cowork]] |
| **Claude Code** | codebase / diffs / git / dev environments | Codebase 級編程任務 | [[Claude Code]] |
| **Claude Design** | UI 設計 + 直接產 React 元件 | 設計師（Research Preview 階段）| [[Claude-Design]] |

附加產品 / 範式：
- **[[Managed-Agents|Claude Managed Agents]]** — 託管 agent 服務（session / harness / sandbox 三層架構）
- **[[MCP]]** — Anthropic 推出的「AI 連外部工具」開放協議
- **[[Agent-Skills]]** — Anthropic 推出的 AI Agent 可擴充能力規範
- **[[CLAUDE-md|CLAUDE.md]]** — Claude Code 持久記憶層的官方檔名約定

## 核心工程論述

本 wiki 中收錄的 Anthropic 官方工程內容：

| 來源頁 | 主題 |
|---|---|
| [[src-anthropic-founders-playbook-2026]] | 創業者手冊 / AI-Native Startup 4 階段框架 |
| [[src-anthropic-managed-agents-engineering]] | Managed Agents 工程架構（meta-harness） |
| [[src-claude-code-in-large-codebases]] | 大型 codebase 中使用 Claude Code 的 best practices |
| [[src-claude-code-context-management]] | Claude Code 上下文管理攻略（原作者 Thariq Shihipar） |
| [[src-zeuikli-claude-code-best-practices]] | 社群整合 81 篇 Anthropic 來源的研究報告 |

## Anthropic 在本知識庫的關鍵論點

1. **[[Ratchet-Pattern]]**——Anthropic 官方建議 3-6 月 review CLAUDE.md，避免規則 sprawl；本 wiki 中是「**克制原則**」的第 4 個獨立來源
2. **[[Context-Engineering]]**——「真正的工程護城河」，是 Anthropic 對 [[Context-Rot]] 的對策
3. **[[Agentic-AI-Workflow]]**——Founder = orchestrator of agents 的「[[AI-Native-Startup|10-person unicorn]]」官方範式
4. **[[Adversarial-Code-Review|Claude as structured devil's advocate]]**——貫穿四階段創業的核心 use case
5. **[[Fields-Without-Enforcement-Anti-Pattern|Insecure by inexperience]]**——AI-Native 創業者常見的 5 類安全漏洞官方版命名

## 對標廠商

- **[[OpenAI]]** — GPT / Codex CLI / Harness Engineering 提出方
- **Google** — Gemini / [[Addy-Osmani]] 視角的 Harness 七元件
- **Meta** — Llama 開源模型
- 對標關係：Anthropic 在「**安全研究 + 企業 / Pro 用戶 + 編程 / 知識工作**」這個三角區站位最堅實；OpenAI 主打消費端（ChatGPT）；Google 主打整合搜尋與生產力套件。

## 與本知識庫的關係

本 wiki 因為其使用者偏好 Claude Code，主要關注 Anthropic 生態。多個概念頁（[[CLAUDE-md]] / [[Agent-Skills]] / [[MCP]] / [[Ratchet-Pattern]] / [[Harness-Engineering]] / [[Context-Engineering]]）的「官方版」內容都來自 Anthropic 工程文章——使本知識庫具備「**個人實作 ↔ Anthropic 官方範式**」的雙向銜接特性。

## 相關連結

- 主要產品 surface：[[Claude Code]] / [[Claude-Cowork]] / [[Claude-Design]]
- 核心員工：[[Boris-Cherny]] / [[Thariq-Shihipar]] / [[Andrej-Karpathy]]
- 對標廠商：[[OpenAI]]
- 創業範式：[[AI-Native-Startup]]
- 工程原則：[[Ratchet-Pattern]] / [[Context-Engineering]] / [[Harness-Engineering]]
