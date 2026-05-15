---
title: CLAUDE.md
type: concept
sources: ["Claude + Obsidian 打造 AI 第二大腦，Karpathy 的知識管理 LLM Wiki 教學｜科技翰林院.md", "科技翰林院怎麼用 Claude Code 終端機？8 個實戰設定全公開.md", "【直播筆記】用 Claude Design × Claude Code × Figma 重新定義設計工作流程 - AAPD 產品設計學院.md", "未命名.md"]
created: 2026-05-09
updated: 2026-05-14
tags: [claude-code, configuration, schema, persistent-memory, llm-wiki, design-workflow, harness, ratchet]
confidence: 強
---

# CLAUDE.md

[[Claude Code]] 的**持久記憶層 / 設定檔規範**：放在專案根目錄或全域 `~/.claude/`，每次啟動 Claude Code 都會自動讀取，作為 AI 的「合作備忘錄」。

[[Andrej-Karpathy]] [[LLM-Wiki]] 範式中對應「**Schema**」層——定義 LLM 行為的邊界與筆記規範。

## 兩層分層

[[科技翰林院]] [[src-techhanlin-claude-code-8-settings|實戰建議]]：

| 層級 | 路徑 | 用途 |
|---|---|---|
| **全域** | `~/.claude/CLAUDE.md` | 跨所有專案都適用（語言偏好、commit 格式、安全規則）|
| **專案** | `<project-root>/CLAUDE.md` | 該專案特定規範（API endpoint、部署流程、框架限制）|

切換專案時 Claude Code 自動切換上下文，不必每次重新交代。

## 該寫進 CLAUDE.md vs 不該寫進

[[科技翰林院]] 整理的對照表：

| 該寫 | 不該寫 |
|---|---|
| 你的身份和 AI 的角色定位 | 程式碼的架構細節（AI 會自己讀） |
| **硬規則（絕對不能做的事）** | Git history（用 `git log` 查就好） |
| 工作流程和驗證步驟 | 暫時性的 debug 筆記 |
| 語言偏好（如：回覆用中文） | 已經寫在 README 裡的東西 |
| 常用的 API endpoint 和環境資訊 | 每次都會變的動態資料 |

> 核心原則：**「不寫的話 AI 一定會搞錯的事」才寫**。寫太多反而浪費 Token——每次對話開頭 AI 都要讀一遍。

## 長度控制

兩個來源一致建議：

- [[src-techhanlin-llm-wiki-tutorial|林思翰前一篇]]：**100 行以內**最佳
- [[src-techhanlin-claude-code-8-settings|林思翰本篇]]：**超過 200 行就該精簡**

長度膨脹的後果：
- 每次新對話 token 浪費（CLAUDE.md 開頭就讀完）
- auto-compaction 時更容易被壓縮丟掉規則
- 規則之間互相打架，AI 抓不到重點

## 設計重點

### 1. 身份定位

寫清楚「你是誰、AI 的角色是什麼」，例如：「我是中文使用者，做 WordPress 接案；AI 角色是 senior 工程師，負責 review 與修改建議」。

### 2. 硬規則（不做清單）

[[科技翰林院]] [[src-techhanlin-llm-wiki-tutorial|前一篇]]強調：

> 「AI 工具最危險的地方不是它不會做什麼，而是它太積極了」

明確列出 NEVER 規則，例如：
- NEVER 刪除任何檔案
- NEVER 修改既有 frontmatter tags（只能新增）
- NEVER force push
- 不用 em dash

> 對照本知識庫專案 CLAUDE.md：在「規則」區段已含此類具體規範（raw/ 不可修改、index/log 同步更新、矛盾並列、不擅自取捨）

### 3. 工作流程

寫清楚順序而非單點規則，例如：
- 先規格再開發
- 改完要驗證
- 提疑問時只回答方案不執行

### 4. 語言偏好

例：「回覆用中文、commit message 用英文、技術詞保留原文」。

### 5. Ratchet 原則：每條規則都要從失敗中賺來

[[src-addy-osmani-harness-engineering|Addy Osmani]] 給 CLAUDE.md 一個更銳利的定位：

> 「**像飛行員的檢查清單，不應該像一份冗長風格指南。它要短，每一條規則都要是從過去的失敗中賺來的（earn the line）。**」

對應的克制原則：

- **加入規則**：只在你**真的觀察到失敗**時才加入（不要預想可能的問題就堆規則）
- **移除規則**：模型變強後，某些限制已經不再必要時，要**主動移除**

這與 [[Ratchet-Pattern]] 的整體哲學一致——CLAUDE.md 是 Ratchet 的主要編碼載體之一（另外兩層是 hook 與 reviewer subagent）。

**重要安全議題**（同來源）：工具描述會直接進到 prompt 裡——一個品質差或惡意的外部整合（如未驗證的 [[MCP]] server）可能在 agent 工作前就注入不該有的指令到 CLAUDE.md 或 system context。挑工具要看「描述本身的健康度」。

### 6. 設計領域規則（[[Simon-Lin|Simon]] [[src-aapd-claude-design-figma-workflow|範例]]）

從 [[Claude-Design]] handoff 給 [[Claude Code]] 之前，必須先建好 CLAUDE.md，否則「翻譯出來的東西完全跑版」（直播當天的失敗教訓）。Simon 的設計規則範例：

- 「跟 [[Figma]] 同步時必須使用已定義的 design token」
- 「必須使用既有 component，沒有定義就先問我」

這把 CLAUDE.md 從「工程協作備忘錄」擴展為「**跨工具品牌一致性的錨點**」——[[DESIGN-md]] 強調事前定義，CLAUDE.md 則收斂為「給當下 agent 看的具體規則」。

## 與其他 Schema 規範的關係

| 檔名 | 工具 | 作用範圍 | 性質 |
|---|---|---|---|
| **CLAUDE.md** | [[Claude Code]] | AI 助理規範 | 行為規範（怎麼做事）|
| [[DESIGN-md\|DESIGN.md]] | AI Coding Agent（多家） | UI 設計系統規範 | 行為規範（視覺風格）|
| `AGENTS.md` | OpenAI Codex / 其他 agentic CLI | 任務代理人規範 | 行為規範 |
| `.cursorrules` | Cursor | 編輯器級規範 | 行為規範 |
| **App Flow JSON** | AI coding agent（[[src-akiraxclaw-app-flow-trick]]）| 系統核心流程結構化描述 | **系統地圖（系統長什麼樣）** |

> 共通模式：純 markdown、放專案根目錄、agent 啟動自動讀取。差別在於各自關注的「行為面向」（程式碼風格 / 設計風格 / 任務代理規則）。

## 與 [[LLM-Wiki]] 的整合

本知識庫即用 CLAUDE.md 同時擔任**兩個角色**：

1. **Claude Code 行為規範**（給 AI 看的）
2. **LLM Wiki schema 定義**（給 `/llm-wiki` skill 讀取的 profile）

具體寫進去的內容包含：
- 知識庫主題、目的、語言
- 高層原則（組織邏輯、摘要風格、調性）
- 具體指引（來源處理、品質控制、頁面類型）
- 規則（raw/ 不可改、index/log 同步、wikilink 慣例）
- **素材投遞流程**（inbox 機制）

> 這個複用設計剛好符合本頁開頭定義：「合作備忘錄」就是「LLM Wiki schema」的另一種說法。

## 實戰建議：讓 Claude Code 自己改

[[科技翰林院]] 觀察：

> 「==如果你看不懂我以上的說明沒有關係，把這篇文章丟給你的 Claude Code，它就會理解了，不用自己去改 CLAUDE.md。==」

CLAUDE.md 是 Claude Code 自己最熟的格式，遇到要新增規則直接跟它對話即可。

## 信心評估

- **強**：兩層分層（全域 + 專案）、該寫/不該寫對照表、長度建議 — 兩篇來源一致、與 Anthropic 官方文件方向一致
- **強**：與 [[LLM-Wiki]] 整合的論點 — 本知識庫即現行案例
- **中**：「auto-compaction 會壓掉 CLAUDE.md 規則」— 作者個人實測，需另外驗證

## 相關頁面

- [[Claude Code]] — 讀取 CLAUDE.md 的主要 agent
- [[LLM-Wiki]] — 把 CLAUDE.md 當 schema 使用的範式
- [[Agent-Skills]] — 與 skill 機制互補（CLAUDE.md 是規範、Skill 是流程）
- [[src-claude-code-context-management]] — Memory / Handoff / Token 管理相關
- [[src-techhanlin-llm-wiki-tutorial]]、[[src-techhanlin-claude-code-8-settings]]、[[src-aapd-claude-design-figma-workflow]]、[[src-addy-osmani-harness-engineering]] — 來源
- [[DESIGN-md]] — 同類設計：給 AI Agent 讀的規範檔
- [[Simon-Lin]] — 提供設計領域具體規則範例的設計師
- [[Ratchet-Pattern]] — CLAUDE.md 是 Ratchet 的主要編碼載體
- [[Harness-Engineering]] — CLAUDE.md 是 harness 七元件之一
- [[Addy-Osmani]] — 提出「飛行員檢查清單」隱喻
