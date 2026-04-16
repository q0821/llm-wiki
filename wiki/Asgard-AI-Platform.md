---
title: Asgard AI Platform
type: entity
sources: [asgard-ai-platform-skills.md]
created: 2026-04-16
updated: 2026-04-16
tags: [技術, AI, 平台, Agent-Skills]
confidence: 中
---

# Asgard AI Platform

## 概要

一個 AI 平台，以「食材庫 + MCP」的組合模式打造特定場景的 AI agent 外掛。

## 核心產品

- **Skills Repository**（開源）：263 個 coding agent skills，涵蓋理論模型、演算法、商業框架等 21 類。詳見 [[src-asgard-skills]]
- **MCP Servers**：搭配 skills 組合成場景化外掛（股票分析、電商營運、政策研究等）

## 架構理念

```
Skills（知識食材） + MCP Servers（工具接口） → 場景化 Agent 外掛
```

- Skills 提供框架、方法論、確定性計算腳本
- MCP Servers 提供外部資料存取能力
- 兩者組合產出特定領域的 AI agent

## 技術特色

- 遵循 Claude Agent Skills 規範（`SKILL.md` 格式）
- 強調 Iron Law 與 Gotchas 設計——讓 agent 注意非顯而易見的限制
- 確定性計算用 Python 腳本，不依賴 LLM 做數值運算

## 相關頁面

- [[src-asgard-skills]] — Skills Repository 來源摘要
- [[Agent-Skills]] — Agent Skills 概念
- [[src-marketing-skills-ai-agents]] — 另一個 skills 集合（行銷）
