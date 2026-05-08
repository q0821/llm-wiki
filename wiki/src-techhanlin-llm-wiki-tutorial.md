---
title: Claude + Obsidian 打造 AI 第二大腦 — 科技翰林院 LLM Wiki 教學
type: source
sources: ["Claude + Obsidian 打造 AI 第二大腦，Karpathy 的知識管理 LLM Wiki 教學｜科技翰林院.md"]
created: 2026-05-08
updated: 2026-05-08
tags: [llm-wiki, claude-code, obsidian, karpathy, second-brain, methodology]
confidence: 強
---

# Claude + Obsidian 打造 AI 第二大腦：Karpathy LLM Wiki 教學

**作者**：[[科技翰林院|AI 導演林思翰 Hans]]
**發表平台**：科技翰林院（techhanlin.tw）
**發表日期**：2026-04-14
**原始連結**：https://www.techhanlin.tw/claude-code-obsidian-second-brain/
**抓取於**：2026-04-30

## 核心主張

- LLM 最擅長的不是「幫你思考」，而是幫你做 **bookkeeping**——整理、歸檔、交叉引用的苦工
- [[LLM-Wiki]]（[[Andrej-Karpathy]] 2026-04 提出）解決了 [[RAG]] 的根本缺陷：**沒有累積、每次從零開始**
- [[Obsidian]] + [[Claude Code]] 是這套方法論的最佳載體：純 markdown、`[[wikilink]]`、YAML frontmatter，零整合成本
- Wiki 是 codebase、Obsidian 是 IDE、LLM 是 programmer——三方分工的精準比喻
- 概念上承襲 1945 年 [[Memex]]：私人主動策展的知識庫

## 詳細摘要

### 一、核心對立軸：LLM Wiki vs RAG

[[Andrej-Karpathy]] 在原文點出大多數人用 AI 處理文件的方式有根本性問題：

- **RAG 模式**（NotebookLM、ChatGPT 上傳檔案、多數 RAG 系統）：上傳一堆檔案 → AI 提問時撈相關片段拼答案 → **每次從零開始，沒有累積**
- **LLM Wiki 模式**：LLM 持續建構與維護一組結構化、互相連結的 Markdown 檔案，**夾在你和原始資料之間**。新資料進來會被消化、提取、整合到既有的知識網路裡

關鍵差異：「**The wiki is a persistent, compounding artifact.**」——交叉引用已經建好、矛盾已經被標記、綜合分析已經反映了你讀過的所有東西。每加一筆新資料、問一個新問題，wiki 都會更豐富。

> 延伸對比：本知識庫 [[RAG]] 頁面已論述 RAG 的適用場景，LLM Wiki 並非取代 RAG 而是**互補層**——RAG 解決「動態查詢」、LLM Wiki 解決「累積複利」。

### 二、Ingest / Query / Lint 三步驟工作流

Karpathy 把 LLM Wiki 操作歸納成三個核心動作（與本知識庫使用的 [[Agent-Skills|llm-wiki skill]] 完全對應）：

| 動作 | 說明 | 影響範圍 |
|---|---|---|
| **Ingest** | 把新資料餵進來，自動提取重點、寫結構化筆記、更新交叉引用 | Karpathy 指出一次 ingest 可能動到 **10-15 個 wiki 頁面** |
| **Query** | 提問時從累積的 wiki 合成答案（不是從訓練資料） | 好答案應該被存回 wiki 變新頁面，產生複利 |
| **Lint** | 定期掃描整個 vault，找矛盾、過時、孤兒頁、缺失交叉引用 | 「人類最容易偷懶的步驟」 |

### 三、為什麼是 Obsidian + Claude Code？

文章列出三個技術原因：

1. **純 Markdown** — Claude Code 讀寫 `.md` 不需轉換層；Notion 等雲端工具要透過 API 拉取、轉格式、推回去
2. **雙向連結語法** — `[[wikilink]]` 可被 Claude Code 解析、建立、補全
3. **YAML frontmatter** — metadata 區塊可被批次讀取、篩選、更新

加上 Obsidian local-first 的長期保障：「就算 Obsidian 公司明天消失，你的知識庫一個字都不會少。」

### 四、實戰技巧（與本 wiki 工作流相關的部分）

- **`.claude/commands/` 自訂 slash command**：每個常用工作流寫成 markdown 範本（檔名 = 指令名），呼應 [[Agent-Skills]] 的概念
- **批次反向連結**：讓 Claude Code 掃 daily notes，找出人名/專案名/書名 → 自動加 `[[wikilink]]`，沒有對應頁就建立
- **批次補 frontmatter / tags**：根據 CLAUDE.md 規範自動歸檔
- **每週回顧（`/weekly-review`）**：統計完成/未完成 tasks、辨識重複主題、找停滯專案
- **2026 新增的 [[Managed-Agents|Scheduled Agents]]**：可設定每日自動整理昨天筆記、每週五自動產週回顧

### 五、CLAUDE.md 設計指引

- 控制在 100 行以內，太長浪費 token
- 核心要寫清楚：身份/領域、資料夾結構邏輯、frontmatter 必填欄位、wikilink 慣例、**行為邊界**
- 重點：定義「**不做清單**」（NEVER 刪檔、NEVER 改 frontmatter tags 只能新增）

> 對照本知識庫：本專案 CLAUDE.md 在 [規則] 區段已包含此原則的具體版本（raw/ 不可修改、index/log 同步更新、矛盾並列）

### 六、歷史脈絡：從 Memex 到 LLM Wiki

文章拉了一個歷史軸：[[Memex]]（Vannevar Bush, 1945）就是「私人的、主動策展的知識庫，文件之間的關聯跟文件本身一樣有價值」。

- **Bush 解決不了的問題**：誰來做維護？人類會放棄維護 wiki，因為**維護成本的增長速度比價值快**
- **LLM 解決了**：「不會無聊、不會忘記更新交叉引用、一次能動 15 個檔案」

人機分工：
- **人**：策展來源、引導分析、問好問題、思考意義
- **LLM**：其他所有事

## 關鍵原文引用

> "Most people's experience with LLMs and documents looks like RAG: you upload a collection of files, the LLM retrieves relevant chunks at query time, and generates an answer. This works, but the LLM is rediscovering knowledge from scratch on every question. **There's no accumulation.**"
> — Karpathy, 2026

> "Instead of just retrieving from raw documents at query time, the LLM **incrementally builds and maintains a persistent wiki** — a structured, interlinked collection of markdown files that sits between you and the raw sources."
> — Karpathy, 2026

> "**The wiki is a persistent, compounding artifact.**"
> — Karpathy, 2026

> "In practice, I have the LLM agent open on one side and Obsidian open on the other... **Obsidian is the IDE; the LLM is the programmer; the wiki is the codebase.**"
> — Karpathy, 2026

> "The tedious part of maintaining a knowledge base is not the reading or the thinking — **it's the bookkeeping**. Humans abandon wikis because the maintenance burden grows faster than the value. LLMs don't get bored, don't forget to update a cross-reference, and can touch 15 files in one pass."
> — Karpathy, 2026

> "**The human's job is to curate sources, direct the analysis, ask good questions, and think about what it all means. The LLM's job is everything else.**"
> — Karpathy, 2026

## 數據點（時間敏感）

- Karpathy LLM Wiki gist 2026-04 發布：**5,000+ stars、1,900 萬曝光**
- GitHub 每天 **13.5 萬筆公開 commit** 來自 Claude Code，佔全平台 **4%**
- 文章日期：2026-04-14

## 與本知識庫既有頁面的關聯

- [[LLM-Wiki]] — 本來源是「LLM Wiki 中文圈的代表性介紹文」，建立此概念頁的主要依據
- [[RAG]] — 文章直接點名 RAG 的累積缺陷，補強 [[RAG]] 頁面的「LLM Wiki 對照」段落
- [[Memex]] — 歷史脈絡，新建概念頁
- [[Andrej-Karpathy]] — LLM Wiki 提出者，新建實體頁
- [[Obsidian]] — 載體工具，新建實體頁
- [[科技翰林院]] — 作者品牌，新建實體頁
- [[HC-AI-說人話]] — 同為中文圈推廣者，建立交叉引用
- [[Agent-Skills]] — `.claude/commands` 用法補充
- [[Managed-Agents]] — 提到 Scheduled Agents 的應用情境
- [[src-claude-code-notebooklm]] — HC AI 說人話的對應作品，方法論互補

## 信心評估

- **強**：核心方法論（Ingest/Query/Lint、人機分工、wiki vs RAG 的差異）— 對應 Karpathy 原始 gist，已在多處被引用
- **中**：實戰技巧細節（批次反向連結、`/weekly-review`）— 為作者個人實踐，可行但效果因人而異
- **中**：2026 新增功能（Scheduled Agents）— 文章提及但未深入，需另外驗證

## 忽略區段

下列段落已**不納入摘要**（依使用者指引）：
- Obsidian / Claude Pro 定價方案表（時效短、易過時）
- 文末「推薦閱讀」連結清單（屬導流，無新資訊）
