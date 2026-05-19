---
title: Agent Skills
type: concept
sources: [2026-03-12-Marketing-Skills-for-AI-Agents.md, asgard-ai-platform-skills.md, 只要 5 分鐘！Claude Code 無縫整合 NotebookLM 實戰.md, 推薦的 Claude Code  skill.md, "Claude + Obsidian 打造 AI 第二大腦，Karpathy 的知識管理 LLM Wiki 教學｜科技翰林院.md", "科技翰林院怎麼用 Claude Code 終端機？8 個實戰設定全公開.md", "Hermes Agent 成功案例 — 你的 AI 代理可以做什麼.md", "未命名.md"]
created: 2026-04-15
updated: 2026-05-14
tags: [技術, AI, 工具, 概念]
confidence: 強
---

# Agent Skills

## 概念說明

一種讓 AI coding agents（如 Claude Code、Cursor、Windsurf 等）可擴充任務能力的規範。每個 skill 是一份 Markdown 文件，定義特定任務的框架、檢查清單與工作流程。Agent 面對對應任務時會自動套用。

## 規範

- 官方規範：https://agentskills.io
- 安裝方式：`npx skills add <repo>`

## 與 .claude/commands/ 的關係

[[Claude Code]] 的 `.claude/commands/` 機制是 Skills 的**簡化版本**：每個常用工作流寫成一個 markdown 範本（檔名 = slash command 名）。

[[科技翰林院]] [[src-techhanlin-llm-wiki-tutorial|LLM Wiki 教學]]建議把高頻動作都寫成 slash command：
- `/today` — 建立今日 daily note、搬入未完成 task
- `/weekly-review` — 統計本週、辨識重複主題、產回顧筆記
- `/llm-wiki ingest|query|lint` — [[LLM-Wiki]] 三步驟工作流

差異：
- **.claude/commands/**：本機專案層級，逐字 prompt 範本，無腳本邏輯
- **Agent Skills**：跨專案分發、可含腳本（Python、shell）、有 frontmatter metadata 與觸發條件描述

## Anthropic 官方版 Skills 設計原則：Progressive Disclosure

[[src-claude-code-in-large-codebases|2026-05-14 官方 blog]] 把 Skills 列為 [[Claude Code]] Harness 7 個 extension points 之一，並確認設計原則：

> 「**Skills Keep the Right Expertise Available On-Demand**：Specialized workflows load when needed through **progressive disclosure**, preventing all expertise from competing for context space in every session. Can be scoped to specific paths.」

關鍵設計：
- **On-demand**：不在 session 啟動就全載入（會 context rot）
- **Progressive disclosure**：需要時才載入特定 workflow（對應 [[Context-Rot]] 三招之一）
- **Path-scoped**：可綁定到特定目錄 / 路徑——例如 `WordPress/` 下才載入 WP 相關 skill

對應本頁先前提到 [[科技翰林院]]「每次都跟 AI 說一樣的話就該建 skill」與 Asgard @honglong0420「人不會主動叫出方法論」兩個論點——Anthropic 官方版加上**第三層機制**：「skill 載入是 progressive，避免擠佔 context」。

## 為什麼把 Prompt 變成 Skill？

[[科技翰林院]] [[src-techhanlin-claude-code-8-settings|8 個設定]]提出的核心啟發：

> 「**每次你發現自己在跟 AI 說一樣的話，那就是應該建一個 Skill 的時候。**」

直接打 Prompt 的問題：
- 每次都要重新描述完整流程（光是 prompt 就要幾百字）
- 容易漏步驟
- 流程更新時要去改每個 prompt

Skill 的封裝優勢：
- 一鍵觸發完整 SOP
- 流程更新只改一處
- 規範與檢查清單可被多個 session 共用

### Asgard @honglong0420 的補充論點（[[src-honglong0420-asgard-x-thread]]）

> 「辯證法、商業模式九宮格、精實創業、敘事這些方法論，前沿的 LLM 幾乎都內建了。**缺的不是 AI 知不知道，而是人不會記得主動把它叫出來。**會議開到一半、定價拍腦袋的當下，沒人會停下來說『等等，我們來論述一下正論反論合論』。」

這精準回答「為什麼 skill 化有效」的根本問題——**LLM 知識不缺，啟動成本才是瓶頸**。Skill 化把「啟動」降到「按一個鍵」。

對應的設計含義：

| 觀點 | 焦點 |
|---|---|
| [[科技翰林院]]：「每次都跟 AI 說一樣的話就該建 skill」 | 對抗**重複描述**的成本 |
| Asgard：「人不會主動叫出方法論」 | 對抗**遺漏啟動**的成本 |

兩者**互補不互斥**——前者是「節省 token」，後者是「對抗自己偷懶 / 過度自信」。後者對應 [[Ratchet-Pattern]] 的另一個切角：不只防失敗，也防遺漏。

## 實戰 Skill 命名範例（[[科技翰林院]] 的 10 個常用 Skills）

按用途分類，可作為設計自己 skills 的參考：

| 類別 | Skill 範例 | 觸發時機 |
|---|---|---|
| **內容產線** | `/techhanlin-write` | 寫文章：讀 SOP → 寫內容 → 上傳 WP → 設 SEO |
| **單純操作** | `/techhanlin-wp` | 不寫內容只改 WordPress 設定 |
| **批次任務** | `/wp-seo-batch` | 大量修 SEO 時，每 5 篇自動驗證 |
| **修改流程** | `/css-fix` | 改樣式：先診斷再動手 |
| **Session 護欄** | `/check`, `/verify` | session 開頭驗環境、修改後強制驗證 |
| **部署流程** | `/deploy` | 上線時：跑 tsc → 建置 → commit → push |

> 對應本知識庫：`/llm-wiki ingest|query|lint` 屬於「**流程護欄 + 內容產線**」混合型。

## 已知的 Skills 集合

- [[src-marketing-skills-ai-agents|marketingskills]] — 行銷任務技能集（SEO、CRO、文案等）
- [[src-asgard-skills|Asgard Skills]] — 301 個跨領域技能（2026-05-19 審計快照；初版 2026-04 為 263 個），附確定性計算腳本；含 26 個 `tw-ecom-*` skeleton 狀態，詳見 [[src-asgard-skills-audit-2026-05-19]]
- **NotebookLM Skill**（[[notebooklm-py]] 配套）— 讓 Claude Code 操作 [[NotebookLM]]，把研究外包給 Gemini。詳見 [[src-claude-code-notebooklm]]
- **yt-search Skill**（自製範例）— 用 yt-dlp 搜尋 YouTube 並回傳結構化結果（含「觀看數/訂閱數」爆款比率）
- **Hermes Skills**（[[Hermes-Agent]] 生態系）— 99 案例中橫跨 13 個分類，含 awesome-hermes-agent 精選清單；特色是 **Skill Factory**（靜默監看工作流，自動生成 SKILL.md）。詳見 [[src-hermes-agent-99-cases]]

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

| 面向 | marketingskills | Asgard Skills | Hermes Skills（[[Hermes-Agent]] 生態系）|
|------|----------------|---------------|------|
| 定位 | 行銷實務操作 | 跨領域理論與演算法 | 跨平台 agent 用例 |
| 規模 | ~30 skills | 263 skills | 99 案例 / 13 分類 |
| 特色 | `product-marketing-context` 共用基底 | Iron Law / Gotchas 設計 + Python 計算腳本 | **Skill Factory（自動生成）** + MEMORY.md 整合 |
| 適用 | SEO/CRO/文案/廣告 | 股票分析、策略、統計、設計 | 訊息平台、企業、加密、家庭自動化 |
| 生成方式 | 人類撰寫 | 人類撰寫 + 確定性腳本 | **AI 自動生成**（靜默監看 → 寫 SKILL.md） |

> **Skill Factory** 的設計哲學最特殊——把 [[Self-Improving-Agent]] 概念落實為 Skill 自動萃取。這與 marketingskills / Asgard 的「人類精心設計」形成兩種典型。

## 與 Continue（VS Code 擴充）的對照

[[PAPAYA-電腦教室]] [[src-papaya-gemma-lm-studio|示範]]中介紹的 Continue 是另一種 AI agent 介入點：

| | Agent Skills | Continue（VS Code 擴充） |
|---|---|---|
| 介入位置 | Claude Code / 其他 agent CLI | VS Code 編輯器 |
| 模型來源 | Claude API / 任何 agent | 可選任意 LLM provider（含 [[LM-Studio]] 本地模型）|
| 擴展機制 | Skill markdown + frontmatter | 編輯器擴充 + 模型 provider 設定 |
| 適合情境 | 跨專案的標準化 SOP | 編輯器內逐行/逐區塊互動 |

兩者**不衝突**——可同時用 Skills（高層流程）與 Continue（編輯器內互動）。

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
- [[MCP]] — 概念對照：Skills 封裝工作流、MCP 連接外部工具
- [[BrowseForge]] / [[Playwright]] — AI agent 操作瀏覽器的應用場景（多帳號管理、爬蟲、表單填寫）
- [[GEO]] — 「網站暴露 Agent Skills」是 Agent-Ready 的前沿項（[[Cloudflare]] Radar 2026-04 採用率僅 0.015%）
- [[Hermes-Agent]] — 第三大 Skill 生態系，自動生成 Skill 的代表
- [[Self-Improving-Agent]] — Skill Factory 是該範式的關鍵元件
- [[src-hermes-agent-99-cases]] — Hermes Skill 生態的 99 案例彙整
- [[Harness-Engineering]] — Skills 是 harness 七元件中「Tools / 工具箱」的一部分
- [[Ratchet-Pattern]] — Skill 是 Ratchet 累積的高層形式（把「應該怎麼做」固化）
- [[Addy-Osmani]] — 提出「10 個職責清楚的工具勝過 50 個功能重疊」原則
- [[src-addy-osmani-harness-engineering]] — Harness 七元件視角下的 Skills 定位
- [[Prompt-Pack-Pattern]] — 與 Skill 對照的另一種重用範式（人類控制節奏 vs Agent 自動觸發）
