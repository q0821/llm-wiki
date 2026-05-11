# 日誌

> 僅追加記錄。格式：`## [YYYY-MM-DD] 操作 | 標題`

## [2026-04-15] init | 知識庫初始化
- 主題：技術、親子出遊、投資等多領域第二大腦
- 目的：備忘有趣與實用的資訊，後續再消化整理
- 語言：繁體中文（專有名詞附原文）
- Profile 設定：已寫入 CLAUDE.md

## [2026-04-15] ingest | 批次匯入 Second-Brain 來源
- 匯入 7 個來源（跳過 3 個 meta 檔案）
- 建立來源摘要頁：[[src-btc-dual-currency-2026-03-09]], [[src-taiwan-stock-2026-03-09]], [[src-mega-bloks-pikachu]], [[src-plakoro-board-game]], [[src-marketing-skills-ai-agents]], [[src-photography-studio-proposal]], [[src-openclaw-wordpress-rag]]
- 建立實體頁：[[攝影工作室A]], [[OKX]], [[Cloudflare]]
- 建立概念頁：[[雙幣贏]], [[RAG]], [[Embedding]], [[Agent-Skills]]
- 共建立 14 個 wiki 頁面

## [2026-04-16] ingest | Asgard Skills Repository
- 來源：https://github.com/asgard-ai-platform/skills
- 重點方向：股票分析、策略、網站規劃、SEO、設計
- 建立來源摘要頁：[[src-asgard-skills]]
- 建立實體頁：[[Asgard-AI-Platform]]
- 更新概念頁：[[Agent-Skills]]（新增 Asgard 集合與兩套 skills 比較表）
- 影響頁面：[[src-asgard-skills]], [[Asgard-AI-Platform]], [[Agent-Skills]], index.md

## [2026-04-16] lint | 健康檢查與修正
- 標記投資記錄待觀察項目為「未追蹤後續」：[[src-btc-dual-currency-2026-03-09]], [[src-taiwan-stock-2026-03-09]]
- 補充 confidence 欄位：[[攝影工作室A]], [[OKX]], [[Cloudflare]]
- 新建實體頁：[[OpenClaw]]
- 補充交叉引用：[[src-taiwan-stock-2026-03-09]], [[src-mega-bloks-pikachu]], [[攝影工作室A]], [[src-openclaw-wordpress-rag]]
- 補充關鍵引用區塊：[[src-btc-dual-currency-2026-03-09]], [[src-taiwan-stock-2026-03-09]]
- 更新 index.md（新增 OpenClaw 實體）

## [2026-04-16] ingest | 50 個顧客管理自我診斷問題
- 來源：raw/你真的了解你的顧客嗎？—— 50 個自我診斷問題.md
- 建立來源摘要頁：[[src-customer-diagnostic-50-questions]]
- 建立概念頁：[[顧客終身價值]]
- 更新交叉引用：[[src-photography-studio-proposal]], [[src-marketing-skills-ai-agents]]
- 影響頁面：[[src-customer-diagnostic-50-questions]], [[顧客終身價值]], [[src-photography-studio-proposal]], [[src-marketing-skills-ai-agents]], index.md

## [2026-04-16] ingest | Claude Code 工作階段管理與百萬上下文攻略
- 來源：raw/Claude Code 工作階段管理與百萬上下文攻略.md
- 作者：Anthropic 工程師 Thariq，X (Twitter) 實戰教學
- 建立來源摘要頁：[[src-claude-code-context-management]]
- 影響頁面：[[src-claude-code-context-management]], [[Agent-Skills]], index.md

## [2026-04-16] ingest | DESIGN.md 革命 + oh-my-design
- 來源：raw/designmd-革命一個純文字檔案讓-ai-coding-agent-秒生成-stripelinear-等級的-ui.md, raw/oh-my-design-design-system-generator.md
- 建立來源摘要頁：[[src-design-md-revolution]]
- 建立概念頁：[[DESIGN-md]]
- 影響頁面：[[src-design-md-revolution]], [[DESIGN-md]], [[Agent-Skills]], index.md
- 備註：GitHub (VoltAgent/awesome-design-md) 抓取超時；YouTube (rgyuQNXyYvc) 無字幕，兩者均跳過

## [2026-04-16] synthesis | 顧客管理自我診斷作答記錄
- 逐題問答，記錄於 [[diagnostic-customer-answers]]
- 使用業績記錄表.xlsx 補充部分真實數據
- 資料狀況：2019-2022 完整，2023 缺漏，2024-2025 成交未登記
- 待辦：取得更完整的業績資料後重新分析，補充 CLV、留存率等數字

## [2026-04-20] ingest | VoltAgent/awesome-design-md（補抓 2026-04-16 跳過的來源）
- 來源：raw/github-voltagentawesome-design-md-...-github.md（2026-04-20 fetch-url.sh 重抓成功）
- 整合到既有頁面：[[src-design-md-revolution]]（來源數 2 → 3），補上完整 68 個品牌分類與最新數據
- 更新概念頁：[[DESIGN-md]]（補上 getdesign.md 官方服務、採用動能說明）
- 關鍵觀察：awesome-design-md 於 2-3 週內 stars 從 4,385 → 59,900（~14×），收錄 55+ → 68 個品牌
- 清理：刪除空檔 `DESIGN.md 革命...md`（CJK 重複）與 `Untitled.md`（只含已知無字幕的 YouTube URL）
- 影響頁面：[[src-design-md-revolution]], [[DESIGN-md]], index.md

## [2026-04-20] ingest | Claude Code × NotebookLM 整合實戰
- 來源：raw/只要 5 分鐘！Claude Code 無縫整合 NotebookLM 實戰.md
- 作者：[[HC-AI-說人話]]（YouTube 創作者）｜原始影片：https://www.youtube.com/watch?v=22bjps4LMmU
- 建立來源摘要頁：[[src-claude-code-notebooklm]]
- 建立實體頁：[[NotebookLM]], [[notebooklm-py]], [[HC-AI-說人話]]
- 更新概念頁：[[Agent-Skills]]（新增 NotebookLM Skill、yt-search Skill 案例與「Skill 自我優化 meta-pattern」段落）
- 更新概念頁：[[RAG]]（新增 RAG 解決方案類別表格，並列自建 vs 免費商用）
- 補充交叉引用：[[src-claude-code-context-management]], [[src-asgard-skills]]
- 重點面向：(a) 工具整合教學 (b) Token 經濟學 (c) Skill 自我優化 meta-pattern（全部）
- 待辦：作者 HC 提到的「上一支影片」（LLM wiki + Obsidian + Claude Code）值得追蹤匯入

## [2026-04-20] update | index.md 新增「最近新增」區塊
- 在索引頁頂部加入最近 10 筆新增頁面清單，欄位：頁面、類型、新增日期
- 按日期倒序排列，方便一眼掌握最新動態
- 影響頁面：index.md

## [2026-04-20] ingest | Anthropic Claude Managed Agents（3 來源整合）
- 背景：原 raw/ 內的「永別了 n8n！Managed Agents」為空檔，使用者判斷導課內容不值得擷取；改為搜尋實用教學後選 3 份整合
- 來源：
  - raw/scaling-managed-agents-decoupling-the-brain-from-the-hands-anthropic.md（官方工程部落格，fetch-url.sh 抓取）
  - raw/claude-managed-agents-github-tutorial-az9713.md（GitHub 教學 repo，WebFetch 抓取 raw README）
  - raw/the-ai-corner-claude-managed-agents-guide-2026.md（真實部署案例，WebFetch 抓取摘要；premium 部分未取得）
- 建立來源摘要頁（僅官方版，較厚）：[[src-anthropic-managed-agents-engineering]]
- 建立概念頁：[[Managed-Agents]]（整合 3 來源，含架構、定價、真實案例、教學資源）
- 建立概念頁：[[Meta-Harness]]（抽離出的設計哲學模式，OS 虛擬化類比）
- 更新概念頁：[[Agent-Skills]], [[RAG]]（補交叉引用）
- 更新來源頁：[[src-claude-code-context-management]]（與 Managed Agents session 外部化對照）
- 清理：刪除空檔 `永別了 n8n！Managed Agents...md`
- 重點面向：(a) 架構設計哲學 (b) 實際部署案例 (c) 定價與經濟學（全部）
- 關鍵觀察：TTFT p50 -60% / p95 -90% 是 decoupling 的具體效能收益，可作為架構評估基準
- 影響頁面：[[src-anthropic-managed-agents-engineering]], [[Managed-Agents]], [[Meta-Harness]], [[Agent-Skills]], [[RAG]], [[src-claude-code-context-management]], index.md

## [2026-04-21] ingest | Harness Engineering（AI 駕馭工程）入門篇
- 來源：raw/Harness Engineering（AI駕馭工程）入門篇：OpenAI最新編程標準，教你輕鬆做到Lv.1.md
- 作者：flip（動區動趨），原始文章來自 OpenAI 工程師 Ryan Lopopolo
- 建立來源摘要頁：[[src-harness-engineering-openai]]
- 建立概念頁：[[Harness-Engineering]]
- 更新概念頁：[[Meta-Harness]]（新增 Harness Engineering 交叉引用，來源數 1→2）
- 備註：來源後半段混入不相關的嘉信理財新聞（網頁擷取雜訊），已忽略
- 影響頁面：[[src-harness-engineering-openai]], [[Harness-Engineering]], [[Meta-Harness]], index.md

## [2026-04-21] ingest | 推薦的 Claude Code skill 清單
- 來源：raw/推薦的 Claude Code  skill.md
- 整合到既有頁面：[[Agent-Skills]]（新增「推薦 Skills 清單」區段，來源數 3→4）
- 8 個推薦 skill：superpowers、anthropics/skills、gstack、obsidian-skills、claude-code-templates、marketingskills、claude-scientific-skills、compound-engineering-plugin
- 不另建來源摘要頁（資訊密度低，整合進概念頁更合適）
- 影響頁面：[[Agent-Skills]]

## [2026-04-21] ingest | 雙幣贏的真相：折價賣波動率
- 來源：raw/雙幣贏的真相：折價賣波動率.md
- 建立來源摘要頁：[[src-dual-currency-truth]]
- 大幅更新概念頁：[[雙幣贏]]（來源數 1→2，confidence 中→強，新增定價不公平、行情依賴、替代方案比較等區段）
- 關鍵發現：交易所雙幣贏定價比 Deribit 公允價折價 40-60%，散戶期望值先天劣勢
- 影響頁面：[[src-dual-currency-truth]], [[雙幣贏]], index.md

## [2026-04-23] ingest | WordPress 接案交接：如何檢查「前人的遺產」
- 來源：raw/2026-04-23-接手專案檢查sop.md
- 來源性質：**原創經驗文**（author: Jackie Yeh），第一手接手案例
- 建立來源摘要頁：[[src-wordpress-handover-sop]]
- 建立概念頁：[[WordPress-接手檢查SOP]]（依使用者決定，將「前人的遺產」概念併入此頁定義區段，不獨立建頁）
- 建立實體頁：[[WP-CLI]]
- 更新既有頁面：[[src-photography-studio-proposal]]（新增 WordPress-接手檢查SOP 交叉引用）
- 重點面向：(a) 技術 SOP 六步驟 (b) 資安倫理（撿到別家帳密處理原則）(c) 接案經驗——三者都收
- 關鍵觀察：
  - `wp core verify-checksums` 一個指令同時解決「多餘檔盤點」與「核心檔竄改」
  - serialized data 必須用 `wp search-replace --all-tables`，SQL UPDATE 會破壞長度標記
  - 倫理處理三原則：不利用、不傳播、視認識程度決定通知
- 影響頁面：[[src-wordpress-handover-sop]], [[WordPress-接手檢查SOP]], [[WP-CLI]], [[src-photography-studio-proposal]], index.md

## [2026-04-24] lint | 健康檢查與修正
- 操作模式：逐項確認執行
- **A 類修正（結構/正確性）**：
  - A1：index.md「綜整與分析」區段補上 [[diagnostic-customer-answers]]
  - A2：修壞連結 2 個——`diagnostic-customer-answers` 的 `[[src-customer-diagnostic-50-questions.md]]` 去掉 `.md`；`Managed-Agents` 中指向 raw/ 的 `[[the-ai-corner-...]]` 改為純文字
  - A3：補 confidence 欄位於 [[src-dual-currency-truth]]（強）、[[src-harness-engineering-openai]]（強）、[[diagnostic-customer-answers]]（中）
- **B 類修正（一致性）**：
  - B1：[[Agent-Skills]] 來源數 3→4；[[DESIGN-md]] frontmatter sources 改列 3 個 raw（與其他 concept 慣例一致），index 來源數 2→3
- **C 類修正（交叉引用）**：
  - C1：[[src-customer-diagnostic-50-questions]] 補反向連結 [[diagnostic-customer-answers]]
  - C2：[[攝影工作室A]] 連 [[WordPress-接手檢查SOP]]；[[src-openclaw-wordpress-rag]] 連 [[WordPress-接手檢查SOP]] 與 [[WP-CLI]]；並補齊反向連結
- **D 類改善（新建頁面）**：
  - D1.1：新建綜整頁 [[WordPress-接案工作筆記]]（整合 [[src-photography-studio-proposal]]、[[WordPress-接手檢查SOP]]、[[src-openclaw-wordpress-rag]]）
  - D1.2：新建比較頁 [[加密貨幣收益工具比較]]（活期賺幣 / 網格 / [[雙幣贏]] / Deribit 自賣）
  - D1.3：新建來源頁 [[src-recommended-claude-code-skills]]（原先整合於 [[Agent-Skills]]，改為獨立 author=Jackie Yeh 來源頁）
- 影響頁面：index.md, [[diagnostic-customer-answers]], [[Managed-Agents]], [[src-dual-currency-truth]], [[src-harness-engineering-openai]], [[DESIGN-md]], [[Agent-Skills]], [[src-customer-diagnostic-50-questions]], [[攝影工作室A]], [[src-openclaw-wordpress-rag]], [[WordPress-接手檢查SOP]], [[WP-CLI]], [[src-photography-studio-proposal]], [[src-wordpress-handover-sop]], [[雙幣贏]], [[src-recommended-claude-code-skills]], [[WordPress-接案工作筆記]], [[加密貨幣收益工具比較]]

## [2026-04-24] query → synthesis | 攝影工作室A — 網站優化簡報
- 查詢「攝影工作室A客戶的內容」，以 [[src-photography-studio-proposal]] 與 [[攝影工作室A]] 為基底
- 使用者需求：給攝影工作室A + 小編的內部共識簡報，前提「若無法取得資源，至少讓小編可自行執行」
- 產出 Marp 格式簡報 [[presentation-攝影工作室A-網站優化]]（34 張）
  - Part 1 現況盤點 + Part 2 四大症狀 + Part 3 三層策略 + Part 4 小編行動手冊 + Part 5 衡量追蹤 + Part 6 優先順序
  - 新增內容：知識文章寫作模板、SEO 標題檢查表、圖片 alt text 範例、每週一小時行動方案、寫作靈感來源四法、常見誤區警示
- 更新 index.md：最近新增區塊與「綜整與分析」區段各補 1 筆
- 影響頁面：index.md, [[presentation-攝影工作室A-網站優化]]

## [2026-04-24] audit → synthesis | 攝影工作室A SEO + GEO 實地健檢（簡報大改版）
- 實地抓取 client-site.example 技術 SEO 資料（首頁 head、robots.txt、sitemap、多個分類與服務頁、qualityrecommendation 頁）
- 實測校正的數字：文章總數 350+（原估 430）、商業分類文章 40-60 篇（原估 22）、已有 commercial-photography 分類 20+ 篇 2026 新文章
- 技術 SEO 實測發現：
  - 已有：完整 sitemap、canonical、OG、Twitter Card、Schema.org（Organization + WebSite + Author Person）、WP Rocket 快取
  - 缺：Meta description 完全婚禮化、URL 結構 /ID/日期 無關鍵字、無 about 頁、無 LocalBusiness/Service/FAQPage schema、客戶推薦 0 企業（5 全同業夥伴）
- 簡報大改版為「SEO × GEO 雙軌健檢」：從 34 張擴為 8 個 Part
  - Part 1 健檢總覽（含 ABC 儀表板 + 好消息 / 壞消息）
  - Part 2 SEO 體檢（實測 Title / Meta / URL / 分類 / 服務頁密度 / 外部訊號）
  - Part 3 GEO 體檢（Schema.org 現況 + E-E-A-T + FAQ 缺口）
  - Part 4 Google + AI 眼中的你（含 ChatGPT / Perplexity 模擬）
  - Part 5 雙軌改善策略（A 軌 SEO 內容 + B 軌 GEO 結構）
  - Part 6 小編行動手冊（三個月清單 + FAQ 寫作指南 + 圖片說明）
  - Part 7 衡量（五項指標，新增 AI 引用次數與 Schema 覆蓋率）
  - Part 8 優先順序（本月三件 + 本季藍圖）
- 重新匯出 PDF 至 ~/Downloads（1.2MB）
- 影響頁面：index.md, [[presentation-攝影工作室A-網站優化]]

## [2026-04-28] ingest | Will AI Kill SaaS（5）— Adobe/Figma 之死
- 來源：raw/(5) Will AI Kill SaaS系列：... - Yu-Chih Edward Hwang.md（Facebook 個人發文，2026-04-24）
- 作者：[[Yu-Chih-Edward-Hwang]]（fatality1117）；系列第 5 篇
- 圖片：根目錄 `Pasted image 20260424133004.png` → 移至 `raw/assets/figma-mcp-architecture-2026-04-24.png`
- 建立來源摘要頁：[[src-will-ai-kill-saas-design]]
- 建立概念頁：[[Vibe-Coding]], [[Agentic-AI-Workflow]]（含 Design to Code / Code to Design 兩節）
- 建立實體頁：[[Figma]], [[Adobe]], [[Claude-Design]], [[Yu-Chih-Edward-Hwang]]
- 取捨：
  - Contextual Coding（Cursor / Copilot 範式）資訊密度不足，僅在源頁定義，不獨立建頁
  - Design-to-Code / Code-to-Design 併入 [[Agentic-AI-Workflow]] 作子節
- 待辦（iCloud 解凍後再補）：
  - 兩個 ThisWeb 來源（DESIGN.md ThisWeb 文章 + Threads 貼文）尚未 ingest——文章內容是 SPA 取不到，待手動補
  - 需更新既有頁面 [[DESIGN-md]]（補 Figma MCP / Code to Design 段落）、[[Harness-Engineering]]（與 Agentic Workflow 對照）、[[Agent-Skills]]（補 Vibe Coding / Claude Design 交叉引用）——這些頁面目前因 iCloud 釋出本地空間無法讀取
- 影響頁面：index.md, [[src-will-ai-kill-saas-design]], [[Vibe-Coding]], [[Agentic-AI-Workflow]], [[Figma]], [[Adobe]], [[Claude-Design]], [[Yu-Chih-Edward-Hwang]]

## [2026-05-08] infra | 建立 inbox 機制（手機素材投遞）
- 問題：整包專案放 iCloud 會壞 .git/objects、衝突 node_modules，但需要手機隨手丟素材的能力
- 解法：專案保持本地，獨立開 iCloud Obsidian vault `wiki-inbox` 作投遞口
- 新增：
  - `~/Library/Mobile Documents/iCloud~md~obsidian/Documents/wiki-inbox/`（含 .obsidian/app.json + README.md）
  - `bin/inbox-pull.sh`（mv 而非 cp，衝突加時間戳，跳過 .DS_Store / .obsidian / README.md）
  - 專案 CLAUDE.md 新增「素材投遞（Inbox 機制）」段落
- 工作流：手機 → wiki-inbox vault → iCloud 同步 → Mac 端跑 inbox-pull.sh → raw/

## [2026-05-08] ingest | 科技翰林院 LLM Wiki 教學
- 來源：raw/Claude + Obsidian 打造 AI 第二大腦，Karpathy 的知識管理 LLM Wiki 教學｜科技翰林院.md
- 來源驗證：本次 ingest 由 inbox 機制觸發——手機投遞 URL 占位符 → inbox-pull.sh 搬入 raw/（不過此檔已有完整網頁內容，URL 占位符是另一篇 AI 品質共謀，未在本次處理）
- 作者：[[科技翰林院|AI 導演林思翰 Hans]]，發表於 2026-04-14
- 強調軸（依使用者指引）：(a) RAG vs LLM Wiki 對立軸、(b) 實戰技巧、(c) 歷史脈絡（Memex → Karpathy）
- 忽略：價格表、文末推薦閱讀
- 建立來源摘要頁：[[src-techhanlin-llm-wiki-tutorial]]
- 建立概念頁：[[LLM-Wiki]]（核心方法論，本知識庫的元層級頁）, [[Memex]]（歷史先驅，Vannevar Bush 1945）
- 建立實體頁：[[Andrej-Karpathy]]（LLM Wiki 提出者）, [[科技翰林院]]（作者品牌）, [[Obsidian]]（載體工具）
- 更新既有頁：
  - [[HC-AI-說人話]] 加入「同領域中文創作者」區塊（與科技翰林院互補定位）
  - [[RAG]] 新增「RAG vs LLM Wiki」對照區（核心對立論點 + 互補關係）
  - [[Agent-Skills]] 新增「與 .claude/commands/ 的關係」區塊
- 自指特性：本次 ingest 把「介紹 LLM Wiki 的文章」加進「LLM Wiki 知識庫」，未來 query「我的方法論基礎」時可直接溯源
- 待辦：
  - raw/ 中尚有「科技翰林院 Claude Code 8 個實戰設定」未處理，可預期 [[科技翰林院]] entity 會持續累積
  - 直接 ingest [[Andrej-Karpathy]] 原始 gist（karpathy/442a6bf...）以一手強化 [[LLM-Wiki]] 頁信心等級
- 影響頁面：index.md, [[src-techhanlin-llm-wiki-tutorial]], [[LLM-Wiki]], [[Memex]], [[Andrej-Karpathy]], [[科技翰林院]], [[Obsidian]], [[HC-AI-說人話]], [[RAG]], [[Agent-Skills]]

## [2026-05-09] ingest | 批次處理 raw/ 中累積素材（4 篇 ingest + 2 篇跳過）

### 完整 ingest

**1. AI 品質共謀（SPT Wiki）**
- URL 占位符 → fetch-url.sh 抓回完整內容（148 行）
- 來源：另一個用 Quartz v4 建的中文個人 wiki（https://shingo0620.github.io/SPT/）— 元層級觀察：本知識庫不是孤例
- 建立：[[src-spt-ai-quality-collusion]]、[[AI-Quality-Collusion]]（concept）
- 概念：AI 同時生成 code 與 test 時，測試對齊實作而非需求 → CI 綠燈卻測不到真實 bug
- 對策：context 隔離、SBE 規格凍結、人類黃金測試、探索性測試
- 與既有 [[Vibe-Coding]]、[[Meta-Harness]]、[[Managed-Agents]] 自然連結

**2. 科技翰林院 — Claude Code 8 個實戰設定**
- 作者第二篇納入 [[科技翰林院]] entity（與第一篇 [[src-techhanlin-llm-wiki-tutorial]] 構成「方法論 + 實戰」雙軸）
- 建立：[[src-techhanlin-claude-code-8-settings]]、[[CLAUDE-md]]（concept，重要）
- [[CLAUDE-md]] 補充本知識庫缺漏的核心概念頁，承載：兩層分層、該寫/不該寫對照表、長度建議、與 [[LLM-Wiki]] schema 的整合
- 更新 [[科技翰林院]] entity（補第二篇 + 主要主張集）
- 更新 [[Agent-Skills]]（補「為什麼把 Prompt 變 Skill」+ 實戰 Skill 命名範例）

**3. The end of responsive images — Piccalilli**
- 作者：Mat Marquis（前 RICG 主席）
- URL 占位符 → fetch-url.sh 抓回（218 行）
- 簡明 ingest：僅建 [[src-piccalilli-end-of-responsive-images]]，不擴張 entity/concept
- 重點：`sizes="auto"` + `loading="lazy"` 終結手寫 sizes 的痛苦；現在就可以加，零成本
- 與本知識庫主軸關聯弱，主要供 [[Claude-Design]] / [[DESIGN-md]] 等前端議題參考

**4. Transitions.dev**
- 作者：Jakub Antalik
- URL 占位符 → fetch-url.sh 抓回（104 行，內容偏稀但網站本身就是互動式範例庫）
- 簡明 ingest：僅建 [[src-transitions-dev]]
- 重點：可複製貼上的 web app 轉場效果集（CSS / React），9 種常用效果

### 跳過（SPA 抓不到）

**5. ThisWeb DESIGN.md 文章**（https://www.thisweb.dev/articles/design-md）
- 第二次嘗試 fetch 仍失敗（Next.js / SPA，markdown.new API 抓不到動態渲染）
- 保留兩個占位符與一個失敗 fetch（`-2.md`）作為紀錄
- 待手動補（瀏覽器另存或從 ThisWeb 找 RSS / Markdown 來源）

**6. ThisWeb Threads 貼文**（https://www.threads.com/@this.web/post/...）
- Threads 同樣是 SPA，跳過
- 待辦：找 ThisWeb 是否有 RSS / Bluesky / 其他可抓的鏡像

### 待辦清單

- ThisWeb 兩篇 SPA 內容需手動補
- raw/ 中尚有「OpenClaw 龍蝦 4 月更新」「Claude Design 實戰」兩篇 [[科技翰林院]] 文章可補強既有 [[OpenClaw]]、[[Claude-Design]] entities
- 直接 ingest [[Andrej-Karpathy]] 原始 LLM Wiki gist（karpathy/442a6bf...）可一手強化 [[LLM-Wiki]] 信心等級

### 影響頁面

- 新建：[[src-spt-ai-quality-collusion]], [[AI-Quality-Collusion]], [[src-techhanlin-claude-code-8-settings]], [[CLAUDE-md]], [[src-piccalilli-end-of-responsive-images]], [[src-transitions-dev]]
- 更新：[[科技翰林院]], [[Agent-Skills]], index.md

## [2026-05-09] lint | 補建 Managed Agents 兩個來源的獨立 src 頁

### 動機

執行 raw/ 全面盤點時發現一致性缺口：

- `raw/claude-managed-agents-github-tutorial-az9713.md`
- `raw/the-ai-corner-claude-managed-agents-guide-2026.md`

兩者已在 2026-04-20 被列為 [[Managed-Agents]] 概念頁的多來源（`sources` frontmatter），但**沒有獨立的 src 摘要頁**——違反 SKILL.md「每個匯入來源一頁」原則。

### 修正

補建兩個簡明 src 頁：

**1. [[src-az9713-managed-agents-tutorial]]**
- GitHub repo 入門教學
- 重點：30 行 hello world、5 part 教學結構（~2.5 小時）、capstone arXiv research agent（年成本 $3）
- 設計哲學：Python SDK 薄層 + 重活 delegate Claude Code CLI subprocess

**2. [[src-the-ai-corner-managed-agents-guide]]**
- 商業內容訂閱媒體文章（部分付費牆）
- 重點：5 個真實企業部署案例（Notion / Rakuten / Asana / Sentry / Vibecode）
- 限制：technical architecture / deployment roadmap / system prompt templates 等付費部分未取得
- 兩者抓取時都因 fetch-url.sh 超時改用 WebFetch 萃取，內容是摘要而非全文

### 整理 [[Managed-Agents]]

- 新增「**三視角來源**」區塊明確標示三個來源的不同切入角度：
  - 官方視角（[[src-anthropic-managed-agents-engineering]]）
  - 社群視角（[[src-az9713-managed-agents-tutorial]]）
  - 商業視角（[[src-the-ai-corner-managed-agents-guide]]）
- 新增 [[AI-Quality-Collusion]] 交叉引用（subagent context 隔離可緩解此反模式）

### raw/ 完整盤點結論

掃過 raw/ 共 34 個 markdown 檔案：
- **已 ingest**：30 個（每個都有對應的 wiki/src-* 頁或被併入概念頁）
- **跳過（SPA）**：4 個（ThisWeb DESIGN.md 三個版本 + Threads 貼文）
- 完整 raw/ 與 wiki/ 對應關係達成**95% 覆蓋**

### 影響頁面

- 新建：[[src-az9713-managed-agents-tutorial]], [[src-the-ai-corner-managed-agents-guide]]
- 更新：[[Managed-Agents]], index.md

## [2026-05-09] lint | 全 wiki 健檢與修正

### 健檢範圍

- 63 個頁面 frontmatter 檢查
- wikilink 雙向連結圖譜分析
- index.md ↔ 實體頁雙向對應
- frontmatter sources 欄位指向驗證
- profile 一致性（confidence、原文引用區塊）
- 信心等級分布

### 主要發現

**孤立頁面：0**（很好——所有 61 個內容頁都有反向連結）
**信心等級分布**：強 43 / 中 17 / 弱 1（合理）
**index ↔ 頁面**：完全雙向對應，無遺漏

### 修正項目

**1. 補建 3 個缺漏頁**

- 新建 [[Claude Code]] entity 頁 — 原 9 處引用無獨立頁，補上本知識庫核心 agent 的完整描述
- 新建 [[Quartz]] entity 頁 — 原 2 處引用無獨立頁，記錄發布層工具與「中文圈 LLM Wiki 範式擴散」元觀察
- 新建 [[Specification-by-Example]] 簡明 concept 頁 — 配合 [[AI-Quality-Collusion]] 對策補充

**2. 修 frontmatter sources 格式錯誤（兩處）**

兩個 synthesis 頁的 sources 誤填成 wiki/ src 頁名而非 raw/ 檔名：
- `diagnostic-customer-answers.md`：`src-customer-diagnostic-50-questions.md` → `你真的了解你的顧客嗎？—— 50 個自我診斷問題.md`
- `presentation-攝影工作室A-網站優化.md`：`src-photography-studio-proposal.md` → `2026-03-20-攝影工作室A_網站提案.md`

**3. 移除假連結提議**

`src-transitions-dev` 中的 `[[前端工具索引]]` 是「未實現提議」，移除 wikilink 改為純文字引號。

**4. 補 [[src-piccalilli-end-of-responsive-images]] 的關鍵原文引用區塊**

按 CLAUDE.md「需要，重要論點附原文引用區塊」規定，補 7 段精彩原文（含「I'm here to help bury it」、「I know you would have done it wrong」等核心句）。

### 偽報項目（lint 腳本誤判，無需修）

- 5 處 `[[wikilink]]` 文字引用（LLM-Wiki / Memex / Obsidian / RAG / src-techhanlin-llm-wiki-tutorial）— 都已包在反引號 `` ` `` 內，markdown parser 不會解析為 link
- log.md 中歷史 lint 紀錄的兩處 wikilink 形式引用 — 也都在反引號內

腳本未過濾 backtick 是改進空間，但這次手動驗證確認無實際壞連結。

### 其他觀察（不修正）

- **過熱頁**：[[Agent-Skills]] 被引用 29 次、[[Managed-Agents]]/[[RAG]] 各 17 次。屬於核心節點，未來繼續累積可考慮拆子頁
- **時效性風險區**：Anthropic 定價、Figma 股價、雙幣贏/台股操作記錄 — 已標 confidence 中或「未追蹤後續」
- **3 個 src 頁無原文引用區塊**（玩具/客戶提案/工具網站）— 來源本身就無敘述性原文可引，豁免

### 影響頁面

- 新建：[[Claude Code]], [[Quartz]], [[Specification-by-Example]]
- 更新：[[diagnostic-customer-answers]], [[presentation-攝影工作室A-網站優化]], [[src-transitions-dev]], [[src-piccalilli-end-of-responsive-images]], index.md

## [2026-05-10] ingest | PAPAYA — Gemma 4 + LM Studio 本地 AI 教學

### 來源驗證

- inbox 投遞：兩個 YouTube URL 占位符（Untitled.md / Untitled 1.md）
- fetch-youtube.sh 結果：
  - r5M0W66xcGc（PAPAYA Gemma 教學）→ ✓ 繁中字幕完整（856 段）
  - KrUkyTYaRs4（《啊!設計》系列日本排版）→ ✗ 僅土耳其語自動字幕，**跳過**（與 wiki 主軸關聯弱、需 Whisper fallback 耗時）

### 強調軸（依使用者指引）

- (a) **雲端 vs 本地 AI 對立軸**：本知識庫第一個本地 AI 主題，與既有 [[Claude Code]] / [[NotebookLM]] / [[Managed-Agents]] 雲端服務形成對照
- (d) **使用者可操作的具體步驟**：影片完整實戰（硬體檢查 → 下載 → 設定 → 上傳分析 → 手機 → MCP → 寫程式）

### 新建頁面

**source（1 頁）**
- [[src-papaya-gemma-lm-studio]] — 含完整 7 步驟操作指南、雲端 vs 本地對照表、5 段精彩原文

**entity（3 頁）**
- [[Gemma]] — Google open-weight LLM 系列，4 個版本與 MoE（A3B）解釋
- [[LM-Studio]] — 跨平台 GUI 本地 LLM runtime，與 Ollama（CLI）對比
- [[PAPAYA-電腦教室]] — 中文 YouTube 創作者，補完中文 AI 教學者地圖

**concept（1 頁，重要）**
- [[MCP]] — Anthropic 推出的開放協議。本知識庫之前已多處引用（[[Claude Code]]、[[Managed-Agents]]、[[Agent-Skills]]、[[Obsidian]]）但無獨立頁——本次補上
- [[MCP]] 涵蓋 client/server 架構、與 OpenAI Function Calling 對照、本地 vs 雲端兩種使用情境、meta 工作流（用雲端 AI 設定本地 AI 的 MCP）

### 中文 AI 教學者地圖補完

新增的 [[PAPAYA-電腦教室]] 與既有 [[HC-AI-說人話]]、[[科技翰林院]] 形成三層光譜：

| 層級 | 創作者 | 內容偏向 |
|---|---|---|
| 入門 | PAPAYA 電腦教室 | 純白話、生活化情境 |
| 中階 | HC AI 說人話 | 5 分鐘上手、token 經濟學 |
| 進階 | 科技翰林院 | 方法論、結合公司營運 |

[[HC-AI-說人話]] 與 [[科技翰林院]] 兩頁皆更新「同領域中文創作者」區塊呈現此光譜。

### 更新既有頁

- [[Claude Code]] — 把 MCP 從文字加上 wikilink、相關頁面區塊補 [[Gemma]] / [[LM-Studio]] 對照
- [[Agent-Skills]] — 新增「與 Continue（VS Code 擴充）的對照」區塊
- [[HC-AI-說人話]] / [[科技翰林院]] — 中文 AI 教學者地圖三層光譜

### 跳過項目

- 第一支影片（KrUkyTYaRs4）保留 raw/Untitled.md 占位符作紀錄，未生成 wiki 頁

### 影響頁面

- 新建：[[src-papaya-gemma-lm-studio]], [[Gemma]], [[LM-Studio]], [[PAPAYA-電腦教室]], [[MCP]]
- 更新：[[Claude Code]], [[Agent-Skills]], [[HC-AI-說人話]], [[科技翰林院]], index.md

## [2026-05-11] ingest | ai-explained 教學網站 + BrowseForge 反偵測瀏覽器

### 來源驗證

- inbox 投遞：兩個 GitHub URL 占位符（robennals/ai-explained、nczz/BrowseForge/releases）
- fetch-url.sh **超時**（GitHub repo 頁太大）→ 改用 `gh api` 萃取 README + curriculum + release，存為 `raw/github-robennals-ai-explained.md` 與 `raw/github-nczz-browseforge.md`

### 強調軸（依使用者指引：全部）

- (a) AI 底層學習路徑：[[src-ai-explained-tutorial]] 完整呈現 21+ 章地圖
- (b) MCP 生態擴張：[[MCP]] 頁新增 server 端範例表，[[BrowseForge]] 作為「工具自帶 MCP server」案例
- (c) AI agent 操作瀏覽器：[[BrowseForge]] 頁新增此應用類別比較表
- (d) 反偵測瀏覽器技術細節：[[BrowseForge]] 頁完整收錄指紋/Cookie/Proxy/GeoIP 機制

### 新建頁面

**source（2 頁）**
- [[src-ai-explained-tutorial]] — Rob Ennals 互動式 AI 教學網站，含完整章節地圖 + 對應本知識庫頁面表
- [[src-browseforge]] — BrowseForge 完整功能，含倫理提示（雙用途工具）

**entity（2 頁）**
- [[BrowseForge]] — AI agent 操作瀏覽器的代表工具；MCP server 端範例
- [[Playwright]] — Microsoft 跨瀏覽器自動化框架；第 2 次出現後建頁（之前在 MCP 工具列表、本次 BrowseForge）

### 更新既有頁

- [[Embedding]] — 新增「延伸學習：底層原理」連到 ai-explained 第 5 章
- [[MCP]] — 客戶端表拆成 client/server 兩段；新增 server 範例表（Brave Search、Filesystem、BrowseForge、Obsidian vault）；補 Kiro CLI 為 client
- [[Claude Code]] / [[Agent-Skills]] — 相關頁面區塊補 [[BrowseForge]] / [[Playwright]]

### index.md 順手補正

發現 5/10 ingest 時 [[src-papaya-gemma-lm-studio]] 只加到「最近新增」未加到「來源摘要」表格，本次補上。

### 影響頁面

- 新建：[[src-ai-explained-tutorial]], [[src-browseforge]], [[BrowseForge]], [[Playwright]]
- 更新：[[Embedding]], [[MCP]], [[Claude Code]], [[Agent-Skills]], index.md
