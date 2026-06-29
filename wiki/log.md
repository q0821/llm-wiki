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

## [2026-05-11] ingest | Welly SEO 月報 2026-04（GEO / Agent-Ready 主題）

### 來源驗證

- inbox 投遞：Obsidian Web Clipper 抓的 PDF（從 Google Drive），但**只抓到前 3 頁**（PDF 共 8 頁）
- 補救：從 Google Drive 直接下載完整 PDF（`curl uc?export=download&id=...`），用 Read 工具讀完 8 頁，存為 `raw/welly-seo-2026-04-full.md`
- 兩個 raw 檔並存：`Welly SEO ....pdf.md`（不完整 Web Clipper 版）+ `welly-seo-2026-04-full.md`（完整版）

### 三大主題

1. Google 2026 年 3 月核心演算法更新（2026-03-27~04-08）——SEO 從「內容產量」轉「內容價值」
2. **Cloudflare "Is Your Site Agent-Ready?" 檢測工具**——四面向 + Cloudflare Radar 採用率數據
3. Google AI Mode 整合進 Chrome（2026-04-16）——Side-by-side Browsing、跨分頁整合

### 新建頁面

**source（1 頁）**
- [[src-welly-seo-2026-04]] — 完整 8 頁內容，含 Cloudflare Radar 數據表

**concept（1 頁，重要）**
- [[GEO]] — Generative Engine Optimization / Agent-Ready 網站
  - SEO vs GEO 對照、Cloudflare 四面向檢測、Radar 採用率（robots.txt 78% → MCP Server Card 0.0092%）
  - 實作 4 個 Level（SEO 基礎 → AI 可讀性 → 結構化資料 → 可被 AI 操作）
  - 含 E-E-A-T 框架說明（連結到本知識庫 CLAUDE.md 的品質規則）
  - 標出資料缺口：LLMs.txt 格式規範、實際檢測範例、WebMCP 細節

### 更新既有頁

- [[Cloudflare]] — 從「部署平台」單一面向擴成「部署平台 + AI agent 標準推手」；新增 Agent-Ready 工具 + Radar 數據
- [[MCP]] — 新增「採用現況：極早期」段（網站作為 MCP server 端僅 0.0092%）
- [[Agent-Skills]] — 相關頁面補 [[GEO]]（網站暴露 Agent Skills 採用率 0.015%）
- [[presentation-攝影工作室A-網站優化]] — 未改本文（Marp 簡報不宜插 wikilink），但 [[GEO]]/[[src-welly-seo-2026-04]] 已反向連結到它

### 觀察：本知識庫的「AI × web」三角

這次 ingest 後，本知識庫對「AI 與 web 互動」有了三個面向的頁面：
- **主動操作**：[[BrowseForge]] / [[Playwright]]（AI agent 操控真實瀏覽器）
- **被動準備**：[[GEO]]（網站如何準備好被 AI 爬取/引用/操作）
- **協議層**：[[MCP]]（兩端如何標準化溝通）

### 影響頁面

- 新建：[[src-welly-seo-2026-04]], [[GEO]]
- 更新：[[Cloudflare]], [[MCP]], [[Agent-Skills]], index.md

## [2026-05-14] inbox-pull | 從 iCloud inbox 搬入素材
- 搬入 3 個檔案到 raw/：
  - `Hermes Agent 成功案例 — 你的 AI 代理可以做什麼.md`（2418 行，gaskhuang.github.io clipping）
  - `【直播筆記】用 Claude Design × Claude Code × Figma 重新定義設計工作流程 - AAPD 產品設計學院.md`（178 行）
  - `電子發票.md`（7 行，3 個 YouTube 標題但 URL 不完整——暫緩 ingest）

## [2026-05-14] ingest | AAPD 直播筆記 — Claude Design × Claude Code × Figma 工作流
- 來源：aapd.com.tw / Simon（產品設計師，雪梨）/ 2026-05-05 直播筆記
- 核心發現：Hand off to Claude Code 機制 + Figma MCP 雙向操作 + 邊走邊建設計規則 + 設計師價值轉向判斷力
- 與 [[src-will-ai-kill-saas-design]] 形成「宏觀觀察 vs 實作經驗」對話組——Simon 的 Figma MCP bug 觀察反向佐證 Yu-Chih「人類仍需精細工具」論點

### 影響頁面

- 新建：[[src-aapd-claude-design-figma-workflow]], [[Simon-Lin]], [[AAPD]]
- 更新：[[Claude-Design]]（補介面結構 / Hand off / 四限制）、[[Claude Code]]（補 Hand off + Figma MCP 整合）、[[CLAUDE-md]]（補設計領域規則範例）、[[Figma]]（補 MCP 雙向操作 + bug 觀察）、[[MCP]]（補 Figma MCP 案例）、[[DESIGN-md]]（補「事前定義 vs 邊走邊建」對照）、[[Agentic-AI-Workflow]]（補 Simon 實作經驗觀點）

## [2026-05-14] todo | 暫緩處理：電子發票.md
- 保留於 raw/，因內容僅 3 個 YouTube 標題 + 截斷的 `watch?v` URL（無 video id），無法跑 fetch-youtube.sh
- 待使用者補完整 URL 後再 ingest 為 YouTube 來源

## [2026-05-14] ingest | Hermes Agent 99 個成功案例
- 來源：gaskhuang.github.io/hermes-agent-cases / [[Gas-Khuang]] 整理 / 99 案例 / 13 分類
- 處理策略：結構化抽 patterns + 12 個代表案例展開（依先前對齊的策略）
- 核心發現：
  - **跨案例觀察 5 個模式**：自我改進三角（MEMORY.md + Skill Factory + 偏好學習）、多模型協作、多訊息平台閘道、成本壓縮極限、替代 SaaS 訂閱
  - **OpenClaw → Hermes 遷移敘事**：兩個 case 直接記錄；本知識庫 [[OpenClaw]] 頁面已註記此趨勢
  - **「自我改進的 LLM Wiki」路線分歧**：與本知識庫的「人類引導 + Obsidian」路線形成有意義對照
  - **agent 自帶 MCP server**：`hermes mcp serve` 把 agent 自己包成可組合層

### 影響頁面

- 新建：[[src-hermes-agent-99-cases]], [[Hermes-Agent]], [[Gas-Khuang]], [[Self-Improving-Agent]]
- 更新：[[OpenClaw]]（補遷移趨勢段落）、[[Agent-Skills]]（補 Hermes Skill 生態 + 三方比較表）、[[MCP]]（補 hermes mcp serve / jMunch / Firecrawl / OSV + agent-as-server 模式）、[[Claude Code]]（補跨代理統一記憶 case）、[[BrowseForge]]（補 Vessel Browser 對照）、[[LLM-Wiki]]（補人類引導 vs 全自動路線分歧）
- 更新 index.md（最近新增 / 來源摘要 / 實體 / 概念；調整 7 個既有頁面的來源數）

### 待 lint 與 query 處理項

- Hermes vs Asgard vs Anthropic 三組 Agent Skills 生態的綜整分析（建議下次 lint 或專題 query 時做）
- 「自我改進 LLM Wiki」case 的 medium 原文是否要獨立 ingest 為新來源
- Vessel Browser 是否要獨立 source 頁（如關注 agent-first browser 範式）
- Hermes 中提到的具體模型版本（GPT-5.4 / MiniMax M2.7 / Qwen 35B）需進一步驗證

## [2026-05-14] inbox-pull | 第二次 inbox 同步
- 搬入 2 個檔案到 raw/：
  - `未命名.md`（241 行）— FB 中文整理 Addy Osmani 的 Harness Engineering 文章
  - `讓 Claude 把你的 App 流程畫成一頁 HTML：...md`（1 行）— **只有 URL** 無內文

## [2026-05-14] ingest | Addy Osmani Harness Engineering
- 來源：FB 中文整理（二次來源），原文作者 [[Addy-Osmani]]（Google Cloud AI 總監）
- 與既有 [[Harness-Engineering]]（OpenAI Ryan Lopopolo）形成「兩巨頭對同一範式不同切角」對話組
- 新概念：[[Ratchet-Pattern]] — 「每次錯誤編碼成永久規則」，跨 OpenAI / Google 兩家工程文化的共識
- 注入論點：Harness 七元件 / Context Rot 三招 / Long-Horizon 三招 / HaaS 趨勢 / harness 移動而非萎縮 / Training Loop 雙向

### 影響頁面
- 新建：[[src-addy-osmani-harness-engineering]], [[Addy-Osmani]], [[Ratchet-Pattern]]
- 更新：[[Harness-Engineering]]（補七元件 / Ratchet 段落 / Context Rot / Long-Horizon / HaaS / 跨工程文化對照表）、[[Self-Improving-Agent]]（補「AI 自動 vs 人類引導 Ratchet」兩條路徑對照）、[[Claude Code]]（補 Fareed Khan 架構元件拆解）、[[Meta-Harness]]（補與 Addy「harness 移動」呼應）、[[CLAUDE-md]]（補「飛行員 checklist」「每條規則從失敗賺來」「工具描述安全議題」）、[[Agent-Skills]]（補「10 個職責清楚 vs 50 個重疊」原則）、[[MCP]]（補工具描述會進 prompt 的安全議題段落）

## [2026-05-14] fetch-failure | akiraxclaw.com Claude App Flow 文章
- URL：https://akiraxclaw.com/blog/claude-app-flow-documentation-trick-2026
- 兩次擷取失敗：
  - `fetch-url.sh`（markdown.new）→ exit 56 / `Crawl completely disallowed by robots.txt`
  - WebFetch（Claude Code 內建）→ 拿到的是會員牆頁面殼，內文需「免費加入即可閱讀」
- 解法：使用者手動複製貼上內文 → 存為 raw/akiraxclaw-app-flow-trick-content.md（原「轉址檔」保留作為投遞紀錄）

## [2026-05-14] ingest | App Flow HTML + JSON 雙輸出技巧（Dave Jeffery / akiraxclaw）
- 來源：akiraxclaw.com 整理 Dave Jeffery（X @DaveJ）原推
- 核心：讓 Claude 生成「同一份資訊兩種呈現」——HTML 給人看、JSON 給 AI 看作為「系統記憶外掛」
- 對應 [[Harness-Engineering]] 七元件中的 Memory + Search 條目
- 與 [[Ratchet-Pattern]] 形成對照：Ratchet 是反應式累積（錯誤→規則），App Flow Doc 是前置式準備（一次寫好系統地圖）

### 影響頁面
- 新建：[[src-akiraxclaw-app-flow-trick]]
- 更新：[[CLAUDE-md]]（同類規範檔對照表加 App Flow JSON 與「行為規範 vs 系統地圖」性質欄）、[[DESIGN-md]]（補同類設計檔家族）、[[Harness-Engineering]]（七元件 Memory + Search 條目補 App Flow JSON 範例）

## [2026-05-14] lint | 健康檢查與新概念頁萃取
- 掃描 wiki，使用 python regex（處理 markdown table `\|` escape）找出真正 dead links
- 結果：
  - **真正 dead links 4 個**，3 個在 log.md 歷史紀錄（不動），1 個 `[[wikilink]]` 是示範用 placeholder（依使用者選擇不動）
  - **反向連結數**：本次 session 新增 9 頁全部有 4-12 個反向引用，無孤立頁
  - **profile 一致性**：11 個新增/相關頁面全部有 confidence 欄位
- **概念缺漏萃取**（已批准）：
  - 建 [[MEMORY-md]]：在 10 個既有頁面中提及，且有 3 個獨立來源（Hermes / Claude Code 8 settings / Addy）
  - 建 [[Context-Rot]]：在 6 個既有頁面中提及，且有 2 個獨立來源（Addy / Claude Code 上下文管理）
- **中度推薦未建**（依使用者選擇）：Skill Factory / Long-Horizon Execution / Harness-as-a-Service 都已在主頁有專段
- **人物實體未建**（弱證據）：Viv Trivedy、HumanLayer、Fareed Khan、Mitchell Hashimoto、Dave Jeffery、Ryan Lopopolo、Fred K. Schott — 都只在 Harness-Engineering 跨工程文化對照表中單行提及，未來如多來源引用再建

### 影響頁面
- 新建：[[MEMORY-md]], [[Context-Rot]]
- 更新（首次提及處改 wikilink，避免過度連結）：[[Hermes-Agent]]、[[Self-Improving-Agent]]、[[Ratchet-Pattern]]、[[OpenClaw]]、[[src-hermes-agent-99-cases]]、[[Harness-Engineering]]、[[src-addy-osmani-harness-engineering]]、[[src-claude-code-context-management]]
- 更新 index.md（最近新增 + 概念區追加 MEMORY-md 與 Context-Rot）

## [2026-05-14] fetch-failure | Dave Jeffery 原推（X.com）
- URL：https://x.com/DaveJ/status/2053867258653339746
- WebFetch 結果：**HTTP 402 Payment Required**（X.com 對 unauthenticated server-side 擷取要求 paid API tier）
- 決議：跳過，不獨立成 source
- 影響頁面：[[src-akiraxclaw-app-flow-trick]]（更新「信心評估」與「未來可延伸」段落，刪除線標註原推擷取已嘗試）

### 來源擷取成功率經驗法則（本次累積）
| 來源類型 | 範例 | 擷取成功率 |
|---|---|---|
| 靜態部落格 / GitHub Pages | gaskhuang、aapd | 高 — markdown.new 直接抓 |
| Newsletter / 會員制 | akiraxclaw | 中 — 拿到「殼」，需手動複製內文 |
| X / Twitter（unauthenticated）| Dave Jeffery 推文 | **零** — HTTP 402 直接擋 |

## [2026-05-15] ingest | 5 個 AI Coding 反模式 / 工作流 concept（漂白版）
- 性質：個人實作累積的反模式、工作流、技術洞察，**已去識別**
- 原始 retro（含客戶識別、admin URL、具體 schema、商業措辭）已從 git 歷史撤回（force push），未進 wiki
- 漂白版保留：純 pattern、設計原理、generic 範例、公開 framework API
- 漂白版移除：客戶識別、admin URL 路徑、具體 model schema 名稱、phase 編號、commit/test 數字、商業措辭

### 影響頁面
- 新建：[[Subagent-Driven-Development]], [[Adversarial-Code-Review]], [[Hybrid-XSS-Defense]], [[Fields-Without-Enforcement-Anti-Pattern]], [[Verify-Framework-Version-First]]
- 5 個 concept 的 sources frontmatter 均為 `[]`，頁首註明「來源：個人實作累積（已去識別）」
- index.md 概念區追加 5 條，來源數標 `-` 表示無公開來源
- 不還原 src 入口頁（內容過於 case-specific）

### 與既有 wiki 的連結
- [[Ratchet-Pattern]] — 5 個概念中至少 3 個直接引用此 pattern
- [[AI-Quality-Collusion]] — Subagent-Driven 與 Adversarial-Code-Review 都是該反模式的對抗工具
- [[Agentic-AI-Workflow]] / [[Claude Code]] / [[Specification-by-Example]] / [[CLAUDE-md]] — 各 concept 對應上位範式

## [2026-05-15] ingest | Codex × HyperFrames 30 秒 Demo Prompt Pack
- 來源：公開課程課後 Notion 匯出（`paddy19981205.github.io/FLPDF/#17`）
- 942 行：7 個 Prompt Pack（00-06）+ 12 Visual Beats + 6 類 Fix Prompts + 3 個範例專案
- 通過 CLAUDE.md「公開度與資安」檢查（無客戶識別 / admin URL / 私人 schema）
- 知識庫首次有「短影片產製」主題；HyperFrames 是第一個影片生成工具實體

### 影響頁面
- 新建：[[src-codex-hyperframes-prompt-pack]], [[HyperFrames]], [[OpenAI-Codex-CLI]], [[Prompt-Pack-Pattern]]
- 更新：[[DESIGN-md]]（應用領域從 UI 擴張到短影片，加對照表）、[[Vibe-Coding]]（補影片 vibe coding 案例）、[[Agentic-AI-Workflow]]（補 Codex × HyperFrames 影片工作流案例）、[[Agent-Skills]]（補與 Prompt Pack Pattern 對照）、[[Claude Code]]（強化與 OpenAI Codex CLI 對照）
- 更新 index.md（最近新增追加 2026-05-15 下午區塊 + 來源/實體/概念條目 + 來源數調整）

### 待 lint / 後續可延伸
- 補抓 HyperFrames 官方文件作獨立來源（驗證透過 prompt 內容推斷的架構與 CLI）
- 探討 HyperFrames 與 Remotion（React-based 影片框架）的關係——同類設計哲學
- 課程簡報 `paddy19981205.github.io/FLPDF` 可考慮另外 ingest
- 範例 3 中「ChatGPT 生圖 + Gemini 生影片 + HyperFrames 剪 Reels」的多 AI 串接工作流值得另外抽出 pattern

## [2026-05-18] ingest | Cloudflare 大規模協同運作 AI 程式碼審查
- 來源：https://blog.cloudflare.com/zh-tw/ai-code-review/（Ryan Skidmore，2026-04-20，Cloudflare Agents Week）
- 擷取：`fetch-url.sh` markdown.new 超時 60 秒失敗 → 改用 WebFetch 成功（公開技術部落格無會員牆）
- 本知識庫第一個跨 5+ 既有概念頁的 production 標本——把 [[Adversarial-Code-Review]]、[[Subagent-Driven-Development]]、[[Harness-Engineering]] 等概念接上實際 production 數據（131K 次審查 / 5169 repo / $0.98 中位數 / 1200 億 tokens / 85.7% cache hit）
- 通過 CLAUDE.md「公開度與資安」grep 自查（純公開技術內容）

### 影響頁面
- 新建：[[src-cloudflare-ai-code-review]], [[OpenCode]], [[AGENTS-md]]
- 更新：
  - [[Cloudflare]]（擴張第三面向「內部 AI 工程文化」+ AI code review 系統段落）
  - [[Adversarial-Code-Review]]（補 Risk Tier 分配 + Cloudflare production 數據 + prompt 設計實例）
  - [[Subagent-Driven-Development]]（補「Production 對照」段落：spawn_reviewers / shared context / 三層 timeout / 斷路器 / 提示詞注入防範 / 心跳記錄 / break glass）
  - [[Harness-Engineering]]（補「Circuit Breaker for AI」段落含 Netflix Hystrix 啟發、故障回退鏈、錯誤分類、協調者層獨立故障回退；跨工程文化對照表加 Cloudflare 一行）
  - [[CLAUDE-md]]（AGENTS.md 條目從純文字升級為 wikilink）
  - [[Claude Code]]（agentic CLI 對照表加 OpenCode）
  - [[OpenAI-Codex-CLI]]（補與 OpenCode 整合：`@opencode-reviewer/codex`）
  - [[Hermes-Agent]]（agent 工具對比表加 OpenCode，「企業基礎建設 vs SMB」對照）
  - [[Context-Rot]]（補 Cloudflare production 三層防護案例：tool-call offloading + 共用脈絡檔 + 50% 警告）
  - [[MCP]]（補 Cloudflare MCP 評論伺服器與 GitLab 整合）
- 更新 index.md（最近新增追加 2026-05-18 區塊 + 來源/實體/概念條目 + 來源數調整）

### 形成的新對話組
- [[src-cloudflare-ai-code-review]] ↔ [[Subagent-Driven-Development]] / [[Adversarial-Code-Review]] 兩個漂白後 concept：個人實作累積 vs Cloudflare 130K production，數量級不同但 pattern 同源
- [[OpenCode]] 補齊本知識庫 agentic CLI 地圖：[[Claude Code]] / [[OpenAI-Codex-CLI]] / [[OpenCode]] / [[Hermes-Agent]] 四強
- [[AGENTS-md]] ↔ [[CLAUDE-md]] 平行對照組終於完整成形
- Netflix Hystrix「Circuit Breaker」從微服務延伸到 AI 模型呼叫——產業共識正在形成

### 待後續處理
- Cloudflare 內部 AI 工程堆棧（文中連結 `internal-ai-engineering-stack`）可獨立 ingest
- Agents Week 其他發布
- OpenCode 官方 GitHub repo / 文件可獨立 ingest 補強 entity 頁
- fetch-url.sh markdown.new API 卡 60 秒問題——若反覆出現可考慮加 WebFetch fallback 機制

## [2026-05-19] inbox-pull | iCloud 權限解鎖
- 之前的 `Operation not permitted` 解除（使用者授權 Terminal 存取 iCloud）
- 搬入 1 個檔案：`原來是擅長等紅燈的朋友 (@honglong0420)\n272 個喜歡 · 1 則回覆.md`（140 bytes，只有 X 貼文 share link）
- 因 X.com unauthenticated 抓不到（HTTP 402，前車之鑑）→ 擱置，需登入態手動貼上才能 ingest

## [2026-05-19] ingest | bnext「CLAUDE.md 12 條規則」
- 來源：bnext.com.tw / 蘇柔瑋 / 2026-05-18，二次整理 Mnimiy（X @Mnilax）原始實證
- fetch-url.sh 跳過直接 WebFetch（上次 cloudflare 經驗：markdown.new 對大型網站 blog 易超時）
- 演化鏈：[[Andrej-Karpathy]] 3 缺失 → Forrest Chang 4 條（GitHub 12 萬星）→ Mnimiy 8 條擴充（30 codebase 盲測 41% → 11% → 3% 錯誤率）
- 通過 CLAUDE.md「公開度與資安」grep 自查

### 影響頁面
- 新建：[[src-bnext-claude-md-12-rules]]
- 更新（5 個既有頁）：
  - [[CLAUDE-md]]：**大幅擴充**——加「12 條 production 範本」段落（簡表 + 完整範本指向 src）+ Mnimiy 三大反模式
  - [[Ratchet-Pattern]]：補 Mnimiy 同源原則「規則只應防止你實際遇過的失敗」+ 30 codebase 量化實證數據
  - [[Andrej-Karpathy]]：補「2026 初 AI 寫程式 3 缺失」段落 + 演化鏈位置（問題定義者角色）
  - [[Context-Rot]]：補「個人版對抗工具」段落，Rule 6 token budget 直接對應
  - [[AI-Quality-Collusion]]：補 Rule 9「Tests verify intent」個人版對策
  - [[Prompt-Pack-Pattern]]：補三大反模式警示（範例 vs 規則 / 情緒喊話 / 工具死指令）
- 更新 index.md（最近新增追加 2026-05-19 區塊 + 來源/概念條目 + 7 個既有頁來源數調整）

### 形成的新對話組
- [[Ratchet-Pattern]] 跨工程文化共識（第三個獨立來源）：Google Addy ↔ OpenAI Mitchell Hashimoto ↔ 個人工程師 Mnimiy
- [[CLAUDE-md]] 從「方法論說明」升級為「含具體可貼上範本 + 30 codebase 實證數據」的完整參考頁
- [[Andrej-Karpathy]] 在「LLM Wiki gist」之外多了「AI 寫程式 3 缺失」第二個影響鏈

### 待後續處理
- 補抓 Mnimiy 原 X 貼文（X.com unauthenticated 抓不到，需登入態手動貼上）
- 補抓 Forrest Chang GitHub CLAUDE.md 原 repo
- inbox 那個「等紅燈朋友」X 貼文擱置——等使用者補完整內容

## [2026-05-19] ingest | Asgard Skills 開源推廣（@honglong0420 X 推文）
- 來源：使用者手動提供 X 推文內文（X.com unauthenticated 抓不到，前車之鑑 HTTP 402）
- 補強既有 [[src-asgard-skills]]（2026-04 客觀整理）→ 2026-05 內部人員親述視角
- 核心論點：「**缺的不是 AI 知不知道，而是人不會記得主動把它叫出來**」——精準回答 [[Agent-Skills]] 範式為什麼比 prompt 有效
- 四件套思維模型（決策完整路徑）：hum-dialectics → ops-business-model-canvas → ux-lean-startup → hum-narrative；含三條 Iron Law（Synthesis ≠ Compromise / 漏一格就是許願 / Every Story Needs Tension）

### 影響頁面
- 新建：[[src-honglong0420-asgard-x-thread]]
- 更新（3 個既有頁）：
  - [[src-asgard-skills]]：補「作者推薦四件套思維模型」段落
  - [[Asgard-AI-Platform]]：補內部人員 @honglong0420、主打定位「台灣中小企業」、領域涵蓋（含台灣專屬：勞健保 / 營業稅）、核心設計論點段落
  - [[Agent-Skills]]：補「為什麼 skill 化有效」第二觀點（節省 token vs 對抗遺漏啟動），與 [[科技翰林院]] 觀點形成互補
- 更新 index.md（最近新增 2026-05-19 加新條目 + 來源摘要 / 實體 / 概念區條目調整 + 4 個既有頁來源數調整）
- raw/ 新增 `honglong0420-asgard-x-thread.md` 含完整貼文內容（補先前只有 share link 的 inbox 投遞紀錄）

### 形成的對話組
- **同主題雙來源**：[[src-asgard-skills]]（GitHub 客觀整理）↔ [[src-honglong0420-asgard-x-thread]]（內部人員親述）
- **「為什麼 Skill 化有效」雙論點**：[[科技翰林院]]「節省 token」↔ Asgard「對抗遺漏啟動」
- **Ratchet 切角擴張**：原版「防失敗」↔ Asgard 切角「**防遺漏 / 防偷懶**」

### 四件套對應的經典方法論（未獨立成頁，單來源證據弱）
- hum-dialectics → 黑格爾辯證法
- ops-business-model-canvas → Alex Osterwalder
- ux-lean-startup → Eric Ries
- hum-narrative → Robert McKee / Joseph Campbell
- 待累積更多獨立來源討論再考慮萃取

### 擱置處理
- inbox 那則含 newline 的 X share link 檔保留（與 honglong0420-asgard-x-thread.md 配對：share link + 內文兩檔）

## [2026-05-19] audit | Asgard Skills Repo 本地審計
- 觸發：使用者問「repo 裡面的 skill 是不是都沒有問題」
- 範圍：A 結構 / B 安全 / D 品質抽樣 / E 適用性 四向掃描
- 方法：`git clone --depth 1` 後 bash 命令統計、grep 掃描、10 個 skill 詳看
- 結論：**整體可信、品質高、安全乾淨**——301/301 frontmatter 完整、安全 0 紅旗、抽樣品質佳
- 重要新發現：
  - **26 個 `tw-ecom-*` 是 `status: skeleton`**（佔 tw- 類 68%）——主打台灣電商承諾與現況落差
  - **Iron Law 普及率實際 100%**（前期 grep 誤判 18%，case-sensitive heading 漏掉 `IRON LAW:` 全大寫 / 中文「鐵律」/ 「核心法則」寫法）
  - **規模時間線**：263（2026-04）→ 263（2026-05 推文）→ **301**（2026-05-19）；分類 21 → 22 → 25

### 影響頁面
- 新建：[[src-asgard-skills-audit-2026-05-19]]（audit src，frontmatter sources []）
- 新建：[[synthesis-asgard-install-for-my-topics]]（綜整頁，3 主題 install 候選 ~50 個）
- 事實校正：
  - [[src-asgard-skills]]：263 → 301、21 類 → 25 前綴、補規模時間線 + skeleton 警示段
  - [[Asgard-AI-Platform]]：263 → 301、補公司資訊（肆佳科技股份有限公司）+ 承諾 vs 現況落差段
  - [[Agent-Skills]]：對照表「Asgard 263 → 301」校正
  - [[src-honglong0420-asgard-x-thread]]：補「2026-05-19 審計校正」對照表（推文快照數字 vs 審計）
  - [[src-hermes-agent-99-cases]]：「Asgard 263 → 301」校正
  - [[src-recommended-claude-code-skills]]：同校正

### Asgard 主題三來源視角完整成型
| Source | 視角 | 時間 |
|---|---|---|
| [[src-asgard-skills]] | 客觀整理（GitHub repo 結構描述）| 2026-04 |
| [[src-honglong0420-asgard-x-thread]] | 內部人員親述（推廣 + 推薦四件套）| 2026-05 |
| [[src-asgard-skills-audit-2026-05-19]] | 獨立審計（安全 + 品質 + 適用性 + 校正）| 2026-05-19 |

### 自我審計流程觀察
- 第一遍 grep `Iron Law` heading 找到 55 個 → **誤判普及率 18%**
- 第二遍寬鬆掃描含 `IRON LAW:` 全大寫 / 中文寫法 → **修正為 100%**
- 教訓：審計報告中明確記下這個誤判 + 修正，作為 [[Ratchet-Pattern]] 「規則從失敗賺來」的小範例

### 待後續處理
- 三個月後（~2026-08）回頭看 26 個 `tw-ecom-*` skeleton 是否完工
- 實際試跑推文四件套並記 case study
- 接案 SEO 體檢時試 `mkt-seo-audit` + `algo-seo-*` 系列
- 投資決策時試 `tw-stock-analysis` + `biz-dcf` 組合

## [2026-05-19] ingest | Claude Code in Large Codebases — Anthropic 官方 best practices
- 來源：https://claude.com/blog/how-claude-code-works-in-large-codebases-best-practices-and-where-to-start
- 作者：Anthropic Applied AI team / 2026-05-14（Customer mention：Zoox）
- fetch-url.sh 跳過直接 WebFetch（前次 cloudflare blog 經驗）

### 核心發現
- **Anthropic 官方版 Harness 7 個 extension points**：CLAUDE.md / Hooks / Skills（progressive disclosure）/ Plugins / LSP / MCP / Subagents
- **「The Harness Matters as Much as the Model」**——副標題層級官方論述
- **Agentic search vs RAG embedding** 官方定位：「Unlike RAG-powered tools that embed entire codebases, Claude Code uses agentic search, avoiding failures where indices become stale.」
- **CLAUDE.md 3-6 月 review 維護週期**——Anthropic 官方版 Ratchet 克制原則
- **新組織角色**：Agent Manager（hybrid PM/engineer）/ DRI for Claude Code

### 影響頁面
- 新建：[[src-claude-code-in-large-codebases]], [[Plugins-Claude-Code]], [[LSP-Integrations]]
- 更新 9 個既有頁：
  - [[Claude Code]]：**大幅擴充**——加 Anthropic 官方版 Harness 7 個 extension points + Agentic Search 官方論述 + 適用範圍限制
  - [[CLAUDE-md]]：補「Anthropic 官方版 CLAUDE.md 維護指引」段（3-6 月 review 週期 + lean/layered 配置）
  - [[Harness-Engineering]]：跨工程文化對照表分拆 Anthropic 為兩列（雲端 agent / Claude Code 視角）
  - [[Subagent-Driven-Development]]：補官方版「split exploration from editing」定義 + isolated context window 確認
  - [[Agent-Skills]]：補 progressive disclosure 設計原則官方確認 + 與既有「啟動成本」論點形成三層機制
  - [[Context-Rot]]：補 Anthropic 官方版「progressive disclosure 產品內建」+ subagent only return final results 確認
  - [[MCP]]：補「structured search MCP server」官方背書 + 「企業 codebase 自帶 MCP」第三種典型
  - [[Ratchet-Pattern]]：補第 4 個獨立來源（Anthropic 官方）—— 業界共識升級為廠商在內全方位共識
  - [[LLM-Wiki]]：補「Agentic Search vs RAG Embedding」官方論述對照（從個人知識庫延伸到 codebase 導覽）
- 更新 index.md（最近新增區追加 3 條 + 來源摘要 + 概念追加 2 條 + 9 個既有頁面來源數調整）

### 形成的新對話組
- [[src-claude-code-in-large-codebases]]（官方視角）↔ [[src-cloudflare-ai-code-review]]（client production 視角）：Anthropic harness 7 元件 ↔ Cloudflare OpenCode 7 外掛實作
- [[src-claude-code-in-large-codebases]] ↔ [[src-addy-osmani-harness-engineering]]：兩家獨立的 7-元件 harness 分解（Google vs Anthropic）
- [[src-claude-code-in-large-codebases]] ↔ [[src-bnext-claude-md-12-rules]]：官方「3-6 月 review」↔ Mnimiy「規則只應防止實際遇過的失敗」——同源克制原則第 4 個來源
- [[LLM-Wiki]] ↔ [[Claude Code]]：兩個層次都採用 agentic search vs RAG embedding 設計

### 新候選概念 (未獨立)
- Agent Manager 角色（單句描述、弱證據）
- DRI for Claude Code（同上）
- 兩者都先記在 [[src-claude-code-in-large-codebases]] 中，未來累積再萃取

### 待後續處理
- 待 Anthropic 官方文件補 Plugins marketplace 機制細節後更新 [[Plugins-Claude-Code]]
- 待 LSP integration 具體技術細節（哪些 LSP 已支援 / 如何啟用）更新 [[LSP-Integrations]]
- Zoox 是否有具體 Claude Code 部署案例可獨立 ingest

## [2026-05-20] ingest | zeuikli「Claude Code 各面向最佳實踐完整研究報告」（社群第二手整合）
- 來源：https://github.com/zeuikli/claude-code-workspace/blob/main/docs/2026-05-16-claude-code-best-practices.md
- 整理者：GitHub `zeuikli`（個人 workspace repo）
- 規模：1254 行 / 10 章 + 2 附錄；引用 research/best-practices/ 29 篇 + research/claude-blog/ 52 篇 + Boris Cherny / Thariq Shihipar 引言
- 擷取：WebFetch 暫時 unavailable → 改用 `curl` 直接抓 raw GitHub content
- 通過 CLAUDE.md「公開度與資安」grep 自查（公開 GitHub repo + 公開技術內容）

### 重要新發現
- **PGE 原則（Generator ≠ Evaluator）**：多個既有反模式對策（Subagent-Driven / AI-Quality-Collusion / Adversarial-Code-Review）的上位原則官方版命名
- **Cache as Uptime**（[[Thariq-Shihipar]]）：「Cache rules everything. We treat it like uptime.」+ Sonnet 4.6 節省 90% 成本（$3 → $0.30/MTok）
- **CLAUDE.md 60 行最佳 / 200 行門檻**：超過 200 行遵從率 76% → 52%（補 [[src-bnext-claude-md-12-rules]] 的 76% 為「上限值」）
- **Context Engineering 是真正的工程護城河**：整篇核心論點，補 [[Harness-Engineering]] 第一支柱細部展開
- **[[Boris-Cherny]] 完成驗證心法**：「資深工程師會核准這個嗎？否 → 先修再報」—— Ratchet 規則的判準工具，第 5 個獨立來源

### 影響頁面
- 新建（5 個）：[[src-zeuikli-claude-code-best-practices]], [[PGE-Principle]], [[Context-Engineering]], [[Boris-Cherny]], [[Thariq-Shihipar]]
- 更新（12 個既有頁，多為精準補小段）：
  - [[Claude Code]]：補「補充機制」（Path-Scoped / Auto Memory / Routines / Effort Level / Tool Search / PGE）+「核心論述者」（Boris / Thariq）
  - [[CLAUDE-md]]：補黃金法則新數字（60 行最佳 / 200 行門檻 / 76% → 52%）+ Path-Scoped Rules
  - [[Context-Rot]]：補 Thariq「Cache as Uptime」+ 90% cache 節省
  - [[Subagent-Driven-Development]]：補 PGE 原則上位 + Advisor 模式
  - [[AI-Quality-Collusion]]：補 PGE 原則作為對策上位
  - [[Adversarial-Code-Review]]：補在 PGE 中的「層 3 AI evaluator」位置
  - [[Agent-Skills]]：補 Description 寫法 / 自由度分層 / 生命週期管理
  - [[MCP]]：補 Transport 三模式 / Scope 優先序 / Tool Search / 輸出控制
  - [[MEMORY-md]]：補 Auto Memory 機制官方稱呼
  - [[Ratchet-Pattern]]：補第 5 個獨立來源（Boris Cherny）+ 「資深工程師會核准嗎」判準工具
  - [[src-claude-code-context-management]]：補 Thariq 新引言 + 連結 [[Thariq-Shihipar]] entity
  - [[src-bnext-claude-md-12-rules]]：補 60 行 / 200 行 / 76% → 52% 數字對照
- 更新 index.md（最近新增 + 來源摘要 + 實體 + 概念區條目）

### 形成的新對話組
- [[src-zeuikli-claude-code-best-practices]]（社群第二手整合）↔ [[src-claude-code-in-large-codebases]]（Anthropic 官方）：同主題兩種視角
- [[PGE-Principle]] 統合本 wiki 三個既有反模式對策概念為一個上位原則
- Anthropic Claude Code 論述者地圖完整：[[Andrej-Karpathy]]（源頭）/ [[Boris-Cherny]] / [[Thariq-Shihipar]] / Applied AI team
- Ratchet 克制原則第 5 個獨立來源（Google Addy / OpenAI Hashimoto / Mnimiy / Anthropic Applied AI / Boris Cherny）

### 待後續處理
- 補抓 zeuikli 81 篇 reference 中與本 wiki 重疊度高的 5-10 篇
- Boris Cherny 公開講座 / 訪談（特別 Routines 章節）
- Anthropic engineering blog 中 Boris / Thariq 的署名文章
- 附錄 A 5 個範本可考慮放進 `.claude/snippets/` 之類可重用位置

## [2026-05-20] ingest | Anthropic Founder's Playbook（2026-05 官方）
- 來源：https://cdn.prod.website-files.com/.../The-Founders-Playbook-05062026_v3.pdf（36 頁 / 7 章）
- 入 raw/：anthropic-founders-playbook-2026-05.pdf（PDF 二進位）+ anthropic-founders-playbook-2026-05.md（metadata 指引）
- 採用「中度」策略：新建 1 個 source page + 2 個概念/實體頁 + 補強 8 個既有頁，不大幅重寫
- 建立來源摘要頁：[[src-anthropic-founders-playbook-2026]]
- 建立實體頁：[[Claude-Cowork]]（Anthropic Claude 3 product surfaces 之一）
- 建立概念頁：[[AI-Native-Startup]]（Anthropic 官方版「10-person unicorn」範式 + 4 階段 + 4 反模式）
- 補強既有頁：
  - [[Claude Code]]：補 Chat / Cowork / Code 3 surfaces 完整分工表
  - [[Claude-Design]]：補產品家族對照（Chat / Cowork / Code + Design 4 個 surfaces）
  - [[CLAUDE-md]]：補「MVP stage Day Zero 建立 CLAUDE.md」官方版要求
  - [[Vibe-Coding]]：補「Agentic Technical Debt」官方版命名 + 「AI removes every natural bottleneck」核心論點
  - [[Agentic-AI-Workflow]]：補「Founder = orchestrator of agents」官方版範式，把同心圓迭代從工程層延伸到 founder 層
  - [[Adversarial-Code-Review]]：補「Claude as structured devil's advocate」跨四階段創業 use case，對抗 Loss of Objectivity 反模式
  - [[顧客終身價值]]：補 CAC / LTV / payback 在 Launch 階段 exit criteria 的官方版位置
  - [[Fields-Without-Enforcement-Anti-Pattern]]：補「Insecure by inexperience」官方版根因命名 + Anthropic 列的 5 大 inexperience-driven 漏洞
- 更新 index.md（2026-05-20 區塊 + 來源摘要 + 實體 + 概念，含既有頁來源數調整）
- 影響頁面：3 新 + 8 既有 + index.md = 12

### 形成的新對話組
- AI-Native 創業範式：[[AI-Native-Startup]]（Anthropic 官方）+ [[Vibe-Coding]] + [[Agentic-AI-Workflow]] 三層銜接（時代論述 → 開發範式光譜）
- Claude 產品家族官方分工首次完整：[[Claude Code]] / [[Claude-Cowork]] / [[Claude-Design]] + Chat
- CAC/LTV 從「商業概念孤島」連到「AI 創業階段框架」
- Insecure by inexperience：本 wiki 的 anti-pattern 集合與 Anthropic 官方根因命名對齊

## [2026-05-20] lint | 健康檢查 + broken links 修正
- 全面掃描：117 個 wiki 頁、frontmatter 完整性 100%、無真孤立頁
- **客戶識別殘留修正**（高優先 / 資安）：移除前次漂白事件遺漏的一處檔名引用，連 wikilink 字串都不保留
- **3 個 broken wikilink 修正**：
  - 概念頁中尚未建立的子概念（Cloudflare 內某機制）改為純文字 + 短描述
  - source 頁中指向廠商實體的 wikilink 改純文字（該廠商實體頁尚未建，候選列入下次 ingest 建頁）
  - 概念頁中指向 Asgard skill 的 wikilink 改純文字（skill 不適合單獨開 wiki 頁）
- 驗證：敏感詞 grep 0 命中 + broken link 偵測 0 命中
- 影響頁面：[[PGE-Principle]], [[Cloudflare]], [[src-anthropic-founders-playbook-2026]], [[AI-Native-Startup]]

### 未處理（依設計留下）
- log.md 中 3 處歷史 typo 引述（屬僅追加日誌的修正紀錄，動會破壞 audit trail）
- 反引號內 `` `[[wikilink]]` `` 範例文字（markdown 不 render，是說明文字）

### 待後續 ingest 時考慮
- Anthropic / OpenAI / Mnimiy entity 頁建立（高頻提及但無獨立頁）
- Anthropic Applied AI team blog 系列補 ingest
- AI-Native 4 階段 vs lean startup 6 階段比較頁

## [2026-05-20] lint 補建 | 缺漏實體頁 + AI-Native vs Lean Startup 比較頁
- 對應上次 lint 報告中的「低優先項目」批次處理
- **新建 3 個 entity 頁**（高頻提及但無獨立頁，依次補建）：
  - [[Anthropic]]（195+ 次提及）：核心廠商，Claude 3+1 個 surfaces 完整地圖 + 核心員工（Boris/Thariq/Karpathy）+ 跨廠商工程共識位置 + 對標廠商關係
  - [[OpenAI]]（92 次提及）：對標廠商，與 Anthropic 在 surface/規範檔/工程論述 8 維對比 + 跨廠商共識（Hashimoto Ratchet / Harness Engineering）
  - [[Mnimiy]]（30 次提及）：社群實驗者 / X @Mnilax，CLAUDE.md 12 條規則的 8 條擴充作者 + Ratchet 第 3 個獨立來源 + 三大 prompt 反模式實證者
- **新建 1 個 comparison 頁**：
  - [[comparison-ai-native-vs-lean-startup]]：Lean Startup（Eric Ries 2011）vs AI-Native Startup（Anthropic 2026）4 階段對映 + 4 個 AI 時代新反模式對照 + Anthropic 為何重新框架的 4 大原因
- **補強既有頁**：
  - [[Fields-Without-Enforcement-Anti-Pattern]]：擴充對應 OWASP 區塊為「OWASP Top 10 完整映射表」+ Anthropic Inexperience 5 大漏洞映射；標出本頁核心命中 A04 + A01 + A09
  - [[src-anthropic-founders-playbook-2026]]：把上次 lint 漂白成純文字的「Anthropic 官方」改回 [[Anthropic|Anthropic 官方]] wikilink（entity 頁已建）
- 驗證：broken link 0 命中 + 敏感詞 grep 0 命中
- 影響頁面：4 個新頁 + 2 個既有頁補強 + index.md = 7
- 知識庫規模：117 → 121 頁

### 形成的新對話組
- [[Anthropic]] ↔ [[OpenAI]] entity 頁完整對映後，[[CLAUDE-md]] ↔ [[AGENTS-md]] / [[Claude Code]] ↔ [[OpenAI-Codex-CLI]] / [[Boris-Cherny]] ↔ Hashimoto 等多組「Anthropic vs OpenAI」雙向連結可清晰追溯
- [[Mnimiy]] entity 頁填補 Ratchet 跨工程文化共識的「個人實證者」角色
- [[comparison-ai-native-vs-lean-startup]] 是本 wiki 第二個 comparison 頁（首個為加密貨幣收益工具比較），開啟「框架對比」這個新文體

### 仍待後續處理
- 資料缺口（需要外部 ingest）：
  - Anthropic Applied AI team blog 系列補 ingest
  - Boris Cherny 公開講座 / 訪談 ingest
  - Anthropic engineering blog 中 Boris / Thariq 的署名文章
- 等使用者提供 URL 或場景再處理

## [2026-05-26] ingest | Gask Huang-Kai 論述貼文 + HermesOS 官方落地頁
- **觸發**：inbox-pull 拉進 5 個新檔，使用者選擇按優先順序逐一處理 #1
- **主來源**：raw/未命名-20260526-031034.md（[[Gas-Khuang|Gask Huang-Kai]] FB 貼文「為什麼我不推 vibe coding，而是推 AI Agent 自動化」）
- **延伸 fetch**：https://hermesos.cloud/ → raw/hermesos-your-ai-agents-always-on.md（為釐清 Hermes OS 與既有 [[Hermes-Agent]] 關係）

### 新建頁
- [[src-gask-ai-agent-vs-vibe-coding]]（source / 信心中）：7 個論點完整摘要 + 與 wiki 既有 entity 對位表 + 觀點限制標註
- [[src-hermesos-cloud-landing]]（source / 信心強）：hermesos.cloud 首頁全文 + 定價結構 + 商業承接 OpenClaw 的官方證據
- [[HermesOS]]（entity / 信心強）：**新 entity**——hermesos.cloud 的 managed cloud 商品，建立在 Nous Research 的 [[Hermes-Agent]] 之上。釐清「框架／託管／競品」三層

### 更新既有頁
- [[Gas-Khuang]]：補真實全名 **Gask Huang-Kai** + Facebook handle GaskHuang + 補「[[HermesOS]] 中文圈推廣者」身分；信心弱→中
- [[OpenClaw]]：補中文別名 **「龍蝦 AI」** + 「遷移趨勢」段重寫為「商業承接 + 社群遷移 + 並存推薦」三層；補 HermesOS 商業承接證據（首屏 tagline + OpenClaw migration built in + FAQ）
- [[Hermes-Agent]]：補開篇層次差異說明 + 新增「商業包裝層：HermesOS」段 + 對比表加入 HermesOS row
- [[Vibe-Coding]]：「不同觀點」加入 Gask Huang-Kai 中小企業視角 + 新增「中小企業視角：根本替代而非補強」段（與 DESIGN.md / Harness Engineering 補強路徑並列對照）

### 關鍵釐清成果
- **HermesOS ≠ Hermes Agent**：前者是商業 managed cloud（hermesos.cloud），後者是 Nous Research 開源框架。文章與社群討論常混用，此次 ingest 把三層分開
- **「龍蝦 AI」= OpenClaw** 的中文行銷別名（claw → 蝦螯 → 龍蝦），此次首度納入 aliases
- **同一人三身分匯流**：Gas Khuang（GitHub username）= Gask Huang-Kai（真實全名）= [[src-hermes-agent-99-cases|99 案例整理者]] = 中文圈 HermesOS 推廣者
- **「OpenClaw → Hermes 取代趨勢」的商業機制**：不是技術自然取代，是 HermesOS 把「OpenClaw migration built in」做成商品功能主動承接

### 觀察到的對話組
- [[Vibe-Coding]] 的批判視角從 [[src-anthropic-founders-playbook-2026|Anthropic「Agentic Technical Debt」]]（startup / AI-Native 視角）+ [[src-will-ai-kill-saas-design|Yu-Chih Edward Hwang]]（SaaS 演化視角）擴展到「**台灣 SMB 顧問視角**」——三條獨立論述線
- [[Managed-Agents]]（Anthropic 親生）↔ [[HermesOS]]（開源底層 + BYO key）形成「同一 managed agent 趨勢的兩個切片」雙向連結

### 影響頁面
[[src-gask-ai-agent-vs-vibe-coding]], [[src-hermesos-cloud-landing]], [[HermesOS]], [[Gas-Khuang]], [[OpenClaw]], [[Hermes-Agent]], [[Vibe-Coding]], index.md = 8 頁

### 餘下 inbox 來源（後續 ingest）
- 台灣家具廠/品牌清單（task #2）
- calcom/cal.diy URL fetch（task #3）
- AKIRAXCLAW GitHub 精選 URL fetch（task #4）
- MBP 短感想 4 行（task #5 待定）

## [2026-05-26] ingest | 批次處理 inbox 餘下 4 來源 (#2-5)
- **觸發**：使用者選擇「一次把 #2-5 都跑完」
- 同日 wave B，承接 wave A (#1) 完成後

### 新建 4 個 source 頁
- [[src-taiwan-made-brands]]（信心弱）：FB 貼文整理 11 品類 30 品牌索引；保留嚴格標準「台灣監製、產地中國的不算」；單一來源 + 未驗證個別品牌實際產地
- [[src-cal-diy-github]]（信心強）：Cal.com 100% MIT 開源社群版（移除 EE features，僅 self-host）；與 [[HermesOS]] 形成**商業↔開源反向案例**對位（HermesOS 是「開源框架包成商業 cloud」，cal.diy 是「商業 SaaS 剝掉 EE 變回純開源」）
- [[src-akiraxclaw-github-trending-2026-05-20]]（fetch 失敗 / deferred）：三方法均失敗（markdown.new 超時 / WebFetch 抓不到 body / curl 確認是 Next.js SPA）；建 placeholder 頁保留 URL + 後續手動投遞指引
- [[src-mbp-failure-hardware-pivot]]（信心強）：MBP 三年保固剛過顯示晶片損壞無法修；策略轉向「MBA M5 24g + Framework Desktop 128g + SSH remote」；對應「fungible client / persistent server」設計哲學

### 不為 cal.diy / Cal.com / Taiwan 品牌個別建 entity 的決策理由
- Cal.com / cal.diy：wiki 既有對 Cal.com 僅 1 處引用（DESIGN.md 範例品牌之一），未到「需要 entity 頁支撐多處交叉引用」門檻；以 src 頁形式保留即可
- 台灣品牌 30+ 個：價值密度低 + 「未來真用到再升級」原則；source 頁的索引表已可滿足「查找起手」用途

### Fetch 失敗的工程觀察（記錄為未來經驗）
- **markdown.new API**：對 GitHub repo 與部分 SPA 站點處理慢 / 超時。fetch-url.sh 60s 超時門檻對複雜頁不夠用
- **WebFetch tool**：可以拿到 GitHub README 但對 client-side render 的 Next.js SPA 內容拿不到（只有 nav + meta）
- **curl + UA spoof**：80KB HTML 但無實質內容才能確認是 SPA——是判斷 fetch 為何失敗的最後手段
- **GitHub repo 的權威路徑**：`gh api repos/<owner>/<name>/readme --jq '.content' | base64 -d` 比 fetch URL 穩定許多

### 影響頁面
[[src-taiwan-made-brands]], [[src-cal-diy-github]], [[src-akiraxclaw-github-trending-2026-05-20]], [[src-mbp-failure-hardware-pivot]], index.md = 5 頁

### 整日 ingest 累積
| Wave | 來源 | 新頁 | 更新頁 |
|------|------|------|--------|
| A (#1) | Gask 論述 + HermesOS 官網 | 3 | 4 |
| B (#2-5) | 4 inbox 來源 | 4 | 0 |
| **合計** | **6 來源** | **7 新頁** | **4 更新頁** |

知識庫規模：121 → 128 頁。

### 仍待後續
- AKIRAXCLAW 文章內容手動投遞後再 ingest
- 若採購 MBA M5 24g 後實際 SSH remote 體驗有觀察，回頭補 [[src-mbp-failure-hardware-pivot]]
- Framework Desktop 128g 跑本地 LLM 的實測（若有，與 [[LM-Studio]] / [[Gemma]] 對照）

## [2026-05-28] ingest | 曹興誠回應川普「台灣偷半導體」+ ingest 流程強化試行

### 來源
- 今周刊 2026-05-26 文章，轉述曹興誠（聯電創辦人）FB 貼文
- URL：https://www.businesstoday.com.tw/article/category/183015/post/202605260002/
- raw/我們是夥伴不是小偷台灣4億豪賭才換來矽盾川普屢喊偷晶片吳金榮台積電n3p完勝美方才想偷-今周刊.md

### 新建頁
- [[src-tsao-hsing-cheng-tsmc-rca-history-2026-05]]（信心中）：對外駁川普 + 對內補刀台積電歷史恩怨；含 5 個關鍵時間軸事件 + 商業決策洞察（7 微米 CMOS vs 3.5 微米 NMOS）

### 流程強化試行（呼應使用者「沒好好吸收」痛點）
本次 ingest 第一次加入 **「個人吸收」段**：
- ingest 之前先 quiz 使用者：「不看文章用自己的話講 1 個重點 + 你會用在什麼場合」
- 使用者答案：重點「為什麼買 7 微米 CMOS」+ 場合「跟朋友/客戶聊台美關係/關稅」
- **LLM 觀察到錯位**：論點（商業決策智慧）與場合（地緣政治論述）不對位——CMOS 決策對「台灣不是偷的」沒幫助，對「技術選型/接案策略」反而最強
- 在 src 頁明確記錄這個錯位 + 兩條重組路徑 + spaced retrieval 7-14 天後回測建議

### 不主動建 entity 的決策
- 文章涉及 7 個未建頁 entity（曹興誠 / 台積電 / 張忠謀 / 聯電 / 工研院 / RCA / 矽盾）
- 全部標記為「未來再出現 1 次即建」候選，避免一次性 over-engineer
- wiki 半導體 / 台美地緣主題從 0 起步，「矽盾」概念建頁優先序最高（地緣政治論述常用詞）

### 觀察成果
- 半導體主題從 0 提及變成 1 個 src 頁——新領域第一頁
- ingest 流程從「無腦丟進去」進化到「強迫吸收檢核」第 1 個試驗點
- 影響頁面：[[src-tsao-hsing-cheng-tsmc-rca-history-2026-05]], index.md = 2 頁

### 待回測
- 2026-06-10 前後請使用者回答：「曹興誠 RCA 那篇你還記得什麼？」驗證 spaced retrieval 效果
- 若使用者真在某個場合（客戶 / FB 貼文）用到本文論點，回頭在「個人吸收」段補應用紀錄

## [2026-05-28] ingest | 雷小蒙週報 — 三棲遷移 + 雙 AI 對辯儀式

### 來源
- 雷蒙 / Kairos「雷小蒙」第一人稱 FB 貼文（2026-05-08 ~ 05-26 共 18 天工作復盤）
- raw/2026-05-26-雷小蒙-AI分身上班紀錄-三棲遷移與雙AI對辯儀式.md

### 新建頁
- [[src-leikairos-tri-platform-migration-dual-ai-ritual-2026-05]]（信心中）：7 條核心論點 — 不被綁死策略 / 描述清楚=真資產 / Pro-kit08 雙棲清單 / 雙 AI 對辯儀式 / 工具資產化 / 不務正業正向觀察 / AI vs 人類回饋風格差異

### 流程：第 2 次使用「個人吸收」段
本次依照 2026-05-28 確立的論點型 ingest 流程：
- ingest 前 quiz：「不看文章用自己的話講 1 個重點 + 你會用在什麼場合」
- 使用者答案：重點「不被任何 AI 公司綁死的策略」+ 場合「規劃自己 Skill / Workflow 怎麼寫才能跨平台」
- **LLM 觀察的對位結果**：**方向對位但層級錯位**（vs 上次曹興誠的完全錯位）
  - 方向對：「不被綁死 = why」「跨平台 workflow = how」是因果關係
  - 層級錯位：使用者記的是「綱領」，真要寫 Skill 用得上的是文章裡的下位執行細節（Pro-kit08 模式 / 描述清楚原則 / 不互讀再寫）
- 在 src 頁記錄 2 條重組路徑（往下擴一層 vs 改變應用場合）+ spaced retrieval 7-14 天後回測

### 不主動建 entity 的決策
- 雷蒙 / Kairos / 雷小蒙：第 1 次出現，標記為「再出現 1 次即建」
- Antigravity（Google agent CLI）：第 1 次出現，同上標記
- consensus-builder / Pro-kit08：個別工具 / 課程材料，優先序低
- 「Dual-AI-Review-Ritual」「Tool-Assetization」標為 concept 候選——若第二個案例出現可獨立成 concept 頁

### 與既有頁面建立的對話
- vs [[src-gask-ai-agent-vs-vibe-coding]]：同期 AI 工作流論述，角度不同（Gask 講「正確使用 AI」/ 雷蒙講「即使用對也要可遷移」）→ 可作對比閱讀
- vs [[HermesOS]]：「商業包裝層」vs「個人 OS 層」對位（同樣解決可遷移性，路徑不同）
- vs [[Ratchet-Pattern]]：「描述清楚 = 真資產」幾乎是 Ratchet 孿生 sibling（失敗側 vs 生產側）
- vs [[HyperFrames]]：本文補了 HyperFrames 一個額外的影片 broll 使用場景

### 影響頁面
[[src-leikairos-tri-platform-migration-dual-ai-ritual-2026-05]], index.md = 2 頁

### 連續觀察
- 第 1 次（曹興誠）：完全錯位
- 第 2 次（雷小蒙）：方向對 + 層級錯位
- 兩次都需要「重組記憶」才能真用——這個 quiz/觀察循環本身是有產出的（不只是「存了」）
- 樣本還太少；持續 3-5 次後可累積錯位類型 taxonomy

### 待回測
- 2026-06-10 前後合併問：「曹興誠 + 雷小蒙兩篇你還記得什麼？特別是雷小蒙的『跨平台 workflow』具體該怎麼寫？」
- 看 Pro-kit08 / 描述清楚 / 不互讀這三個下位執行細節有沒有留下來，或仍只記「不被綁死」綱領

## [2026-05-29] ingest | WP AI 小聚 — 歐陽嘉隆 / 羊羊數位 AI 設計網頁工作流

### 來源
- 歐陽嘉隆（羊羊數位科技創辦人）2026 春季 WordPress AI 小聚 12 張投影片簡報
- URL: https://dev-ys.wppro.cloud/WP-MEETUP/
- 公開度判斷：dev subdomain + noindex robots，但講者主動分享 URL 推廣 + 完整自家品牌標示 + 列入官方 demo → 屬「intentionally shareable」公開內容
- raw/2026-05-29-WP-MEETUP-歐陽嘉隆-羊羊數位-AI設計網頁工作流.md

### 新建頁
- [[src-yangsheep-wp-ai-meetup-2026-spring]]（信心中）：7 條核心論點群 — 帶雛型去談案 / 給對資料 / Claude Design vs 本地+Codex / 5 套工具 toolchain / 提示詞範本 / GreenLight WP 整合 / 自家產品延伸

### 流程：第 3 次使用「個人吸收」段
- 使用者答案：重點「給對資料 + 好的參考網站是 AI 設計關鍵」+ 場合「評估自己接案工作流跨不跨得過這套水準」
- **LLM 觀察的對位結果**：**方向對位但尺度錯位**——記住 slide 3 一個論點，但要 benchmark 整套工作流需要 cross-check slide 2/4/5/6/8 全部
- 在 src 頁明確列出 6 個 benchmark 檢核點 + 2 條重組路徑 + spaced retrieval 7-14 天回測

### 連續觀察的對位類型累積（3 次）
| 序 | 來源 | 對位類型 |
|---|------|---------|
| 1 | 曹興誠 RCA | 完全錯位（商業決策 vs 地緣政治）|
| 2 | 雷小蒙週報 | 方向對 + 層級錯位（綱領 vs 下位執行）|
| 3 | 歐陽嘉隆 WP 小聚 | 方向對 + 尺度錯位（單點論點 vs 整體 benchmark）|

**初步浮現 pattern**：使用者每次記住「單一最 stick 的點」（CMOS 商業決策 / 不被綁死 / 給對資料），但應用場合需要「結構化全貌」（地緣論述彈藥 / 跨平台 workflow 執行 / 完整工作流 benchmark）。

若後續 3-5 次 ingest 此 pattern 持續，獨立為 [[Single-Point-Recall-Bias]] 元 pattern 頁。

### 不主動建 entity 的決策
- 歐陽嘉隆 / 羊羊數位 / YS CART：第 1 次出現，「再出現 1 次即建」候選
- GreenShift / GreenLight Skills (greenlight-vibe)：第 1 次出現但是「AI 設計→WP 上線」最後一哩橋的關鍵元件，標「再出現 1 次即建」高優先
- design-md-chrome / web-interface-guidelines：個別 skill，等實際安裝使用再升級
- marketing-skills / claude-gpt-image-bridge / superpowers / webdesignclip / Awwwards：個別資源，優先序低

### 與既有頁面建立的對話
- vs [[src-gask-ai-agent-vs-vibe-coding]]：兩個台灣 WP 接案者視角互補（Gask 講架構面替代論，歐陽嘉隆給執行面 toolchain）
- vs [[src-leikairos-tri-platform-migration-dual-ai-ritual-2026-05]]：抽象 ↔ 具體（雷蒙跨平台設計原則 ↔ 歐陽嘉隆中文圈具體 toolchain）
- vs [[Vibe-Coding]]：歐陽嘉隆的工作流是 vibe coding 的「結構化進階版」（5 skill 串接 + 標準提示詞）
- vs [[DESIGN-md]]：design-md-chrome 是 design.md 的取得方式之一
- vs [[Claude-Design]]：slide 4 的「Claude Design 限制」可寫進其適用 / 不適用場景段
- vs [[Prompt-Pack-Pattern]]：slide 6 提示詞範本是此 pattern 的最簡實例
- vs [[WordPress-接案工作筆記]]：直接補充「加值階段（AI / RAG）」可操作 toolchain
- vs [[Plugins-Claude-Code]]：GreenLight + GreenShift 是「AI skill ↔ WordPress plugin 雙向整合」具體案例

### 影響頁面
[[src-yangsheep-wp-ai-meetup-2026-spring]], index.md = 2 頁

### 待回測
- 2026-06-12 前後（提早幾天，因為這篇對使用者工作直接相關，預期可用性高）：「歐陽嘉隆 / 羊羊數位的 WP AI 工作流你還記得什麼？特別是『benchmark 自己工作流』的話，你會列哪幾個檢核點？」
- 看是否能從 slide 3 自然擴展到 slide 5 / 6 / 8 的具體執行細節
- 同步累積到第 3 次的「單點記憶 vs 整體應用」pattern 觀察

## [2026-05-29] ingest | 支付決勝 — Winston Wen / SHOPLINE Payments（同場 WP 小聚姊妹簡報）

### 來源
- Winston Wen 溫文（SHOPLINE Payments 台灣商務拓展負責人）2026 春季 WP 小聚 6 張投影片
- URL: https://wordpress-shoplinepayments.netlify.app/
- 公開度：netlify 公開部署 + 對外 BD 用，無內部資訊；安全可入 git
- raw/2026-05-29-WP-MEETUP-Winston-Wen-SHOPLINE-Payments-支付決勝.md

### 新建頁
- [[src-shopline-payments-wp-meetup-2026-spring]]（信心中）：論點型 + 銷售 pitch 混合；4 個 framework — AI 時代支付位階重塑 / 3 結帳殺手 / 現代支付 4 要素 / 3 組平台數據
- [[SHOPLINE-Payments]]（新 entity）：第 2 次出現觸發；含支付方式 / 接案決策矩陣 / 競品 placeholder（藍新/綠界/紅陽/Stripe）/ 自家數據可信度評估

### 流程：第 4 次使用「個人吸收」段
- 使用者答案：重點「3 結帳殺手 framework」+ 場合「診斷客戶電商/課程/服務網站為什麼轉換不好」
- **LLM 觀察的對位結果**：**方向對位但階段窄化錯位** — 3 殺手是「結帳階段」工具，但「整體轉換診斷」還需要流量質量 / CRO / 信任設計 / 加購物車前 / 結帳後 4 個漏斗階段
- 在 src 頁明確列出更大轉換漏斗的 5 階段 + 2 條重組路徑 + spaced retrieval 約定

### 連續觀察的對位類型累積（4 次）
| 序 | 來源 | 對位類型 |
|---|------|---------|
| 1 | 曹興誠 RCA | 完全錯位 |
| 2 | 雷小蒙週報 | 方向對 + 層級錯位 |
| 3 | 歐陽嘉隆 WP 工作流 | 方向對 + 尺度錯位 |
| 4 | SHOPLINE Payments | 方向對 + 階段窄化錯位 |

**4 次後的觀察更新（修正版，回應使用者澄清要求）**：對位 fit 度逐次提升（完全錯位 → 層級錯位 → 尺度錯位 → 階段窄化錯位）。**錯位拆成 2 類**：

1. **拿錯工具型（Case 1）**：記住的 insight 跟想用的場合**無關**（曹興誠 CMOS 商業決策 vs 聊台美關係）——不是「場合大小不對」，是「**拿錯工具去錯場合**」
2. **場合 > 工具型（Case 2、3、4 共 3 次）**：方向對位但**場合範圍大於工具 cover 範圍**
   - Case 2：場合「寫 Skill 跨平台」需下位執行細節，工具「不被綁死綱領」是更上位的概念
   - Case 3：場合「benchmark 整套工作流」需 cross-check 12 slides，工具「給對資料」只是 slide 3 一個論點
   - Case 4：場合「整體轉換診斷」需 5 個漏斗階段，工具「3 結帳殺手」只 cover 結帳那 1/5

**初步規律**：
- 來源是**單點 insight** 時，最容易完全拿錯工具（Case 1）
- 來源**本身就是 framework** 時（Case 2、3、4），對位**形式上比較容易 match**，但仍出現「場合 > 工具」的 scope mismatch
- **3/4 案例屬於「場合 > 工具」**：方向對位會給人「我有 fit 到」的錯覺，比「完全錯位」更難察覺，所以這個 pattern 特別值得追蹤

**前一輪 commit log（commit 3e46021）寫的「4/4 都是場合 > 工具」是過度概括**——Case 1 不屬於這類；已在此處修正。

樣本仍嫌少；後續 2-3 次若持續，獨立為 [[Tool-Coverage-Mismatch]] / [[Wrong-Tool-Recall]] 兩個元 pattern。

### 為什麼建 SHOPLINE-Payments entity 但不建其他 entity
- SHOPLINE-Payments：第 2 次出現符合「再出現 1 次即建」+ 對使用者接案有實務決策價值
- Winston Wen、SHOPLINE（母公司）：第 1 次，「再出現 1 次即建」候選
- zingala / LINE Pay / Apple Pay / 街口支付 / 藍新 / 綠界 / 紅陽 / Stripe / TapPay：個別金流，等需要做 [[comparison-tw-payment-gateways]] 比較頁時一併建

### 與既有頁面建立的對話
- vs [[src-yangsheep-wp-ai-meetup-2026-spring]]：**同場小聚姊妹簡報**——做網站 ↔ 收錢的閉環兩端
- vs [[WordPress-接案工作筆記]]：「加值階段」新增「金流升級建議」子服務 + 3 結帳殺手是其診斷工具
- vs [[顧客終身價值]]：高客單服務（> 1 萬）+ 分期影響 CLV 計算的具體機制
- vs [[src-customer-diagnostic-50-questions]]：3 殺手是「為什麼不買」結帳階段的細展開

### 影響頁面
[[src-shopline-payments-wp-meetup-2026-spring]], [[SHOPLINE-Payments]], index.md = 3 頁

### 待回測
- 2026-06-12 合併問：「SHOPLINE 那篇 3 個結帳殺手是哪 3 個？你拿來診斷客戶的話，前面 4 個漏斗階段你會怎麼補？」
- 同步累積到第 4 次的「fit 度逐步提升」觀察是否持續

## [2026-06-01] ingest | NVIDIA GTC Taipei 2026 黃仁勳 keynote（首例 YouTube 長片 + 首例 intent quiz）

### 來源
- 2026-05-30 ~ 06-01 期間 NVIDIA GTC Taipei 2026 直播；天下雜誌 video 轉播（AI 即時中字翻譯版本）
- URL: https://www.youtube.com/watch?v=tUE2RV9hqWI
- Transcript：2318 段 / ~2 小時（英文 auto-caption）
- raw/2026-06-01-yt-nvidia-gtc-taipei-2026-jensen-keynote.md（完整 transcript）

### 新建頁
- [[src-nvidia-gtc-taipei-2026-jensen-keynote]]（信心中）：5 條主軸結構化（Agentic AI / CUDA 護城河 / Vera Rubin 路線圖 / Action Model / Taiwan ecosystem partner）+ 7 項論點群 + 投資視角的廠商敘事 bias 警示
- [[TSMC]]（新 entity）：第 2 次出現觸發；含曹興誠歷史爭議視角 + NVIDIA AI 供應鏈核心定位

### 流程變化：首次 intent quiz（非 memory test）
前 4 篇都是「已讀後 quiz memory」，本篇因為使用者可能還沒看（2 小時長），改成 **intent quiz**：「你想從這場拿走什麼 + 用在什麼場合」。
- 使用者答案：想拿走「Agentic AI / Jensen AI / Action Model narrative」+ 用在「評估 NVIDIA / 台積電 / AI 供應鏈股票投資決策」
- LLM 觀察到**新類型錯位**：**Source bias 錯位**——想拿走的是 NVIDIA 自家 selling narrative，但用在投資決策需要中立 / 反向懷疑的工具

### 連續觀察的對位類型累積（5 次後）
| 序 | 來源 | 錯位類型 | 種類 |
|---|------|---------|------|
| 1 | 曹興誠 RCA | 完全錯位 | 拿錯工具 |
| 2 | 雷小蒙週報 | 層級錯位 | 場合 > 工具 |
| 3 | 歐陽嘉隆 WP 工作流 | 尺度錯位 | 場合 > 工具 |
| 4 | SHOPLINE Payments | 階段窄化錯位 | 場合 > 工具 |
| 5 | NVIDIA GTC keynote | **Source bias 錯位** | **工具類型不對**（廠商敘事 vs 中立分析）|

**5 次後 taxonomy 更新（3 大類）**：
- 拿錯工具型（1/5）
- 場合 > 工具型（3/5，仍是主流）
- **Source bias 錯位（1/5，新類型）**：當來源是廠商 keynote / BD pitch / 自家 LP 等「有商業立場」的講者時，即使「拿到了正確論點」，用在需要反向懷疑的場合（投資 / 採購 / 競品分析）會自帶 bias 風險

### 為什麼建 TSMC entity 但不建 NVIDIA entity
- TSMC：在 [[src-tsao-hsing-cheng-tsmc-rca-history-2026-05]] 是第 1 次提及但只是「候選」，本次是第 2 次符合 trigger + 有「對話組」價值（曹興誠歷史視角 + Jensen ecosystem 視角形成兩層）
- NVIDIA：本 src 是首次深度描述，第 2 次出現再建（避免單來源 entity）
- Jensen Huang / Vera Rubin / Blackwell / CUDA / Stargate / 鴻海 / GR00T / Action Model：同上，「再出現 1 次即建」候選

### 與既有頁面建立的對話
- vs [[src-tsao-hsing-cheng-tsmc-rca-history-2026-05]]：**Taiwan 半導體敘事**的兩條獨立論述線——曹興誠對外駁 Trump + Jensen 廠商視角框架「ecosystem partner」
- vs [[src-leikairos-tri-platform-migration-dual-ai-ritual-2026-05]]：**AI 分身**兩種尺度——雷蒙 Kairos 個人版 + Jensen AI 產業版（narrative 同方向但不同尺度）
- vs [[Agent-Skills]] / [[Managed-Agents]] / [[Claude Code]]：「軟體層 agentic AI」vs Jensen 「硬體 + framework 層 agentic AI」對位
- vs [[Vibe-Coding]]：Action Model 4 元素（perceiving / reasoning / planning / acting）與 vibe coding 「描述意圖讓 AI 全鏈執行」同方向
- vs [[DESIGN-md]]：DSX blueprint 反映「規格 → AI 實作」橫向 pattern 已從 software 滲透到 data center 設計

### 影響頁面
[[src-nvidia-gtc-taipei-2026-jensen-keynote]], [[TSMC]], index.md = 3 頁

### 工程觀察（首例 YouTube ingest）
- `fetch-youtube.sh` 抓 transcript 正常但**保存到 OUTPUT_DIR 失敗**（疑似 shell scope 問題）→ 改 fallback 用 inline Python + `>` redirect 解決
- YouTube auto-caption 英文 + 2 小時長度 → 必須先做「topic outline + keyword 掃描」才能結構化整理，不能逐段引用
- intent quiz（vs memory test）是長片 / 未讀來源的合適流程變體

### 待回測
- 2026-06-15 前後（給時間讓投資判斷有實際決策時機）：「NVIDIA GTC Taipei 那場你還記得什麼？特別是 Agentic AI / Action Model narrative 你**怎麼用在投資決策**——是直接信還是有跟競品 / capex 數字 cross-check？」
- 看是否能意識到 narrative 的 source bias 警示

## [2026-06-02] ingest | Google 搜尋生成式 AI 功能最佳化指南（首例「平台守門人」對話組）

### 來源
- URL：https://developers.google.com/search/docs/fundamentals/ai-optimization-guide?hl=zh-tw
- 文件最後更新：2026-05-21（世界標準時間）
- 來源類型：官方文件型 + **強論點型**（含 5 個明確「不要做」+ 對 AEO/GEO 的官方定論）
- raw/2026-06-02-google-ai-search-optimization-guide-zh-tw.md（WebFetch 快照，因 Google 文件會改版）

### 新建頁
- [[src-google-ai-search-optimization-guide-2026-05]]（信心強，含 bias 警示）：完整 5 個「不要做」清單 + 應該做清單 + RAG/查詢擴展機制 + AI Overview 引用條件 + 對話組對撞表 + 個人吸收段

### 重要既有頁更新
- [[GEO]]：新增「Google 官方反論（2026-05-21）」段（含立場對撞表 + 兩派如何同時為真的 audience 選用建議 + 立場演化時間軸 + Source bias 平台守門人型診斷）；**不刪除原本 Welly / Cloudflare 立場**（per CLAUDE.md「並列呈現，標註各自來源與時間，不擅自取捨」）；sources 從 2 → 3

### 流程：第 6 次吸收檢核 + 對位 taxonomy 細分

延續 5/28 確立的 [[src-tsao-hsing-cheng-tsmc-rca-history-2026-05|個人吸收段]] 流程，本次是 **第 6 次**，使用 [[src-nvidia-gtc-taipei-2026-jensen-keynote|前次]] 引入的 **intent quiz**（適合可能未細讀的官方文件）。

**Quiz 答案**：
- 想拿走：5 個「不要做」清單（全選）+ GEO/AEO = SEO 定論 + RAG/查詢擴展機制 + AI Overview 引用條件
- 用在：客戶網站 SEO 建議 + 自家 wiki 優化 + 對抗 GEO/AEO 顧問業話術

**LLM 觀察**：對位類型是 **Source bias 錯位（平台守門人型）—— 新亞型**

### 6 次後 taxonomy 更新（3 大類 → 第 3 類細分 2 亞型）

| 序 | 來源 | 錯位類型 | 大類 | 亞型 |
|---|------|---------|------|------|
| 1 | 曹興誠 RCA | 完全錯位 | 拿錯工具 | — |
| 2 | 雷小蒙週報 | 層級錯位 | 場合 > 工具 | — |
| 3 | 歐陽嘉隆 WP 工作流 | 尺度錯位 | 場合 > 工具 | — |
| 4 | SHOPLINE Payments | 階段窄化錯位 | 場合 > 工具 | — |
| 5 | NVIDIA GTC keynote | 廠商敘事 bias | Source bias 錯位 | **賣方敘事型** |
| 6 | **Google AI 搜尋指南** | **平台守門人 bias** | Source bias 錯位 | **平台守門人型（新）** |

**平台守門人型** vs **賣方敘事型** 的差別：

| 軸 | 賣方敘事型（NVIDIA）| 平台守門人型（Google）|
|---|---|---|
| 講者身分 | 賣自家產品（直接利益）| 平台守門人（決定規則）|
| Bias 來源 | 「我們最棒」selling narrative | 「不要做這件對手會受益的事」|
| 偽裝形式 | 技術 + product roadmap | **客觀技術判斷 / 官方指南** |
| 察覺難度 | 中（明顯是 keynote）| **高（藏在 developer doc 外衣下）**|
| 診斷問題 | 「這個論點如果反過來，他自家會受損嗎？」| **「這個立場如果反過來成立，誰會受損？」**|

**Google 反對 llms.txt 的結構性動機**：如果開發者普遍採用 llms.txt 等**平台無關標準**，OpenAI / Anthropic / Perplexity 可選擇優先抓 llms.txt，Google 在「平台無關優化」這條 axis 上會輸給對手。所以 Google 把 llms.txt 框成「沒必要 / 沒效果」是**自然的競爭立場**。

### 與既有頁面建立的對話（對話組黃金案例）

- **vs [[GEO]] + [[src-welly-seo-2026-04]]**：本次 ingest 直接觸發 [[GEO]] 頁實質更新，並列保存兩派立場。雙方論點對撞表已寫進 [[GEO#Google 官方反論（2026-05-21）|GEO 頁該段]]。
- vs [[RAG]]：Google AI Overview 是 RAG 的一種應用（對自家 web index 做 RAG），跟一般化 RAG 同技術不同 corpus
- vs [[DESIGN-md]]：「為 AI 提供 markdown」與 Google「不需為 AI 重寫」直接相反，但 [[DESIGN-md]] audience 是 coding agent 不是 search engine，所以**不衝突**
- vs [[MCP]] / [[Agent-Skills]]：Google 指南未提，因為這些是給 agent 用不是給 Google index 用，立場上沒衝突
- vs [[Ratchet-Pattern]]：本次擴充對位 taxonomy 是 Ratchet 第 N 次具體實例

### 為什麼不直接建 Google entity / llms.txt concept / AI Overview concept
- Google 在本知識庫出現很多次，但目前無獨立 entity 頁 → 列入 [[src-google-ai-search-optimization-guide-2026-05#未來追蹤候選 entity / concept|未來追蹤候選]]，等下次再實質出現時建
- llms.txt 已成兩派交鋒點，再出現 1 次值得獨立成 concept 頁（含格式規範 + 雙方立場 + Cloudflare Radar 採用率追蹤）
- AI Overview / E-E-A-T 同上，目前在既有頁面有夠用的子段

### 影響頁面
[[src-google-ai-search-optimization-guide-2026-05]], [[GEO]], index.md = 3 頁

### 工程觀察
- WebFetch + AI 摘要可作為 Google developer doc 的可靠 ingest 路徑（vs YouTube transcript 需 Python script）
- 對話組型 ingest（既有頁與新頁立場相反）的處理 SOP：
  1. 建新 src 頁完整保留新立場
  2. 在既有概念頁加「XX 反論」段並列保存（**不改原有段落**）
  3. 兩頁互相 `[[wikilink]]` 引用形成雙向連結
  4. log.md 紀錄為「對話組」型 ingest（非常規更新）

### 待回測（~2026-06-15）
1. 不看本頁，能講出 Google 那 5 個「不要做」嗎？
2. Google 反對 llms.txt 的**商業動機**是什麼？（不是只記「Google 說不要」，要記得**為什麼會這樣說**——平台守門人型 bias 的診斷問題）
3. 最後幫客戶 / 自家 wiki 做了 llms.txt 沒有？理由？是看 Google 還是看其他平台訊號？
4. 跟前 5 次合併回測：5 種錯位類型（拿錯工具 / 層級 / 尺度 / 階段窄化 / Source bias 兩亞型）你能憑記憶舉例嗎？

### 知識庫規模
135 → 136 頁（+1 新 src 頁；GEO.md 為更新，不算新增）

## [2026-06-02] concept | llms.txt 獨立成頁（兩派交鋒焦點 + 實測部署投票）

### 觸發
前一次 ingest（Google AI 搜尋指南）已標記 [[llms-txt]] 為「再出現 1 次即建」候選。本次未等再出現，**主動建頁**理由：
- 已是 [[GEO]] / [[src-welly-seo-2026-04]] / [[src-google-ai-search-optimization-guide-2026-05]] **三頁共同焦點**
- 接下來幫客戶 / 自家 wiki 做決策時會頻繁查閱，需單一查閱點
- 三方立場（推薦 / 反對 / 行動）有結構性矛盾，獨立成頁才裝得下

### 新建頁
- [[llms-txt]]（信心中）：完整規範 + 採用率追蹤 + 三方立場對撞 + 「行動 > 表態」heuristic + 自家 wiki 決策框架 + 未來追蹤 trigger 清單

### 重要既有頁更新
- [[GEO]]：「相關概念與來源」段加入 [[llms-txt]] 雙向連結
- [[src-google-ai-search-optimization-guide-2026-05]]：「未來追蹤候選」標記 ✅ 已建頁；「相關概念與來源」加入 [[llms-txt]]
- [[src-welly-seo-2026-04]]：「與本知識庫的關聯」加入 [[llms-txt]] 與 [[src-google-ai-search-optimization-guide-2026-05]]（這頁原本沒連到 Google 反論，本次補回）

### 研究方法：直接抓 URL 取代問「他們怎麼想」
建頁前並行抓 4 個關鍵 URL 驗證實際部署狀態：

| 域名路徑 | 結果 | 推導 |
|---|---|---|
| `https://platform.claude.com/docs/llms.txt`（[[Anthropic]]）| ✅ 11 語言 / 3000+ 連結 | **行動支持派** |
| `https://stripe.com/llms.txt` | ✅ 含 llms-full.txt 雙檔 | 行動支持派 |
| `https://platform.openai.com/llms.txt` | ❌ 404 | 未部署 |
| `https://www.anthropic.com/llms.txt` | ❌ 404 | Anthropic 限縮在 docs 子域 |

**方法論教訓**：對於有「平台守門人 bias」爭議的技術標準，**抓對方自家網站看實際部署 > 看官方表態文章**。Anthropic 沒發過「我們支持 llms.txt」聲明，但部署 3000+ 連結比任何聲明都強。本次正式編碼為兩條 heuristic 寫進 [[llms-txt]] 頁：
1. **「行動 > 表態」**：實際部署的工程投入 = 對 ROI 為正的買單
2. **「這個立場如果反過來成立，誰會受損？」**：用反向推導識別 Source bias

### 從吸收檢核延伸出來的 concept 頁
[[llms-txt]] 是本知識庫第一個**從「吸收檢核發現的對位類型」直接衍生**的 concept 頁。前 6 次吸收檢核是寫在 src 頁底部，本次擴充成獨立 concept 因為**累積證據夠多 + 三方立場互相 reference**。

### 影響頁面
[[llms-txt]], [[GEO]], [[src-google-ai-search-optimization-guide-2026-05]], [[src-welly-seo-2026-04]], index.md = 5 頁

### 未來追蹤 trigger（已寫進 [[llms-txt#未來追蹤 trigger]]）
- 任何 LLM 公司新增 / 移除 llms.txt 部署
- Cloudflare Radar 發布含 llms.txt 直接數據的報告
- Jeremy Howard 規範改版
- 出現量化效益研究
- OpenAI / Perplexity / Mistral 任一家官方表態

### 知識庫規模
136 → 137 頁（+1 新 concept 頁）

## [2026-06-03] ingest | Anthropic Dynamic Workflows in Claude Code（首例「矩陣未對位錯位」+ 對話組擴展 7 個既有頁）

### 來源
- URL：https://claude.com/blog/a-harness-for-every-task-dynamic-workflows-in-claude-code
- 作者：[[Thariq-Shihipar]] + Sid Bidasaria（Anthropic 工程師）
- 發佈：2026-06-02；本知識庫 06-03 ingest
- 來源類型：強論點型 + Anthropic 官方
- raw/2026-06-03-anthropic-dynamic-workflows-in-claude-code.md

### 新建頁
- [[src-anthropic-dynamic-workflows-claude-code-2026-06-02]]（信心強）：完整三大失敗模式 + 6 種設計模式 + 10 類使用案例 + 何時不用 + 對話組對位 + 第 7 次個人吸收段

### 重要既有頁更新
- [[Harness-Engineering]]：
  - 「概念層次關係」段新增 **Dynamic Harness Construction** 層
  - 新增獨立段「Dynamic Harness Construction（Anthropic 2026-06-02）」含三大失敗模式 + 6 種設計模式
  - 「跨工程文化論述對照」表新增 Anthropic Dynamic Workflows 視角列
  - 「相關頁面」加入新 src
  - sources 隱含 +1（Anthropic 第 4 個獨立論述角度）
- [[Thariq-Shihipar]]：
  - sources 從 2 → 3
  - 「核心論述」加新段「Dynamic Workflows / 三大失敗模式（2026-06-02 官方 blog）」
  - 「論述者地圖」位置擴展為「Cache 與 Context 工程 / Session 管理 / Dynamic Harness Construction」
  - 「未來可延伸」標記 ✅「Anthropic engineering blog 中 Thariq 的署名文章」已找到第一篇

### 流程：第 7 次吸收檢核 + 對位 taxonomy 重大擴充

延續 5/28 確立的個人吸收段流程，本次第 7 次。使用 intent quiz（適合可能未細讀的論述型來源）。

**使用者答案**：intent 全選（4/4）+ application 全選（4/4） = 4×4 矩陣

**關鍵 LLM 觀察：新型對位錯位浮現 ——「矩陣未對位錯位」**

過去 6 次吸收檢核每次都是 1 source × 1 application 點對點分析。本次第一次遇到 N×M 矩陣型答案，發現新類型錯位：

| 軸 | 描述 |
|---|---|
| **觸發條件** | intent 與 application 都「全選」（N×M 矩陣，N≥3 且 M≥3）|
| **機制** | 使用者內心是「這篇對我全方位有用」，但實際使用時只有對角線 cell 真的會啟動，其他 cell 是 dead cell |
| **危險性** | 中——比單點對位錯位**更隱蔽**，「全選」表面上看起來完美 |
| **診斷問題** | 「如果只能用其中 1 個 intent × 1 個 application 組合，會選哪一個？剩下的 cell 真的會啟動嗎？」|
| **對應對策** | 強制做 N×M 矩陣化拆解，標出 dead cell |

### 完整對位 taxonomy（7 次後 → 4 大類）

| 序 | 來源 | 大類 | 亞型 |
|---|------|------|------|
| 1 | 曹興誠 RCA | 拿錯工具 | — |
| 2 | 雷小蒙週報 | 場合 > 工具 | — |
| 3 | 歐陽嘉隆 WP 工作流 | 場合 > 工具 | — |
| 4 | SHOPLINE Payments | 場合 > 工具 | — |
| 5 | NVIDIA GTC keynote | Source bias 錯位 | 賣方敘事型 |
| 6 | Google AI 搜尋指南 | Source bias 錯位 | 平台守門人型 |
| 7 | **Anthropic Dynamic Workflows** | **矩陣未對位錯位（新）** | — |

### 次要觀察：Source bias 平台守門人型可能要再細分

本篇也是平台守門人來源（Anthropic 自家對 dynamic workflows 的論述），但 bias 性質與 Google 不同：

| 亞型 | 行為特徵 | 案例 |
|---|---|---|
| **壓制型平台守門人** | 「叫你不要做某事」（對手會受益）| Google 反 llms.txt |
| **開放型平台守門人** | 「鼓勵你用更多」（自家會受益）| Anthropic 推 Workflows |

兩者都是平台守門人 bias，但前者隱藏 / 後者顯性。**本次尚未到要修 taxonomy 的證據量，待第 3 次平台守門人型出現再判斷**。

### 對話組擴展（7 個既有頁延伸）

本次來源是高密度論述，與多個既有頁形成對話：

| 既有頁 | 對話面向 | 本次是否實際更新 |
|---|---|---|
| [[Harness-Engineering]] | Workflows = 動態化升級 | ✅ 更新（新段 + 概念層次 + 跨文化對照）|
| [[Thariq-Shihipar]] | 第 3 個來源 + 論述軸擴展 | ✅ 更新 |
| [[Subagent-Driven-Development]] | 兩階段審查 → 6 種模式擴展 | ❌ 未更新（已從新 src 反向 link 過去；待第二來源確認再實質補段）|
| [[Adversarial-Code-Review]] | Adversarial Verification 模式 = ACR 多 agent 版 | ❌ 未更新 |
| [[PGE-Principle]] | Generator ≠ Evaluator 可執行落地 | ❌ 未更新 |
| [[Context-Rot]] | 三大失敗模式 = Context Rot 變體分類 | ❌ 未更新（待三大模式 vocabulary 升級成 concept 時一併補）|
| [[Agentic-AI-Workflow]] | 同心圓 → dynamic 編排演化 | ❌ 未更新 |

**策略**：本次只實質更新 [[Harness-Engineering]] 與 [[Thariq-Shihipar]]，其他 5 頁只從新 src 反向 link 過去——避免單來源就在多頁加段，等三大失敗模式 / 6 種模式有第二來源時再實質升級。

### 未來追蹤候選 entity / concept

| 候選 | 等級 | 建立 trigger |
|---|---|---|
| **Agent Failure Modes (3)** concept | 高 | 再出現 1 次 |
| **Dynamic Workflow** concept | 高 | 本知識庫實戰引用 1-2 次內建頁 |
| **Workflow Design Patterns** concept | 中 | 6 種模式 cluster；再出現 1 次 |
| **Sid Bidasaria** entity | 中 | 再出現 1 次 |
| **Bun** entity | 中 | Zig → Rust rewrite 案例再出現 1 次 |
| **Tournament Pattern** | 低 | 暫不獨立建頁 |

### 工程觀察
- WebFetch + AI 摘要對 Anthropic 官方 blog 是可靠路徑
- 對話組擴展型 ingest（N 個既有頁被牽動）的處理 SOP：
  1. 標記**全部**會被牽動的頁面（本次 7 個）
  2. 從中區分「**核心對位**」（需實質更新段落）與「**反向 link**」（只在新 src 連過去）
  3. 通常只實質更新 2-3 個最核心，剩下等下次同主題來源出現再升級
  4. 避免「單來源就全面改寫多頁」過度反應

### 影響頁面
[[src-anthropic-dynamic-workflows-claude-code-2026-06-02]], [[Harness-Engineering]], [[Thariq-Shihipar]], index.md = 4 頁實質更新

### 待回測（~2026-06-17）
1. 3 大失敗模式名稱 + 對應既有 wiki 概念
2. 6 種設計模式你實際在 Claude Code 任務中用過幾種
3. 「dead cell」觀念你還記得嗎？最近 task 有沒有「intent 全選但實際只用對角線」
4. 你最後寫過 dynamic workflow 嗎？理由？

### 知識庫規模
137 → 138 頁（+1 新 src 頁；Harness-Engineering / Thariq-Shihipar 為更新）

## [2026-06-05] ingest | MUKI Plaud 工作坊（首例 Playwright MCP fetch + 首例 STT 系統性錯誤校正）

### 來源
- URL：https://web.plaud.ai/s/pub_a603637d-b309-4503-be01-c3e2774040f0::pg1VSEEyaVReIwZ7KnGLwak-Sfg1Wp0R6ieF3AkOCHVjaEd4UpmPos3o1JGVII1yM5S_PGFXOOqBdg0C
- 錄音日期：2026-06-04 19:37（單場 58:50）；本知識庫 06-05 ingest
- 講師：MUKI（張惠玲，muki.tw 部落格自 2008，台灣前端社群知名講者）
- 來源類型：論點型 + 實戰經驗型 + 高密度工具鏈介紹
- raw/2026-06-04-plaud-workshop-ai-codev-summary.md（Plaud AI summary 含 5 大主題 + 26 作業）
- raw/2026-06-04-plaud-workshop-ai-codev-transcript-FULL.md（轉錄逐字稿 19K 字 / 225 行）

### 新建頁
- [[src-muki-plaud-workshop-ai-codev-2026-06-04]]（信心中）：主軸聚焦 Hi Day vs LLM-Wiki 兩個實作對話組 + STT 錯誤校正表 + 其他 4 面向標明對位強度（不展開）+ 第 8 次個人吸收段

### 流程創新 1：首例 Playwright MCP fetch（SPA 內容）

Plaud 是 SPA，WebFetch 只抓到頁面標題。本次首次使用 Playwright MCP tool：
1. `browser_navigate` → URL
2. `browser_wait_for` → SPA 渲染
3. `browser_snapshot` → 抓 accessibility tree（拿到完整 AI summary，含 5 大主題 + 26 作業）
4. `browser_evaluate` → 切換到「轉錄」tab 並 extract `iframe.contentDocument.body.innerText`
5. 用 Python 解 JSON-encoded 字串還原成正規 markdown
6. `browser_close`

**工程教訓**：
- iframe 內容需用 `iframe.contentDocument` 存取
- `browser_evaluate` 加 `filename` 參數時，結果是 JSON-encoded（轉義 `\n`）的單行檔，需 `json.loads()` 還原
- zsh `noclobber` 會擋 `>` 覆寫，要先 rm 或 `setopt clobber`

### 流程創新 2：首例 STT 系統性錯誤校正

中文 Plaud STT 把「Claude」系列術語**一律聽成「Cloud」**。校正：

| Plaud STT | 校正 | 出現次數 |
|---|---|---|
| Cloud Code | Claude Code | 4 |
| cloud.md | CLAUDE.md | 多次 |
| Clocko / Codeless | Claude？/ Codex？ | 4 / 2（**未確認**）|
| Cloud（其他） | Claude | 多處 |
| NCP | MCP | 多次 |
| super product | Superpowers | 1-2 |

**校正策略**：src 頁開頭獨立段標明 STT 錯誤映射表，**ingest 後內文一律用正確術語**，讀者不必再校。Clocko / Codeless 待後續來源驗證。

**SOP 編碼**：未來中文 STT 來源（Plaud / Otter / Whisper 中文 / 其他）ingest 前先掃「Cloud / cloud 出現次數 vs Claude 出現次數」，若 Cloud 多 Claude 少 → 90% 是 STT 錯誤，啟動校正表。

### 流程：第 8 次吸收檢核

Quiz 答案：intent 4/4 全選 + **application 只 1/4**（Hi Day vs LLM-wiki 對話）

**新型對位類型候選浮現**：「Intent 廣 / Application 窄錯位」

延續第 7 次「矩陣未對位錯位」（N×M 都全選），本次是其變體：

| 維度 | 第 7 次（矩陣未對位）| 第 8 次候選（Intent 廣 / Application 窄）|
|---|---|---|
| 結構 | intent N + application M 全選 | intent N 全選 + **application 1** |
| 危險性 | 中 | **較高**（75-90% intent 不啟動但易被誤吸收）|
| 常見場合 | 高密度 N×M 矩陣型 source | **個人學習 / 累積認知**型 ingest |
| 升級狀態 | 已升級為獨立大類 | **候選變體** —— 待第 9-10 次再出現 1-2 次確認 |

**為什麼不直接升級**：N=1 樣本不足；跟第 7 類本質可能相同（intent 過多 vs application 過少）。**寫作紀律**：避免過早擴 taxonomy 後又要回滾。

### 完整對位 taxonomy（8 次後）

| 序 | 來源 | 大類 | 亞型 / 變體 |
|---|------|------|------|
| 1 | 曹興誠 RCA | 拿錯工具 | — |
| 2 | 雷小蒙週報 | 場合 > 工具 | — |
| 3 | 歐陽嘉隆 WP | 場合 > 工具 | — |
| 4 | SHOPLINE Payments | 場合 > 工具 | — |
| 5 | NVIDIA GTC | Source bias | 賣方敘事型 |
| 6 | Google AI 指南 | Source bias | 平台守門人壓制型 |
| 7 | Anthropic Workflows | 矩陣未對位錯位 | — |
| 8 | **MUKI Plaud 工作坊** | **矩陣未對位錯位** | **Intent 廣 / App 窄候選變體** |

### 寫作紀律新編碼：弱對位面向「標明 + 不展開」

依使用者 quiz 真實對位寫 src 頁，**不平均展開所有 intent**：
- 主軸（Hi Day vs LLM-Wiki 對話）= 完整對話組表 + 設計哲學差異 + 結論
- 弱對位 3 個面向（MUKI 工具鏈 / 26 作業 / 三大架構）= 每段 1-2 段標明對位強度 + 不展開細節，**標出未來對應到哪個 application 時可拿來用**

這避免 src 頁因「想吸收很多」變成全部論點都寫但每條都淺的雜訊版。

### 對話組擴展策略：全部既有頁不實質更新

主軸放在新 src 頁，**8 個牽動的既有頁全部不實質更新**（[[LLM-Wiki]] / [[Obsidian]] / [[Claude Code]] / [[CLAUDE-md]] / [[Agent-Skills]] / [[Ratchet-Pattern]] / [[using-git-worktrees]] / [[Andrej-Karpathy]] / [[NotebookLM]] / [[OpenClaw]]）。

理由：(1) 本來源是個人實作分享，非廠商正式論述；(2) 單一資料點不夠 trigger 既有 entity 升級；(3) 對應前次 [[src-anthropic-dynamic-workflows-claude-code-2026-06-02|Anthropic Workflows ingest]] 確立的「對話組擴展紀律」——等第二來源出現再升級。

### 未來追蹤候選 entity / concept

| 候選 | 等級 | 建立 trigger |
|---|---|---|
| MUKI entity | 中 | 再出現 1 次 |
| Hi Day entity | 中 | 再出現 1 次 |
| Deep Wiki entity / concept | 中 | 再出現 1 次（對 NotebookLM / OpenClaw 第三條路徑）|
| **「定義 / 決定 / 負責」三大核心** concept | **高** | 再出現 1 次（對客戶溝通強對位）|
| Understand Anything skill family concept | 中 | 使用者實際試用 1 次再建 |
| Checkpoint / 雙擊回退 concept | 低 | 累積 2 次再建 |

### 影響頁面
[[src-muki-plaud-workshop-ai-codev-2026-06-04]], index.md = 2 頁實質更新

### 待回測（~2026-06-19）
1. Hi Day vs LLM-Wiki 核心差別 2-3 條
2. 你最後試了 Hi Day 嗎？
3. 「Intent 廣 / Application 窄錯位」觀念你還記得嗎？最近 ingest / 學習有沒有同樣 pattern？
4. MUKI「定義 / 決定 / 負責」三大核心你真的跟客戶講過嗎？

### 知識庫規模
138 → 139 頁（+1 新 src 頁；無既有頁實質更新）

## [2026-06-09] ingest | 五大傷眼迷思 — Doctor.賴 護眼科普（YouTube）
- 來源：https://youtu.be/sW4aRxV60V8（放射腫瘤科醫師跨界護眼科普 ~18:20）
- **本知識庫第一個健康／醫療領域來源**（先前全為 AI／技術／投資）
- 建立來源摘要頁：[[src-doctor-lai-3c-eye-myths-myopia-2026]]
- 母框架「劑量決定毒性」+ 5 大盲點（抗藍光智商稅 / 距離才是近視殺手 / PWM 調光 / 藍光毀睡眠 / 30-10-120 戶外存摺）
- 刻意不抽 concept/entity 頁（第一個全新領域，避免 orphan，待第 2 個健康來源再建）
- 影響頁面：[[src-doctor-lai-3c-eye-myths-myopia-2026]], index.md

## [2026-06-09] reflect | 個人吸收第 9 次 — 新發現「受眾／適用對象錯位」
- 對應來源：[[src-doctor-lai-3c-eye-myths-myopia-2026]]
- Quiz：使用者答「近距離才是重點+要休息」/「自己落實到生活」
- 觀察：recall 對位母主軸（距離>藍光）但**對位到錯誤受眾**——記得「對小孩有效的距離/戶外存摺」，漏掉「對成人自己高槓桿的眨眼/選螢幕(DC調光)/睡前斷捨離」
- **新類型**：對位 taxonomy 第 5 大類候選「受眾／適用對象錯位」（主張對 + 套錯受眾族群）；樣本僅 1 次未固化
- 新 heuristic：「你記得的主張原本講給誰聽？跟你打算套用的對象是同一群人嗎？」
- 領域觀察：健康/醫療衛教類來源天然高頻觸發受眾錯位（兒童/成人/銀髮處方常相反）
- Spaced retrieval 約定：~2026-06-23（14 天後）
- 對應 [[Ratchet-Pattern]]

## [2026-06-10] ingest | OpenCLI + mcp-cli 兩個 agentic CLI 工具（GitHub README）
- 來源：https://github.com/jackwener/opencli 、 https://github.com/doggy8088/mcp-cli
- 擷取方式備忘：markdown.new API（fetch-url.sh）對 GitHub 連線**超時失敗**，改用 `gh api repos/.../readme` 抓 README raw + `gh repo view --json` 補 metadata（star/license/lang/parent）→ 之後 GitHub repo ingest 優先走 gh
- 補到關鍵事實：doggy8088 的 mcp-cli 是 **fork 自 philschmid 原版（Bun/TS）、由 Antigravity 重寫為純 Rust**；npm `@willh/mcp-cli`
- 建立來源摘要頁：[[src-opencli-github-2026-06]], [[src-mcp-cli-doggy8088-2026-06]]
- 建立實體頁：[[OpenCLI]], [[mcp-cli]]
- 更新既有頁：[[MCP]]（client 表新增 mcp-cli + Tool Search 落地補述 + 相關頁面）
- 核心整理：兩者都「把某層能力 CLI 化給人與 AI」但**處於不同 stack 層**——OpenCLI 在網頁存取層（對象=網站/瀏覽器）、mcp-cli 在 MCP 協定存取層（對象=MCP server）；可疊用（OpenCLI 包成 MCP server → mcp-cli 呼叫）
- OpenCLI 補進「AI 操作瀏覽器」三角：vs [[BrowseForge]]（反偵測養號）/ [[Playwright]]（通用底層），OpenCLI 走「已登入單人確定性 adapter」
- mcp-cli 核心論點接上 [[MCP]] 既有「Tool Search 按需載入」概念——shell 層省 token 實作，對應 [[Context-Engineering]]
- 來源分類：工具/官方文件型 README → 依 CLAUDE.md 表預設不加個人吸收段（選型決策吸收段待使用者確認）
- 影響頁面：[[OpenCLI]], [[mcp-cli]], [[src-opencli-github-2026-06]], [[src-mcp-cli-doggy8088-2026-06]], [[MCP]], index.md

## [2026-06-13] ingest | html2pptx skill 評價推文（X @taiyo_ai_gakuse）
- 來源：https://x.com/taiyo_ai_gakuse/status/2064578992548540650 （inbox 投遞的 URL 備忘，2026-06-10 發文）
- 擷取方式備忘：markdown.new（exit 56）與 WebFetch（402）對 X 均失敗 → 改用 **Claude in Chrome get_page_text** 成功抓到推文 + 引用推文（含 X 內建繁中翻譯）→ 之後 X 貼文 ingest 優先走瀏覽器
- **查證亮點：推文作者＝工具開發者**——@taiyo_ai_gakuse 2026-04 親自發布 html2pptx CLI、經營 html2pptx.app（官網 GitHub 指向 nanameru）。「個人 benchmark 超越 Genspark」實為**賣方自評自家產品**（賣方敘事型 source bias），信心降為弱並在來源頁顯著標註
- 識別注意：taiyokimura.com 當代藝術家「木村太陽」為同名不同人
- 補充擷取：html2pptx.app 官網（四形態 REST/Skill/MCP/CLI、localhost bridge、價格方案）
- 建立來源摘要頁：[[src-x-taiyo-kimura-html2pptx-2026-06]]
- 建立實體頁：[[html2pptx]]（含 vs Marp 工作流定位：Marp 不產可編輯 PPTX，html2pptx 補交付段）
- 更新既有頁：[[Agent-Skills]]（已知 Skills 集合補列 html2pptx + 賣方敘事警示）
- 來源分類：工具型（使用者確認）→ 不加個人吸收段
- 附帶處理：同批 inbox 的 Patreon「Modular Shelf」（Gazzaladra 3D 列印層架，付費牆內）經使用者確認**不需要，已刪除** raw URL 備忘檔，不建頁
- 影響頁面：[[src-x-taiyo-kimura-html2pptx-2026-06]], [[html2pptx]], [[Agent-Skills]], index.md

### 知識庫規模
142 → 144 頁（+1 src 頁 +1 entity 頁；[[Agent-Skills]] 實質更新；不含 index/log）

## [2026-06-17] ingest | 語音輸入 Voice Typing（GitHub｜本機 Whisper STT 工具）
- 來源：https://github.com/penny1985/voice-typing-mac （作者 陳沛孺 Penny）
- 擷取：markdown.new API 超時（60 秒未完成），改用 GitHub API 抓 README + repo metadata，手動補寫 raw/voice-typing-mac-github-readme.md
- 建立來源頁：[[src-voice-typing-mac-github-2026-06]]
- 來源分類：工具型 → 不加個人吸收段（對齊 OpenCLI / mcp-cli / html2pptx 先例）
- 交叉引用：與 [[src-muki-plaud-workshop-ai-codev-2026-06-04]] 連結——同涉 STT 但情境相反（Plaud 雲端轉錄且有系統性 STT 錯誤需校正 vs 本工具本機 + 規則式 `修正規則.txt` 後處理）
- 影響頁面：[[src-voice-typing-mac-github-2026-06]], index.md

## [2026-06-18] query→comparison | STT 模型比較 Whisper vs Paraformer vs SenseVoice
- 起因：有人反映 [[src-voice-typing-mac-github-2026-06]] 用的 Whisper 中文品質不佳，建議改用 FunASR/Paraformer/SenseVoice
- 網路研究（WebSearch×4 + WebFetch×3）：FunAudioLLM 論文、FunASR repo、ASR 2025-2026 深度比較、sherpa-onnx 文件、mlx-audio issue #761
- 建立比較頁：[[comparison-stt-models-whisper-paraformer-sensevoice]]
- 核心釐清：FunASR=工具箱（runtime），Paraformer/SenseVoice=跑在上面的模型；正確比較是三個模型
- 關鍵發現：① AISHELL-1 CER Whisper 5.14% vs Paraformer 1.68% vs SenseVoice 2.96%（Whisper 中文確實落後）② 兩模型無原生 MLX，Mac 本機需走 sherpa-onnx CPU ③ 繁體靠 opencc，非差異點 ④ press-to-talk 情境偏好 SenseVoice
- 信心：方向強／確切 CER 中（多來自單一深度比較文）
- 待決策：尚未實測，頁內留 spaced retrieval 自問（有實際測過自己語音的 CER 嗎）
- 反向連結：在 [[src-voice-typing-mac-github-2026-06]] 補上指向本比較頁的連結
- 影響頁面：[[comparison-stt-models-whisper-paraformer-sensevoice]], [[src-voice-typing-mac-github-2026-06]], index.md

## [2026-06-18] ingest | Hermes Agent 保姆級教學（PAPAYA 電腦教室，YouTube）
- 來源：https://www.youtube.com/watch?v=-EivK7vpOXY （頻道 PAPAYA 電腦教室，逐字稿 1328 行）
- 建立來源頁：[[src-papaya-hermes-agent-tutorial-2026-06]]
- 來源分類：工具教學型 → 不加個人吸收段
- 對既有實體的價值：[[Hermes-Agent]] 從「99 案例轉述」升級到「一手可重現操作」的首個來源
- 補充既有頁細節：記憶三檔補齊 User.md/Memory.md/**Soul.md**（既有頁只記 MEMORY/USER）、Goal/Subagent 具體化、提到 gpt-5.5（既有頁為 5.4，仍待驗證）
- 來源偏誤標註（延續賣方敘事紀律）：① 標題「OpenClaw 大規模棄養潮/用過回不去」為行銷語，規模無數據 ② 重推 Hostinger 疑似聯盟行銷 ③「最安全」為比較級宣稱未對比同類
- 更新既有頁：[[Hermes-Agent]]（記憶三檔 + 新來源 + updated 日期）、[[PAPAYA-電腦教室]]（第二支作品 + 主題從本地 AI 擴及 agent + 調性張力觀察）
- 影響頁面：[[src-papaya-hermes-agent-tutorial-2026-06]], [[Hermes-Agent]], [[PAPAYA-電腦教室]], index.md

## [2026-06-18] ingest | coralline — Claude Code statusline（GitHub + 作者 Threads）
- 來源（2 個，手機 inbox 投遞的書籤連結，本次擷取內容）：
  - https://github.com/Nanako0129/coralline （Shell/MIT/345★，2026-06-12 建）
  - https://www.threads.com/@nyanako_0129/post/DZeoN7MERsp （作者 Nanako Tsai 親述）
- 擷取：GitHub 經 API 抓 README + meta；Threads 經 WebFetch
- 建立來源頁：[[src-coralline-statusline-2026-06]]（依使用者選擇：輕量合一頁，不另開實體頁）
- 來源分類：工具型 → 不加個人吸收段（使用者表示「參考收著、未定」，不加個人角度）
- 重點：仿 Powerlevel10k statusline、13 segment、9 主題、響應式、可匯入 p10k；亮點 pattern「AI installer」訪談式安裝；作者動機=盯 Claude Code 比終端機久想讓它好看
- 信心：功能強（README 一手）／動機中（Threads 親述單一視角）
- 反向連結：[[Claude Code]] 狀態列自訂處補指向 coralline
- 影響頁面：[[src-coralline-statusline-2026-06]], [[Claude Code]], index.md

## [2026-06-26] ingest | 行銷快手 Windows — 房仲/車仲 FB 自動群發工具（YouTube）
- 來源：https://www.youtube.com/watch?v=8lGMBYYdWHI （廠商官方操作教學影片）
- 擷取流程（無字幕踩雷紀錄）：YouTube captions 不可用 → fetch-youtube.sh 失敗 → 改 `uv tool install yt-dlp`（brew 本機損壞）抽音訊 → MacWhisper CLI (`/Applications/MacWhisper.app/Contents/MacOS/mw transcribe`) 本機轉錄
  - 模型選擇踩雷：Parakeet v3 對中文完全無效（輸出亂碼羅馬拼音）→ 改 whisperkit:openai_whisper-large-v2 成功；對照既有 [[comparison-stt-models-whisper-paraformer-sensevoice]] 結論
  - `mw` detached（nohup）會空手而回，需用 harness background 機制（保留 launchd session 環境）
- 建立來源頁：[[src-marketing-quick-hand-fb-autopost-2026-06]]
- 來源分類：工具/產品操作教學型 → **不加個人吸收段**（per CLAUDE.md 分類表）
- 匯入動機（使用者明示）：手法研究 + 廠商來問「能否自製同類產品」，評估可行性
- 頁面取向（使用者選擇）：競品/手法研究 + **風險警示並列標註**
  - 反偵測手法拆解：60 秒節流／刪「紫色圖片」規避重複上架偵測／信任此裝置持久 session
  - 風險警示（廠商教學未提，賣方敘事偏誤）：違反 FB ToS、封號、帳密交付第三方、spam 商譽、法遵
- 可行性評估：頁內留結論錨點，完整評估於對話回覆（依使用者慣例「問可行性只給說明不直接執行」）
- 交叉引用：[[BrowseForge]]／[[OpenCLI]]／[[Playwright]]「自動化操作瀏覽器」家族，定位為最靠近合規紅線的灰產應用
- 影響頁面：[[src-marketing-quick-hand-fb-autopost-2026-06]], index.md

## [2026-06-29] ingest | AI 協作真正省的是「決策次數」（酒Ann 實戰分享文）
- 來源：inbox 投遞純文字（`raw/未命名-20260629-110502.md`，社群長貼文，無原始 URL）
- 來源分類：**論點型** → 加個人吸收段（per CLAUDE.md 分類表）
- 核心論點：AI 協作省的不是寫程式時間而是**決策腦力**（一天 80–120 次小決策慢慢耗乾）；三種成本（重工/上下文/決策）；核心機制「即時決策→預先規則」
- 萃取方法論：決策三層（自動/回報/確認）、任務設計>prompt（六要素 + 主動寫 Non-scope）、流程才是真正產出、把 AI 分產品型/工程型角色、換 session+交接摘要、踩坑變 SOP、想法進 Roadmap；附完整 15 條 ChatGPT 協作 Instructions 範本
- 建立來源頁：[[src-jiuann-ai-codev-decision-fatigue-2026-06]]
- 建立概念頁：[[決策疲勞]]（AI 協作效率人因衡量框架，補 wiki gap——大量 agent 工作流頁缺「為什麼這樣設計」的認知負荷角度）
- 更新既有頁（雙向連結）：[[Context-Rot]]（人因側鏡像）、[[Ratchet-Pattern]]（每條 ratchet 削減未來決策次數）
- 信心：**中**——方法論強（與 4 個既有概念頁獨立呼應）、成果宣稱弱（n=1 自述，202 模塊/20 小時/可商用無第三方驗證，帶自我敘事色彩），分別評估
- 影響頁面：[[src-jiuann-ai-codev-decision-fatigue-2026-06]], [[決策疲勞]], [[Context-Rot]], [[Ratchet-Pattern]], index.md

## [2026-06-29] reflect | 個人吸收第 10 次 — 新發現「反直覺稀釋」錯位
- 對應來源：[[src-jiuann-ai-codev-decision-fatigue-2026-06]]
- Quiz：使用者答「小決策很消耗腦力 + 明確定義現在要做什麼會比較快」/「改自己的 Claude + 調整跟 Claude Code 協作習慣」
- 觀察（錯位 A，**新類型**）：主論點對位強（小決策耗腦＝全文骨幹），但使用者把第二點記成「定義**要做什麼**」——文章反覆強調的反直覺核心是定義「**不做什麼（Non-scope）**」。recall 把反直覺鋒利版（負空間）平滑成直覺鈍化版（正空間）
- **新類型**：對位 taxonomy 第 6 大類候選「**反直覺稀釋**」（記得主張方向、把反直覺版記成直覺版）；與前 9 次不同——前面都是 intent/application/受眾的「對位」問題，這次是同一主張在記憶中的**保真度**問題；樣本僅 1 次未固化
- 觀察（錯位 B，既有大類變體）：使用者場合「單軌 Claude Code」套用作者「ChatGPT+Claude Code 雙軌」方法——「分角色降決策」這塊會打折；歸「場合>工具」大類「單軌套多軌方法」變體
- 新 heuristic：「你記得的版本是不是這篇最反直覺的那個？還是記成了大家本來就會做的版本？」
- 領域觀察：方法論/工作流類來源天然高頻觸發「反直覺稀釋」——價值幾乎都在反直覺的 20%，記憶最易磨回直覺的 80%
- 重組路徑（針對使用者真實場合「改自己的 Claude」）：① 把決策三層寫進 CLAUDE.md ② 每任務先寫 Non-scope 再寫 Scope（矯正錯位 A）③ 養成換 session+交接摘要
- Spaced retrieval 約定：~2026-07-13（14 天後）
- 對應 [[Ratchet-Pattern]]

## [2026-06-29] ingest | ihower《Harness + Loop Engineering》系列（GAIConf 2026，9 篇 blog）
- 來源：https://ihower.tw/blog/13721-harness-engineering （電子報導覽頁）+ 9 篇 blog 子系列（blog.aihao.tw）
- 擷取流程：導覽頁 fetch-url.sh 成功但只有演講介紹 + 9 篇索引（無深度內容）→ 使用者選「完整抓 9 篇」→ 循序 fetch 9 篇子文章 + 投影片
  - 投影片 ihower.tw/presentation/harness.html 為 reveal.js 動態渲染，markdown API 抓不到內容（空殼）→ 刪除空檔
  - 9 篇正文含大量 WordPress boilerplate → 派 9 個並行 subagent 各萃取一篇（跳過 boilerplate），主 agent 綜合
- 來源分類：技術論述/框架型 → 加個人吸收段；信心**強**（9 篇互撐 + 原始碼級證據 + 學界引用）
- 核心框架：定位「自建 agent 開發者」視角；原創「由內而外四個回饋時機點」（①工具回傳值 ②mid-run 注入 ③單輪結束 Goal/Outcome 驗收 ④外層 Loop）+ Deep Agent 六項能力 + Prompt→Context→Harness 三層 + Thoughtworks 前饋/回饋×運算/推論 2×2 + 裁判獨立性 vs 資訊量 trade-off + 自我改進 Harness（Stanford Meta-Harness）+ Model-Harness-Fit（harness 會過期）+ 框架選型
- 建立來源頁：[[src-ihower-harness-loop-engineering-2026-06]]（9 篇精華，整 wiki 最完整 Harness Engineering 單一來源）
- 建立實體頁：[[ihower]]（前此 wiki 未提及；作者 + 多頁對照表將引用，非孤立）
- 更新既有概念頁：
  - [[Harness-Engineering]]：新增「四個回饋時機點」section（時間軸切角，正交於既有元件清單）+ 跨工程文化對照表加「台灣社群/開發者視角」列 + frontmatter source
  - [[Meta-Harness]]：新增「自動化 Meta-Harness：Stanford 論文」section（篇7 自我改進 + regression gate）
  - [[Ratchet-Pattern]]：補「反方向棘輪」具體佐證（Model-Harness-Fit / scaffolding trap / The Harness Tax，篇8）
- 跨來源連結：與同日 [[src-jiuann-ai-codev-decision-fatigue-2026-06|酒Ann]] 互補（使用者降決策 vs 開發者設計回饋）；[[決策疲勞]]
- 影響頁面：[[src-ihower-harness-loop-engineering-2026-06]], [[ihower]], [[Harness-Engineering]], [[Meta-Harness]], [[Ratchet-Pattern]], index.md

## [2026-06-29] reflect | 個人吸收第 11 次 — 罕見正向對位 + 新「抽象層級/讀者層級錯位」變體
- 對應來源：[[src-ihower-harness-loop-engineering-2026-06]]
- Quiz：使用者答「請他寫測試 / 另一個 agent（codex）review / 人工審核」/「擴充認知背景 + 改善跟現成 coding agent 協作」
- **正向對位（11 次來少見）**：Q1 三種驗證手段正好落在系列篇5 主軸「裁判獨立性光譜」三個點（測試=運算式自動驗證 / codex review=獨立 agent 裁判 / 人工=human-in-the-loop）——使用者既有實踐自發覆蓋來源核心論點，非記錯。記錄「吸收不總是抓錯位，也要肯定對位，避免為找錯位而強加」
- **錯位（既有「場合>工具」大類新變體）**：Q2「改善跟現成 coding agent 協作」場合 vs 來源明確定位「自建 agent 開發者」視角——對「擴充認知」全對位，對「改善協作」只有上層概念可遷移，篇4/7/9 大量實作（API 注入/eval gate/框架選型）對「使用者」身份用不到。命名「**抽象層級/讀者層級錯位**」（來源預設讀者層級≠使用者身份→可操作粒度不匹配）；與第 9 次「受眾錯位」不同（那是同主張對不同受眾處方相反）；樣本 1 次未升大類
- 新 heuristic：「這篇是寫給『做這個東西的人』還是『用這個東西的人』？你是哪一種？」
- 重組路徑（針對使用者場合）：把 9 篇拆「使用者能用」（四時機點心智地圖、形式化 /goal、驗證強度可調、harness 會過期該回頭刪 CLAUDE.md 多餘規則）vs「開發者才用」（API 注入/eval/框架選型）
- Spaced retrieval 約定：~2026-07-13（14 天後）
- 對應 [[Ratchet-Pattern]]
