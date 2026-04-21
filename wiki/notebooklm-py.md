---
title: notebooklm-py
type: entity
sources: [只要 5 分鐘！Claude Code 無縫整合 NotebookLM 實戰.md]
created: 2026-04-20
updated: 2026-04-20
tags: [開源工具, CLI, NotebookLM, Python, Skills]
confidence: 強
---

# notebooklm-py

林探（影片中稱「林先生」）開發的 NotebookLM Python CLI 工具，讓 [[NotebookLM]] 可以被命令列呼叫，進而被 Claude Code 等 AI agent 自動化操作。

## 基本資訊

- 開發者：林探
- 語言：Python
- 形式：CLI tool + 配套 Claude Code Skill
- 安裝方式：透過 Claude Code 自動安裝，或手動安裝後執行 `agent setup notebooklm`

## 主要指令

| 指令 | 功能 |
|------|------|
| `notebooklm login` | 登入 NotebookLM 帳號（會跳出瀏覽器視窗） |
| `agent setup notebooklm` | 安裝 NotebookLM Skill 到 Claude Code |
| `/notebooklm`（在 Claude Code 內） | 觸發 NotebookLM 工作流 |

## 安裝流程（影片示範）

1. 把 GitHub repo 連結貼給 Claude Code，請它幫忙安裝
2. 選擇安裝範圍（global 還是 project local）
3. 執行 `notebooklm login` 完成 Google 認證
4. 重啟 Claude Code，輸入 `/` 應可看到 `/notebooklm` 指令

## 重要性

- 解決了 NotebookLM 沒有官方 API 的問題
- 是 Claude Code 與 [[NotebookLM]] 整合的關鍵介接層
- 屬於「擴展 AI agent 能力的 wrapper 工具」這個逐漸成形的生態類別

## 在各來源中的角色

- [[src-claude-code-notebooklm]]：Claude Code → NotebookLM 整合的核心工具，搭配自製 yt-search Skill 完成完整工作流

## 相關實體

- [[NotebookLM]] — 此 CLI 工具呼叫的目標服務
- [[HC-AI-說人話]] — 在 YouTube 推廣此工具用法的創作者

## 相關概念

- [[Agent-Skills]] — notebooklm-py 透過 Skill 形式被 AI agent 使用
