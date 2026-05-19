---
title: Plugins（Claude Code）
type: concept
sources: ["claude-blog-large-codebases.md"]
created: 2026-05-19
updated: 2026-05-19
tags: [claude-code, plugins, marketplace, distribution, anthropic-official]
confidence: 中
---

# Plugins（Claude Code）

[[Claude Code]] 的擴充機制——把 **skills / hooks / MCP configurations 打包成可安裝套件**，讓新工程師立即取得與資深成員相同的 Claude Code setup。透過 **managed marketplaces** 分發更新。

## 定位

依 [[src-claude-code-in-large-codebases|Anthropic 官方 best practice]]：

> 「**Plugins Distribute What Works**：Bundle skills, hooks, and MCP configurations into installable packages so new engineers immediately access the same setup as experienced team members. Updates distribute via managed marketplaces.」

是 [[Claude Code]] **Harness 7 個 extension points** 之一，定位為「**分發層**」：
- 跟 [[CLAUDE-md]] / [[Agent-Skills]] / Hooks / [[MCP]] / [[LSP-Integrations]] 等個別元件不同——Plugins 不是新功能，而是**把這些既有元件打包成可分發單位**

## 為什麼需要

企業 / 團隊導入 Claude Code 時最常見的痛點：

| 痛點 | Plugins 對策 |
|---|---|
| 新成員自己摸索 Claude Code setup | 一鍵安裝資深成員的整套配置 |
| 各人配置漂移、style 不一致 | 透過 marketplace 集中分發、版本化更新 |
| Skill 散落各種 GitHub repo、難管理 | Bundle 成單一 plugin |
| Hooks 規則需要跨 repo 共用 | 與 skills/MCP 一起打包 |

對應 [[Ratchet-Pattern]]「規則只應防止實際遇過的失敗」—— Plugins 是「**把累積的規則 / 工作流系統化分發給團隊**」的機制。

## 與其他 Skill 分發機制的對照

| 機制 | 涵蓋範圍 | 分發方式 | 適用情境 |
|---|---|---|---|
| **Plugins**（本頁）| Skills + Hooks + MCP | Managed marketplaces | 企業 / 團隊統一配置 |
| [[Agent-Skills]] | 純 skill markdown | `npx skills add <repo>` | 跨專案 skill 重用 |
| Skill Factory（[[Self-Improving-Agent]]）| Skill 自動生成 | AI 靜默監看後寫 SKILL.md | 個人化累積 |
| Prompt Pack（[[Prompt-Pack-Pattern]]）| 多段 prompt 鏈 | 對話框內貼上 | 一次性 / 教學 |

**核心差別**：Plugins 是**最完整的打包單位**（含 skills + hooks + MCP），其他機制只涵蓋部分。

## 在 [[Cloudflare]] AI Code Review 系統中的對應

[[src-cloudflare-ai-code-review]] 中 Cloudflare 用 [[OpenCode]] 自家 `@opencode-reviewer/*` 7 個外掛打包整套 AI review 系統——這個架構與 Anthropic 官方提的 Plugins 設計同源（雖然 OpenCode 與 Claude Code 是同類但不同產品）。

**啟示**：「打包整套配置成可分發單位」是 agentic CLI 進入企業 production 的關鍵機制，不只 Anthropic 一家在做。

## 在各來源中的角色

- [[src-claude-code-in-large-codebases]]：首次紀錄 Plugins 為 [[Claude Code]] Harness 7 個 extension points 之一；定位「Distribute What Works」

## 信心評估

- **強**：定位與設計目標（bundle skills + hooks + MCP 成可安裝套件）—— Anthropic 官方論述
- **中**：「managed marketplaces」具體運作機制 —— 文中只用一句帶過
- **弱**：具體 plugin 範例 / marketplace URL / 安裝命令 —— 官方文章未提供
- **時效**：2026-05 當下；產品功能可能還在演化

## 相關概念

- [[CLAUDE-md]] / [[Agent-Skills]] / [[MCP]] / [[LSP-Integrations]] / [[Subagent-Driven-Development]] —— Plugins 打包的成分
- [[Self-Improving-Agent]] / [[Ratchet-Pattern]] —— 累積後的工程化分發
- [[OpenCode]] —— 同類用 `@opencode-reviewer/*` 外掛打包的對照案例

## 未來可延伸

- Anthropic 官方 plugin marketplace 文件出現後補強
- 具體企業如何建內部 plugin marketplace（如 [[Cloudflare]] 模式）
- 與 Anthropic Skills 官方 repo（`anthropics/skills`）的關係
