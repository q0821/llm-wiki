---
title: Agent Skills
type: concept
sources: [2026-03-12-Marketing-Skills-for-AI-Agents.md, asgard-ai-platform-skills.md]
created: 2026-04-15
updated: 2026-04-16
tags: [技術, AI, 工具, 概念]
confidence: 中
---

# Agent Skills

## 概念說明

一種讓 AI coding agents（如 Claude Code、Cursor、Windsurf 等）可擴充任務能力的規範。每個 skill 是一份 Markdown 文件，定義特定任務的框架、檢查清單與工作流程。Agent 面對對應任務時會自動套用。

## 規範

- 官方規範：https://agentskills.io
- 安裝方式：`npx skills add <repo>`

## 已知的 Skills 集合

- [[src-marketing-skills-ai-agents|marketingskills]] — 行銷任務技能集（SEO、CRO、文案等）
- [[src-asgard-skills|Asgard Skills]] — 263 個跨領域技能（理論模型、演算法、商業框架等），附確定性計算腳本

## Skill 設計模式比較

| 面向 | marketingskills | Asgard Skills |
|------|----------------|---------------|
| 定位 | 行銷實務操作 | 跨領域理論與演算法 |
| 規模 | ~30 skills | 263 skills |
| 特色 | `product-marketing-context` 共用基底 | Iron Law / Gotchas 設計 + Python 計算腳本 |
| 適用 | SEO/CRO/文案/廣告 | 股票分析、策略、統計、設計 |

## 相關頁面

- [[src-marketing-skills-ai-agents]] — 行銷 Skills 集合詳細介紹
- [[src-asgard-skills]] — Asgard Skills 集合詳細介紹
- [[Asgard-AI-Platform]] — Asgard 平台
