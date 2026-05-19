---
title: Claude Code in Large Codebases — Anthropic 官方 best practices
type: source
sources: ["claude-blog-large-codebases.md"]
created: 2026-05-19
updated: 2026-05-19
tags: [claude-code, harness, anthropic-official, enterprise, plugins, lsp, ratchet]
confidence: 強
---

# Claude Code in Large Codebases — Anthropic 官方 best practices

**作者**：Anthropic Applied AI team
**發布日期**：2026-05-14
**原文連結**：https://claude.com/blog/how-claude-code-works-in-large-codebases-best-practices-and-where-to-start
**Customer mention**：Zoox（Amit Navindgi 提供 feedback）
**性質**：**Anthropic 官方**對 Claude Code 企業導入的 best practice 文件

## 核心主張

- **「The Harness Matters as Much as the Model」** —— Anthropic 官方副標題，把「harness」概念正式納入產品論述
- Claude Code 採用 **agentic search**（traversing / grep / cross-references），**而非 RAG embedding**——避免索引過時失敗
- Harness 由 **5 個 extension points**（實列 6 個含 LSP）形成：CLAUDE.md / Hooks / Skills / Plugins / LSP / MCP / Subagents
- **CLAUDE.md 主動維護週期**：每 3-6 個月或重大模型發布後 review；模型變強後既有規則可能變 unnecessary 或 constraining
- 企業導入需要 **DRI（Directly Responsible Individual）** + 浮現中的「**Agent Manager**」（hybrid PM/engineer）角色
- 「**Bottoms-up adoption generates enthusiasm but can fragment without someone to centralize what works.**」

## 詳細摘要

### 一、Agentic Search vs RAG Embedding（官方定位）

> 「Claude Code navigates codebases like a software engineer—traversing file systems, reading files, using grep for precise searches, and following cross-codebase references. It operates locally without requiring a codebase index.」
>
> 「Unlike RAG-powered tools that embed entire codebases, Claude Code uses agentic search, avoiding failures where indices become stale.」

對應本知識庫 [[LLM-Wiki]] vs [[RAG]] 對話組——Anthropic 官方確認 agentic search 的設計選擇。但官方也提醒「**this approach requires sufficient starting context to navigate effectively**」——所以 CLAUDE.md 與 codebase 結構越好越有效。

### 二、Harness 5/6 個 Extension Points

| Extension Point | 一句話定位 | 對應 wiki |
|---|---|---|
| **CLAUDE.md Files Come First** | Root 看大局、subdirectory 管 local conventions；應「focused on what applies broadly」 | [[CLAUDE-md]] |
| **Hooks Make the Setup Self-Improving** | Scripts at key moments；**stop hooks 提議 CLAUDE.md 更新、start hooks 動態載入 context** | （新）|
| **Skills On-Demand**（**progressive disclosure**）| 特定 workflow 在需要時才載入；can be scoped to specific paths | [[Agent-Skills]]、[[Context-Rot]] |
| **Plugins Distribute What Works** | Bundle skills / hooks / MCP 成可安裝套件；managed marketplaces 分發 | [[Plugins-Claude-Code]]（新）|
| **LSP Integrations** | 透過 IDE language server 給 Claude symbol-level precision（「go to definition」/「find all references」）| [[LSP-Integrations]]（新）|
| **MCP Servers Extend Everything** | 連接 internal tools / data sources / APIs；「**most sophisticated teams built MCP servers exposing structured search as a tool Claude can call directly**」 | [[MCP]] |
| **Subagents Split Exploration from Editing** | Isolated Claude instances + separate context windows | [[Subagent-Driven-Development]] |

### 三、CLAUDE.md 主動維護週期（官方版 Ratchet 克制原則）

> 「As models improve, previous instructions may become unnecessary or constraining. A rule forcing single-file refactors may hinder newer models capable of coordinated cross-file edits. **Teams should review configurations every three to six months or after major model releases.**」

對應 [[Ratchet-Pattern]] 的**第四個獨立來源**：
- Google [[Addy-Osmani]]：「模型變強後既有限制應該主動移除」
- OpenAI Mitchell Hashimoto：「每次錯誤變成永久規則」
- 個人工程師 Mnimiy（[[src-bnext-claude-md-12-rules]]）：「規則只應防止實際遇過的失敗」
- **Anthropic 官方（本來源）**：「3-6 月 review、模型變強後 unnecessary」

四個獨立來源的同源原則 → 已是包含廠商在內的全方位共識。

### 四、企業導入組織模式

#### Codebase 配置 best practices

- Keep CLAUDE.md files **lean and layered**（root 大局、subdirectory 細節）
- **Initialize in subdirectories** rather than repo root
- Scope test / lint commands per subdirectory
- 用 `.claude/settings.json` permissions.deny 排除 generated files / build artifacts / third-party code
- 目錄結構不清楚時 build **codebase maps**
- Run **LSP servers** for symbol-based searching instead of string matching

#### 組織角色（**新名詞**）

> 「The rollouts that spread fastest had a dedicated infrastructure investment **before** broad access.」

成功組織的共通配置：
- 小型專職團隊預先做 tooling
- 透過 developer experience / productivity team 取得明確 ownership
- 浮現中的 **「Agent Manager」** 角色（hybrid PM/engineer）管 Claude Code ecosystem
- **Minimum viable setup：一個 DRI（Directly Responsible Individual）** 有權管 configuration / settings / permissions policy / plugin marketplace / CLAUDE.md conventions

> 「Bottoms-up adoption generates enthusiasm but **can fragment without someone to centralize what works**.」

#### 受監管產業（regulated industries）

需要更早建立跨部門工作小組（engineering / security / governance），以 defined approved skills / required code review processes / limited initial access 起步，**expanding with confidence**。

### 五、適用範圍限制

設計給「**conventional software engineering environments**」：
- 主要貢獻者是工程師
- 版本控制用 Git
- Code 遵循標準目錄結構

非傳統 setup（**game engines with large binary assets / unconventional version control / non-engineers contributing**）需要額外配置——這是 Anthropic 官方明白標示的「不適用」邊界。

對應 [[Hermes-Agent]] / [[OpenCode]] / [[OpenAI-Codex-CLI]] 等同類 agentic CLI 的應用範圍——可能也是傳統工程環境為主。

## 關鍵引用

> 「**The harness matters as much as the model.**」

> 「**Claude Code uses agentic search**, avoiding failures where indices become stale. However, this approach **requires sufficient starting context** to navigate effectively.」

> 「**Teams should review configurations every three to six months or after major model releases.**」

> 「**Bottoms-up adoption generates enthusiasm but can fragment without someone to centralize what works.**」

> 「Most sophisticated teams built MCP servers **exposing structured search as a tool Claude can call directly**.」

## 信心評估

- **強**：Harness 7 個 extension points（含 LSP）的官方定位——Anthropic 第一手文件
- **強**：「3-6 月 review」「DRI」「agent manager」企業導入模式——官方歸納實際 enterprise 部署
- **中**：Zoox 是唯一 case study 提及，但無具體 deployment 細節
- **時效**：2026-05-14 當下；產品功能（如 Plugins / LSP）可能還在演化

## 與 Wiki 的關聯

### 新建頁面

- [[Plugins-Claude-Code]]（concept）——Bundle skills/hooks/MCP 成可安裝套件
- [[LSP-Integrations]]（concept）——透過 IDE language server 給 Claude symbol-level precision

### 更新既有頁面

- [[Claude Code]]：大幅擴充——官方 7 個 extension points、agentic search vs RAG embedding、適用範圍限制、Hooks 段落（之前未提）
- [[CLAUDE-md]]：補「3-6 月 review」官方版維護週期 + 「lean and layered」配置 best practice
- [[Harness-Engineering]]：跨工程文化對照表加 **Anthropic 官方**一行（先前由 Managed Agents 視角代替）
- [[Subagent-Driven-Development]]：補官方版定義「split exploration from editing」+ isolated context window 官方確認
- [[Agent-Skills]]：補 **progressive disclosure** 設計原則的官方確認
- [[Context-Rot]]：progressive disclosure 是其對抗工具的官方版確認
- [[MCP]]：補「最 sophisticated teams 用 MCP 暴露 structured search」官方背書
- [[Ratchet-Pattern]]：第 4 個獨立來源——Anthropic 官方
- [[LLM-Wiki]]：補「agentic search vs RAG embedding」官方論點對照

### 形成的對話組

- **本來源（官方視角）** ↔ **[[src-cloudflare-ai-code-review]]（client 視角）**：Anthropic 官方說的 harness 7 元件 ↔ Cloudflare 用 OpenCode 自建 review 系統的具體 production
- **本來源** ↔ **[[src-bnext-claude-md-12-rules]]**：官方「3-6 月 review」↔ Mnimiy「規則只應防止實際遇過的失敗」—— 同源克制原則
- **本來源** ↔ **[[src-addy-osmani-harness-engineering]]**：Anthropic 7 元件 ↔ Google Addy 七元件 —— 兩家獨立的 7-元件 harness 分解

### 未來可延伸

- Zoox 的 Claude Code 部署案例（文中只 acknowledgement，無細節）
- Plugins marketplace 機制細節（待官方文件補完）
- LSP integration 的具體技術細節（哪些 LSP 已支援、如何啟用）
- Anthropic Applied AI team 的其他 enterprise 案例文章
