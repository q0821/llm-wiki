---
title: OpenClaw
type: entity
sources: [2026-04-07-OpenClaw × WordPress 輕量內部知識 RAG 系統.md, "Hermes Agent 成功案例 — 你的 AI 代理可以做什麼.md"]
created: 2026-04-16
updated: 2026-05-14
tags: [技術, AI, 工具, 框架]
confidence: 中
---

# OpenClaw

## 概要

AI Agent 框架，支援 Telegram / Discord / Slack 等平台。在 [[src-openclaw-wordpress-rag|WordPress RAG 筆記]] 中作為 MVP 快速驗證工具使用。**2026 年起社群觀察到顯著的 OpenClaw → [[Hermes-Agent]] 遷移趨勢**（詳見下方「遷移趨勢」段落）。

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

## 遷移趨勢：OpenClaw → Hermes Agent

[[src-hermes-agent-99-cases|Hermes 99 案例]] 中至少兩個 case 直接記錄遷移：

| Case | 重點 |
|---|---|
| **「從 OpenClaw 換到 Hermes，再也不回頭」** | 影子模式（Shadow Mode）並行運行 Hermes 驗證；切換後「功能更強、成本更低」 |
| **「從 OpenClaw 無縫遷移到 Hermes 的完整手冊」** | 社群整理遷移工具與設定轉換 |

對應觀察：

- [[Hermes-Agent]] 補足了 OpenClaw 缺少的元件——[[MEMORY-md|MEMORY.md]] 持久記憶、Skill 自動生成、多模型協作、跨平台訊息閘道（13 平台共用一個程序）
- 本知識庫 [[src-openclaw-wordpress-rag|WordPress RAG MVP]] 是 OpenClaw 的典型「快速 PoC」用法，這個定位仍然有效——但長期生產環境社群已大量遷往 Hermes
- [[Hermes-Agent]] 還有「Hermes 當其他 AI Agent 的看門狗」case 中明確指出可監控 OpenClaw 的執行狀態，反映出 OpenClaw 在「需要被監督」的成熟工具位置

## 相關頁面

- [[src-openclaw-wordpress-rag]] — 完整 RAG 實作筆記（OpenClaw 的代表使用案例）
- [[Hermes-Agent]] — 社群觀察到的主要遷移目標
- [[src-hermes-agent-99-cases]] — 含遷移敘事的 99 案例彙整
- [[RAG]] — 核心技術概念
- [[Cloudflare]] — 生產環境部署平台
