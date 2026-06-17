---
title: 索引
---

# 索引

> 本索引由 LLM 自動維護。每次匯入或更新時同步更新。

## 最近新增

### 2026-06-18

| 頁面 | 摘要 |
|------|------|
| [[comparison-stt-models-whisper-paraformer-sensevoice]] | **新比較頁**：Whisper vs Paraformer vs SenseVoice 本機中文 STT 比較。釐清 FunASR=工具箱、後兩者=模型；AISHELL-1 CER 顯示 Whisper(5.14%) 中文明顯落後 Paraformer(1.68%)/SenseVoice(2.96%)；關鍵：兩模型無原生 MLX，Mac 本機需走 sherpa-onnx(CPU)；繁體靠 opencc 非差異點；press-to-talk 情境偏好 SenseVoice。起點 [[src-voice-typing-mac-github-2026-06]]|

### 2026-06-17

| 頁面 | 摘要 |
|------|------|
| [[src-voice-typing-mac-github-2026-06]] | **新來源（工具型）**：penny1985/voice-typing-mac — 完全本機運行的 macOS 語音轉文字小工具，Whisper（mlx-whisper large-v3-turbo）+ opencc 簡轉繁 + 全形標點 + 規則式修正（`修正規則.txt` 錯＝對）；定位「像 Typeless 但開源免費、隱私自掌」；與 [[src-muki-plaud-workshop-ai-codev-2026-06-04]] 同涉 STT 但情境相反（雲端轉錄 vs 本機 + 後處理修正）|

### 2026-06-13

| 頁面 | 摘要 |
|------|------|
| [[html2pptx]] | **新 entity**：HTML/CSS → 完全可編輯 PPTX 的 SaaS（REST API / Skill / [[MCP]] / CLI 四形態 + localhost bridge 回寫源 HTML）；補「AI 生成 HTML 投影片 → 交付可編輯檔」缺口（vs 本人 Marp 工作流不產 PPTX）；開發者 @taiyo_ai_gakuse 自評「超越 Genspark」——**查證確認為賣方自評自家產品**（信心弱）|
| [[src-x-taiyo-kimura-html2pptx-2026-06]] | 來源推文摘要頁；含利益衝突查證（推文作者＝工具開發者，2026-04 親自發布 html2pptx CLI）——「Source Bias 錯位——賣方敘事型」又一實例；[[Agent-Skills]] 已知 Skills 集合同步補列 |

### 2026-06-10

| 頁面 | 摘要 |
|------|------|
| [[OpenCLI]] | **新 entity**：jackwener 開源（JS/TS, Apache-2.0），把任何網站變成 CLI、並用**你已登入的真實 Chrome**（Browser Bridge 擴充 + 本地 daemon + CDP）操作網頁；三用途（100+ 內建 adapter / `opencli-browser` skill 給 AI agent / 本地工具與 Electron app 的 CLI hub）；輸出 table/json/yaml/csv + sysexits.h exit codes；補進「AI 操作瀏覽器」三角（vs [[BrowseForge]] 反偵測養號、[[Playwright]] 通用底層，OpenCLI 走「已登入單人確定性 adapter」）|
| [[mcp-cli]] | **新 entity**：doggy8088（Will 保哥）維護的 **Rust** fork（fork 自 philschmid 原版、Antigravity 重寫；npm `@willh/mcp-cli`, MIT）；把 [[MCP]] server 的 tools 變成 shell 指令（`info`/`grep`/`call` + jq）；**核心論點＝給 agent 按需載入 schema 省 token**，是 [[MCP]] 頁「Tool Search 按需載入」在 shell 層的實作；lazy-spawn daemon 連線池 + tool filtering；與 OpenCLI 對照「不同 stack 層的能力 CLI 化」|
| [[src-opencli-github-2026-06]] / [[src-mcp-cli-doggy8088-2026-06]] | 兩個來源 README 摘要頁；[[MCP]] 頁同步新增 mcp-cli 為 CLI 形態 client + Tool Search 落地補述 |

### 2026-06-09

| 頁面 | 摘要 |
|------|------|
| [[src-doctor-lai-3c-eye-myths-myopia-2026\|五大傷眼迷思 — Doctor.賴 拆解 3C 傷眼真相與兒童近視關鍵]] | **本知識庫第一個健康／醫療領域來源**；YouTube ~18 分（放射腫瘤科醫師跨界，以「**劑量決定毒性**」母框架破 5 大護眼迷思）；核心結論：抗藍光眼鏡=智商稅 / 距離(<30cm)才是近視殺手 / PWM 調光是螢幕偏頭痛元兇 / 藍光真正危險是毀睡眠(ipRGC melanopsin) / 30-10-120 + 戶外多巴胺存摺；含個人吸收段（**第 9 次：新發現「受眾／適用對象錯位」第 5 大類候選**——使用者把「對小孩有效的距離/戶外」記成「要對自己成人落實」，漏掉對成人真正高槓桿的眨眼/選螢幕/睡前三項）；信心中（非眼科專科 + 商業導流，框架強但細節需查證）|

### 2026-06-05

| 頁面 | 摘要 |
|------|------|
| [[src-muki-plaud-workshop-ai-codev-2026-06-04\|MUKI 06-04 工作坊 — AI 協同開發與系統架構轉型]] | Plaud 錄音（58:50）；MUKI（張惠玲，muki.tw 部落格自 2008）分享自建 Hi Day 筆記軟體 + 5 大主題（Hi Day / CICD / 風險治理 / 共同語言 / 角色變革）+ 26 作業任務；主軸**聚焦 [[LLM-Wiki]] vs Hi Day 兩個實作對話組**；含 Plaud STT 錯誤校正表（Cloud Code → Claude Code 等）+ 個人吸收段（**第 8 次：新發現「Intent 廣 / Application 窄錯位」候選變體**）|

### 2026-06-03

| 頁面 | 摘要 |
|------|------|
| [[src-anthropic-dynamic-workflows-claude-code-2026-06-02\|A harness for every task — Dynamic Workflows in Claude Code（Anthropic 2026-06-02）]] | Anthropic 官方 blog（[[Thariq-Shihipar]] + Sid Bidasaria）；**三大 agent 失敗模式**首次並列命名（Agentic laziness / Self-preferential bias / Goal drift）+ **6 種 dynamic workflow 設計模式**（Classify-and-Act / Fan-out-and-Synthesize / Adversarial Verification / Generate-and-Filter / Tournament / Loop Until Done）+ 10 類使用案例 + 何時不用清單；含個人吸收段（**第 7 次：新發現「矩陣未對位錯位」**——當 intent / application 都全選 N×M 矩陣時，使用者誤以為「全方位有用」但實際只用對角線 cell）|
| [[Harness-Engineering]]（更新）| 新增「Dynamic Harness Construction（Anthropic 2026-06-02）」段 + 概念層次關係加入 dynamic harness construction 層 + 跨工程文化對照表加入 Anthropic Dynamic Workflows 視角 |
| [[Thariq-Shihipar]]（更新）| 補入第 3 個來源（Anthropic 官方 blog 首次具名）；論述軸從 context window 管理延伸到 dynamic harness construction；地圖更新 |

### 2026-06-02

| 頁面 | 摘要 |
|------|------|
| [[src-google-ai-search-optimization-guide-2026-05\|Google 搜尋生成式 AI 功能最佳化指南（2026-05-21 更新版）]] | Google 官方明確反對 5 件事（llms.txt / 分塊內容 / 為 AI 重寫 / 找不實提及 / 過度依賴 schema）+ 把 GEO/AEO 定論為 SEO 子集；與既有 [[GEO]] / [[src-welly-seo-2026-04]] 形成**對話組**；含個人吸收段（**第 6 次：Source bias 錯位細分為 2 亞型 — 賣方敘事型 + 平台守門人型**，後者是新發現）|
| [[GEO]]（更新）| 新增「Google 官方反論（2026-05-21）」段並列保存兩派立場；含立場對撞表 + 雙方如何同時為真 + audience 選用建議 + 立場演化時間軸；不刪原有 Welly / Cloudflare 立場（per CLAUDE.md「並列呈現，不擅自取捨」）|
| [[llms-txt]] | **新 concept**：三方立場交鋒焦點獨立成頁；含 Jeremy Howard 規範細節 + 採用率追蹤（**[[Anthropic]] / Stripe 已實際部署、OpenAI 未部署**的實測快照）+ Welly 推薦派 / Google 反對派 / Anthropic 行動派三方對撞表 + 「行動 > 表態」判讀 heuristic + 自家 wiki 是否做 llms.txt 的決策框架 |

### 2026-06-01

| 頁面 | 摘要 |
|------|------|
| [[src-nvidia-gtc-taipei-2026-jensen-keynote\|NVIDIA GTC Taipei 2026 黃仁勳主題演講]] | 2 小時 keynote / 2318 段 transcript；5 條主軸 — Agentic AI / CUDA 護城河 / Vera Rubin 路線圖 / Action Model / Taiwan ecosystem partner；含個人吸收段（**第 5 種錯位類型：Source Bias 錯位**，廠商敘事 vs 中立投資分析）|
| [[TSMC]] | **新 entity**：第 2 次出現觸發；含曹興誠 RCA 爭議視角 + NVIDIA AI 供應鏈核心定位 |

### 2026-05-29

| 頁面 | 摘要 |
|------|------|
| [[src-yangsheep-wp-ai-meetup-2026-spring\|WP AI 小聚 — 歐陽嘉隆 / 羊羊數位 AI 設計網頁工作流]] | 2026 春季 WP AI 小聚 12 張投影片；接案者實戰 toolchain（5 套工具 + 標準提示詞 + GreenLight WP 整合 + Claude Design vs 本地 + Codex 選型）；含個人吸收段（**第 3 次：方向對 + 尺度錯位**，單點 vs 整體 benchmark）|
| [[src-shopline-payments-wp-meetup-2026-spring\|支付決勝 — Winston Wen / SHOPLINE Payments]] | 同場 WP 小聚姊妹簡報（贊助商 BD）；6 張投影片；3 結帳殺手 framework + 現代支付 4 要素 + 4 成靠分期數據；含個人吸收段（**第 4 次：方向對 + 階段窄化錯位**，結帳階段 vs 整體轉換）|
| [[SHOPLINE-Payments]] | **新 entity**：第 2 次出現觸發；支付方式 + 接案決策參考 + 競品 placeholder + 數據可信度評估 |

### 2026-05-28

| 頁面 | 摘要 |
|------|------|
| [[src-tsao-hsing-cheng-tsmc-rca-history-2026-05\|曹興誠回應川普「台灣偷半導體」]] | 1976 RCA 350 萬美元當事人視角；對外駁川普 + 對內補刀台積電歷史恩怨；wiki 第 1 個半導體 / 台美地緣主題；**首次加入「個人吸收」段**（記錄使用者答 quiz 結果 + LLM 觀察的論點/應用場合錯位）|
| [[src-leikairos-tri-platform-migration-dual-ai-ritual-2026-05\|雷小蒙週報 — 三棲遷移 + 雙 AI 對辯儀式]] | 雷蒙 AI 分身視角的 18 天工作復盤；核心論點群：不被任何 AI 公司綁死 / 描述清楚=真資產 / Pro-kit08 雙棲清單 / 雙 AI 對辯儀式 / 工具的資產化；含「個人吸收」段（記錄方向對位但層級錯位的觀察）|

### 2026-05-26

inbox-pull 拉進 5 個檔案 → 批次 ingest，產出 7 個新頁 + 4 個更新頁。

#### Wave A：vibe coding × HermesOS 生態釐清

| 頁面 | 摘要 |
|------|------|
| [[src-gask-ai-agent-vs-vibe-coding\|Gask Huang-Kai — 為什麼我不推 vibe coding]] | FB 論述貼文：5-50 人台灣 SMB 不該走 vibe coding，應改 [[Agent-Skills]] 架構放進通訊軟體；7 論點 + 觀點限制 |
| [[src-hermesos-cloud-landing\|HermesOS 官方落地頁]] | hermesos.cloud 首頁全文 + 三階定價 + 商業承接 OpenClaw 的官方證據（「OpenClaw forgets. Hermes compounds.」）|
| [[HermesOS]] | **新 entity**：建立在 [[Hermes-Agent]]（Nous Research 開源）之上的 managed cloud 商品；釐清「框架／託管／競品」三層差異 |
| [[Gas-Khuang]]（更新） | 補真實全名 **Gask Huang-Kai** + FB handle + 中文圈 [[HermesOS]] 推廣者身分；信心弱→中 |
| [[OpenClaw]]（更新） | 補中文別名 **「龍蝦 AI」** + 遷移趨勢段重寫為「商業承接 + 社群遷移 + 並存推薦」三層 |
| [[Hermes-Agent]]（更新） | 補商業包裝層 [[HermesOS]] 段 + 三層層次差異釐清開篇 |
| [[Vibe-Coding]]（更新） | 補「中小企業視角：根本替代而非補強」段（與 DESIGN.md / Harness Engineering 補強路徑並列對照）|

#### Wave B：其他 4 個 inbox 來源

| 頁面 | 摘要 |
|------|------|
| [[src-taiwan-made-brands\|全台灣製造品牌推薦清單]] | FB 貼文整理，11 品類 30 品牌索引表（嚴格標準「台灣監製、產地中國的不算」）|
| [[src-cal-diy-github\|calcom/cal.diy GitHub repo]] | Cal.com 的 100% MIT 開源社群版（移除所有 EE features，僅 self-host）；與 [[HermesOS]] 形成「商業 ↔ 開源」反向案例對位 |
| [[src-akiraxclaw-github-trending-2026-05-20\|AKIRAXCLAW GitHub 精選 2026-05-20]] | **fetch 失敗**（Next.js SPA）→ deferred；URL + 推測範圍 + 後續手動投遞指引 |
| [[src-mbp-failure-hardware-pivot\|MBP 故障與個人開發硬體採購策略轉向]] | MBP 三年保固剛過就掛 → 改採「MBA M5 + Framework Desktop 128g + SSH remote」模型；對應「fungible client / persistent server」設計哲學 |

### 2026-05-20（lint 補建）

| 頁面 | 摘要 |
|------|------|
| [[Anthropic]] | 廠商 entity 補建（195+ 次提及無獨立頁）；含 Claude 3+1 個 surfaces 完整地圖、核心員工、跨廠商共識中的位置 |
| [[OpenAI]] | 對標廠商 entity 補建；與 Anthropic 的對標關係表（surface / 規範檔 / 工程論述等 8 維對比） |
| [[Mnimiy]] | 社群實驗者 entity 補建；CLAUDE.md 8 條擴充作者 + Ratchet 第 3 個獨立來源 + 30 codebase 盲測量化實證 |
| [[comparison-ai-native-vs-lean-startup\|AI-Native vs Lean Startup 比較頁]] | 4 階段 vs 6 階段對映 + 反模式對照 + Anthropic 為何重新框架 4 大原因 |

### 2026-05-20

| 頁面 | 摘要 |
|------|------|
| [[src-anthropic-founders-playbook-2026\|Anthropic Founder's Playbook（2026-05 官方）]] | 36 頁 PDF / 7 章；AI-Native 創業 4 階段框架 + Claude 3 surfaces 分工 + 4 個 AI 時代反模式 + 9-10 家 customer cases |
| [[Claude-Cowork]] | Anthropic Claude 3 product surfaces 之一（folder access + connectors + skills + scheduled runs）；Airtree 「運營核心」實戰 |
| [[AI-Native-Startup]] | 「10-person unicorn」官方範式；4 階段 + exit criteria 框架；4 個反模式（Agentic technical debt / Zero-friction scope creep / False PMF / Loss of Objectivity） |
| [[src-zeuikli-claude-code-best-practices\|Claude Code 最佳實踐完整研究報告（zeuikli）]] | 1254 行 / 10 章整合報告；Anthropic 81 篇來源 + Boris Cherny / Thariq Shihipar 核心引言；含 PGE 原則、Cache as Uptime |
| [[PGE-Principle]] | Generator ≠ Evaluator——多個既有反模式對策的上位原則 |
| [[Context-Engineering]] | 「真正的工程護城河」；Harness 第一支柱的細部展開 + 分層快取結構 |
| [[Boris-Cherny]] | Anthropic Claude Code 核心；完成驗證心法 + Routines 實戰 |
| [[Thariq-Shihipar]] | Anthropic Claude Code 核心；Cache as Uptime + Context 工程；[[src-claude-code-context-management]] 原作者 |

### 2026-05-19

| 頁面 | 摘要 |
|------|------|
| [[src-claude-code-in-large-codebases\|Claude Code in Large Codebases — Anthropic 官方 best practices]] | Anthropic 官方版 Harness 7 個 extension points + agentic search vs RAG embedding 官方定位 + 3-6 月 review 維護週期 |
| [[Plugins-Claude-Code]] | Bundle skills/hooks/MCP 成可安裝套件，managed marketplaces 分發 |
| [[LSP-Integrations]] | 透過 Language Server Protocol 給 Claude symbol-level precision |
| [[src-bnext-claude-md-12-rules\|CLAUDE.md 12 條規則 — Forrest Chang 4 條 + Mnimiy 8 條擴充]] | Karpathy 3 缺失 → 12 條 production CLAUDE.md 範本；30 codebase 盲測 41% → 11% → 3% 錯誤率 |
| [[src-honglong0420-asgard-x-thread\|Asgard Skills 263 個 agent skills 開源推廣（X 推文）]] | @honglong0420 親述視角 + 四件套思維模型（辯證法 / 九宮格 / 精實創業 / 敘事）+ 「啟動成本是瓶頸」核心論點 |
| [[src-asgard-skills-audit-2026-05-19\|Asgard Skills Repo 本地審計]] | A 結構 / B 安全 / D 抽樣 / E 適用性四向審計；301 個 skill 校正 + 26 個 `tw-ecom-*` skeleton 警示 + Iron Law 100% 驗證 |
| [[synthesis-asgard-install-for-my-topics]] | 從 301 個挑出 ~50 個與接案 / 投資 / 思維三主題強相關的 install 候選清單 |

### 2026-05-18

| 頁面 | 摘要 |
|------|------|
| [[src-cloudflare-ai-code-review\|Cloudflare 大規模協同運作 AI 程式碼審查]] | OpenCode + 7 subagent + 斷路器 + Risk Tier；130K 次審查 / $0.98 中位數 / 1200 億 tokens production 數據 |
| [[OpenCode]] | 開源伺服器優先 agentic CLI；Cloudflare 提交 45+ PR；本知識庫 agentic CLI 地圖缺角 |
| [[AGENTS-md\|AGENTS.md]] | 與 CLAUDE.md 平行對照的規範檔；Cloudflare 設專門審查者監控更新時機 |

### 2026-05-15（下午追加）

| 頁面 | 摘要 |
|------|------|
| [[src-codex-hyperframes-prompt-pack\|Codex × HyperFrames 30 秒 Demo Prompt Pack]] | 公開課程課後資料：用 OpenAI Codex CLI + HyperFrames 製作 30 秒短影片的 7-prompt 鏈 + 12 Visual Beats + Fix Prompts |
| [[HyperFrames]] | Code-first 短影片框架（HTML+CSS+GSAP timeline → MP4）；本知識庫第一個影片生成工具 |
| [[OpenAI-Codex-CLI]] | OpenAI 推出的 agentic CLI，[[Claude Code]] 對照產品；含 `codex adversarial-review` |
| [[Prompt-Pack-Pattern]] | 多段 prompt 串成完整工作流的設計模式；與 Agent Skills 形成「人類控制節奏 vs Agent 自動觸發」對照 |

### 2026-05-15

| 頁面 | 摘要 |
|------|------|
| [[Subagent-Driven-Development]] | Fresh subagent per task + spec reviewer + code quality reviewer 兩階段獨立審查 |
| [[Adversarial-Code-Review]] | 對抗式 AI review，抓跨檔組合 bug；Codex `--scope branch --base <初始 commit>` 審全 codebase |
| [[Hybrid-XSS-Defense]] | escape at substitution 薄層 + sanitize at storage 厚層；`{{var}}` placeholder 用 uniqid token 防 collision |
| [[Fields-Without-Enforcement-Anti-Pattern]] | Schema 有欄位、邏輯不檢查的反模式（含 silent backdoor 變體與時序狀態變體） |
| [[Verify-Framework-Version-First]] | 新專案第一件事驗 lockfile 版本；AI 把框架 vN 帶到 vN+1 codebase 的踩雷對策 |

### 2026-05-14

| 頁面 | 摘要 |
|------|------|
| [[src-aapd-claude-design-figma-workflow\|AAPD 直播筆記 — Claude Design × Claude Code × Figma]] | [[Simon-Lin\|Simon]] 第一手 Demo：Hand off 機制、Figma MCP 雙向操作、設計師價值轉向判斷力 |
| [[Simon-Lin]] | Product Designer，台灣→東京→雪梨，AI 設計工作流實作者 |
| [[AAPD]] | 繁中產品設計教育平台，Simon 直播發表的場域 |
| [[src-hermes-agent-99-cases\|Hermes Agent 99 個成功案例]] | [[Gas-Khuang]] 整理，跨 13 個分類 |
| [[Hermes-Agent]] | Nous Research 開源 agent 框架，自我改進 + 跨平台訊息（13 平台） |
| [[Gas-Khuang]] | 99 案例網站整理者 |
| [[Self-Improving-Agent]] | 自我改進代理範式：MEMORY.md + Skill Factory + 偏好學習 |
| [[src-addy-osmani-harness-engineering\|Addy Osmani Harness Engineering（FB 中文整理）]] | Google Cloud AI 總監視角的 Harness 七元件 + Ratchet + Context Rot + HaaS 趨勢 |
| [[Addy-Osmani]] | Google Cloud AI 總監，Harness 七元件分解 |
| [[Ratchet-Pattern]] | 每次錯誤編碼成永久規則的設計模式（含克制原則） |
| [[src-akiraxclaw-app-flow-trick\|App Flow HTML + JSON 雙輸出技巧]] | Dave Jeffery 推文整理：給人看的 HTML + 給 AI 看的 JSON，作為系統「記憶外掛」 |
| [[MEMORY-md\|MEMORY.md]] | AI Agent 跨 session 持久記憶層；與 CLAUDE.md 形成「AI 寫 vs 人類寫」對 |
| [[Context-Rot]] | 上下文衰損；compaction / offloading / progressive disclosure 三招對抗 |

### 2026-05-11（下午追加）

| 頁面 | 摘要 |
|------|------|
| [[src-welly-seo-2026-04\|Welly SEO 月報 2026-04]] | Google 核心演算法更新 + Cloudflare Agent-Ready 工具 + Google AI Mode 進 Chrome |
| [[GEO]] | Generative Engine Optimization / Agent-Ready 網站——SEO 延伸到「被 AI 理解引用」|

### 2026-05-11

| 頁面 | 摘要 |
|------|------|
| [[src-ai-explained-tutorial\|ai-explained — Learn AI Layer by Layer]] | Rob Ennals 的互動式 AI 教學網站，21+ 章從 first principles 講 AI |
| [[src-browseforge\|nczz/BrowseForge — 多指紋反偵測瀏覽器]] | 雙引擎 + 每 Profile 獨立指紋/Cookie/Proxy + 內建 MCP server |
| [[BrowseForge]] | AI agent 操作瀏覽器的代表工具，內建 12 個 MCP tools |
| [[Playwright]] | Microsoft 跨瀏覽器自動化框架,多個工具的底層引擎 |

### 2026-05-10

| 頁面 | 摘要 |
|------|------|
| [[src-papaya-gemma-lm-studio\|PAPAYA — Gemma 4 + LM Studio 本地 AI 工作站]] | 本知識庫第一個本地 AI 主題，開啟「雲端 vs 本地」對立軸 |
| [[Gemma]] | Google open-weight LLM（Gemma 4 四個版本：E2B/E4B/26B/31B）|
| [[LM-Studio]] | 跨平台 GUI 本地 LLM runtime，與 Ollama（CLI）對照 |
| [[MCP]] | Anthropic 推出的開放協議，AI 連外部工具的「USB」 |
| [[PAPAYA-電腦教室]] | 中文 AI 教學者地圖中的入門層（白話、零技術假設）|

### 2026-05-09 (lint 補建)

| 頁面 | 摘要 |
|------|------|
| [[Claude Code]] | Anthropic 2025 推出的 agentic CLI，本知識庫核心 agent（補建：原 9 處引用無獨立頁）|
| [[Quartz]] | jackyzha0 的 digital garden SSG，本知識庫的發布層（補建：原 2 處引用無獨立頁）|
| [[Specification-by-Example]] | 用具體範例凍結需求，[[AI-Quality-Collusion]] 結構性對策之一 |

### 2026-05-09

| 頁面 | 摘要 |
|------|------|
| [[src-spt-ai-quality-collusion\|AI 品質共謀（SPT Wiki）]] | 來自他人 LLM Wiki 的 AI 反模式概念頁 |
| [[AI-Quality-Collusion]] | AI 同時生成 code 與 test 的隱形共謀，CI 綠燈卻測不到真實需求 |
| [[src-techhanlin-claude-code-8-settings\|科技翰林院 — Claude Code 8 個實戰設定]] | cmux / CLAUDE.md / Skills / Memory + Handoff / Token 管理 |
| [[CLAUDE-md\|CLAUDE.md]] | Claude Code 持久記憶層，兼任 LLM Wiki schema 規範 |
| [[src-piccalilli-end-of-responsive-images\|The end of responsive images — Piccalilli]] | `sizes="auto"` + `loading="lazy"` 終結手寫 sizes 的痛苦 |
| [[src-transitions-dev\|Transitions.dev]] | Jakub Antalik 的 web app 轉場效果集，可直接複製貼上 |
| [[src-az9713-managed-agents-tutorial\|az9713/claude-managed-agents]] | Managed Agents 30 行 hello world + 5 part 社群教學（補建獨立 src） |
| [[src-the-ai-corner-managed-agents-guide\|The AI Corner Managed Agents Guide]] | Managed Agents 商業視角，Notion/Rakuten/Asana 等部署案例（補建獨立 src） |

### 2026-05-08

| 頁面 | 摘要 |
|------|------|
| [[src-techhanlin-llm-wiki-tutorial\|Claude + Obsidian 打造 AI 第二大腦 — 科技翰林院 LLM Wiki 教學]] | Karpathy LLM Wiki 範式的中文圈代表性介紹文，2026-04-14 發表 |
| [[LLM-Wiki]] | Karpathy 2026-04 提出的個人知識管理範式，本知識庫的方法論基礎 |
| [[Memex]] | Vannevar Bush 1945 提出的私人知識庫概念，LLM Wiki 的歷史先驅 |
| [[Andrej-Karpathy]] | 前 Tesla AI 總監、OpenAI 共同創辦成員，LLM Wiki 概念提出者 |
| [[科技翰林院]] | 中文圈 AI 工具實戰部落格，主筆 AI 導演林思翰 Hans |
| [[Obsidian]] | Local-first markdown 筆記工具，LLM Wiki 工作流的最佳載體 |

### 2026-04-28

| 頁面 | 摘要 |
|------|------|
| [[src-will-ai-kill-saas-design\|Will AI Kill SaaS（5）— Adobe/Figma 之死？]] | Yu-Chih Edward Hwang Facebook 系列文，4 種開發模式光譜 + Figma/Adobe 護城河變遷 |
| [[Vibe-Coding]] | 自然語言直接驅動 LLM 生成程式碼的開發範式 |
| [[Agentic-AI-Workflow]] | 同心圓迭代範式，含 Design to Code / Code to Design 雙向流動 |
| [[Figma]] | 介面設計工具，作者觀察上市 120 → 不到 20 |
| [[Adobe]] | 設計軟體龍頭，受教育綁定鬆動威脅 |
| [[Claude-Design]] | Anthropic 2026 推出，繞過設計稿直接產出 React 元件 |
| [[Yu-Chih-Edward-Hwang]] | 「Will AI Kill SaaS」系列作者（fatality1117） |

### 2026-04-24

| 頁面 | 摘要 |
|------|------|
| [[presentation-攝影工作室A-網站優化\|攝影工作室A — 網站健檢與優化簡報]] | Marp 簡報，含 SEO + GEO 雙軌體檢與實地數據（client-site.example） |
| [[src-recommended-claude-code-skills\|推薦的 Claude Code Skills 清單]] | 8 個值得安裝的 skills，按 GitHub stars 排序 |
| [[WordPress-接案工作筆記]] | 綜整：接案前（SEO）→ 接手時（檢查 SOP）→ 加值階段（AI / RAG）三階段工作流 |
| [[加密貨幣收益工具比較]] | 比較：活期賺幣 / 現貨網格 / 雙幣贏 / Deribit 自賣選擇權 |

### 2026-04-23

| 頁面 | 摘要 |
|------|------|
| [[src-wordpress-handover-sop\|WordPress 接案交接：如何檢查「前人的遺產」]] | 原創經驗文（Jackie Yeh），六步 SOP + 倫理原則 |
| [[WordPress-接手檢查SOP]] | 六步驟 SOP：核心檔驗證、uploads 掃描、帳密搜尋、路徑殘留、DB 搜尋、外掛盤點 |
| [[WP-CLI]] | WordPress 命令列工具，verify-checksums 與 search-replace 是接手檢查關鍵指令 |

### 2026-04-21

| 頁面 | 摘要 |
|------|------|
| [[src-harness-engineering-openai\|Harness Engineering 入門篇]] | OpenAI 駕馭工程範式，三根支柱與三級實踐框架 |
| [[Harness-Engineering\|Harness Engineering]] | AI 代理環境設計範式：約束 + 上下文 + 熵管理 |
| [[src-dual-currency-truth\|雙幣贏的真相：折價賣波動率]] | 選擇權賣方本質、定價折價 40-60%、行情依賴性 |

### 2026-04-20

| 頁面 | 摘要 |
|------|------|
| [[src-claude-code-notebooklm\|Claude Code × NotebookLM 整合實戰]] | token 外包 + skill 自我優化 |
| [[NotebookLM]] | Google 免費閉合式 RAG 工具，Gemini 模型，可生成圖表/podcast |
| [[notebooklm-py]] | 林探開發的 NotebookLM CLI 工具，提供 Claude Code 整合 |
| [[HC-AI-說人話]] | YouTube 創作者，推廣 Claude Code + 第二大腦工作流 |
| [[src-anthropic-managed-agents-engineering\|Scaling Managed Agents]] | Anthropic 工程部落格，meta-harness 架構設計 |
| [[Managed-Agents\|Claude Managed Agents]] | Anthropic 託管 agent 服務，session/harness/sandbox 三層架構 |
| [[Meta-Harness]] | 為「尚未想出的程式」設計的 agent 架構模式，對介面有意見對實作無意見 |

### 2026-04-16

| 頁面 | 摘要 |
|------|------|
| [[src-design-md-revolution\|DESIGN.md 革命]] | AI Coding Agent 秒生成品牌級 UI，awesome-design-md 專案 |
| [[DESIGN-md\|DESIGN.md]] | 純 Markdown 設計系統規範，讓 AI coding agent 生成風格一致的 UI |
| [[src-claude-code-context-management\|Claude Code 上下文管理攻略]] | 含 rewind/compact/subagent 策略 |
| [[src-customer-diagnostic-50-questions\|50 個顧客自我診斷問題]] | 含 ABC 分級與 CLV 概念 |
| [[顧客終身價值]] | CLV，衡量顧客經營成效的核心指標 |
| [[src-asgard-skills\|Asgard Skills Repository]] | Asgard AI Platform 開源 263 個 AI agent skills |

## 來源摘要

| 頁面 | 摘要 | 來源數 |
|------|------|--------|
| [[src-voice-typing-mac-github-2026-06\|語音輸入 Voice Typing（GitHub）]] | 本機 Whisper 語音轉文字 Mac 小工具；隱私自掌、零 API 成本、台灣繁體 + 全形 + 規則式修正；開源個人實驗作品 | 1 |
| [[src-x-taiyo-kimura-html2pptx-2026-06\|html2pptx 評價推文（X）]] | 開發者自評自家 HTML→PPTX 工具超越 Genspark；含利益衝突查證（賣方敘事型，信心弱） | 1 |
| [[src-opencli-github-2026-06\|OpenCLI README]] | 把任何網站變 CLI + 用已登入 Chrome 跑 browser automation；100+ adapter、Agent Skills、CLI hub | 1 |
| [[src-mcp-cli-doggy8088-2026-06\|mcp-cli README（doggy8088 Rust fork）]] | 與 MCP server 互動的輕量 Rust CLI；按需載入 schema 省 token；fork philschmid 原版 | 1 |
| [[src-btc-dual-currency-2026-03-09\|BTC 雙幣贏操作記錄]] | OKX 上 2,000 USDT 部署 | 1 |
| [[src-taiwan-stock-2026-03-09\|台股大跌換股操作記錄]] | 富邦台50 → 00981A | 1 |
| [[src-mega-bloks-pikachu\|MEGA BLOKS 皮卡丘積木組]] | 願望清單約 3,000 TWD | 1 |
| [[src-plakoro-board-game\|寶可夢骰子對戰桌遊 PLAKORO]] | 2026/07 發售 | 1 |
| [[src-marketing-skills-ai-agents\|Marketing Skills for AI Agents]] | AI Agent 行銷技能集，涵蓋 SEO/CRO/文案等 | 1 |
| [[src-photography-studio-proposal\|攝影工作室A網站優化提案]] | 網站內容優化提案 | 1 |
| [[src-openclaw-wordpress-rag\|OpenClaw × WordPress 輕量 RAG]] | Cloudflare 免費方案實作筆記 | 1 |
| [[src-asgard-skills\|Asgard Skills Repository]] | 開源 301 個 AI agent skills（2026-05-19 審計快照；初版 263 個），涵蓋股票分析、策略、SEO、設計等 | 1 |
| [[src-honglong0420-asgard-x-thread\|Asgard Skills 開源推廣（X 推文）]] | @honglong0420 親述視角 + 四件套思維模型 skill + 「啟動成本是瓶頸」 | 2 |
| [[src-asgard-skills-audit-2026-05-19\|Asgard Skills Repo 本地審計（2026-05-19）]] | A 結構 / B 安全 / D 抽樣 / E 適用性四向審計；補強客觀整理與作者親述兩個既有來源 | 0 |
| [[src-claude-code-in-large-codebases\|Claude Code in Large Codebases — Anthropic 官方]] | 官方 Harness 7 個 extension points + agentic search 定位 + 企業導入 DRI / Agent Manager 模式 | 1 |
| [[src-zeuikli-claude-code-best-practices\|Claude Code 最佳實踐完整研究報告（zeuikli）]] | 1254 行 / 10 章整合報告；Anthropic 81 篇來源 + Boris Cherny / Thariq Shihipar 引言；PGE 原則 + Cache as Uptime | 1 |
| [[src-customer-diagnostic-50-questions\|50 個顧客自我診斷問題]] | 含 ABC 分級與 CLV 概念 | 1 |
| [[src-claude-code-context-management\|Claude Code 上下文管理攻略]] | 含 rewind/compact/subagent 策略 | 1 |
| [[src-design-md-revolution\|DESIGN.md 革命]] | awesome-design-md 專案介紹，AI UI 設計新標準 | 3 |
| [[src-claude-code-notebooklm\|Claude Code × NotebookLM 整合實戰]] | token 外包 + skill 自我優化 | 1 |
| [[src-anthropic-managed-agents-engineering\|Scaling Managed Agents]] | Anthropic 官方工程部落格，meta-harness 架構設計 | 1 |
| [[src-harness-engineering-openai\|Harness Engineering 入門篇]] | OpenAI 駕馭工程，三根支柱與三級實踐框架 | 1 |
| [[src-dual-currency-truth\|雙幣贏的真相：折價賣波動率]] | 選擇權賣方本質、定價折價 40-60% | 1 |
| [[src-wordpress-handover-sop\|WordPress 接案交接：如何檢查「前人的遺產」]] | 原創經驗文，六步 SOP + 倫理原則 | 1 |
| [[src-recommended-claude-code-skills\|推薦的 Claude Code Skills 清單]] | 8 個精選 skills，按 stars 排序（原創推薦） | 1 |
| [[src-will-ai-kill-saas-design\|Will AI Kill SaaS（5）— Adobe/Figma 之死？]] | Yu-Chih Edward Hwang，4 種開發模式 + Figma/Adobe 護城河變遷 | 1 |
| [[src-techhanlin-llm-wiki-tutorial\|Claude + Obsidian 打造 AI 第二大腦 — 科技翰林院]] | Karpathy LLM Wiki 範式的中文圈代表性介紹文 | 1 |
| [[src-spt-ai-quality-collusion\|AI 品質共謀（SPT Wiki）]] | 他人 LLM Wiki 上的 AI 反模式概念頁，元層級觀察 | 2 |
| [[src-techhanlin-claude-code-8-settings\|科技翰林院 — Claude Code 8 個實戰設定]] | cmux、CLAUDE.md、Skills、Memory、Token 管理實戰 | 1 |
| [[src-piccalilli-end-of-responsive-images\|The end of responsive images — Piccalilli]] | Mat Marquis 自白：`sizes="auto"` 終結了手寫 sizes 的時代 | 2 |
| [[src-transitions-dev\|Transitions.dev]] | Jakub Antalik 的 web app 轉場效果集 | 2 |
| [[src-az9713-managed-agents-tutorial\|az9713 Managed Agents Tutorial]] | 社群入門教學 repo，30 行 hello world + 5 part 教學 | 1 |
| [[src-the-ai-corner-managed-agents-guide\|The AI Corner Managed Agents Guide]] | 商業視角，企業部署案例與定價分析（部分付費牆）| 1 |
| [[src-papaya-gemma-lm-studio\|PAPAYA — Gemma 4 + LM Studio]] | 本地 AI 完整工作流（YouTube，繁中字幕）| 1 |
| [[src-ai-explained-tutorial\|ai-explained — Learn AI Layer by Layer]] | Rob Ennals 的互動式 AI 教學網站（21+ 章）| 2 |
| [[src-browseforge\|nczz/BrowseForge]] | 多指紋反偵測瀏覽器 + 內建 MCP server | 2 |
| [[src-welly-seo-2026-04\|Welly SEO 月報 2026-04]] | 演算法更新 + Cloudflare Agent-Ready + Google AI Mode（完整 8 頁 PDF）| 2 |
| [[src-aapd-claude-design-figma-workflow\|AAPD — Claude Design × Claude Code × Figma 工作流]] | Simon 第一手 Demo：Hand off + Figma MCP 雙向操作 | 1 |
| [[src-hermes-agent-99-cases\|Hermes Agent 99 個成功案例]] | Gas Khuang 整理；13 分類 + 跨平台訊息 + 自我改進 + Skill Factory | 1 |
| [[src-addy-osmani-harness-engineering\|Addy Osmani Harness Engineering]] | Google 視角的 Harness 七元件 + Ratchet + Context Rot + HaaS（FB 中文整理）| 1 |
| [[src-akiraxclaw-app-flow-trick\|App Flow HTML+JSON 雙輸出技巧]] | Dave Jeffery 推文整理：給人看的 HTML + 給 AI 看的 JSON 作為記憶外掛 | 2 |
| [[src-codex-hyperframes-prompt-pack\|Codex × HyperFrames 30 秒 Demo Prompt Pack]] | 7-prompt 鏈 + 12 Visual Beats + Fix Prompts + 3 範例專案 | 1 |
| [[src-cloudflare-ai-code-review\|Cloudflare AI Code Review 系統]] | Production-grade case study：OpenCode + 7 subagent + Risk Tier + Circuit Breaker；130K 次 / $0.98 中位數 | 1 |
| [[src-bnext-claude-md-12-rules\|CLAUDE.md 12 條規則]] | Forrest Chang 4 條（GitHub 12 萬星）+ Mnimiy 8 條擴充；30 codebase 盲測 41% → 3% 錯誤率 + 三大 prompt 反模式 | 1 |
| [[src-anthropic-founders-playbook-2026\|Anthropic Founder's Playbook（2026-05 官方）]] | 36 頁 PDF / 7 章；AI-Native 創業 4 階段框架 + Claude 3 surfaces 分工 + 4 個 AI 時代反模式 + 9-10 家 customer cases | 2 |
| [[src-gask-ai-agent-vs-vibe-coding\|為什麼我不推 vibe coding — Gask Huang-Kai]] | 中文圈 SMB 視角 vibe coding 批判 + Agent + Skill 架構替代論 + HermesOS / OpenClaw 推廣；信心中 | 1 |
| [[src-hermesos-cloud-landing\|HermesOS 官方落地頁]] | hermesos.cloud 首頁全文；釐清 Hermes Agent / HermesOS / OpenClaw 三層關係的權威來源；信心強 | 1 |
| [[src-taiwan-made-brands\|全台灣製造品牌推薦清單]] | 11 品類 30 品牌索引；嚴格標準「台灣監製、產地中國的不算」；信心弱 | 1 |
| [[src-cal-diy-github\|calcom/cal.diy]] | Cal.com 100% MIT 開源社群版；無 EE features 僅 self-host；與 [[HermesOS]] 形成商業↔開源反向案例 | 1 |
| [[src-akiraxclaw-github-trending-2026-05-20\|AKIRAXCLAW GitHub 精選 2026-05-20]] | **fetch 失敗 / deferred**（Next.js SPA）；URL 保留待手動投遞 | 1 |
| [[src-mbp-failure-hardware-pivot\|MBP 故障與個人硬體採購轉向]] | 三年保固剛過就掛 → MBA M5 + Framework Desktop 128g + SSH remote 模型 | 1 |
| [[src-tsao-hsing-cheng-tsmc-rca-history-2026-05\|曹興誠回應川普「台灣偷半導體」（今周刊）]] | 1976 RCA 350 萬美元 + 4 億 NT 「國家賭注」；首篇含「個人吸收」段的 src 頁；信心中 | 1 |
| [[src-leikairos-tri-platform-migration-dual-ai-ritual-2026-05\|雷小蒙週報 — 三棲遷移 + 雙 AI 對辯儀式]] | 雷蒙 / Kairos FB 貼文；不被 AI 公司綁死策略 + 描述清楚=真資產 + Pro-kit08 雙棲清單 + 雙 AI 對辯儀式 + 工具資產化 7 條論點；含個人吸收段；信心中 | 1 |
| [[src-yangsheep-wp-ai-meetup-2026-spring\|WP AI 小聚 — 歐陽嘉隆 / 羊羊數位 AI 設計網頁工作流]] | 2026 春季 WordPress AI 小聚 12 張投影片；中文圈接案者實戰 toolchain（5 套工具 + 提示詞範本 + GreenLight WP 區塊整合 + 工具選型決策）；含個人吸收段；信心中 | 1 |
| [[src-shopline-payments-wp-meetup-2026-spring\|支付決勝 — Winston Wen / SHOPLINE Payments]] | 同場 WP 小聚 BD 簡報（6 張投影片）；3 結帳殺手 + 現代支付 4 要素 + 4 成靠分期數據；含個人吸收段；信心中 | 1 |
| [[src-nvidia-gtc-taipei-2026-jensen-keynote\|NVIDIA GTC Taipei 2026 黃仁勳主題演講]] | 2 小時 keynote 完整 transcript + 5 主軸結構化整理（Agentic / CUDA / Vera Rubin / Action Model / Taiwan partner）；含個人吸收段 + 廠商敘事 source bias 警示；信心中 | 1 |
| [[src-google-ai-search-optimization-guide-2026-05\|Google 搜尋生成式 AI 功能最佳化指南（2026-05-21）]] | Google 官方明確反對 5 件事（llms.txt / 分塊 / 為 AI 重寫 / 找不實提及 / 過度依賴 schema）+ GEO/AEO = SEO 的官方定論；與既有 [[GEO]] / Welly 月報直接對撞，並列保存；含個人吸收段（**第 6 次**：Source bias 細分 2 亞型，新增**平台守門人型**）；信心強（含 bias 警示） | 1 |
| [[src-anthropic-dynamic-workflows-claude-code-2026-06-02\|A harness for every task — Dynamic Workflows in Claude Code（Anthropic 2026-06-02）]] | Anthropic 官方 blog（[[Thariq-Shihipar]] + Sid Bidasaria）；三大 agent 失敗模式首次並列命名 + 6 種編排設計模式 + 10 類使用案例 + 何時不用清單；含個人吸收段（**第 7 次**：新發現「矩陣未對位錯位」型）；信心強 | 1 |
| [[src-muki-plaud-workshop-ai-codev-2026-06-04\|MUKI 06-04 工作坊 — AI 協同開發與系統架構轉型]] | Plaud 錄音 58:50（19K 字 transcript）；MUKI 自建 Hi Day 筆記軟體 + 5 大主題 + 26 作業；含 Plaud STT 錯誤校正表（Cloud Code → Claude Code 等系統性錯誤）+ 個人吸收段（**第 8 次：新發現「Intent 廣 / Application 窄錯位」候選**，待第 9-10 次再升級為獨立 taxonomy）；信心中（STT 校正後） | 2 |

## 實體

| 頁面 | 摘要 | 來源數 |
|------|------|--------|
| [[html2pptx]] | HTML/CSS → 完全可編輯 PPTX 的 SaaS；REST API / Skill / MCP / CLI 四形態；日本獨立開發者 @taiyo_ai_gakuse | 1 |
| [[攝影工作室A]] | 攝影工作室客戶，商業攝影網站優化中 | 1 |
| [[OKX]] | 加密貨幣交易所，使用雙幣贏產品 | 1 |
| [[Cloudflare]] | 雲端平台 + AI agent 標準推手 + 內部 AI 工程文化（AI code review production case）| 3 |
| [[Asgard-AI-Platform\|Asgard AI Platform]] | AI 平台，以 Skills + MCP 組合打造場景化 agent 外掛；主打台灣中小企業日常工作場景 | 2 |
| [[OpenClaw]] | open-source desktop agent 框架（中文別名「龍蝦 AI」）；RAG MVP 使用；2026 起被 [[HermesOS]] 主動承接遷移 | 4 |
| [[NotebookLM]] | Google 免費閉合式 RAG 工具，Gemini 模型，可生成圖表/podcast | 1 |
| [[notebooklm-py]] | 林探開發的 NotebookLM CLI 工具，提供 Claude Code 整合 | 1 |
| [[HC-AI-說人話]] | YouTube 創作者，推廣 Claude Code + 第二大腦工作流 | 1 |
| [[WP-CLI]] | WordPress 官方命令列工具，接手檢查 SOP 關鍵依賴 | 1 |
| [[Figma]] | 雲端介面設計工具，AI 衝擊下護城河收斂為「美學錨點 + 像素控制」；Figma MCP 已實現雙向操作 | 2 |
| [[Adobe]] | 設計軟體龍頭，Creative Cloud 全家桶，面臨教育綁定鬆動 | 1 |
| [[Claude-Design]] | Anthropic 2026 推出的 AI 原生設計產品，繞過設計稿直接產 React | 2 |
| [[Yu-Chih-Edward-Hwang]] | 「Will AI Kill SaaS」系列作者，FB user fatality1117 | 1 |
| [[Andrej-Karpathy]] | 前 Tesla AI 總監、OpenAI 共同創辦成員，LLM Wiki 提出者；AI 寫程式 3 缺失觀察是 12 條規則的源頭 | 2 |
| [[科技翰林院]] | 中文圈 AI 工具實戰部落格，主筆 AI 導演林思翰 Hans | 2 |
| [[Obsidian]] | Local-first markdown 筆記工具，LLM Wiki 工作流最佳載體 | 2 |
| [[Claude Code]] | Anthropic 2025 推出的 agentic CLI，本知識庫核心執行 agent；含官方 Harness 7 個 extension points | 7 |
| [[Quartz]] | jackyzha0 的 digital garden SSG，本知識庫的發布層工具 | 2 |
| [[PAPAYA-電腦教室]] | 中文 YouTube 創作者，AI 教學者地圖中的入門層 | 1 |
| [[Gemma]] | Google open-weight LLM 系列，本地 AI 代表模型 | 1 |
| [[LM-Studio]] | 跨平台本地 LLM GUI runtime | 1 |
| [[BrowseForge]] | 多指紋反偵測瀏覽器（Go/開源），內建 MCP server | 3 |
| [[Playwright]] | Microsoft 跨瀏覽器自動化框架，多工具的底層引擎 | 3 |
| [[OpenCLI]] | jackwener 開源（JS/TS），把任何網站變 CLI + 用已登入真實 Chrome 操作網頁；「AI 操作瀏覽器」第三種路線（已登入單人確定性 adapter）| 1 |
| [[Simon-Lin]] | Product Designer，台灣→東京→雪梨，Claude Design × Claude Code × Figma 工作流實作者 | 1 |
| [[AAPD]] | 繁中產品設計教育平台 | 1 |
| [[Hermes-Agent]] | Nous Research 出品的開源 agent 框架，跨平台 + 自我改進；[[HermesOS]] 是其商業 managed cloud 包裝 | 2 |
| [[HermesOS]] | hermesos.cloud 的 managed cloud 商品（建立在 [[Hermes-Agent]] 上）；BYO key + 通訊整合 + OpenClaw migration built in | 2 |
| [[Gas-Khuang]] | 真實全名 Gask Huang-Kai；Hermes 99 案例整理者 + 中文圈 HermesOS / OpenClaw 推廣者 | 2 |
| [[Addy-Osmani]] | Google Cloud AI 總監；Harness 七元件分解 + Ratchet 機制 + HaaS 趨勢 | 1 |
| [[Boris-Cherny]] | Anthropic Claude Code 核心；完成驗證心法（資深工程師會核准嗎）+ Routines 實戰 | 1 |
| [[Thariq-Shihipar]] | Anthropic Claude Code 核心；Cache as Uptime + Context 工程；既有 context-management 教學原作者 | 2 |
| [[HyperFrames]] | Code-first 短影片框架（HTML+CSS+GSAP+timeline）；本知識庫第一個影片生成工具 | 1 |
| [[OpenAI-Codex-CLI]] | OpenAI agentic CLI；AGENTS.md / `codex adversarial-review` 等特色 | 2 |
| [[OpenCode]] | 開源伺服器優先 agentic CLI；Cloudflare AI code review 系統底層 | 1 |
| [[mcp-cli]] | doggy8088（Will 保哥）維護的 Rust MCP client CLI（fork philschmid 原版）；把 MCP tools 變 shell 指令、給 agent 按需載入 schema 省 token | 1 |
| [[Claude-Cowork]] | Anthropic Claude 3 product surfaces 之一（folder access + connectors + skills + scheduled runs）；Airtree 「運營核心」實戰 | 1 |
| [[Anthropic]] | 本知識庫核心廠商（195+ 次提及）；Claude 3+1 個 surfaces + 核心員工地圖 + 跨廠商工程共識位置 | 4 |
| [[OpenAI]] | 對標廠商（92 次提及）；Codex CLI / AGENTS.md / Harness Engineering 的對應位置；與 Anthropic 8 維對比 | 2 |
| [[Mnimiy]] | 社群實驗者 / X @Mnilax；CLAUDE.md 12 條規則的 8 條擴充作者 + Ratchet 第 3 個獨立來源 + 30 codebase 盲測 | 1 |
| [[SHOPLINE-Payments]] | SHOPLINE 集團金流產品；支援信用卡分期 / LINE Pay / Apple Pay / zingala / 街口；2026 春季 WP 小聚贊助商 + 專題 BD 主題；接案決策矩陣 + 自家數據可信度評估 | 2 |
| [[TSMC]] | 台積電；含曹興誠 RCA 歷史爭議視角 + NVIDIA GTC Taipei 2026 AI 供應鏈核心定位；待第三方驗證標記 + 未來追蹤候選表 | 2 |

## 概念

| 頁面 | 摘要 | 來源數 |
|------|------|--------|
| [[雙幣贏]] | 選擇權賣方策略的零售包裝版，非存款非利息 | 2 |
| [[RAG]] | 檢索增強生成，讓 AI 根據自有資料回答（含 vs LLM Wiki 對比）| 3 |
| [[Embedding]] | 向量化，把文字轉成語意向量供搜尋 | 1 |
| [[Agent-Skills\|Agent Skills]] | AI Agent 可擴充任務能力的技能規範；「啟動成本是瓶頸」核心論點；Anthropic 官方確認 progressive disclosure 設計 | 10 |
| [[LLM-Wiki]] | Karpathy 提出的 wiki 化知識管理範式，本知識庫的方法論基礎；含人類引導 vs 全自動 + agentic search vs RAG embedding 官方版對照 | 3 |
| [[Memex]] | Vannevar Bush 1945 提出，LLM Wiki 的歷史先驅 | 1 |
| [[CLAUDE-md\|CLAUDE.md]] | Claude Code 持久記憶層，兼任 LLM Wiki schema 規範；Ratchet 編碼主要載體；含 12 條 production 範本 + Anthropic 官方 3-6 月 review 維護週期 + MVP stage Day Zero 建立官方要求 | 7 |
| [[AI-Quality-Collusion]] | AI 同時生成 code 與 test 的隱形共謀反模式；含 CLAUDE.md Rule 9 個人版對策 | 3 |
| [[Specification-by-Example\|SBE]] | 以具體範例凍結需求，AI 品質共謀的結構性對策之一 | 1 |
| [[MCP]] | Anthropic 推出的開放協議，AI 連外部工具的「USB」標準；含工具描述安全議題；官方背書 MCP for structured search | 10 |
| [[GEO]] | Generative Engine Optimization / Agent-Ready 網站，SEO 的 AI 時代延伸；含 Google 官方反論段（2026-05-21）並列保存兩派立場（llms.txt / Markdown negotiation / AEO 是否獨立策略等議題對撞） | 3 |
| [[llms-txt]] | Jeremy Howard 2024-09 提出的 LLM 推理時網站索引規範；採用率追蹤含 Anthropic / Stripe 已部署 + OpenAI 未部署實測快照；含三方立場對撞（推薦派 / 反對派 / 行動派）+ 「行動 > 表態」heuristic + 自家 wiki 部署決策框架 | 2 |
| [[顧客終身價值]] | CLV，衡量顧客經營成效的核心指標；Anthropic 官方版列為 Launch 階段 exit criteria | 2 |
| [[DESIGN-md\|DESIGN.md]] | 純 Markdown 設計系統規範，讓 AI coding agent 生成風格一致的 UI / 短影片 | 6 |
| [[Managed-Agents\|Claude Managed Agents]] | Anthropic 託管 agent 服務，session/harness/sandbox 三層架構 | 3 |
| [[Meta-Harness]] | 為「尚未想出的程式」設計的 agent 架構模式 | 3 |
| [[Harness-Engineering\|Harness Engineering]] | AI 代理環境設計範式；含 OpenAI 三支柱 / Google Addy 七元件 / Anthropic Claude Code 7 個 extension points / Cloudflare production 四組視角 | 4 |
| [[WordPress-接手檢查SOP]] | 接手 WordPress 網站的六步檢查流程，辨識「前人的遺產」 | 1 |
| [[Vibe-Coding]] | 自然語言直接驅動 LLM 生成程式碼／影片的開發範式（演化光譜第 2 階段）；含 Anthropic「Agentic Technical Debt」+ Yu-Chih Edward Hwang SaaS 演化 + Gask Huang-Kai 中小企業根本替代三條獨立批判線 | 4 |
| [[Agentic-AI-Workflow]] | 同心圓迭代範式，含 Design to Code / Code to Design 雙向流動 + 短影片產製鏈；含 Anthropic 官方版 founder = orchestrator of agents 擴展 | 4 |
| [[Self-Improving-Agent]] | 自我改進代理範式：MEMORY.md + Skill Factory + 偏好學習，Hermes 是代表實作 | 2 |
| [[Ratchet-Pattern]] | 每次錯誤編碼成永久規則的設計模式；CLAUDE.md / hook / reviewer subagent 三層編碼；含 41% → 3% 量化實證；Anthropic 官方為第 4 個獨立來源 | 4 |
| [[MEMORY-md\|MEMORY.md]] | AI Agent 跨 session 持久記憶層；與 CLAUDE.md 形成「AI 寫 vs 人類寫」對；Claude Code / Hermes 雙實作 | 3 |
| [[Context-Rot]] | 上下文衰損；含 Cloudflare 共用脈絡檔 / Anthropic progressive disclosure 官方版 / CLAUDE.md Rule 6 個人版 token budget 三層對抗 | 5 |
| [[Subagent-Driven-Development]] | Implementer + spec reviewer + code quality reviewer 兩階段獨立審查；含 Cloudflare 130K production 對照 + Anthropic 官方「split exploration from editing」定義 | 2 |
| [[Adversarial-Code-Review]] | 對抗式 AI review，抓 human review 看不見的跨檔組合 bug；OWASP focus 為常見起點；含 Risk Tier 分配；含 Anthropic 官方「跨四階段創業 use case」擴展 | 2 |
| [[Hybrid-XSS-Defense]] | 雙層 stored XSS 防護（escape variables at substitution + sanitize at storage）| - |
| [[Fields-Without-Enforcement-Anti-Pattern]] | 反模式：schema 有欄位、邏輯不檢查；含 silent backdoor 變體與時序狀態變體；Anthropic 官方版根因命名「Insecure by inexperience」| 1 |
| [[Verify-Framework-Version-First]] | 新專案第一件事驗 lockfile 版本；ratchet pattern 的具體應用 | - |
| [[Prompt-Pack-Pattern]] | 多段 prompt 串成完整工作流的設計模式；與 Agent Skills 形成「人類控制節奏 vs Agent 自動觸發」對照；含三大反模式警示 | 2 |
| [[AGENTS-md\|AGENTS.md]] | OpenAI Codex / OpenCode 等 agentic CLI 的規範檔；與 CLAUDE.md 平行對照 | 2 |
| [[Plugins-Claude-Code]] | Claude Code 的 Plugins 機制：bundle skills/hooks/MCP 成可安裝套件 | 1 |
| [[LSP-Integrations]] | Language Server Protocol 整合：給 Claude symbol-level precision | 1 |
| [[PGE-Principle]] | Generator ≠ Evaluator——多個既有反模式對策（Subagent-Driven / AI-Quality-Collusion / Adversarial-Code-Review）的上位原則 | 1 |
| [[Context-Engineering]] | 「真正的工程護城河」；Harness 第一支柱細部展開 + 分層快取結構 | 2 |
| [[AI-Native-Startup]] | Anthropic 官方版 AI 時代創業範式（「10-person unicorn」）；4 階段 + exit criteria 框架 + 4 個 AI 時代反模式 | 1 |

## 綜整與分析

| 頁面 | 摘要 | 來源數 |
|------|------|--------|
| [[diagnostic-customer-answers\|顧客管理自我診斷 — 作答記錄]] | 對 50 題顧客自我診斷問卷的個人作答 | 1 |
| [[WordPress-接案工作筆記]] | WordPress 接案三階段工作流：獲客 → 接手 → 加值 | 3 |
| [[presentation-攝影工作室A-網站優化\|攝影工作室A — 網站健檢與優化簡報]] | Marp 簡報：SEO + GEO 雙軌體檢，含實地抓取 client-site.example 數據 | 1 |
| [[synthesis-asgard-install-for-my-topics\|Asgard Skills 個人 install 候選清單]] | 從 301 個挑出 ~50 個對接案 / 投資 / 思維三主題強相關的 skill；含安裝建議 | 3 |



## 比較

| 頁面 | 摘要 | 來源數 |
|------|------|--------|
| [[加密貨幣收益工具比較]] | 活期賺幣 / 網格 / 雙幣贏 / Deribit 自賣選擇權的並排比較 | 2 |
| [[comparison-ai-native-vs-lean-startup\|AI-Native vs Lean Startup]] | 4 階段 vs 6 階段對映 + 反模式對照 + Anthropic 為何重新框架的 4 大原因 | 1 |
| [[comparison-stt-models-whisper-paraformer-sensevoice\|STT 模型比較 Whisper/Paraformer/SenseVoice]] | 本機中文語音輸入選型：CER benchmark + Mac MLX 可行性 + sherpa-onnx 路徑 + 繁體 opencc caveat | 2 |
