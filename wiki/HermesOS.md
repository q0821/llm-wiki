---
title: HermesOS
type: entity
sources: [hermesos-your-ai-agents-always-on.md, 未命名-20260526-031034.md]
created: 2026-05-26
updated: 2026-05-26
tags: [managed-cloud, agent-hosting, hermes-agent, byo-key, smb-automation]
confidence: 強
---

# HermesOS

由 hermesos.cloud 提供的 **managed cloud agent hosting** 商業服務，把 [[Hermes-Agent]]（Nous Research 開源框架）包裝成「5 分鐘部署、BYO key、月費訂閱」的雲端託管商品。**不是** [[Hermes-Agent]] 本身——前者是商業服務，後者是底層開源 agent 框架。

詳細落地頁原文見 [[src-hermesos-cloud-landing]]。

## 基本資訊

- **網址**：https://hermesos.cloud/
- **路線圖**：https://hermesos.cloud/roadmap
- **底層**：Built on [[Hermes-Agent]]（Nous Research）
- **商業模型**：BYO API key（OpenRouter / OpenAI / Anthropic）+ 月費訂閱
- **加密 token**：$HermesOS（折扣支付 + 持有制訪問）
- **規模快照**（2026-05-26）：985 deployed all-time · +111 today

## 三個 entity 的關係釐清

| 層 | 名稱 | 角色 | 商業性 |
|---|------|------|--------|
| 底層框架 | [[Hermes-Agent]] | Nous Research 開源 agent 框架 | 開源、免費 |
| 雲端託管 | **HermesOS** | hermesos.cloud 把上述框架做成 managed cloud | 商業服務（Free/Pro/Power 三階） |
| 競爭對手 | [[OpenClaw]] | open-source desktop framework，HermesOS 主動承接 migration | 開源 |

這三者過去在 [[src-hermes-agent-99-cases|99 案例]] 與 [[OpenClaw]] 既有頁的敘事中混在一起——本頁的價值是把「框架／託管／競品」三層明確分開。

## 核心賣點

| 賣點 | 對應傳統痛點 |
|------|-----------|
| 5 分鐘部署 | self-host Hermes Agent 需要一個週末 |
| Zero config 全堆疊 | Docker / config / StackOverflow 凌晨 debug |
| Unlimited agent profile | 每個 agent 加錢 |
| BYO key 零加成 | reseller 加成或自己當 reseller 的合規風險 |
| Telegram/Discord/Slack/WhatsApp 原生 | 自己接整合工程 |
| **OpenClaw migration built in** | 既有 [[OpenClaw]] 用戶能無痛轉移 |
| Auto-restart + 日備份 | 自己維運 |

## 定價（launch 期 2026-05）

| 方案 | 月費 | 規格 |
|------|------|------|
| Free | $0 | 0.5 vCPU / 1 GB / 1 agent |
| Pro | $9.99 | 2 vCPU / 4 GB / 3 agents |
| Power | $19.99 | 4 vCPU / 8 GB / unlimited agents |

**支付路徑**：月費信用卡 / 年費信用卡 / $HermesOS token 年費 / $HermesOS token 持有制（hold 即免訂閱）。

## 路線圖（站內公開）

- **Operator Packs**：pre-built agent templates（research / trading intel / content automation 一鍵部署）
- **Marketplace**：使用者可賣自製 operator pack，以 $HermesOS 結算
- **Agent Endpoints**：把自己的 agent 開成 callable API，其他 agent 付費呼叫
- **Hive Mind**：agent 之間共享所學，「全網路一起變聰明」——對應 [[Self-Improving-Agent]] 範式

## 與 [[OpenClaw]] 的競爭定位

HermesOS 官網首屏 tagline：「**OpenClaw forgets. Hermes compounds.**」

這比 [[src-hermes-agent-99-cases|99 案例]] 中的社群「遷移敘事」更直接——HermesOS 把「OpenClaw 用戶遷移」做成商品功能（**OpenClaw migration built in**）。對 wiki 既有 [[OpenClaw]] 頁「2026 起被 Hermes 取代趨勢」的描述提供了商業機制層的解釋：不是技術自然取代，是 HermesOS 主動承接。

## 與 [[Managed-Agents]] 的對位

| 維度 | HermesOS | [[Managed-Agents\|Anthropic Managed Agents]] |
|------|---------|---------|
| 廠商 | hermesos.cloud（獨立） | [[Anthropic]] 親生 |
| 底層 | [[Hermes-Agent]] 開源 | Claude + 自家 harness |
| 模型自由度 | BYO key（多家可選） | 限 Claude family |
| 通訊平台 | Telegram/Discord/Slack/WhatsApp 原生 | Skills + scheduled runs（[[Claude-Cowork]]）|
| 定價 | 月費訂閱 $9.99 起 | API 計費 + 託管費 |
| 目標市場 | SMB + 個人 | enterprise + developer |

兩者是「同一個 managed agent 趨勢」的兩個切片——前者開源底層 + 多模型 + SMB 親近、後者單一供應商 + 完整堆疊 + enterprise。

## 與 [[src-gask-ai-agent-vs-vibe-coding|Gask Huang-Kai 論述]] 的關係

[[Gas-Khuang|Gask Huang-Kai]] 那篇「為什麼我不推 vibe coding」的 7 個論點，從「訂閱 vs API Key」、「通訊軟體型 agent」到「5-50 人台灣中小企業目標市場」，**幾乎逐點對應 HermesOS 的賣點**。可以看作「在地中文圈推廣者把官方賣點本地化的論述版本」。

## 信心評估

- **強**：服務存在、定價結構、與 Hermes Agent 的層次關係——官方來源
- **中**：「5 分鐘部署」「OpenClaw migration intact」的實際體驗——行銷宣稱
- **弱**：$HermesOS token 的長期經濟穩定性、與 Nous Research 的商業/授權關係細節

## 相關實體

- [[Hermes-Agent]] — 底層框架（Nous Research）
- [[OpenClaw]] — 主動承接遷移的競品（中文別名「龍蝦 AI」）
- [[Gas-Khuang|Gask Huang-Kai]] — 中文圈主要推廣者（GitHub username Gas Khuang / 真實全名 Gask Huang-Kai）
- [[Nous-Research]] — Hermes Agent 出品方（尚未建獨立頁）

## 相關概念

- [[Self-Improving-Agent]] — Hive Mind 路線圖的範式對應
- [[Managed-Agents]] — 同類「managed cloud agent」趨勢
- [[Agent-Skills]] — multi-agent profile 的延伸
- [[MEMORY-md]] — persistent memory 的對應實作層
