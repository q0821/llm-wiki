# LLM Wiki Schema

## 知識庫概述
- 主題：多領域個人知識庫（技術、親子出遊、投資等）
- 目的：第二大腦——備忘有趣與實用的資訊，後續消化整理
- 預期使用者：自己與未來的自己
- 語言：繁體中文，專有名詞附註原文（例：注意力機制 (Attention Mechanism)）

## 高層原則
- 組織邏輯：按主題分類為主，輔以因果關係連結。跨領域的關聯也要主動建立（例如技術趨勢影響投資判斷）
- 摘要風格：結構化條列，方便快速掃描與回顧
- 知識庫調性：實用導向的個人第二大腦，重視快速查閱與未來回想時的脈絡完整性

## 具體指引

### 來源處理
- 主要來源類型：網頁 URL、社群貼文連結、GitHub repo、純文字片段、圖片、YouTube 影片
- 原文引用：需要，重要論點附原文引用區塊

### 品質控制
- 矛盾處理策略：並列呈現，標註各自來源與時間，不擅自取捨
- 信心標注：標注證據等級（強／中／弱），依據來源可信度、資料新鮮度、是否有多來源佐證綜合判斷

## 頁面類型
- **來源摘要**（source）：每個匯入來源一頁
- **實體頁**（entity）：人物、組織、產品、地點、景點、餐廳
- **概念頁**（concept）：理論、方法、框架、技術概念
- **綜整頁**（synthesis）：跨來源的分析與整合
- **比較頁**（comparison）：並排比較

## 規則
- raw/ 中的檔案不可修改
- 每次操作後更新 index.md 和 log.md
- 使用 [[wikilink]] 格式交叉引用
- 新資料與舊主張矛盾時，並列呈現並標註來源
- 每個 wiki 頁面包含 YAML frontmatter
- 專有名詞首次出現時附註原文，後續可省略
- index.md 各分類使用表格格式，欄位為「頁面」、「摘要」、「來源數」

## 公開度與資安（從失敗中累積）

本知識庫是 GitHub **public repo**，push 後即成公開記錄（即使有 noindex/nofollow 也只擋搜尋引擎，擋不了 GitHub clone / search / API）。

- **客戶案件 retro / 學習不直接進 wiki/**：原始 retro 含客戶識別、admin URL、schema、版本快照、商業措辭 → 一律不入 git
- **要公開必須先漂白**：抽出純 pattern / 反模式 / 工作流，移除以下識別資訊後才可入 wiki：
  - 客戶名稱（含暱稱、領域標記、可被反查的描述）
  - admin URL / 路由前綴 / 內部 API endpoint
  - 具體 model / table / schema 名稱（改用 generic 代稱：`Coupon`、`Batch`、`User`）
  - 精確版本快照（lockfile 級的 patch 版本）
  - phase 編號 / commit / test / 時程數字
  - 商業措辭（簽約狀態、報價、客戶評論、跟業主的關係描述）
- **commit 前自查**：`grep` wiki/*.md 掃敏感詞清單（客戶名、URL、schema 名等），確認 0 命中才 push
- **連描述都要去識別**：log.md 或 commit message 描述「漂白移除了什麼」時不要列出具體敏感詞——「移除客戶名」而不是「移除『XX 王國』」
- **要保留具體 case 細節** → private repo（如 `client-case-learnings`）或本地不入版控目錄

對應 [[Ratchet-Pattern]]：每次失敗編碼成永久規則。本規則來自 2026-05-15 的一次實際事件（force push 撤回）。

## 素材投遞（Inbox 機制）
本專案不放在 iCloud（避免 .git 損毀、node_modules 同步衝突），但有獨立的 iCloud Obsidian vault 作為手機投遞口：

- **Inbox 位置**：`~/Library/Mobile Documents/iCloud~md~obsidian/Documents/wiki-inbox/`（手機 Obsidian 可見）
- **同步腳本**：`bin/inbox-pull.sh`
- **同步策略**：mv（搬移），不是 cp。inbox 永遠保持淨空（只留 README.md）
- **搬移規則**：
  - `*.md` / `*.txt` → `raw/`
  - 其他附件（圖片、PDF 等） → `raw/assets/`
  - 衝突時自動加時間戳後綴
- **觸發時機**：`/llm-wiki ingest` 流程開頭會自動執行此腳本（前置檢查的一部分）
- **手動觸發**：直接跑 `./bin/inbox-pull.sh`
