---
title: az9713/claude-managed-agents — GitHub onboarding tutorial
type: source
sources: [claude-managed-agents-github-tutorial-az9713.md]
created: 2026-05-09
updated: 2026-05-09
tags: [managed-agents, claude-code, tutorial, github, onboarding]
confidence: 強
---

# az9713/claude-managed-agents — GitHub Onboarding Tutorial

**Repo**：https://github.com/az9713/claude-managed-agents
**作者**：az9713（社群開發者）
**抓取於**：2026-04-20（透過 WebFetch 萃取 README，因 fetch-url.sh 超時）
**性質**：[[Managed-Agents]] 的社群入門教學 repo

> **補建說明**：本來源 2026-04-20 已併入 [[Managed-Agents]] 概念頁的多來源，本次補建獨立 src 摘要頁以符合「一來源一頁」原則。

## 核心貢獻

提供 [[Managed-Agents]] 的「**最低門檻入門路徑**」：

- **30 行 working agent**：clone + npm install + `python run.py` 即可看到 agent 自動搜尋並摘要論文
- 全程 30-90 秒、單次成本 **$0.01-$0.05**（Claude Haiku 4.5）
- 5 part 教學文件（總 ~2.5 小時）

## 五部教學結構

| Part | 焦點 | 時長 |
|---|---|---|
| 1 | Architecture 與核心概念 | ~15 min |
| 2 | `run.py` setup walkthrough | ~30 min |
| 3 | Agent loop 機制 + streaming | ~25 min |
| 4 | Tools / permissions / cost controls | ~25 min |
| 5 | Capstone research agent project | ~45 min |

> Part 1 是關鍵基礎——建立 mental model；其他可按需學。

## Capstone 專案：AI Research Digest Agent

教學最終成品是一個 production-ready agent：

- 每天爬 arXiv 新論文
- 自動摘要 + 標註來源
- Email 推送結果
- 跑在 Claude Haiku 上**一年只要約 $3**

## 設計哲學

> Python SDK 做最薄一層，**重活全部 delegate 給 Claude Code CLI subprocess**（agent loop、tool execution、context compaction）

對應 [[Meta-Harness]] 的精神：python 端只負責「介面定義」，實作交給可替換的 subprocess。

## 與本知識庫的關聯

- [[Managed-Agents]] — 主概念頁，本來源是「**社群入門路徑**」相對於 Anthropic 官方部落格 [[src-anthropic-managed-agents-engineering|工程設計原理]] 的「**理論闡述**」
- [[Meta-Harness]] — Python SDK 薄層 + subprocess 重活的設計哲學
- [[Agent-Skills]] — Part 4 涵蓋 tools / permissions

## 信心評估

- **強**：教學結構與成本數字 — repo README 直接陳述
- **中**：實際執行品質 — 未實作驗證，僅依 README 摘要

## 忽略區段

- 詳細安裝步驟（具時效性、改用 repo README 為準）
