---
title: DESIGN.md
type: concept
sources: [src-design-md-revolution.md]
created: 2026-04-16
updated: 2026-04-20
tags: [設計系統, AI工具, UI, Markdown]
confidence: 強
---

# DESIGN.md

DESIGN.md 是由 Google Stitch（2026 年 3 月）提出的**純 Markdown 格式設計系統規範**，讓 AI coding agent 能直接讀懂並執行視覺設計規則，解決 AI 生成 UI 風格不一致的問題。

## 核心概念

- **格式**：純 Markdown，LLM 原生理解
- **定位**：設計系統的 AI 可讀版本
- **作用**：放在專案根目錄，AI agent 自動讀取並遵循

## 相容工具

Claude Code、Cursor、Gemini CLI、GitHub Copilot、Windsurf

## 相關資源

- [[src-design-md-revolution]] — 完整介紹與 awesome-design-md 專案（含 68 個品牌分類）
- **awesome-design-md** — GitHub 策展，59.9k stars（2026-04-20），官方 https://getdesign.md/
- **oh-my-design** — 線上生成器，62 個品牌設計系統可選

## 採用動能

短短 2-3 週內，awesome-design-md 從 4.3k stars → 59.9k stars，收錄品牌從 55+ → 68。顯示 DESIGN.md 正快速成為 AI 時代的設計系統事實標準（de facto standard）。

## 與其他概念的關係

- [[Agent-Skills]] — DESIGN.md 是 design agent 的輸入規格
- [[RAG]] — 兩者都是讓 AI 取得外部知識的機制，DESIGN.md 更靜態、更精準
- [[src-claude-code-context-management]] — Claude Code 讀取 DESIGN.md 時的上下文策略
