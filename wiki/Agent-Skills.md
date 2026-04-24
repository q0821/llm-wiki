---
title: Agent Skills
type: concept
sources: [2026-03-12-Marketing-Skills-for-AI-Agents.md, asgard-ai-platform-skills.md, 只要 5 分鐘！Claude Code 無縫整合 NotebookLM 實戰.md, 推薦的 Claude Code  skill.md]
created: 2026-04-15
updated: 2026-04-20
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
- **NotebookLM Skill**（[[notebooklm-py]] 配套）— 讓 Claude Code 操作 [[NotebookLM]]，把研究外包給 Gemini。詳見 [[src-claude-code-notebooklm]]
- **yt-search Skill**（自製範例）— 用 yt-dlp 搜尋 YouTube 並回傳結構化結果（含「觀看數/訂閱數」爆款比率）

## Skill 自我優化 Meta-Pattern

來自 [[src-claude-code-notebooklm]] 的觀察：可以**用 skill 來建 skill**。

- Anthropic 內建的 `skill-creator` skill（Opus 4.6 自動觸發）會：建初版 → 跑測試 → 修腳本 → 優化 SKILL.md
- 關鍵前提：使用者要清楚描述目的、輸入輸出、成功標準
- 「目的越清楚，skill 建得越好」——這是個自舉（bootstrapping）現象
- 與 [[src-asgard-skills]] 的 `Iron Law` / `Gotchas` 設計理念呼應：明確的邊界條件帶來更好的 skill

## 推薦 Skills 清單

個人整理的值得安裝的 Claude Code skills：

| Skill | 作者 | 適用對象 | 說明 |
|-------|------|---------|------|
| [superpowers](https://github.com/obra/superpowers) | Jesse Vincent | 所有人 | 讓 Claude 做事更嚴謹，16 萬星 |
| [anthropics/skills](https://github.com/anthropics/skills) | Anthropic 官方 | 所有人 | 文件處理（Word、PPT、Excel、PDF），12 萬星 |
| [gstack](https://github.com/garrytan/gstack) | Garry Tan（YC CEO） | 一人公司 | 模擬團隊角色審查，7.7 萬星 |
| [obsidian-skills](https://github.com/kepano/obsidian-skills) | Stephan Ango（Obsidian CEO） | Obsidian 使用者 | Obsidian 整合，2.5 萬星 |
| [claude-code-templates](https://github.com/davila7/claude-code-templates) | Daniel Ávila | Skill 新手 | 大型工具集，2.5 萬星 |
| [marketingskills](https://github.com/coreyhaines31/marketingskills) | Corey Haines | 行銷/副業/一人公司 | 行銷技能集，2.2 萬星 |
| [claude-scientific-skills](https://github.com/K-Dense-AI/claude-scientific-skills) | K-Dense AI | 研究/論文 | 深度內容寫作，1.9 萬星 |
| [compound-engineering-plugin](https://github.com/EveryInc/compound-engineering-plugin) | Every.to 團隊 | 長期內容/產品經營 | 複利式工程，1.5 萬星 |

## Skill 設計模式比較

| 面向 | marketingskills | Asgard Skills |
|------|----------------|---------------|
| 定位 | 行銷實務操作 | 跨領域理論與演算法 |
| 規模 | ~30 skills | 263 skills |
| 特色 | `product-marketing-context` 共用基底 | Iron Law / Gotchas 設計 + Python 計算腳本 |
| 適用 | SEO/CRO/文案/廣告 | 股票分析、策略、統計、設計 |

## 相關頁面

- [[src-recommended-claude-code-skills]] — 8 個推薦 Skills 清單的原始來源頁
- [[src-marketing-skills-ai-agents]] — 行銷 Skills 集合詳細介紹
- [[src-asgard-skills]] — Asgard Skills 集合詳細介紹
- [[src-claude-code-notebooklm]] — NotebookLM Skill + 自製 yt-search skill 完整實戰
- [[Managed-Agents]] — Agent 基礎設施層，支援 Skills 作為 agent 能力定義
- [[Meta-Harness]] — Skills 可視為 harness 層對 agent 能力的模組化抽象
- [[Harness-Engineering]] — Skills 是 Level 1 harness 的具體實踐
- [[Asgard-AI-Platform]] — Asgard 平台
- [[notebooklm-py]] — NotebookLM Skill 的底層 CLI 工具
