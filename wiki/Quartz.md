---
title: Quartz
type: entity
sources: ["Claude + Obsidian 打造 AI 第二大腦，Karpathy 的知識管理 LLM Wiki 教學｜科技翰林院.md", "ai-品質共謀ai-quality-collusionsearch暗色模式亮色模式閱讀模式.md"]
created: 2026-05-09
updated: 2026-05-09
tags: [ssg, digital-garden, markdown, obsidian, github-pages]
confidence: 強
---

# Quartz

由 [jackyzha0](https://github.com/jackyzha0) 開發的 **digital garden 靜態網站產生器**，把 [[Obsidian]] 風格的 markdown vault（含 `[[wikilink]]`、YAML frontmatter）一鍵編譯成可發布的網站。

本知識庫的**對外發布層**即用 Quartz v4，部署於 wiki.jackie-yeh.com（GitHub Pages）。

## 基本資訊

- **作者**：jackyzha0（Jacky Zhao）
- **官方文件**：https://quartz.jzhao.xyz/
- **GitHub**：https://github.com/jackyzha0/quartz
- **授權**：MIT
- **本知識庫使用版本**：v4.5.2

## 為何選 Quartz（vs 其他方案）

| 方案 | 月費 | 優勢 | 劣勢 |
|---|---|---|---|
| **Quartz** | $0（自架）| Obsidian 語法原生、社群活躍、可客製 | 需懂 Node.js、需自管 host |
| Obsidian Publish | $8/月 | 一鍵發布、與 Obsidian 完美整合 | 月費、客製受限 |
| Hugo / 11ty | $0 | 速度快、生態成熟 | 不原生支援 `[[wikilink]]` |
| Notion | $$$ | 編輯體驗好 | 鎖定平台、匯出失真 |

[[科技翰林院]]觀察：「跨裝置同步如果不想付 [[Obsidian]] Sync 的費用，用 iCloud（Mac/iOS）或 Git 就能解決，這個價格門檻，比任何同級方案都低。」

## 核心 Plugin Pipeline

| 階段 | Plugin | 作用 |
|---|---|---|
| **Transformer** | FrontMatter, ObsidianFlavoredMarkdown, GitHubFlavoredMarkdown | 解析 markdown 與 wikilink |
| **Transformer** | CrawlLinks | 建立反向連結圖譜 |
| **Transformer** | TableOfContents, Description | 自動產生 ToC、SEO description |
| **Filter** | RemoveDrafts | `draft: true` 的頁不發布 |
| **Emitter** | ContentPage, FolderPage, TagPage | 產出實際 HTML |
| **Emitter** | ContentIndex | 生成 RSS / sitemap |
| **Emitter** | CustomOgImages | 自動生成社群分享預覽圖 |

## 本知識庫的 Quartz 設定

`quartz.config.ts` 重點：

- **`baseUrl`**：wiki.jackie-yeh.com
- **`locale`**：zh-TW
- **配色**：暖石系（米色 #f5f2ee + 翠綠 #3d7a78）
- **字型**：Noto Sans TC（標題與內文）+ IBM Plex Mono（程式碼）
- **`ignorePatterns`**：private / templates / .obsidian
- **部署**：`.github/workflows/deploy.yml` 在 push 到 main 時自動 build + deploy 至 GitHub Pages

> Quartz 預設讀 `content/` 目錄，本知識庫用 symlink `content -> wiki` 把它指到 `wiki/`，這樣不必修改 Quartz 預設設定。

## 元觀察：Quartz 在中文圈的擴散

本知識庫不是孤例：

- **本知識庫**（jackie-yeh.com）：多領域第二大腦，[[LLM-Wiki]] 範式 + 中文 schema
- **SPT Wiki**（shingo0620.github.io/SPT/）：軟體生產技術反模式，含月綜整 / 週綜整節奏
  - 來源：[[src-spt-ai-quality-collusion]]
  - 兩者皆採 `src-{slug}` 命名、使用 `[[wikilink]]`、由 LLM 維護

> 觀察：Quartz + Obsidian + Claude Code 的三件式組合在中文 LLM Wiki 圈正在浮現範式化趨勢。

## 與 [[LLM-Wiki]] 的關係對照

[[Andrej-Karpathy]] 原始 LLM Wiki 概念**沒有指定發布層**——只說 wiki 是「結構化、互相連結的 markdown 檔案」。本知識庫額外加上 Quartz 作為發布層的考量：

| Karpathy 原概念 | 本知識庫實作 |
|---|---|
| 私人累積（不對外） | 預設 + 選擇性對外發布（Quartz）|
| 維護者：自己 + LLM | 同上 |
| 資料：raw/ + wiki/ | 同上 |
| **發布**：未指定 | **Quartz → GitHub Pages** |

額外發布層的好處：
- 公開頁的反向連結圖譜可被搜尋引擎索引
- 行動裝置友善（手機隨時查 wiki）
- 變相做了個 backup（GitHub commit history）

## 信心評估

- **強**：基本資訊、設定細節、本知識庫實際運作 — 直接驗證
- **強**：與 SPT Wiki 並列為中文 LLM Wiki 範式 — 雙方公開可查
- **中**：「Quartz 是中文 LLM Wiki 主流選擇」— 觀察基於 2 個樣本，需累積更多

## 相關頁面

- [[Obsidian]] — 配合的編輯器
- [[LLM-Wiki]] — 本知識庫採用的方法論
- [[Claude Code]] — 編輯與維護的 agent
- [[src-spt-ai-quality-collusion]] — 另一個用 Quartz 的中文 LLM Wiki 案例
- [[科技翰林院]] — 推薦 Obsidian + iCloud + Git 免費組合的中文創作者
