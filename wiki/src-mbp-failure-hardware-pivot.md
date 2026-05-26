---
title: MBP 三年保固剛過就掛 — 個人開發硬體採購策略轉向
type: source
sources: ["未命名 1.md"]
created: 2026-05-26
updated: 2026-05-26
tags: [personal-hardware, dev-environment, macbook, framework-desktop, ssh-remote]
confidence: 強
---

# MBP 故障與下一代硬體採購策略轉向

## 觸發事件

2026-05 左右 MacBook Pro **過三年保固才一個月**就掛了，維修店診斷為**顯示晶片損壞無法維修更換**。

## 採購策略反應

### 短期結論
> 「覺得筆電不需要買太好容易壞，下一台決定 MBA M5 24g 就好了，搭配 ram 夠多的工作站桌機，現在都可以 ssh remote 連線開發。」

**新模型**：輕薄筆電（MBA M5 24g）+ 大記憶體工作站桌機，透過 SSH remote 開發。
- 邏輯轉向：不再把「筆電 = 主力開發機」當預設
- 風險分散：筆電壞了不影響開發環境（環境在桌機上）
- 成本控制：不再為了「可攜性 + 性能」雙重 max-out 多付錢

### 中期保險已就位
> 「好險去年買了台 Framework Desktop 128g，現在不管 GB10/Mac Mini/Mac Studio 不是漲價超貴就是缺貨....😅」

**Framework Desktop 128g** 是 2025 採購，2026 看的市場狀況：
- **NVIDIA GB10**（Project DIGITS）：漲價超貴
- **Mac Mini**：缺貨
- **Mac Studio**：漲價超貴

意外的 timing：在工作站價格全面上漲 / 缺貨潮之前完成採購。

## 對個人 dev environment 設計的影響

| 角色 | 過去模型 | 新模型 |
|------|---------|--------|
| 主力開發機 | MBP（筆電 + 性能 + 可攜） | 工作站桌機（Framework Desktop 128g）|
| 移動端 | （同筆電） | MBA M5 24g（輕、便宜、隨用隨換）|
| 連線方式 | local everything | SSH remote |
| 容錯 | 一機壞 = 工作中斷 | 筆電壞不影響開發環境 |

## 觀察

這是個人版的「**fungible client / persistent server**」模式——跟 [[Cloudflare]]、Vercel Sandbox（雲端 dev 環境）的設計哲學相同方向，差別是用自己的工作站當「server」而非雲端。

對於整天在 [[Claude Code]] / Cursor / [[OpenAI-Codex-CLI|Codex]] 等 agentic CLI 工作的人，主力 client 機器壞掉的傷害**遠低於**這些 agent 跑的環境本身壞掉——把 RAM / GPU / 大模型本地推理放在桌機上是合理重心配置。

## 信心評估

- **強**：事件本身（MBP 故障 + 維修店診斷 + 個人決策已下）
- **強**：硬體市場現況（GB10 / Mac Mini / Mac Studio 缺貨 / 漲價是公開消息）
- **中**：新模型實際效益——需 MBA M5 24g 入手 + 跑一段時間驗證 SSH remote 工作流是否真的順手

## 後續觀察候選

- MBA M5 24g 入手後實際的 SSH remote 開發體驗（延遲、可離線時的退場機制等）
- Framework Desktop 128g 跑本地 LLM（[[Gemma]]、[[LM-Studio]] 等）的實際 throughput
- 若 macbook 顯卡損壞屬於某批次設計缺陷，記錄一下避免未來重蹈

## 相關概念

- [[LM-Studio]] / [[Gemma]] — Framework Desktop 128g 跑本地 LLM 的相關工具
- 暫無對應的「個人 dev environment 設計」概念頁（若未來累積多筆，可考慮建立）
