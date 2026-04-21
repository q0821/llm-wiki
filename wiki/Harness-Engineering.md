---
title: Harness Engineering（駕馭工程）
type: concept
sources: [Harness Engineering（AI駕馭工程）入門篇：OpenAI最新編程標準，教你輕鬆做到Lv.1.md]
created: 2026-04-21
updated: 2026-04-21
tags: [AI, Agent, 軟體工程, 架構設計]
confidence: 強
---

# Harness Engineering（駕馭工程）

## 定義

Harness Engineering 是由 OpenAI 工程師 Ryan Lopopolo 提出的軟體開發範式：設計基礎設施、約束條件和回饋迴圈，讓 AI 代理能可靠且大規模地運作。

「Harness」原意為馬具——AI 模型是馬，harness 是韁繩和導引系統，工程師是騎士。

核心哲學：**Humans steer, agents execute.**

## 四個核心功能

| 功能 | 說明 |
|------|------|
| 約束（Constraining） | 限定代理能做什麼、不能做什麼 |
| 告知（Informing） | 讓代理理解目標——提供上下文 |
| 驗證（Verifying） | 確認代理是否正確執行——測試和檢查 |
| 修正（Correcting） | 代理犯錯時自動修復——回饋迴圈 |

## 三根支柱

### 1. Context Engineering（上下文工程）

代理看不到的東西 = 不存在。所有規範必須存在於 repo 中。

- **靜態上下文**：架構規範、API 合約、coding style（AGENTS.md / CLAUDE.md）
- **動態上下文**：日誌、CI 狀態、目錄結構掃描

最佳實踐：AGENTS.md 當「目錄」指向 `docs/`，不當「百科全書」。

### 2. Architectural Constraints（架構約束）

限制解題空間反而提升生產力。工具：自定義 linter、結構測試、LLM 審計員、pre-commit hooks。

### 3. Entropy Management（熵管理）

AI 代碼會累積特有混亂（文件漂移、命名分歧、死 code）。解法：定期執行清潔代理，持續小步清理。

## 三級實踐路線圖

- **Level 1**（個人，1-2 小時）：CLAUDE.md + pre-commit hooks + 測試套件
- **Level 2**（團隊，1-2 天）：CI 強制約束 + 共用 prompt 模板 + AI 專屬 review checklist
- **Level 3**（組織，1-2 週）：可觀測性整合 + 清潔代理 + harness A/B 測試

## 概念層次關係

```
Prompt Engineering    → 單次互動（怎麼寫 prompt）
Context Engineering   → 上下文視窗（給什麼資訊）← Harness 的子集
Harness Engineering   → 整個系統（環境 + 約束 + 回饋迴圈）
Agent Engineering     → 代理內部（路由、記憶、工具呼叫）
```

## 與 Meta-Harness 的關係

[[Meta-Harness]]（Anthropic）和 Harness Engineering（OpenAI）從不同角度解決同一問題：

| 面向 | Harness Engineering | Meta-Harness |
|------|-------------------|--------------|
| 提出者 | OpenAI | Anthropic |
| 核心關注 | 代理「外面」的環境設計 | 介面抽象與實作可替換性 |
| 關鍵主張 | 約束提升生產力 | 介面穩定性 > 實作完整性 |
| 對未來的態度 | harness 應「可撕裂」，隨模型進化移除 | 介面應 outlast 任何具體實作 |

兩者互補：Meta-harness 定義穩定介面，Harness Engineering 設計介面內的約束和回饋系統。

## 相關頁面

- [[src-harness-engineering-openai]] — 原始來源摘要
- [[Meta-Harness]] — Anthropic 的互補設計哲學
- [[Managed-Agents]] — Meta-harness 的第一個實作
- [[Agent-Skills]] — Level 1 harness 的具體實踐
- [[DESIGN-md]] — Context Engineering 的實踐案例
- [[src-claude-code-context-management]] — Claude Code 的 context 管理策略
