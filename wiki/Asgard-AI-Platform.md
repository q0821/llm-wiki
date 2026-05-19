---
title: Asgard AI Platform
type: entity
sources: [asgard-ai-platform-skills.md, "honglong0420-asgard-x-thread.md"]
created: 2026-04-16
updated: 2026-05-19
tags: [技術, AI, 平台, Agent-Skills, taiwan-smb]
confidence: 強
---

# Asgard AI Platform

## 概要

一個 AI 平台，以「食材庫 + MCP」的組合模式打造特定場景的 AI agent 外掛。**主打定位**：台灣中小企業日常工作場景（依 [[src-honglong0420-asgard-x-thread|內部人員 X 推文]]）。

## 內部人員

- **@honglong0420**（X，暱稱「原來是擅長等紅燈的朋友」）—— 撰寫 2026-05 開源推廣文，自稱「老闆之前很瘋狂，想要整理一份台灣中小企業日常工作場景用得上的 agent skills」

## 公司資訊

- **法人**：Asgard Inc. 肆佳科技股份有限公司
- **License**：MIT（全套開源）

## 核心產品

- **Skills Repository**（開源）：**301 個** coding agent skills（2026-05-19 [[src-asgard-skills-audit-2026-05-19|審計]]快照；初次發布 263 個 / 21 類，2026-05 推文 263 個 / 22 類），涵蓋理論模型、演算法、商業框架、台灣專屬等 25 個前綴分類。詳見 [[src-asgard-skills]]
- **MCP Servers**：搭配 skills 組合成場景化外掛（股票分析、電商營運、政策研究等）

> ⚠️ **承諾 vs 現況落差**：作者推文「主打台灣中小企業電商」現階段大部分仍是骨架——`tw-ecom-*` 分類 38 個中 26 個是 `status: skeleton`。詳見 [[src-asgard-skills-audit-2026-05-19#26 個 skeleton 完整清單]]。

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
- **全套 MIT 開源**

## 涵蓋領域（依 [[src-honglong0420-asgard-x-thread|2026-05 作者推文]]）

| 類別 | 範圍 |
|---|---|
| 通用商業 | 電商、行銷、財會、客服、人資、製造、法務 |
| **台灣專屬** | **勞健保、營業稅**等台灣才需要處理的業務 |
| 思維模型 | 辯證法（hum-dialectics）、商業模式九宮格（ops-business-model-canvas）、精實創業（ux-lean-startup）、敘事方法論（hum-narrative）等 |

## 核心設計論點（內部人員親述）

> 「**缺的不是 AI 知不知道，而是人不會記得主動把它叫出來。**」

LLM 內建大量方法論知識，但**啟動成本**才是真正的瓶頸；skill 化把啟動降到「按一個鍵」。詳見 [[src-honglong0420-asgard-x-thread#一、為什麼 skill 化有價值（核心論點）]]。

## 相關頁面

- [[src-asgard-skills]] — Skills Repository 來源摘要（2026-04 客觀整理）
- [[src-honglong0420-asgard-x-thread]] — 內部人員親述視角（2026-05 推廣 + 四件套思維模型）
- [[Agent-Skills]] — Agent Skills 概念
- [[src-marketing-skills-ai-agents]] — 另一個 skills 集合（行銷）
