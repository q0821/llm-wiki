---
title: LLM Wiki
type: concept
sources: ["Claude + Obsidian 打造 AI 第二大腦，Karpathy 的知識管理 LLM Wiki 教學｜科技翰林院.md", "Hermes Agent 成功案例 — 你的 AI 代理可以做什麼.md"]
created: 2026-05-08
updated: 2026-05-14
tags: [方法論, 知識管理, AI, llm-wiki, second-brain, karpathy]
confidence: 強
---

# LLM Wiki

由 [[Andrej-Karpathy]] 於 2026-04 在 X 上提出的個人知識管理範式。**讓 LLM 維護一個結構化、互相連結的 Markdown 知識庫，作為「你」與「原始資料」之間的中介層**——而不是每次提問都從原始資料臨時拼湊答案。

## 核心定義

> "Instead of just retrieving from raw documents at query time, the LLM **incrementally builds and maintains a persistent wiki** — a structured, interlinked collection of markdown files that sits between you and the raw sources."
> — Karpathy, 2026

> "**The wiki is a persistent, compounding artifact.**"
> — Karpathy, 2026

## 三層架構

```
[原始資料 raw/] ──► [LLM Wiki wiki/] ──► [人類查詢]
   (不可變)         (持續累積複利)        (寫回變新頁)
```

- **Raw Sources**：原始資料（PDF、網頁、文章），LLM 只讀不改
- **Wiki**：LLM 維護的結構化筆記，含交叉引用、矛盾標註、綜整分析
- **Schema**：`CLAUDE.md` 等規範檔，定義 LLM 的行為邊界與筆記格式

## 與 RAG 的根本差異

| 面向 | [[RAG]] | LLM Wiki |
|---|---|---|
| 資料處理時機 | **查詢時**才從原始文件撈片段 | **匯入時**就消化、提取、整合 |
| 累積性 | **無**，每次從零開始 | **有複利**，wiki 隨使用越來越豐富 |
| 交叉引用 | 動態檢索結果 | 已建好的 `[[wikilink]]` 網路 |
| 矛盾處理 | 通常被掩蓋（取最相似 chunk） | 顯性標註並列呈現 |
| 適用場景 | 動態查詢、大量文件、低累積需求 | 個人長期累積、知識複利、追溯思考脈絡 |
| 人類角色 | 提問者 | 策展者 + 引導者 |

> 關鍵洞察（[[Andrej-Karpathy]]）：兩者**不是取代關係**——RAG 適合「你不會反覆查同一個主題」的場景；LLM Wiki 適合「主題會隨時間累積、你會回頭找脈絡」的場景。

## 三步驟工作流：Ingest / Query / Lint

| 動作 | 說明 | 影響範圍 |
|---|---|---|
| **Ingest（攝入）** | 餵新資料進來 → LLM 提取重點、寫結構化筆記、補交叉引用 | 一次可動 **10-15 個 wiki 頁面** |
| **Query（查詢）** | 提問時從累積的 wiki 合成答案；好答案存回 wiki 變新頁 | 探索本身會在知識庫裡產生**複利** |
| **Lint（健檢）** | 掃整個 vault：找矛盾、過時內容、孤兒頁、缺漏交叉引用 | 「人類最容易偷懶的步驟」 |

> 本知識庫使用的 [[Agent-Skills|`/llm-wiki` skill]] 即按照此三步驟設計。

## 人機分工

> "The tedious part of maintaining a knowledge base is not the reading or the thinking — **it's the bookkeeping**. Humans abandon wikis because the maintenance burden grows faster than the value. LLMs don't get bored, don't forget to update a cross-reference, and can touch 15 files in one pass."
> — Karpathy, 2026

| 角色 | 工作 |
|---|---|
| **人** | 策展來源、引導分析、問好問題、思考意義 |
| **LLM** | 摘要、交叉引用、歸檔、整理、維護（其他所有事）|

## 歷史脈絡：從 Memex 到 LLM Wiki

[[Andrej-Karpathy]] 在原文末尾拉出歷史軸：[[Memex]]（Vannevar Bush, 1945）就是「私人的、主動策展的知識庫，文件之間的關聯跟文件本身一樣有價值」。

- **Bush 解決不了的問題**：誰來做維護？人類會放棄維護 wiki，因為**維護成本的增長速度比價值快**
- **LLM 解決了**：「不會無聊、不會忘記更新交叉引用、一次能動 15 個檔案」

LLM Wiki 可視為 [[Memex]] 在 LLM 時代的可實現版本。

## 載體選擇：為何是 [[Obsidian]] + [[Claude Code]]

技術原因（詳見 [[Obsidian]] 頁）：純 markdown、`[[wikilink]]`、YAML frontmatter，零整合成本。

精準比喻：

> "**Obsidian is the IDE; the LLM is the programmer; the wiki is the codebase.**"
> — Karpathy, 2026

## 實踐要點

### 工作環境

- 一邊開 LLM agent，一邊開 [[Obsidian]]
- LLM 改檔，使用者即時看：追連結、看圖譜、讀更新後的頁面

### CLAUDE.md 設計（[[科技翰林院]] 建議）

- 控制在 **100 行以內**（太長浪費 token）
- 必寫：身份/領域、資料夾結構邏輯、frontmatter 必填欄位、wikilink 慣例、**行為邊界（不做清單）**
- 範例 NEVER：不刪檔、不改既有 frontmatter tags 只能新增

### 常見實戰技巧

- **Slash command**（`.claude/commands/<name>.md`）：把常用工作流寫成範本
- **批次反向連結**：掃 daily notes，自動加 `[[wikilink]]`
- **批次補 tags**：依 schema 規範自動歸檔
- **每週回顧**：自動統計完成/未完成、辨識重複主題

## 與本知識庫的關係

本知識庫即按 LLM Wiki 範式建立。對照表：

| Karpathy 原始概念 | 本知識庫實作 |
|---|---|
| Raw Sources | `raw/` |
| Wiki | `wiki/` |
| Schema | `CLAUDE.md` + `references/conventions.md` |
| Ingest / Query / Lint | `/llm-wiki` skill 的三個指令 |
| LLM Agent | [[Claude Code]] |
| IDE | [[Obsidian]] |

差異：本知識庫額外加上「**外部發布層**」（[[Quartz|Quartz v4]] → wiki.jackie-yeh.com）與「**手機投遞層**」（iCloud Obsidian inbox vault），這在 Karpathy 原版未涵蓋。

## Anthropic 官方版「Agentic Search vs RAG Embedding」（[[src-claude-code-in-large-codebases|2026-05-14]]）

Anthropic 官方對 [[Claude Code]] 的 codebase 導覽設計選擇做了明白論述：

> 「Claude Code navigates codebases like a software engineer—traversing file systems, reading files, using grep for precise searches, and following cross-codebase references. **It operates locally without requiring a codebase index.**」
>
> 「**Unlike RAG-powered tools that embed entire codebases, Claude Code uses agentic search**, avoiding failures where indices become stale.」

這對應本頁「**[[LLM-Wiki]] vs [[RAG]]**」的核心對話組——但場景從「個人知識庫」延伸到「**程式碼導覽**」。共通設計選擇：

| 層次 | 選 RAG embedding 的代價 | 選 agentic / wiki 的代價 |
|---|---|---|
| 個人知識庫 | 索引過期 / 每次重新拼湊 | 維護成本（但 LLM 可大量代勞）|
| Codebase 導覽 | Index 過期失敗 | 需要充足 starting context（即 [[CLAUDE-md|CLAUDE.md]]）|

**共通結論**：「**累積結構化知識 + agent 即時遍歷**」比「**索引 + embedding**」更耐久。Anthropic 官方在 Claude Code 產品層做了同樣的設計選擇。

## 路線分歧：人類引導 vs 全自動

[[src-hermes-agent-99-cases]] 中有「**自我改進的 LLM Wiki 第二大腦**」case（連結 medium 原文標題含 "and why I'm not using Obsidian"），代表另一條路線——**完全自動的 LLM Wiki**，AI 自動爬取、自動更新、靜態網站自動發布。

| 路線 | 代表 | 主張 | 風險 |
|---|---|---|---|
| **人類引導**（本知識庫） | [[Andrej-Karpathy]] + [[Obsidian]] + [[Claude Code]] | 來源不可變、矛盾並列、人類監督摘要 | 維護成本仍在（雖然 LLM 大量分擔） |
| **全自動**（Hermes 生態系）| [[Hermes-Agent]] | AI 自動爬取 + AI 自動更新 + 自動發布 → 「永不腐爛」 | [[AI-Quality-Collusion]] 風險：AI 自寫自更新失去人類審視 |

兩者對「**維護負擔**」的回應不同：

- Karpathy 觀點：「LLM 不會無聊、不會忘記更新交叉引用、一次能動 15 個檔案」——但人類仍是策展者
- Hermes 觀點：連策展也外包，AI 全包了

這是 [[Self-Improving-Agent]] 範式在知識管理領域的延伸應用。對本知識庫而言，這提供了一個有意義的對照組——保留「人類引導」路線是有意識選擇，不是技術限制。

## 信心評估

- **強**：核心方法論（三步驟、人機分工、與 RAG 的差異）— Karpathy 原始 gist 直接定義，多處被獨立引用
- **中**：實戰細節（具體 CLAUDE.md 寫法、slash command 範例）— 來自二手介紹文（科技翰林院），可行但屬個人實踐
- **待補**：原始 gist（karpathy/442a6bf...）尚未直接 ingest，目前僅透過二手來源建立此頁

## 相關頁面

- [[Andrej-Karpathy]] — 提出者
- [[Memex]] — 概念前身
- [[RAG]] — 對立的另一種範式
- [[Obsidian]] / [[Claude Code]] — 主要載體
- [[Agent-Skills]] — `/llm-wiki` skill 的實作位置
- [[src-techhanlin-llm-wiki-tutorial]] — 中文圈代表性介紹文（本頁主要依據）
- [[科技翰林院]]、[[HC-AI-說人話]] — 中文圈推廣者
- [[Hermes-Agent]] — 全自動 LLM Wiki 路線的代表
- [[Self-Improving-Agent]] — 自我改進範式在 LLM Wiki 領域的應用
- [[src-hermes-agent-99-cases]] — 含「自我改進 LLM Wiki」對照路線
