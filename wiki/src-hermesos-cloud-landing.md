---
title: HermesOS 官方落地頁 — Your AI Agents, Always On.
type: source
source_url: https://hermesos.cloud/
sources: [hermesos-your-ai-agents-always-on.md]
fetched: 2026-05-26
created: 2026-05-26
updated: 2026-05-26
tags: [hermesos, hermes-agent, openclaw, managed-cloud, agent-hosting, byo-key]
confidence: 強
---

# HermesOS 官方落地頁

hermesos.cloud 首頁全文擷取。這是 [[HermesOS]] entity 的主要來源；同時也是釐清 [[Hermes-Agent]]（Nous Research 開源框架）、[[OpenClaw]]（open-source desktop）、HermesOS（managed cloud）三者關係的權威證據。

## 核心定位（站內文字）

> 「HermesOS gets your Hermes agent running in under 5 minutes — with persistent memory, browser automation, and tool use. No Docker, no config files, no midnight debugging.」

> 「**OpenClaw forgets. Hermes compounds.** Built by Nous Research, Hermes lives on a server and remembers everything — projects, preferences, lessons learned. Every session makes it sharper. Getting it self-hosted takes most people a weekend. HermesOS takes that weekend down to 5 minutes.」

關鍵釐清：
- **HermesOS ≠ Hermes Agent**：HermesOS 是把 Nous Research 的 [[Hermes-Agent]] 包成 5 分鐘部署的 managed cloud 商品；前者是公司/服務，後者是底層開源框架
- **vs OpenClaw**：明確競爭關係，且**內建 OpenClaw migration**（「OpenClaw migration built in. Your existing setup, prompts, and skills transfer over intact」）

## 服務內容

### 零配置全堆疊
> 「Browser automation, tool use, terminal, memory, and cron — pre-configured. No Docker, no StackOverflow at midnight.」

### 多 agent profile
> 「Unlimited agent profiles on a single instance. Researchers, operators, specialists — no extra cost per agent.」

### BYO key 零加成
> 「OpenRouter, OpenAI, or Anthropic. Encrypted at rest, injected at deploy. We never see your AI spend.」

### 通訊平台原生整合
> 「Built-in dashboard with streaming. Connect Telegram, Discord, Slack, or WhatsApp — out of the box.」

### OpenClaw 遷移工具
> 「Your existing setup, prompts, and skills transfer over intact. No starting from scratch.」

### 穩定性保證
> 「Updates tested against your config before rollout. Auto-restart on failure. Daily backups — never more than 24 hours from clean restore.」

## 定價（2026-05 launch 期）

| 方案 | 月費 | vCPU | RAM | 同時 agent |
|------|------|------|-----|-----------|
| Free | $0 | 0.5 | 1 GB | 1 |
| **Pro** | **$9.99** | 2 | 4 GB | 3 |
| Power | $19.99 | 4 | 8 GB | Unlimited |

支付方式：
- 月費信用卡
- 年費信用卡（Pro $79、Power $149）
- $HermesOS token 年費（Pro $49、Power $99）
- $HermesOS token 持有制（Pro ~$99、Power ~$199 launch 期）

## 部署統計（站內公開）

> 「985 deployed all-time · +111 today」

時點：2026-05-26 fetch 當下。這是「初期商品」的規模——111/day 顯示在加速成長期。

## 商業模型觀察

- **訂閱制 + BYO key**：避開 OpenAI/Anthropic 抽成模式（也避開自己當 reseller 的合規風險）
- **$HermesOS token**：自有 token 用於支付折扣與「持有制」訪問（hold 一定數量免月費）。這是「Web3 風格的 SaaS access layer」設計
- **Operator Packs / Marketplace / Hive Mind 路線圖**：未來方向是「pre-built agent templates → marketplace → agent endpoints → 跨 agent 學習共享」。對應 [[Self-Improving-Agent]] 範式

## 使用情境（站內列舉）

| 情境 | 站內描述 |
|------|---------|
| DevOps & Monitoring | 「Reads logs, restarts failing services, pages you only when a human is actually needed. Remembers your stack.」 |
| Research & Competitive Intel | 「Give it a topic and a deadline. It browses, aggregates, and delivers a structured brief — then saves what it learned for next time.」 |
| Background Automation | 「Email triage, scheduling, API calls, spreadsheets — anything repetitive. Runs on cron while you sleep.」 |
| Customer Support Triage | 「Feed it your docs. It resolves common tickets, escalates the hard ones, and gets smarter with every conversation.」 |

## 與既有 wiki 的對位

| HermesOS 賣點 | 對應 wiki 概念 |
|--------------|-----------|
| Persistent memory | [[MEMORY-md]]、[[Self-Improving-Agent]] |
| BYO key (OpenRouter/OpenAI/Anthropic) | [[MCP]] 旁系——API 統一介面 |
| Multi-agent profile | [[Agent-Skills]]、[[Subagent-Driven-Development]] |
| Telegram/Discord/Slack/WhatsApp 原生 | [[Hermes-Agent]] 訊息平台覆蓋表 |
| Managed cloud | [[Managed-Agents]] 對位——Anthropic 同樣思路的官方版 |

## 信心評估

- **強**：服務內容、定價、技術整合——是 **first-party 官方來源**
- **中**：「OpenClaw migration」是否真的「transfer over intact」、「5 分鐘部署」實際體驗——屬行銷宣稱，需第三方使用者驗證
- **弱**：$HermesOS token 的經濟模型穩定性——加密 token 設計變數多

## 相關來源

- [[src-gask-ai-agent-vs-vibe-coding]] — [[Gas-Khuang|Gask Huang-Kai]] 力推此服務的論述貼文
- [[src-hermes-agent-99-cases]] — Hermes Agent 99 案例（[[HermesOS]] 是其商業化承接層）
- [[src-openclaw-wordpress-rag]] — OpenClaw 既有實作（HermesOS 遷移工具的對接對象）
