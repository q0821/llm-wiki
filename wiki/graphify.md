---
title: graphify
type: entity
sources: ["claude-code-五個外掛完整安裝與實戰指南.md", "別人常用的skill.md", "Instagram 上的 Divyanshi Sharma.md"]
created: 2026-07-22
updated: 2026-07-22
tags: [agent-skills, claude-code, 知識圖譜, tree-sitter, 工具]
confidence: 中
---

# graphify

把任何輸入（程式碼、文件、PDF、圖片）轉成可查詢知識圖譜的 [[Agent-Skills|Claude Skill]]。
形態是 **skill + hook**，不是 plugin。

官方： github.com/safishamsi/graphify ｜ graphify.net

## 它解決的問題

[[Claude Code]] 在大型專案裡最貴的成本不是輸出，是**定位**——動手前要先讀懂架構，
而讀懂的方式是一個檔案一個檔案 grep。專案愈大這筆錢燒得愈兇。

graphify 用 **tree-sitter 做 AST 靜態解析**，把專案解成一張圖：節點是概念、邊是關係，
並自動抓出：

- **community**：模組群（哪些東西實際上聚在一起）
- **god node**：被最多東西依賴的核心

## 安裝與使用

```bash
pip install graphifyy          # 套件名兩個 y，需 Python 3.10+
graphify install               # 安裝 skill
cd your-project
graphify claude install        # Claude Code 深度整合
graphify hook install          # 選用：post-commit / post-checkout 自動更新圖
```

`graphify claude install` 做兩件事：

1. 在 CLAUDE.md 寫入「回答架構問題前先讀 `graphify-out/GRAPH_REPORT.md`」
2. 裝 **PreToolUse hook**，在每次 Glob／Grep 之前攔截

**hook 是關鍵**——它讓 Claude 在「搜之前」先看圖，而不是靠模型自律去記得看。
這是 [[Harness-Engineering]] 的典型手法：把「應該做的事」變成環境強制，而非指令期待。

```bash
/graphify ./your-folder                      # 建圖
/graphify query "使用者登入流程經過哪些檔案"
/graphify path A B                           # 追兩個東西之間的路徑
/graphify explain <concept>                  # 解釋單一概念
```

| 產出 | 用途 |
|---|---|
| `graph.html` | 可點擊的互動視覺化 |
| `GRAPH_REPORT.md` | 一頁式摘要：god nodes、communities、意外連結 |
| `graph.json` | 可查詢的持久化圖 |
| `cache/` | 增量快取 |

## 什麼時候不要用

- **檔案不到 100 的小專案**：Claude 直接讀比較快，建圖是額外成本
- 文件／PDF／圖片的語意抽取**會呼叫模型**（程式碼走 tree-sitter 是本機免費），
  大型混合專案第一次建圖成本要有心理準備
- `graphify install` **會覆寫 SKILL.md**，客製過的話升級後要重新確認

作者建議的導入時機是「超過 200 檔再裝」。

## 與本知識庫的關聯

- 使用者**本機已裝**（`~/.claude/skills/graphify/`），CLAUDE.md 中有規則：
  輸入 `/graphify` 時先 invoke Skill tool
- [[LLM-Wiki]] — 精神相近（結構化 + 可查詢），但目標不同：graphify 圖是
  **自動生成、面向定位**；LLM Wiki 是**人工策展、面向理解與觀點累積**。
  兩者可並存：圖用來找東西，wiki 用來想事情
- [[Harness-Engineering]] — PreToolUse hook 攔截 Glob/Grep 是「環境強制」的實例
- [[Context-Engineering]] / [[Context-Rot]] — 少讀是為了省 context
- [[src-community-claude-skills-list]] — 社群清單中出現過
- [[src-jason-claude-code-5-plugins-2026-07]] — 目前最完整的說明來源（含限制）

## 待驗證

- 本機已安裝版本與上述指令是否一致（採用前應自行確認）
- 對本 wiki 這種**純 Markdown 專案**建圖是否有價值（檔案數已破百，但屬文件非程式碼，
  語意抽取要呼叫模型＝有成本）
