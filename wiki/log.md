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
- 建立實體頁：[[胖哥攝影工作室]], [[OKX]], [[Cloudflare]]
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
- 補充 confidence 欄位：[[胖哥攝影工作室]], [[OKX]], [[Cloudflare]]
- 新建實體頁：[[OpenClaw]]
- 補充交叉引用：[[src-taiwan-stock-2026-03-09]], [[src-mega-bloks-pikachu]], [[胖哥攝影工作室]], [[src-openclaw-wordpress-rag]]
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
  - C2：[[胖哥攝影工作室]] 連 [[WordPress-接手檢查SOP]]；[[src-openclaw-wordpress-rag]] 連 [[WordPress-接手檢查SOP]] 與 [[WP-CLI]]；並補齊反向連結
- **D 類改善（新建頁面）**：
  - D1.1：新建綜整頁 [[WordPress-接案工作筆記]]（整合 [[src-photography-studio-proposal]]、[[WordPress-接手檢查SOP]]、[[src-openclaw-wordpress-rag]]）
  - D1.2：新建比較頁 [[加密貨幣收益工具比較]]（活期賺幣 / 網格 / [[雙幣贏]] / Deribit 自賣）
  - D1.3：新建來源頁 [[src-recommended-claude-code-skills]]（原先整合於 [[Agent-Skills]]，改為獨立 author=Jackie Yeh 來源頁）
- 影響頁面：index.md, [[diagnostic-customer-answers]], [[Managed-Agents]], [[src-dual-currency-truth]], [[src-harness-engineering-openai]], [[DESIGN-md]], [[Agent-Skills]], [[src-customer-diagnostic-50-questions]], [[胖哥攝影工作室]], [[src-openclaw-wordpress-rag]], [[WordPress-接手檢查SOP]], [[WP-CLI]], [[src-photography-studio-proposal]], [[src-wordpress-handover-sop]], [[雙幣贏]], [[src-recommended-claude-code-skills]], [[WordPress-接案工作筆記]], [[加密貨幣收益工具比較]]
