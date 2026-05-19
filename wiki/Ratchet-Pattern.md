---
title: Ratchet Pattern（棘輪模式：規則只增不減）
type: concept
sources: ["未命名.md", "Harness Engineering（AI駕馭工程）入門篇：OpenAI最新編程標準，教你輕鬆做到Lv.1.md", "bnext-claude-md-12-rules.md"]
created: 2026-05-14
updated: 2026-05-19
tags: [harness-engineering, design-pattern, agent, error-handling, configuration]
confidence: 強
---

# Ratchet Pattern（棘輪模式）

把 AI agent 的每個錯誤當成**永久信號**而不是一次性意外——每次失敗都被編碼成下一版系統的規則或檢查機制，讓同類錯誤不再發生。「Ratchet（棘輪）」隱喻只往一個方向轉、不會倒退。

## 定義

來自 [[Addy-Osmani]] 在 [[src-addy-osmani-harness-engineering|Harness Engineering]] 中的整理：

> 「Harness engineering 最重要的習慣，是把 agent 的錯誤當成永久信號，而不是一次性的意外。每一次事故都要變成一條檢查清單，而不是只靠人或 AI 記得。」

Mitchell Hashimoto 在 [[src-harness-engineering-openai|OpenAI Harness Engineering 入門篇]]的同源表述：

> 「每當你發現代理犯了一個錯誤，你就花時間設計一個解決方案，確保代理再也不會犯同樣的錯。」

兩個獨立工程文化的同範式表述——是這個 pattern 已收斂為共識的證據。

**第三個獨立來源**（[[src-bnext-claude-md-12-rules]] / Mnimiy）：

> 「**一個針對你真實痛點量身打造的 6 條規則，絕對勝過一個塞滿 6 條你永遠用不到的 12 條規則範本。**」
>
> 「**不要盲目套用這 12 條規則，每一條寫進去的規則都必須能回答一個問題：這能防止我實際遇過的什麼錯誤？**」

**第四個獨立來源**——**Anthropic 官方**（[[src-claude-code-in-large-codebases|2026-05-14 Claude Code in Large Codebases]]）：

> 「**As models improve, previous instructions may become unnecessary or constraining.** A rule forcing single-file refactors may hinder newer models capable of coordinated cross-file edits. **Teams should review configurations every three to six months or after major model releases.**」

→ Google / OpenAI / 個人工程師 / **Anthropic 廠商官方**四個獨立工程社群得出同一原則，這個 pattern **從業界共識升級為包含廠商在內的全方位共識**。

## 實證數據：4 條 → 12 條對 [[CLAUDE-md]] 錯誤率的影響

[[src-bnext-claude-md-12-rules|Mnimiy 30 codebase / 6 週盲測]]提供 ratchet 累積規則的**量化效果**：

| 條件 | AI 寫程式錯誤率 | 指令遵循度 |
|---|---|---|
| 無規則 | 41% | — |
| 4 條規則（Forrest Chang 原版）| 11% | 78% |
| 12 條規則（Mnimiy 擴充）| **3%** | 76% |

關鍵觀察：
- 錯誤率**兩階段驟降**（41% → 11% → 3%）
- 規則數從 4 加到 12，遵循度幾乎沒掉（78% → 76%）—— **打破「規則越多越失控」迷思**
- 但 24% 規則仍不被主動套用，**ratchet 不是萬靈丹**——只是大幅降低錯誤率

這量化證明 ratchet pattern 的工程價值：**從失敗累積出來的具體規則，每增加一條都有邊際效益**（在合理範圍內）。

## 操作步驟

[[src-addy-osmani-harness-engineering]] 中的具體範例：

> 「如果 agent 送出一個 PR 把測試註解掉、結果不小心被 merge，這不是『下次小心』就好。」

| 失敗事件 | Ratchet 編碼方式 |
|---|---|
| Agent 把測試註解掉 | 寫進 AGENTS.md：「不要註解掉測試，要刪掉或修好」 |
| 同樣行為再次出現 | pre-commit hook 自動抓 diff 裡的 `.skip(` |
| 跨 agent 重複出現 | reviewer subagent 被更新，遇到該情況直接阻擋 |

三層落地：**文字規則（CLAUDE.md/AGENTS.md）→ 機械檢查（hook/linter）→ 自動審核（reviewer subagent）**，逐層強化。

## 克制原則（重要）

Ratchet **不是無限累積**——Addy Osmani 明確警告：

> 「限制應該只在你真的觀察到失敗時才加入；當模型變強，某些限制已經不再必要時，也應該移除。」

> 「好的 system prompt 裡，每一條規則都應該能追溯到某個曾經發生過的失敗。」

這個原則平衡了「累積」與「臃腫」——對應 [[CLAUDE-md|CLAUDE.md]] 的「飛行員檢查清單而非冗長風格指南」、[[Harness-Engineering]] 的「harness 應可撕裂、隨模型進化移除」。

## 為什麼比「下次小心」更穩

| 仰賴對象 | 限制 |
|---|---|
| 人類記憶 | 容易忘記、跨 session 不傳遞 |
| AI 自覺 | context 壓縮後遺失約束（[[src-harness-engineering-openai]] 中 Meta 工程師 Summer Yue 案例：agent 批次刪除數百封 Gmail）|
| **機械強制**（Ratchet）| 寫進系統 → 規則自動執行、跨 session 持續 |

對照 [[Self-Improving-Agent]]：自我改進範式中 [[MEMORY-md|MEMORY.md]] 是「AI 自己累積記憶」，Ratchet 是「**人類觀察到失敗後，把修正編碼進系統**」。兩者都是「越用越穩」，但**動力來源不同**：MEMORY.md 自動，Ratchet 半手動（需要人類觀察錯誤）。

## 三層編碼選擇

選哪一層編碼，視失敗成本與發生頻率而定：

| 編碼層 | 適用情境 | 強度 |
|---|---|---|
| **文字規則**（CLAUDE.md / AGENTS.md）| 偶發、判斷彈性高 | 弱（依賴 agent 自覺）|
| **機械檢查**（hook / linter）| 規律可機械化、後果嚴重 | 中（自動執行但可被繞過）|
| **守門 agent**（reviewer subagent）| 需要語意理解的審查 | 強（可阻擋 PR / 操作）|

對照 [[Harness-Engineering]] 的層次選擇——機械方式（linter、hook）強過 prompt 約束。

## 與其他概念的關係

- [[Harness-Engineering]] — Ratchet 是 harness 「進化機制」的核心執行模式
- [[Self-Improving-Agent]] — Ratchet 是該範式中「人類引導」的學習路徑（vs MEMORY.md 的「AI 自動」學習路徑）
- [[CLAUDE-md]] — Ratchet 的最常見編碼載體；CLAUDE.md 中每條規則應能追溯到某個失敗
- [[AI-Quality-Collusion]] — Ratchet 是該反模式的對抗工具：每次「AI 共謀讓 test 通過」就把該模式編碼進 reviewer subagent
- [[Meta-Harness]] — Ratchet 累積的是「介面內的約束」，介面本身穩定
- [[Agent-Skills]] — Skill 是 Ratchet 累積的高層形式（把「應該怎麼做」固化）

## 應用與案例

- **[[src-addy-osmani-harness-engineering]]**：定義來源
- **[[src-harness-engineering-openai]]**：Mitchell Hashimoto 同源表述、OpenAI Codex 經驗
- **[[src-bnext-claude-md-12-rules]]**：Mnimiy 12 條 CLAUDE.md 範本 + 30 codebase 盲測量化證明 ratchet 的工程價值
- **[[Hermes-Agent]] / [[src-hermes-agent-99-cases]]**：「審計自己 23 天 129 個 session，發現合規問題」案例是 Ratchet 的延伸——agent 自我審計過往行為，找出應該被編碼的失敗
- **[[src-cloudflare-ai-code-review]]**：Cloudflare AGENTS.md 審查者監控規則更新時機 + 反模式扣分（通用填充內容 / 超 200 行 / 無命令工具名稱）= Ratchet 在 production 的具體執行
- **本知識庫的實踐**：CLAUDE.md 中的「raw/ 中的檔案不可修改」「使用 [[wikilink]] 格式交叉引用」「公開度與資安」段（從 2026-05-15 客戶 retro 事件累積）就是 Ratchet 編碼的結果

## 信心評估

- **強**：核心定義與克制原則——兩個獨立來源（Google Addy、OpenAI Ryan）同範式表述
- **強**：三層編碼選擇——對應本知識庫已實踐的 CLAUDE.md / hook / reviewer 範式
- **中**：「Ratchet」這個術語是 Addy 提出還是引述他人——透過 FB 中文轉述，需驗證英文原文
