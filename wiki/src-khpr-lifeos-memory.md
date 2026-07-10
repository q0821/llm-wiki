---
title: lifeos-memory — Claude Code 外掛記憶層（@khpr Threads）
type: source
sources: ["Threads 上的 Eason Yao（@khpr）.md"]
created: 2026-07-11
updated: 2026-07-11
tags: [claude-code, memory, context, 工具型, threads]
confidence: 中
---

# lifeos-memory：Claude Code 外掛記憶層（@khpr Eason Yao）

**作者**：Eason Yao（@khpr）
**平台**：Threads（`Dahdq2YE66c`）
**抓取於**：2026-07-11
**類型**：工具型（工具發布分享，非論點型，不加個人吸收段）

解決 Claude Code「每次對話結束丟失上下文、重複踩坑、重複說明偏好」的外掛記憶層。與本知識庫既有的 [[MEMORY-md]]、[[Self-Improving-Agent]] 同一問題域。

## 五項功能

1. **踩坑卡** — 記錄遇到的問題，避免重複犯錯
2. **原子記憶卡** — Markdown 儲存偏好與決策，可版控
3. **自動摘要** — 每 10 分鐘自動生成對話日誌
4. **自動接線狗** — token 接近上限時自動保存進度檔，支援無縫續接
5. **向量索引** — 本機搜尋已存記憶，資料不上雲

**平台**：目前 macOS / Linux，Windows 待開發。
**數據點（時間敏感）**：33 讚、4 評論、1 轉發。

## 與本知識庫的關聯

- [[MEMORY-md]] — 同為「LLM 持久記憶」方案；lifeos-memory 是外掛工具版，[[MEMORY-md|MEMORY.md]] / CLAUDE.md 是原生檔案版
- [[Self-Improving-Agent]] — 「踩坑卡」= 從失敗中累積，呼應 [[Ratchet-Pattern]]
- [[Context-Engineering]] / [[Context-Rot]] — 「自動接線狗」在解 token 上限的 context 續接問題
- **對照使用者自建方案**：使用者本知識庫已有 `memory/` 目錄 + MEMORY.md 索引機制，概念高度重疊（原子記憶卡 ≈ 單檔單事實 + frontmatter；踩坑卡 ≈ feedback 型記憶）

> 使用者在此問題域已有自建實作，本頁按工具型登錄、不做深度吸收；價值在「外部生態出現同構方案」的對照佐證。

## 信心評估

- **中**：Threads 貼文，功能描述清楚但無法驗證實作品質與維護狀態；未提供 repo 連結（若後續採用需補查）
