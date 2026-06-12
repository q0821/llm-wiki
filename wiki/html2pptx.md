---
title: html2pptx
type: entity
sources: ["x-taiyo-kimura-html2pptx-skill.md"]
created: 2026-06-13
updated: 2026-06-13
tags: [工具, pptx, 簡報, agent-skills, mcp, saas]
confidence: 中
---

# html2pptx

> 官網：https://html2pptx.app ｜ 開發者：@taiyo_ai_gakuse（Taiyo，日本獨立開發者）

把 HTML/CSS 轉換成**完全可編輯的 PowerPoint（PPTX）**的 SaaS 服務。核心賣點：AI（如 [[Claude Code]]）先生成 HTML 投影片（設計自由度高），再原樣轉成可給客戶/同事編輯的 PPTX——解決「AI 投影片好看但不能改」或「PPTX 原生生成醜」的兩難。

## 四種使用形態

| 形態 | 說明 |
|------|------|
| REST API | 自動化產線整合 |
| Agent Skill | 給 [[Claude Code]] 等 agent 的 skill（推文場景）|
| [[MCP]] | MCP 相容 agent（Claude Code、Codex 等）一鍵呼叫 |
| CLI | `npm install -g html2pptx-cli` → `html2pptx init`；可進 CI/CD |

特色設計：**localhost bridge**——在本地直觀編輯生成的 HTML，變更自動寫回源檔（本地優先工作流）。

## 價格（2026-06 快照）

- Free Preview：10 次/月（永久免費）
- Founder Beta：¥980/月，300 次
- Starter：¥2,980/月，3,000 次
- Business/Enterprise：¥9,800 起

## 競品定位（注意：多為賣方自述）

- vs **Claude Code 內建 pptx skill**：作者主張內建版「轉換範圍窄」，html2pptx 限制少（賣方主張，未實測）
- vs **Genspark**：作者自評「個人基準測試超越」（**賣方自評，信心弱**，詳見 [[src-x-taiyo-kimura-html2pptx-2026-06]]）
- vs 本人 Marp 工作流（`marp-rules.md`）：Marp 產 HTML/PDF 簡報但**不產可編輯 PPTX**；html2pptx 補的正是「交付可編輯檔」這一段。HTML 設計自由度也高於 Marp 的 markdown 約束

## 風險備忘

- SaaS 依賴：免費額度僅 10 次/月，重度使用需訂閱（日圓計價）
- 開發者為獨立開發者（一人 SaaS），長期維運風險自行評估
- 所有比較性主張均來自開發者本人，無第三方 benchmark

## 相關頁面

- [[src-x-taiyo-kimura-html2pptx-2026-06]] — 來源推文 + 利益衝突分析
- [[Agent-Skills]] — skill 生態清單
- [[Claude Code]] / [[OpenAI-Codex-CLI]] — 可整合的 agent 宿主
- [[MCP]] — 整合協定之一
