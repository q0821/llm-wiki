---
title: CLAUDE.md
type: concept
sources: ["Claude + Obsidian 打造 AI 第二大腦，Karpathy 的知識管理 LLM Wiki 教學｜科技翰林院.md", "科技翰林院怎麼用 Claude Code 終端機？8 個實戰設定全公開.md", "【直播筆記】用 Claude Design × Claude Code × Figma 重新定義設計工作流程 - AAPD 產品設計學院.md", "未命名.md", "bnext-claude-md-12-rules.md", "claude-blog-large-codebases.md"]
created: 2026-05-09
updated: 2026-05-19
tags: [claude-code, configuration, schema, persistent-memory, llm-wiki, design-workflow, harness, ratchet, production, anthropic-official]
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

## Production 範本：12 條規則（[[src-bnext-claude-md-12-rules|Forrest Chang 4 + Mnimiy 8]]）

由 [[Andrej-Karpathy]] 2026 初指出 AI 寫程式 3 缺失 → Forrest Chang 整理成 4 條（GitHub 12 萬星）→ Mnimiy 補 8 條應對複雜 agent 場景。30 codebase / 6 週盲測：**41% → 11% → 3% 錯誤率**，指令遵循度幾乎沒掉（78% → 76%）。

| # | 規則 | 一句話 |
|---|---|---|
| 1 | Think Before Coding | 不清楚就停下發問，別假設 |
| 2 | Simplicity First | 最少 code 解問題，拒過度工程 |
| 3 | Surgical Changes | 只動需求相關，不順手改別處 |
| 4 | Goal-Driven Execution | 任務化為可驗證目標 |
| 5 | Use the model only for judgment calls | 分類/摘要用 AI；status code/retry 用 code |
| 6 | Token budgets | per-task 4,000 / per-session 30,000（[[Context-Rot]] 對抗工具）|
| 7 | Surface conflicts | 相衝模式選一、解釋為什麼，不要 average 兩種 |
| 8 | Read before you write | 寫前讀 exports / immediate caller / shared utilities |
| 9 | Tests verify intent | 業務邏輯改變時測試會 fail = 有效（[[AI-Quality-Collusion]] 對策）|
| 10 | Checkpoint after every step | 每步回報「已完成/已驗證/剩餘」|
| 11 | Match conventions | conformance > taste；不同意則 surface 不要 silently fork |
| 12 | Fail loud | 任何 silently skip 都是錯；surface uncertainty > hiding |

完整英文範本見 [[src-bnext-claude-md-12-rules]]。

### Mnimiy 三大 prompt 反模式（實測）

1. **抽象規則 > 具體範例**：3 個範例 ≈ 10 條規則的 token，AI 對範例過度擬合變不知變通
2. **情緒喊話與角色扮演是純雜訊**：「請仔細思考」「像資深工程師」的遵循度跌到 30%——指令必須是具體動作
3. **依賴特定工具的死指令**：「永遠使用 ESLINT」一旦沒裝就靜默失效；用工具中性說法

> 「**一個針對你真實痛點量身打造的 6 條規則，絕對勝過一個塞滿 6 條你永遠用不到的 12 條規則範本。**」 —— Mnimiy

→ 完美對應 [[Ratchet-Pattern]] 跨工程文化共識：規則只應防止實際遇過的失敗。本 wiki [[CLAUDE-md|CLAUDE.md]] 「公開度與資安」段也用同原則累積。

## Anthropic 官方版 CLAUDE.md 維護指引（[[src-claude-code-in-large-codebases|2026-05-14 官方 blog]]）

### CLAUDE.md Files Come First（Harness 7 元件之首）

> 「**Context files loaded automatically each session—root files for big-picture overview, subdirectory files for local conventions.** Should remain '**focused on what applies broadly**' to maintain performance.」

關鍵設計：
- **Layered**：root 看大局 + subdirectory 管 local conventions
- **Initialize in subdirectories** rather than repo root（官方明白建議）
- **Scope test / lint commands per subdirectory**

### 3-6 月主動維護週期（**官方版 Ratchet 克制原則**）

> 「**As models improve, previous instructions may become unnecessary or constraining.** A rule forcing single-file refactors may hinder newer models capable of coordinated cross-file edits. **Teams should review configurations every three to six months or after major model releases.**」

具體建議 review 時機：
- 每 **3-6 個月** 一次定期掃
- **重大模型發布**後立即掃
- 範例：「強制單檔 refactor」的規則在新模型可以做跨檔協調編輯時，反而 hinder

對應 [[Ratchet-Pattern]] 「克制原則」的第 4 個獨立來源——Anthropic 官方加入 Google Addy / OpenAI Mitchell Hashimoto / 個人工程師 Mnimiy 的同源共識。

## 與其他 Schema 規範的關係

| 檔名 | 工具 | 作用範圍 | 性質 |
|---|---|---|---|
| **CLAUDE.md** | [[Claude Code]] | AI 助理規範 | 行為規範（怎麼做事）|
| [[DESIGN-md\|DESIGN.md]] | AI Coding Agent（多家） | UI 設計系統規範 | 行為規範（視覺風格）|
| [[AGENTS-md\|AGENTS.md]] | [[OpenAI-Codex-CLI]] / [[OpenCode]] / 其他 agentic CLI | 任務代理人規範 | 行為規範（CLAUDE.md 平行對照組） |
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
- [[src-techhanlin-llm-wiki-tutorial]]、[[src-techhanlin-claude-code-8-settings]]、[[src-aapd-claude-design-figma-workflow]]、[[src-addy-osmani-harness-engineering]]、[[src-bnext-claude-md-12-rules]]、[[src-claude-code-in-large-codebases]] — 來源
- [[DESIGN-md]] — 同類設計：給 AI Agent 讀的規範檔
- [[AGENTS-md]] — 平行對照規範檔
- [[Simon-Lin]] — 提供設計領域具體規則範例的設計師
- [[Ratchet-Pattern]] — CLAUDE.md 是 Ratchet 的主要編碼載體；Anthropic 官方版 3-6 月 review 是第 4 個獨立來源
- [[Harness-Engineering]] — CLAUDE.md 是 harness 七元件之一；也是 Anthropic 官方 7 個 extension points 之首
- [[Addy-Osmani]] — 提出「飛行員檢查清單」隱喻
- [[Andrej-Karpathy]] — AI 寫程式 3 缺失觀察是 12 條規則的源頭
- [[Plugins-Claude-Code]] / [[LSP-Integrations]] — CLAUDE.md 的同級 Harness extension points
