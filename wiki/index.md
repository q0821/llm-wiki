---
title: 索引
---

# 索引

> 本索引由 LLM 自動維護。每次匯入或更新時同步更新。

## 最近新增

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

## 實體

| 頁面 | 摘要 | 來源數 |
|------|------|--------|
| [[攝影工作室A]] | 攝影工作室客戶，商業攝影網站優化中 | 1 |
| [[OKX]] | 加密貨幣交易所，使用雙幣贏產品 | 1 |
| [[Cloudflare]] | 雲端平台 + AI agent 標準推手 + 內部 AI 工程文化（AI code review production case）| 3 |
| [[Asgard-AI-Platform\|Asgard AI Platform]] | AI 平台，以 Skills + MCP 組合打造場景化 agent 外掛；主打台灣中小企業日常工作場景 | 2 |
| [[OpenClaw]] | AI Agent 框架，支援 Telegram/Discord/Slack，RAG MVP 使用；2026 起被 Hermes 取代趨勢 | 2 |
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
| [[Simon-Lin]] | Product Designer，台灣→東京→雪梨，Claude Design × Claude Code × Figma 工作流實作者 | 1 |
| [[AAPD]] | 繁中產品設計教育平台 | 1 |
| [[Hermes-Agent]] | Nous Research 出品的開源 agent 框架，跨平台 + 自我改進，OpenClaw 遷移目標 | 1 |
| [[Gas-Khuang]] | Hermes 99 案例網站整理者 | 1 |
| [[Addy-Osmani]] | Google Cloud AI 總監；Harness 七元件分解 + Ratchet 機制 + HaaS 趨勢 | 1 |
| [[Boris-Cherny]] | Anthropic Claude Code 核心；完成驗證心法（資深工程師會核准嗎）+ Routines 實戰 | 1 |
| [[Thariq-Shihipar]] | Anthropic Claude Code 核心；Cache as Uptime + Context 工程；既有 context-management 教學原作者 | 2 |
| [[HyperFrames]] | Code-first 短影片框架（HTML+CSS+GSAP+timeline）；本知識庫第一個影片生成工具 | 1 |
| [[OpenAI-Codex-CLI]] | OpenAI agentic CLI；AGENTS.md / `codex adversarial-review` 等特色 | 2 |
| [[OpenCode]] | 開源伺服器優先 agentic CLI；Cloudflare AI code review 系統底層 | 1 |
| [[Claude-Cowork]] | Anthropic Claude 3 product surfaces 之一（folder access + connectors + skills + scheduled runs）；Airtree 「運營核心」實戰 | 1 |

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
| [[GEO]] | Generative Engine Optimization / Agent-Ready 網站，SEO 的 AI 時代延伸 | 2 |
| [[顧客終身價值]] | CLV，衡量顧客經營成效的核心指標；Anthropic 官方版列為 Launch 階段 exit criteria | 2 |
| [[DESIGN-md\|DESIGN.md]] | 純 Markdown 設計系統規範，讓 AI coding agent 生成風格一致的 UI / 短影片 | 6 |
| [[Managed-Agents\|Claude Managed Agents]] | Anthropic 託管 agent 服務，session/harness/sandbox 三層架構 | 3 |
| [[Meta-Harness]] | 為「尚未想出的程式」設計的 agent 架構模式 | 3 |
| [[Harness-Engineering\|Harness Engineering]] | AI 代理環境設計範式；含 OpenAI 三支柱 / Google Addy 七元件 / Anthropic Claude Code 7 個 extension points / Cloudflare production 四組視角 | 4 |
| [[WordPress-接手檢查SOP]] | 接手 WordPress 網站的六步檢查流程，辨識「前人的遺產」 | 1 |
| [[Vibe-Coding]] | 自然語言直接驅動 LLM 生成程式碼／影片的開發範式（演化光譜第 2 階段）；Anthropic 官方版命名「Agentic Technical Debt」| 3 |
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
