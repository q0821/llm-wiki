---
title: Mnimiy
type: entity
sources: [bnext-claude-md-12-rules.md]
created: 2026-05-20
updated: 2026-05-20
tags: [community-researcher, claude-md, ratchet-pattern]
confidence: 中
---

# Mnimiy

社群實驗者 / 工程實證者，X handle [@Mnilax](https://x.com/Mnilax)。在本知識庫中是 **[[CLAUDE-md|CLAUDE.md]] 12 條規則** 8 條擴充作者，與 **[[Ratchet-Pattern]] 克制原則** 的第 3 個獨立來源。

## 基本資訊

- **身份**：社群實驗者 / 工程實證者（非廠商員工）
- **代表性貢獻**：CLAUDE.md 12 條規則中的 8 條擴充（基於 [[Andrej-Karpathy]] AI 寫程式 3 缺失觀察 + Forrest Chang 原始 4 條規則）
- **代表性實驗**：**30 codebase / 6 週盲測**——量化證明 CLAUDE.md 規則的效益（無規則 41% 錯誤率 → 4 條 11% → 12 條 3%）
- **論述風格**：以盲測量化數據為主軸，避免主觀判斷
- **公開原始實證**：[X @Mnilax 推文串](https://x.com/Mnilax/status/2053116311132155938)

## 在本知識庫中的角色

### 1. CLAUDE.md 12 條規則的 8 條擴充作者

論述者地圖：
- [[Andrej-Karpathy]] 提出 AI 寫程式 3 缺失 → Forrest Chang 整理成 **4 條** CLAUDE.md 規則（GitHub 12 萬星）→ **Mnimiy 補 8 條** 應對「複雜多步驟 agent」與「大型專案」漏洞

Mnimiy 8 條擴充主要對應的缺口：
- 複雜多步驟 agent 場景（原 4 條僅涵蓋單一任務）
- 大型專案的記憶層管理
- AI quality collusion 防護（Rule 9 不能口頭聲稱測試通過）
- Token budget / 上下文密度管理

詳見 [[CLAUDE-md]] 與 [[src-bnext-claude-md-12-rules]]。

### 2. [[Ratchet-Pattern]] 克制原則第 3 個獨立來源

Mnimiy 提出的核心原則：**「規則只應防止你實際遇過的失敗」** —— 與 Google [[Addy-Osmani]]、OpenAI Mitchell Hashimoto 跨工程文化獨立得出同一原則。

在本 wiki 中是「業界 + 廠商全方位共識」的關鍵節點：
| 來源 | 原則來源 |
|---|---|
| [[Addy-Osmani]]（Google）| Ratchet 七元件之一 |
| Mitchell Hashimoto（OpenAI）| Harness Engineering 熵管理支柱 |
| **Mnimiy（個人實證）** | **「規則只防實際遇過的失敗」**——量化 30 codebase 證明 |
| Anthropic Applied AI team | 官方 3-6 月 review CLAUDE.md |
| [[Boris-Cherny]]（Anthropic）| 完成驗證心法 + Routines |

### 3. 三大 prompt 反模式的實證者

Mnimiy 透過 30 codebase 盲測得出的反模式（[[src-bnext-claude-md-12-rules]] 詳述）：

1. **抽象規則 > 具體範例**——抽象規則優於具體範例（與直覺相反）
2. **情緒喊話 / 角色扮演無用**——「你是資深工程師」「請非常仔細」等修辭無效
3. **依賴特定工具的死指令**——指名要用特定 framework / library 的規則易過時、易出 bug

這 3 個反模式直接影響本 wiki 既有 [[Prompt-Pack-Pattern]] 與 [[CLAUDE-md]] 頁面的具體規範。

## 信心評估

- **強**：12 條規則原文（bnext 完整列出）+ 與其他工程文化的同源原則對照
- **中**：30 codebase / 6 週盲測為 Mnimiy 單方面數據——未獨立驗證，但有 Anthropic 官方範本與 Forrest Chang GitHub 12 萬星二次佐證

## 相關連結

- 主要來源：[[src-bnext-claude-md-12-rules]]（bnext 二次整理，作者蘇柔瑋）
- 規則固化載體：[[CLAUDE-md|CLAUDE.md]]
- 同源原則：[[Ratchet-Pattern]] / [[Addy-Osmani]]（Google 視角）
- 上位概念：[[Andrej-Karpathy]] AI 寫程式 3 缺失 → Forrest Chang 4 條 → 本人 8 條擴充
- 對標廠商版：[[Boris-Cherny]] 完成驗證心法（Anthropic 廠商版的同源原則）
- 反模式對策：[[AI-Quality-Collusion]] / [[Prompt-Pack-Pattern]]
