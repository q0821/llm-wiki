---
title: 為什麼我不推 vibe coding，而是推 AI Agent 自動化 — Gask Huang-Kai
type: source
author: Gask Huang-Kai
author_handle: facebook.com/GaskHuang
sources: [未命名-20260526-031034.md]
fetched: 2026-05-26
created: 2026-05-26
updated: 2026-05-26
tags: [vibe-coding, ai-agent, smb-automation, openclaw, hermesos, messaging-platform]
confidence: 中
---

# 為什麼我不推 vibe coding，而是推 AI Agent 自動化

[[Gas-Khuang|Gask Huang-Kai]] 的社群論述貼文（即 wiki 既有 [[Gas-Khuang]] entity，真實全名 Gask Huang-Kai，是 [[src-hermes-agent-99-cases|Hermes 99 案例]] 的整理者）。核心主張：對 5-50 人台灣中小企業，最值得投資的自動化路徑不是 [[Vibe-Coding|vibe coding]]，而是「把 [[Agent-Skills|Agent + Skill]] 架構放進通訊軟體群組」。

## 核心論點

### 1. 工作場景論：員工不在電腦前

> 「你的業務在外面跑客戶、工程師在機房或現場、主管在開會中途要查數據——大家查詢資訊、回報狀況、協調任務，用的幾乎都是手機。如果你的自動化工具必須坐在電腦前面才能用，那這個工具到底在自動化什麼？」

這個前提把後續 6 個論點的價值判斷都框在「手機優先」的場景需求上。

### 2. Vibe Coding 的脆性：業務動態 vs 寫死的 code

> 「今天要加一個財務審批流程，明天要刪掉一個舊的回報格式，後天又要新增一個客戶分群邏輯。用寫程式的方式做自動化，等於把需求寫死在 code 裡。每次業務變動，你就要重新改程式、重新測試、重新部署。這個循環在小公司還勉強能撐，規模一大就開始失控。」

對應既有 [[Vibe-Coding]] 概念頁。本論述是「中小企業視角」的 vibe coding 批判，跟 [[src-anthropic-founders-playbook-2026|Anthropic Founder's Playbook]] 的「Agentic Technical Debt」框架（startup 視角）形成兩個獨立來源的呼應。

### 3. Agent + Skill 架構的彈性

> 「你要新增一個功能，加一個 Skill。要修改，調整那個 Skill。要移除，刪掉它。Agent 本身不需要重新部署，它只是根據你給它的 Skill 組合去執行任務。這個彈性，是寫死 code 的架構根本做不到的。」

對應 [[Agent-Skills]] 概念頁的核心動機。

### 4. 訂閱 vs API Key：成本結構根本不同

> 「如果你用程式去串接 Claude 或 GPT，你只有一條路：API Key，按 token 計費。用越多，付越多，而且 context window 通常還比訂閱版小。你要自己處理 OAuth、自己維護 session、自己寫那一段整合邏輯。但如果你用訂閱制跑 Agent（像是 OpenClaw、Hermes OS），你每個月固定費用，context window 更大，而且不需要自己維護那一堆 API 整合的工程。」

對應 [[HermesOS]] 的 BYO key + 月費商業模型（[[src-hermesos-cloud-landing|官方落地頁]] 的 Free / Pro $9.99 / Power $19.99 三階定價）。

### 5. Claude.ai 的單一性限制

> 「你沒辦法把 Claude.ai 丟進一個工作群組，讓財務、工程、業務三個部門同時跟它講話、分工協作。你沒辦法在群組裡拍一張現場照片直接丟給它處理。」

這個論點針對的不是 Claude.ai 本身的能力，而是「web app 單會話形式」與「多人通訊群組」的結構差異。

### 6. 通訊軟體型 Agent 的勝出點

> 「想開一個財務群組？建一個群，把 Agent 加進去，就能開始溝通了。想讓業務在外面拍了名片直接丟給 Agent 建聯絡人？同樣。這種靈活度，是任何獨立 App 都給不了你的。」

> 「最強的自動化工具，不是功能最多的工具，而是員工在任何場景都願意打開、都能用的工具。」

對應 [[Hermes-Agent]] 的訊息平台覆蓋表（Telegram / WhatsApp / Discord / LINE / QQ / Feishu / iMessage / Email / Slack / Web Chat / CLI），以及 [[HermesOS]] 「Connect Telegram, Discord, Slack, or WhatsApp — out of the box」。

### 7. 目標市場：5-50 人台灣中小企業

> 「如果你問我，對一間有 5 到 50 人的台灣中小企業來說，現在最值得投資的自動化方式是什麼？我的答案是：讓一個 AI Agent 住進你們的通訊軟體裡。」

明確的市場區隔——不是大企業（已有 IT 部門 + 客製化系統）、也不是個人開發者（用 [[Claude Code]] 就夠），是「**沒有 IT 部門但業務動態變化的小型團隊**」這個夾層。

## 文章提到的工具與本 wiki 對應

| 文章用詞 | 對應 wiki entity | 備註 |
|---------|----------------|------|
| OpenClaw | [[OpenClaw]] | open-source desktop framework |
| **龍蝦 AI** | [[OpenClaw]] | **中文行銷別名 / 暱稱**（同一物） |
| Hermes OS | [[HermesOS]] | hermesos.cloud，managed cloud 商業服務 |
| Cursor / Windsurf / GitHub Copilot | （未獨立建頁） | 文章列為「vibe coding 工具典型」 |
| Claude.ai / Codex | [[Claude Code]] 旁系 / [[OpenAI-Codex-CLI]] | 文章列為「強但單一會話的限制」典型 |

## 觀點限制

- **單一作者觀點**：信心等級「中」（已知作者身分 + 該作者為 [[Hermes-Agent]] 99 案例整理者，所以對該生態有第一手認識；但仍是利益相關方論述，缺乏第三方驗證）
- **隱含商業立場**：作者明確說「我在推的 OpenClaw / Hermes OS」，並非中立評論
- **無數據佐證**：所有論點屬定性主張，文中無客戶數量、營收、成功率等量化證據
- **「Hermes OS」與 Hermes Agent 的細微差別文章未說清**：實際上 [[HermesOS]] 是 hermesos.cloud 的 managed 商品，建立在 Nous Research 的 [[Hermes-Agent]] 之上——文章交替使用兩個名詞，讀者可能混淆

## 跨來源關聯

- [[src-anthropic-founders-playbook-2026]]：Anthropic 官方版「Agentic Technical Debt」與本文「業務動態 vs 寫死的 code」是兩個獨立來源指向同一現象
- [[src-hermes-agent-99-cases]]：同作者整理的 99 案例網站，本文是該作者「自家論述」的延伸
- [[src-hermesos-cloud-landing]]：本文力推的商業服務的官方來源
- [[src-openclaw-wordpress-rag]]：[[OpenClaw]] 的代表使用案例（個人 wiki 既有匯入）

## 處理時新增 / 更新的頁面

- 新建 [[HermesOS]] entity
- 更新 [[OpenClaw]] entity（補「龍蝦 AI」中文別名 + HermesOS 主動承接 migration 的關係）
- 更新 [[Hermes-Agent]] entity（補：HermesOS 是其 managed cloud 包裝）
- 更新 [[Gas-Khuang]] entity（補真實全名 Gask Huang-Kai + FB handle）
- 更新 [[Vibe-Coding]] concept 頁（補「中小企業視角」一節）
