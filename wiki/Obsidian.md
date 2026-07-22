---
title: Obsidian
type: entity
sources: ["Claude + Obsidian 打造 AI 第二大腦，Karpathy 的知識管理 LLM Wiki 教學｜科技翰林院.md", "只要 5 分鐘！Claude Code 無縫整合 NotebookLM 實戰.md"]
created: 2026-05-08
updated: 2026-05-08
tags: [工具, 筆記, markdown, local-first, 第二大腦]
confidence: 強
---

# Obsidian

Local-first 的 markdown 筆記工具，被 [[Andrej-Karpathy]] 與中文圈創作者（[[科技翰林院]]、[[HC-AI-說人話]]）共同推為 [[LLM-Wiki]] 工作流的最佳載體。

## 基本資訊

- **官網**：https://obsidian.md/
- **資料儲存**：純本機 markdown 檔案（無雲端鎖定）
- **核心特性**：`[[wikilink]]` 雙向連結、YAML frontmatter、知識圖譜視覺化
- **平台**：macOS / Windows / Linux / iOS / Android

## 為何是 LLM Wiki 的最佳載體

[[科技翰林院]] [[src-techhanlin-llm-wiki-tutorial|文章]]列出三個技術原因：

1. **純 Markdown** — [[Claude Code]] 讀寫 `.md` 不需轉換層；Notion 雲端工具要透過 API 拉取/轉格式/推回
2. **雙向連結** — `[[wikilink]]` 可被 LLM 解析、建立、補全；掃描整個 vault 找漏連結很自然
3. **YAML frontmatter** — metadata 可被批次讀取、篩選、更新

[[Andrej-Karpathy]] 的精準比喻：

> "**Obsidian is the IDE; the LLM is the programmer; the wiki is the codebase.**"

## Local-first 的長期保障

[[科技翰林院]] 文章引用：

> 「就算 Obsidian 公司明天消失了，你的知識庫一個字都不會少。」

對照 Notion：資料鎖在雲端資料庫、匯出 markdown 品質參差、表格與資料庫幾乎無法完整帶走。

## 定價（個人用免費）

| 方案 | 費用 | 用途 |
|------|------|------|
| 個人版 | 免費 | 所有核心功能、無筆記數量上限 |
| 商業版 | $50/年 | 公司內部使用須購買 |
| Sync（選配） | $4/月 | 跨裝置同步、端對端加密；可用 iCloud / Git 免費替代 |
| Publish（選配） | $8/月 | 把筆記發布成網站 |

> **本知識庫的選擇**：未使用 Obsidian Sync 或 Publish。發布層改用 [[Quartz|Quartz v4]]（GitHub Pages），同步層用 iCloud 局部同步（[[#Obsidian + iCloud 注意事項|參見下方注意事項]]）

## Claude Code 整合方式

[[src-techhanlin-llm-wiki-tutorial|科技翰林院文章]]列出兩種：

1. **直接 cd 進 vault 開 claude**（30 秒搞定，最簡單）
2. **MCP 橋接 / Obsidian 插件**：
   - **Agent Client** — 支援 Claude Code / Codex / Gemini CLI，可用 `@notename` 引用筆記
   - **obsidian-claude-code-mcp** — 把 vault 操作註冊成 MCP 工具

> 作者建議：剛開始直接終端機 cd 進 vault 就夠，插件是用熟之後再考慮。

## Obsidian + iCloud 注意事項

**整個專案資料夾放 iCloud 會踩到三個地雷**（本知識庫實戰經驗）：

1. **`.git/objects/` 會被 iCloud evict**：空間吃緊時換成 `.icloud` 占位符，git 一旦讀到不完整 pack file 整個 repo 就壞
2. **`node_modules/` / `public/` / `.quartz-cache/`** 高頻變動小檔案，iCloud 同步邏輯持續打架，產生衝突副本
3. **檔名 normalization**：iCloud 用 NFD（分解式）儲存中文，git 期望 NFC，兩端 hash 不同 → 永遠覺得有未追蹤檔案

**本知識庫的解法**：專案放本地，另開獨立 iCloud Obsidian vault `wiki-inbox` 作為手機投遞口，用 `bin/inbox-pull.sh` 把素材搬入 `raw/`。詳見專案根目錄 CLAUDE.md「素材投遞（Inbox 機制）」段落。

## 推薦的 Vault 結構（[[科技翰林院]] 版本）

| 資料夾 | 用途 |
|---|---|
| `CLAUDE.md` | AI 助理工作手冊 |
| `.claude/commands/` | 自訂 slash commands |
| `daily/` | 每日筆記（YYYY-MM-DD.md） |
| `projects/` | 進行中專案 |
| `areas/` | 持續責任區（健康、財務）|
| `resources/` | 參考資料、研究筆記 |
| `_inbox/` | 待處理收件匣 |
| `templates/` | 筆記範本 |

> 本知識庫採取不同結構：`raw/` + `wiki/` 二分法（更像 LLM Wiki 原始 schema），不採 PARA 分類。理由：本知識庫主要由 LLM 維護，分類由 frontmatter 的 `type` 欄位決定即可。

## 「它不是外掛，是一個資料夾」

[[src-jason-claude-code-5-plugins-2026-07|傑森所長的 Claude Code 五外掛指南]]（2026-07）
把 Obsidian 列為五個工具之一，並明說它根本不是外掛，只是一個裝滿 Markdown 的資料夾——
但它解決五個裡最根本的問題：**Claude 沒有記憶**。

> 「前面四個都是讓 Claude 這一次做得更好，Obsidian 是讓它下一次不用重來。」

該文給的最小可行版本值得對照本知識庫的做法：在 CLAUDE.md 裡明寫「何時讀 vault」
（回答架構問題前、使用者提到「上次／之前／我們決定過」時、開新功能前）與
「何時寫 vault」（做出架構決策 → `decisions/`、踩坑並解決 → `gotchas/`、
明確說「記下來」時），再放一個 INDEX.md 讓 Claude 先掃目錄而非全讀。

**本知識庫的 `wiki/index.md` 就是這個 INDEX.md 的進階版**（表格化 + 分類 + 來源數）。

該文也列了不要用的時候：筆記沒人維護（**過期的 vault 比沒有更糟**，Claude 會照錯的
資訊做決定）、vault 太大需要索引或上 [[graphify]]、裡面有機密
（Claude 讀得到的就是進了 context 的）。第三點正是本知識庫 CLAUDE.md
「公開度與資安」一節在處理的問題。

## 相關頁面

- [[LLM-Wiki]] — 在 Obsidian 上實作的核心方法論
- [[graphify]] — vault 太大時的索引方案
- [[src-jason-claude-code-5-plugins-2026-07]] — 把 Obsidian 定位為「共用記憶層」的來源
- [[Andrej-Karpathy]] — IDE/programmer/codebase 比喻提出者
- [[Claude Code]] — 主要搭配的 CLI agent
- [[NotebookLM]] — 對照組：雲端 RAG 工具
- [[科技翰林院]]、[[HC-AI-說人話]] — 推廣此組合的中文創作者
