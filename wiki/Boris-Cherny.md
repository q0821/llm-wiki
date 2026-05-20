---
title: Boris Cherny
type: entity
sources: ["zeuikli-claude-code-best-practices.md"]
created: 2026-05-20
updated: 2026-05-20
tags: [anthropic, claude-code, engineer, contributor]
confidence: 中
---

# Boris Cherny

Anthropic 工程師，[[Claude Code]] 核心貢獻者之一。在 [[src-zeuikli-claude-code-best-practices|zeuikli 整理報告]]中多次被引用為核心人物，特別在「Routines 排程自動化」與「完成驗證心法」兩個面向有具體論述。

## 基本資訊

- **任職**：Anthropic
- **角色**：[[Claude Code]] 核心貢獻者（與 [[Thariq-Shihipar]] 並列）
- **論述貢獻**：完成驗證心法、Routines 實戰、CLAUDE.md 設計原則

## 核心論述

### 完成驗證心法

> 「**宣告完成前自問：資深工程師會核准這個嗎？否 → 先修再報。**」

對應本 wiki：
- [[CLAUDE-md|CLAUDE.md]] [[src-bnext-claude-md-12-rules|12 條規則]] Rule 2「Test: would a senior engineer say this is overcomplicated?」
- [[PGE-Principle]] 「層 2：人類 Evaluator」
- [[Ratchet-Pattern]] 「克制原則」的具體應用——只規則化值得「資深工程師會皺眉」的失敗

### Routines 排程自動化

[[src-zeuikli-claude-code-best-practices]] 章 8.2「自動化配方（Boris Cherny 實戰）」記錄他的具體場景：
- 每日 standup 自動產出
- PR review 自動化
- Backlog 維護
- 排程任務的使用限額管理

對應本 wiki [[Claude Code#核心能力]]「**Scheduled Agents**（2026 新增）：定時自動執行任務」——當時記錄缺具體實戰，這次補上 Boris 的場景。

## 在各來源中的角色

- [[src-zeuikli-claude-code-best-practices]]：本知識庫首次紀錄。zeuikli 引用為 Claude Code 核心貢獻者之一，特別在 Routines 章與完成驗證心法章有具體引言

## 在 Anthropic Claude Code 論述者地圖中的位置

| 人物 | 主要論述面向 |
|---|---|
| **Boris Cherny** | 完成驗證 / Routines / CLAUDE.md 設計 |
| [[Thariq-Shihipar]] | Cache 與 Context 工程 / Session 管理 |
| Anthropic Applied AI team | 企業導入 best practices（[[src-claude-code-in-large-codebases]]）|
| [[Andrej-Karpathy]] | AI 寫程式 3 缺失（源頭）/ [[LLM-Wiki]] 範式 |

## 信心評估

- **中**：身份「Anthropic Claude Code 核心貢獻者」——zeuikli 整理引用，但未獨立驗證職位
- **強**：引言內容——zeuikli 直接引用，與 Anthropic 官方 [[src-claude-code-in-large-codebases|2026-05-14 blog]] 的工程文化一致
- **時效**：2026-05 當下；未來官方資訊出現可補強

## 相關實體

- [[Thariq-Shihipar]] — 同 Anthropic Claude Code 核心貢獻者
- [[Andrej-Karpathy]] — Claude Code 相關論述影響者

## 相關概念

- [[PGE-Principle]] — Boris「資深工程師會核准嗎」是層 2 人類 Evaluator 的具體實踐
- [[Ratchet-Pattern]] — Boris 完成驗證心法是 Ratchet 累積規則的具體判準
- [[CLAUDE-md]] — Boris 對其設計原則有具體建議
- [[Claude Code]] — 主要產品

## 未來可延伸

- Boris Cherny 公開講座 / 訪談（如 zeuikli 引用的 Routines 實戰可能有原始 talk）
- Anthropic engineering blog 中 Boris 的署名文章
