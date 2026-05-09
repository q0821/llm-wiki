---
title: LM Studio
type: entity
sources: ["yt-別再小看本地-aigemma-4-lm-studio-讓你的電腦變成超級離線-ai-工作站而且完全免費-手機也能使用喔.md"]
created: 2026-05-10
updated: 2026-05-10
tags: [本地-ai, gui, llm-runtime, lm-studio]
confidence: 強
---

# LM Studio

跨平台桌面工具（macOS / Windows / Linux），用**圖形化介面**在本機執行各種 open weights LLM（如 [[Gemma]]、Llama、Qwen）。本知識庫的「本地 AI」分支主要工具。

## 基本資訊

- **官網**：https://lmstudio.ai/
- **平台**：macOS / Windows / Linux
- **類型**：本地 LLM runtime + GUI
- **費用**：免費（個人使用）
- **典型對照**：Ollama（CLI 取向，工程師偏好）

## 為何 LM Studio（vs Ollama）

| 面向 | LM Studio | Ollama |
|---|---|---|
| 介面 | **GUI** | CLI（終端機指令）|
| 入門曲線 | 低（適合非工程師）| 中（要懂指令）|
| 模型管理 | 圖形化清單、一鍵下載 | 指令安裝 |
| 對話 | 內建 chat UI | 需另接前端 |
| 開發者模式 | 可開本地 server | 預設就是 server |

> [[PAPAYA-電腦教室]]：「一款是較為工程師取向的 Ollama，主要是透過終端機的指令來進行操作；今天我們要使用的，是==對電腦初學者相當友善的 LM Studio==，它有提供圖形化的操作介面，在使用上非常地直覺且容易上手。」

## 主要功能（按使用流程）

### 1. 搜尋與下載模型

- 內建 LM Studio 模型清單
- 模型旁三個圖示標明能力：**視覺 / 使用工具 / 推理**
- **綠色標籤** = 你的電腦跑得動
- 可按「最受歡迎」「下載次數」排序

### 2. My Models 頁面

- 統一管理已下載模型
- Delete 移除不用的模型
- 齒輪按鈕內有重要設定（**Context Length**、推論參數）

### 3. Inference 設定

- **Context Length**：4096（預設聊天用）/ 較大值（處理長文件）
- **System Prompt**：跨對話持久套用的規則（語言、不確定就說不知道等）

### 4. 聊天功能

- 上傳檔案（Word / CSV / 圖片 / 音訊）分析
- **Branch（分支）**：保留上下文切出新對話，比較不同 prompt 不弄亂主對話
- 輸出對話為 md / PDF
- 資料夾整理對話記錄

### 5. [[MCP]] 工具整合

- 工具標籤 → 編輯 MCP → 貼設定 + API key
- 側邊欄出現對應 MCP 開關
- 常見：Brave Search（連網）、Filesystem（檔案管理）

### 6. 開發者模式（給程式碼助手用）

- **開發者頁** → 開啟本地伺服器
- 配合 VS Code 的 **Continue** 擴充功能
- VS Code Continue 連接 LM Studio → 在編輯器內用本地 AI 寫程式

## 在本知識庫的角色

LM Studio 是「本地 AI 工作站」的核心節點，與 [[Claude Code]] 形成對立軸：

| | [[Claude Code]] | LM Studio |
|---|---|---|
| 模型來源 | Anthropic 雲端 | 本機（任選 open weights）|
| 介面 | 終端機 + agent loop | GUI + chat |
| 持久性 | CLAUDE.md / Memory / Skills | System Prompt（無跨檔案結構）|
| 工具呼叫 | 內建 + MCP | MCP（需手動設定）|
| 隱私 | 資料上 Anthropic | **資料留本機** |

> 兩者**互補不互斥**——隱私敏感用 LM Studio、複雜推理用 Claude Code。

## 與 [[MCP]] 的關係

LM Studio 在 2026 完整支援 [[MCP]] 協議：透過 MCP，本地 LLM 可呼叫 Brave Search、檔案系統、Gmail 等外部服務，補足 open weights 模型「沒有 internet」「沒有檔案系統權限」的限制。

## 信心評估

- **強**：基本功能、操作介面 — 影片完整示範
- **強**：MCP 整合 — 影片實測 Brave Search + 檔案系統 MCP
- **中**：與 Ollama 的對照 — 影片只略提，未深入比較

## 相關頁面

- [[Gemma]] — 在 LM Studio 上執行的代表模型
- [[MCP]] — LM Studio 主要外部整合機制
- [[src-papaya-gemma-lm-studio]] — 完整操作教學來源
- [[Claude Code]] — 雲端 agent 對照組
