---
title: Figma
type: entity
sources: ["(5) Will AI Kill SaaS系列：... - Yu-Chih Edward Hwang.md", "【直播筆記】用 Claude Design × Claude Code × Figma 重新定義設計工作流程 - AAPD 產品設計學院.md"]
created: 2026-04-28
updated: 2026-05-14
tags: [design-tool, saas, company, mcp]
confidence: 強
---

# Figma

雲端協作介面設計工具，2026 年因 AI 衝擊論述被置於「會被殺死的 SaaS」討論核心。但實作者觀察 [[Figma]] 與 [[Claude-Design]] / [[Claude Code]] 形成「**雙向迭代**」關係，並非單向被取代。

## 基本資訊

- **產品定位**：UI / UX 介面設計工具，雲端協作
- **競爭對手**：[[Adobe]]（XD 線已收）、[[Claude-Design]]（新興 AI 原生）
- **MCP 整合**：透過 MCP 架構實現 Code to Design / Design to Code（見來源配圖 `figma-mcp-architecture-2026-04-24.png`）

## 在各來源中的角色

- [[src-will-ai-kill-saas-design]]：核心討論對象。作者觀察上市 120 → 不到 20（不到一年）；雖積極推 AI 工具與整合，但仍承壓。**作者明確表示不會買 Figma 股票**。
- [[src-aapd-claude-design-figma-workflow]]：實作者觀察。[[Simon-Lin|Simon]] 認為 [[Figma]] 與 [[Claude-Design]] 變成「雙向快速來回迭代」的關係——不是 Claude 取代 Figma，而是兩者形成新分工。實作 Figma MCP 雙向操作後也明確指出當前 bug（Auto layout、色彩 hard-code）需要設計師人工補強。

## Figma MCP 的雙向操作（[[Simon-Lin|Simon]] Demo）

[[Claude Code]] 透過 [[Figma]] [[MCP]] 雙向操作：

| 方向 | 觸發方式 | 用途 |
|---|---|---|
| **Code → Figma** | 小腳本指令 `Figma capture` + `Figma delay` 加上區塊 URL | 把 React 程式碼產出到 Figma 形成可編輯設計檔——「把開發成果反向同步回設計檔」 |
| **Figma → Code** | 在 Figma 調整版位，右鍵複製選取的 link，貼回 [[Claude Code]] | 用白話文驅動 Claude 讀取 Figma 最新狀態並反映到程式碼 |

**現況限制**：
- MCP 串接仍有 bug
- Auto layout 處理得不夠漂亮
- 顏色樣式可能都是 hard-coded
- 需要設計師事後手動檢查跟補強
- 整體流程「堪用但離完美、乾淨還有一段距離」

> 這個觀察**反向佐證**了 [[src-will-ai-kill-saas-design]]（Yu-Chih）的論點：「AI 很難做到把這個陰影往左下角移動 2px，並帶有冷色調的模糊——當你需要極端精緻的客製化時，人類依然需要這類專業工具」。

## AI 時代的護城河（依來源觀點）

過去護城河：將想像力具象化成視覺像素。

**轉變後的價值**：
1. **美學共識與品牌靈魂的錨點（Design System Source of Truth）**——AI 能快速生成幾百個介面，但要符合特定品牌的字體、間距、情緒、微互動，需要高精確度控制中心
2. **精細的像素級控制（Pixel-perfect Control）**——AI 難做「把這個陰影往左下角移動 2px，並帶有冷色調的模糊」這類極端精緻客製化

**潛在威脅**：
- [[Claude-Design]]：直接產出可點擊 React 元件，繞過設計稿
- [[DESIGN-md]] 標準化：用純文字檔承載品牌規範，部分功能可被 Markdown + AI 取代
- 教育綁定（設計系課程）的鬆動：年輕世代從 AI 工具入門，不再以 Figma 為起點

## 相關實體

- [[Adobe]]：傳統設計工具雙雄之一，面臨類似 AI 衝擊
- [[Claude-Design]]：Anthropic 推出的 AI 原生設計產品，被視為對 Figma 的直接威脅
- [[Yu-Chih-Edward-Hwang]]：「Will AI Kill SaaS」系列作者
- [[Simon-Lin]]：實作者，提供 Figma MCP 雙向操作的第一手 Demo
- [[AAPD]]：發表 Simon 直播筆記的設計教育平台

## 相關概念

- [[Agentic-AI-Workflow]]：Code to Design 雙向流動會直接削弱靜態設計稿的價值
- [[DESIGN-md]]：與 Figma 的「Design System」功能形成競合
- [[Vibe-Coding]]：Vibe Coding 文化下，設計稿的中介價值下降
- [[MCP]]：Figma MCP 是 [[Figma]] 接 AI agent 的關鍵介面，Simon Demo 中的 `Figma capture` + `Figma delay` 指令即透過 MCP 雙向同步
