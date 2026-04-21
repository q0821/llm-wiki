---
title: NotebookLM
type: entity
sources: [只要 5 分鐘！Claude Code 無縫整合 NotebookLM 實戰.md]
created: 2026-04-20
updated: 2026-04-20
tags: [Google, AI工具, RAG, 研究工具]
confidence: 強
---

# NotebookLM

Google 推出的免費 AI 研究工具，本質上是一個**閉合式 RAG 系統**——只根據使用者上傳的 source 回答，搭配 Gemini 模型運作。

## 基本資訊

- 開發者：Google
- 模型：Gemini
- 費用：免費
- 介面：網頁版 + CLI（透過第三方工具 [[notebooklm-py]]）

## 核心能力

| 功能 | 說明 |
|------|------|
| Source 上傳 | 支援 YouTube 連結、PDF、網頁、文字檔 |
| 深度分析 | Gemini 對 source 內容做摘要、提取重點 |
| Mind Map | 視覺化內容結構心智圖 |
| Info Graphic | 自動生成資訊圖表 |
| Study Guide / Quiz | 學習用文件與測驗 |
| Audio Overview | 將內容轉為對談式 podcast 音訊 |
| 影片摘要 | 自動生成影片版摘要 |
| Data Table / CSV | 結構化資料輸出 |

## 解決的問題

1. **AI 幻覺**：所有輸出都基於 source，不自由發揮
2. **Token 消耗**：把分析工作外包給 Gemini，不消耗其他 LLM 的 token quota
3. **影片研究**：補足 Claude Code 等工具處理影片能力的不足

## 與 Claude Code 的整合

透過 [[notebooklm-py]] CLI 工具 + NotebookLM Skill，Claude Code 可以：

- 建立 / 切換 notebook
- 上傳 source（YouTube URL、文件）
- 對 NotebookLM 提問
- 觸發圖表 / Audio Overview 生成

詳見 [[src-claude-code-notebooklm]]。

## 在各來源中的角色

- [[src-claude-code-notebooklm]]：作為 Claude Code 的「外部研究 RAG」，承擔 token-密集的影片分析工作

## 相關概念

- [[RAG]] — NotebookLM 是「閉合式 RAG」的代表
- [[Agent-Skills]] — 透過 NotebookLM Skill 暴露給 AI agent 使用

## 相關實體

- [[notebooklm-py]] — 第三方 CLI 工具，讓 NotebookLM 可被自動化呼叫
- [[HC-AI-說人話]] — 推廣 Claude Code + NotebookLM 整合的創作者
