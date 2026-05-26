---
title: OpenClaw
aliases: ["龍蝦 AI", "龍蝦AI"]
type: entity
sources: [2026-04-07-OpenClaw × WordPress 輕量內部知識 RAG 系統.md, "Hermes Agent 成功案例 — 你的 AI 代理可以做什麼.md", "未命名-20260526-031034.md", hermesos-your-ai-agents-always-on.md]
created: 2026-04-16
updated: 2026-05-26
tags: [技術, AI, 工具, 框架, desktop-framework]
confidence: 中
---

# OpenClaw

## 概要

開源 AI Agent **desktop framework**，支援 Telegram / Discord / Slack 等平台。**中文圈別名「龍蝦 AI」**（claw → 蝦螯 → 龍蝦的命名取意，[[Gas-Khuang|Gask Huang-Kai]] 在 [[src-gask-ai-agent-vs-vibe-coding|論述貼文]] 中與 OpenClaw 交替使用）。在 [[src-openclaw-wordpress-rag|WordPress RAG 筆記]] 中作為 MVP 快速驗證工具使用。

**2026 年起出現顯著的 OpenClaw → [[HermesOS]] 遷移趨勢**——並非純技術自然取代，而是 [[HermesOS]]（hermesos.cloud）把「OpenClaw migration」做成商品功能主動承接（詳見下方「遷移趨勢」段落）。

## 技術資訊

- 可在 [Zeabur](https://zeabur.com) 上快速部署
- 支援 BM25 關鍵字搜尋與 [[Embedding]] 語意搜尋
- MVP 開發速度：16 天完成，基本搜尋約 6 小時、語意搜尋約 12 小時

## 在 RAG 專案中的角色

作為第一代 MVP 使用，後續升級為 [[Cloudflare]] Workers 生產環境：

| | OpenClaw MVP | Cloudflare Production |
|--|--|--|
| 部署 | Zeabur（本機） | 全球邊緣（Workers） |
| 資料儲存 | JSON 檔 | Vectorize + D1 |
| 前端 | Telegram + 試運行頁面 | Chat Widget + 獨立頁 |
| 後台 | 無 | Admin UI |

## 遷移趨勢：OpenClaw → HermesOS / Hermes Agent

兩層機制：

### 1. 商業承接（HermesOS 主動）

[[HermesOS]]（hermesos.cloud）首頁 tagline 與賣點直接針對 OpenClaw 用戶：

| 證據 | 來源 |
|---|---|
| 首屏 tagline：「**OpenClaw forgets. Hermes compounds.**」 | [[src-hermesos-cloud-landing]] |
| 商品功能：「**OpenClaw migration built in.** Your existing setup, prompts, and skills transfer over intact. No starting from scratch.」 | [[src-hermesos-cloud-landing]] |
| FAQ「How is this different from OpenClaw?」回答：「OpenClaw is an excellent open-source **desktop** framework. HermesOS is a fully managed, production-grade **cloud** environment.」 | [[src-hermesos-cloud-landing]] |

定位差異是「**desktop self-hosted vs cloud managed**」——HermesOS 不否定 OpenClaw 是好框架，而是把它定位在「需要週末折騰自己跑」的位置。

### 2. 社群遷移敘事

[[src-hermes-agent-99-cases|Hermes 99 案例]] 中至少兩個 case 直接記錄遷移：

| Case | 重點 |
|---|---|
| **「從 OpenClaw 換到 Hermes，再也不回頭」** | 影子模式（Shadow Mode）並行運行 Hermes 驗證；切換後「功能更強、成本更低」 |
| **「從 OpenClaw 無縫遷移到 Hermes 的完整手冊」** | 社群整理遷移工具與設定轉換 |

### 3. 並存觀點：OpenClaw 還活著

[[src-gask-ai-agent-vs-vibe-coding|Gask Huang-Kai 2026-05 論述]]中 OpenClaw 與 Hermes OS **並列**提到三次（「像是 OpenClaw、Hermes OS」「我在推的 OpenClaw / Hermes OS」「不論是龍蝦 AI、Hermes OS」），同一作者既推 HermesOS 也保留 OpenClaw 推薦——意味著 OpenClaw 在「快速 PoC + 不想被 cloud 鎖住」的 niche 仍有實戰位置。

### 對應觀察

- [[Hermes-Agent]] 補足了 OpenClaw 缺少的元件——[[MEMORY-md|MEMORY.md]] 持久記憶、Skill 自動生成、多模型協作、跨平台訊息閘道（13 平台共用一個程序）
- 本知識庫 [[src-openclaw-wordpress-rag|WordPress RAG MVP]] 是 OpenClaw 的典型「快速 PoC」用法，這個定位仍然有效——但長期生產環境社群已大量遷往 HermesOS / Hermes Agent
- [[Hermes-Agent]] 還有「Hermes 當其他 AI Agent 的看門狗」case 中明確指出可監控 OpenClaw 的執行狀態，反映出 OpenClaw 在「需要被監督」的成熟工具位置

## 相關頁面

- [[src-openclaw-wordpress-rag]] — 完整 RAG 實作筆記（OpenClaw 的代表使用案例）
- [[HermesOS]] — 主動承接遷移的 managed cloud 商業服務（首屏 tagline 直接針對 OpenClaw）
- [[Hermes-Agent]] — 社群遷移目標的底層框架（Nous Research 開源）
- [[src-hermesos-cloud-landing]] — 商業承接機制的官方來源
- [[src-hermes-agent-99-cases]] — 含社群遷移敘事的 99 案例彙整
- [[src-gask-ai-agent-vs-vibe-coding]] — 並存推薦的中文圈論述
- [[RAG]] — 核心技術概念
- [[Cloudflare]] — 生產環境部署平台
