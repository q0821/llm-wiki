---
title: Agentic AI Workflow
type: concept
sources: ["(5) Will AI Kill SaaS系列：... - Yu-Chih Edward Hwang.md", "【直播筆記】用 Claude Design × Claude Code × Figma 重新定義設計工作流程 - AAPD 產品設計學院.md", "課後 Prompt & 資源懶人包：Codex × HyperFrames 30 秒 Demo 3615edfc91bd80d19acee2ae9f0c5547.md"]
created: 2026-04-28
updated: 2026-05-15
tags: [ai-coding, agent, development-paradigm, design-to-code, code-to-design, video]
confidence: 強
---

# Agentic AI Workflow

## 定義

Agentic AI Workflow（代理式工作流）是 AI 開發路徑演化的第四階段（在傳統接力、[[Vibe-Coding]]、Contextual Coding 之後）。核心特徵是把「線性接力」轉為「同心圓迭代」（Concentric Iteration）——多個 AI Agent 同步工作，人類扮演 **Reviewer（審批者）** 與 **指揮家（Conductor）**。

## 兩條並行路徑

### Design to Code（正推 / 由形入理）

**輸入**：Vision（高階意圖）

**流程**：
- AI Agent 同時生成規格、UI 元件、底層邏輯
- 不再是「PM 寫規格 → Designer 畫圖 → Engineer 實作」的線性接力
- 各 Agent 並行作業，最後收斂

**人類角色**：
- Reviewer：審查產出
- 指揮家：分派任務、訂優先順序

**邊際成本變化**：原本「來回修正」的溝通成本被 Agent 吸收。

### Code to Design（逆推 / 由理生形）

**核心概念**：以「商業邏輯與資料結構」驅動介面生成與更新。

**典型情境**：
> 工程團隊在資料庫「會員資料」新增「VIP 忠誠度積分」欄位。
>
> - **傳統路徑**：PM 開票 → Designer 在 Figma 畫「積分要放哪？長什麼樣？」→ 前端切版 → 接後端
> - **Agentic 路徑**：AI Agent 反向推演 → 自動生成或更新對應 UI 元件、視覺呈現、設計文件

**為何過去做不到**：需要 AI 同時理解資料模型、UI 慣例、品牌規範（[[DESIGN-md]]）、現有 codebase 結構。

### 雙向閉環的副作用

兩條路徑互相提供訓練資料：
- 舊設計圖 + 程式碼 → 餵給 AI
- AI 更理解設計脈絡與規範
- 未來產出更符合脈絡的程式碼
- 程式碼修改後反向同步更新原始設計文件

這形成一個「AI 越用越懂你的品牌」的飛輪。

## 不同觀點

- [[src-will-ai-kill-saas-design]]（Yu-Chih Edward Hwang，**宏觀觀察**）：將 Agentic AI Workflow 視為「軟體開發邊際成本趨近於零」的最終形態，人類核心價值收斂為意圖、品味、架構三點。
- [[src-aapd-claude-design-figma-workflow]]（[[Simon-Lin|Simon]]，**實作經驗**）：從 [[Claude-Design]] 0→1 → Hand off → [[Claude Code]] 產品化 → [[Figma]] MCP 雙向同步的具體實踐。實作觀察補強：(1) Claude Design 仍有 hard-coded / 無版本控制等限制；(2) Figma MCP 雙向 Auto layout 仍需人工補強；(3) 設計師角色從「雕刻畫面」轉向「判斷方向」。
- [[src-anthropic-managed-agents-engineering]]（Anthropic）：[[Managed-Agents]] 與 [[Meta-Harness]] 是 Agentic AI Workflow 的具體技術實作——session / harness / sandbox 三層架構，TTFT p50 -60% / p95 -90%。
- [[src-harness-engineering-openai]]（OpenAI）：[[Harness-Engineering]] 是 Agentic AI Workflow 的「工程紀律」面向——約束、上下文、熵管理三根支柱。

## 在 Figma / Adobe 衝擊論述中的位置

[[Figma]] 與 [[Adobe]] 過去是「靜態設計稿」流程的核心節點。Agentic AI Workflow 的出現讓設計稿不再是中間產物：

- [[Claude-Design]]：直接產出「活的可點擊 React 元件」，跳過設計稿
- Claude Code：取代「PM 把目標拆成小工單給工程師」
- Figma / Adobe 的剩餘價值：**美學共識錨點**（Design System Source of Truth）+ **像素級控制**

## 相關概念

- [[Vibe-Coding]]：演化光譜的前一階段，Agentic 是其補強版
- [[Managed-Agents]]：Anthropic 的具體實作
- [[Meta-Harness]]：「對介面有意見對實作無意見」的設計哲學
- [[Harness-Engineering]]：OpenAI 提出的工程紀律
- [[DESIGN-md]]：為 Code to Design 提供「美學約束來源」
- [[RAG]] / [[Embedding]]：Code to Design 中讓 Agent 理解 codebase 與設計脈絡的技術基礎

## Founder 層的同心圓迭代（[[src-anthropic-founders-playbook-2026|Anthropic 官方 2026-05]]）

本頁前述「同心圓迭代」是**工程層**範式。Anthropic Founder's Playbook 把同範式延伸到 **founder / 創業者層**：

> 「The founder role becomes much less individual contributor and **much more orchestrator of agents**—specialized AI assistants that can read files, run commands, execute code, and even browse the web.」

新 founder 工作模式對照本頁第 4 階段：

| 維度 | 工程層 Agentic AI Workflow | Founder 層 |
|---|---|---|
| 角色 | 工程師 = Reviewer + 指揮家 | Founder = **Orchestrator of agents** |
| Agent 分工 | 同時 Design + Code + Spec | Conversational research + Agentic coding + Workflow automation |
| Bottleneck | What you **can** build | What you **choose** to build |

詳見 [[AI-Native-Startup]] 概念頁——是「10-person unicorn」「founder 路徑壓縮」的 Anthropic 官方版範式名。

## 應用與案例

- [[Claude-Design]]：Anthropic 把 UI 設計與前端開發融合的 Agentic 產品
- [[Claude Code]]：具備 Agent 能力的編程助手
- [[NotebookLM]] / [[notebooklm-py]]：把 NotebookLM 的閉合 RAG 包成 Agent 可呼叫的 skill，是 Agentic Workflow 的子模組
- **Simon 工作流**（[[src-aapd-claude-design-figma-workflow]]）：[[Claude-Design]] → Hand off → [[Claude Code]] → [[Figma]] [[MCP]] 雙向同步的具體實作鏈，代表「同心圓迭代」的當前最佳實踐
- **Codex × HyperFrames 影片工作流**（[[src-codex-hyperframes-prompt-pack]]）：[[OpenAI-Codex-CLI]] + [[Prompt-Pack-Pattern]] 7 個串連 prompt → DESIGN.md / script.md / storyboard.md → HTML composition → MP4。把 Agentic Workflow 從 code 領域延伸到**短影片產製**
