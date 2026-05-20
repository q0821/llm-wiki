---
title: The Founder's Playbook — Building an AI-Native Startup（Anthropic 官方 2026-05）
type: source
sources: ["anthropic-founders-playbook-2026-05.md", "anthropic-founders-playbook-2026-05.pdf"]
created: 2026-05-20
updated: 2026-05-20
tags: [anthropic-official, ai-native-startup, claude, founder, startup-lifecycle, claude-cowork]
confidence: 強
---

# The Founder's Playbook — Building an AI-Native Startup

**出版方**：[[Anthropic|Anthropic 官方]]
**發布日期**：2026-05-06（檔名 v3）
**原始連結**：https://cdn.prod.website-files.com/6889473510b50328dbb70ae6/69fe2a55b93bb0732b1fe33c_The-Founders-Playbook-05062026_v3%20(1).pdf
**規模**：36 頁 / 7 章 + Resources

## 核心主張

- **「AI-Native Startup」是 Anthropic 官方範式名詞**——「10-person unicorn」從俗語變 deliberate plan
- 4 階段（Idea / MVP / Launch / Scale）+ 各自明確 exit criteria
- 「bottleneck 不再是 what you can build，而是 **what you choose to build**」
- Claude **3 個 product surfaces** 完整分工：Chat / [[Claude-Cowork]] / [[Claude Code]]
- 「Use Claude as **structured devil's advocate**」是貫穿四階段的核心 use case

## 詳細摘要

### 章 1：The startup lifecycle, rebooted for 2026

> 「AI is reshaping how startups are built. Founders who've never written a line of code are shipping production applications today.」

傳統 arc `validate → raise → hire → build → raise again → grow → hire more → repeat` 已被 AI 消解——「每個新階段需要更大的團隊、不同的 skill set、新一輪募資」這個預設不成立了。

本 playbook 重新 map 4 階段（Idea / MVP / Launch / Scale）以對應「AI 為核心」的新現實。

### 章 2：What it means to be a founder is changing

> 「The wall between '**people who can build**' and '**people with ideas worth building**' has dissolved.」

3 個 AI 能力面向（讓 lean startup 可行）：

| 面向 | 「Think:」隱喻 | 用途 |
|---|---|---|
| **Conversational intelligence and research** | on-call 全領域專家 | Deep research / Document drafting / Strategic thinking partner |
| **Agentic coding** | 永遠在的 engineer | 用自然語言 generate / test / debug / refactor production code |
| **Workflow automation** | on-demand ops team | CRM 更新、報告編譯、文件同步——「founder 不必親自處理連接組織」 |

**Claude 3 個 product surfaces**：

| Surface | 何時用 |
|---|---|
| **Chat** | 快速對話、quick brainstorm（no setup）|
| **Claude Cowork** | folder access / connectors / skills / **scheduled runs** |
| **Claude Code** | codebase / diffs / git / dev environments |

> 「The three share the same Claude underneath; what changes is the workspace around it.」

### 章 3：Idea Stage（頁 8-14）

**Exit criteria**：**problem-solution fit**（質性證據，從真人對話來）

**Goal**：**research-oriented validation**——「assembling solid evidence that a real problem exists」before committing resources to building

**3 大挑戰**：
1. **Mistaking building for validating**——「42% of startups failed because they built something nobody wanted」（既有研究）。agentic coding 讓「I have an idea」→「I have a product」距離崩塌
2. **Premature scaling**——AI 讓 scaling 變得 effortless，更容易在驗證之前就 scale 走偏方向
3. **Loss of objectivity**——「Confirmation bias now comes with a research engine」。AI 會幫你找你想要的證據

**Idea stage 工作流**（用 Claude 三個 surface）：
- 定義並 pressure-test 問題假設（用 Claude 作 **structured devil's advocate**）
- Market research / 競品分析（**Competitor neglect** 反模式對策：「ask Claude to make the most compelling argument for why a competitor would succeed」）
- Plan and design customer discovery（who to talk to / what to ask / post-interview analysis）
- Customer outreach 自動化（Cowork + Gmail/Calendar via MCP）
- Design final solution concept
- Build a **lightweight prototype** with Claude Code

### 章 4：MVP Stage（頁 15-20）

**Exit criteria**：**genuine PMF**
- Sean Ellis test：「如何感受如果不能再用？」40% 很失望 = PMF 指標
- Effort test：產品開始 pulling 而不是 pushing → 真正的 PMF
- Day 7 / Day 30 retention 目標需 **launch 前就定**

**Goals**：
- Translate validated problem into a working product
- **Move fast without accruing technical debt**
- **Investing in persistent context from day 1**（[[CLAUDE-md]] 等是 force multiplier）

**4 大挑戰**：
1. **Agentic technical debt**（**新概念**）——AI 移除每個 bottleneck → speed 成唯一變數 → 累積 debt 比舊範式更快
2. **Falling for false PMF**——early traction（朋友、投資人 portfolio、HN headline）≠ genuine PMF
3. **Zero-friction scope creep**——「each addition 是 defensible，但組合起來偏離核心」
4. **Insecure by inexperience**——agentic 工具產 functional code 不等於 secure code；vulnerabilities are invisible until exploited

**MVP 工作流**（用 Claude 三個 surface）：
- **Define your architecture before you build**——先建 `CLAUDE.md` 架構脈絡文件
- **Define and enforce your MVP scope**——明文寫 scope 文件
- Build with Claude Code（每 session 開頭重新讀 scope + CLAUDE.md）
- **Security review before any user touches it**——Claude Code Security（limited beta，2026-05）
- **Build your measurement framework BEFORE launch**——retention / activation / Day 7/30 benchmarks
- Manage discovery + user feedback logistics（Cowork）
- Iterate toward evidence, not toward completeness
- Pivot when the evidence demands it

### 章 5：Launch Stage（頁 21-24）

**Exit criteria** 三項：
1. **Growth is repeatable and channel-driven**（CAC / LTV / payback period 可知可 defensible）
2. The product can handle production workloads（infrastructure hardened / security & compliance / reliability）
3. **Operations run without founder bottlenecks**

**4 大挑戰**：
1. **Technical debt comes due**——MVP 階段累積的 debt 開始 accruing interest
2. **Founder becomes the bottleneck**——「在 MVP 階段是 asset，到 Launch 變 constraint」
3. **Security & compliance are no longer deferrable**——SOC2 / GDPR / HIPAA 等
4. **Expansion before you're ready**——新市場可能讓既有 PMF go to die

**Launch 工作流**：
- **Remediate technical debt before it compounds**（Claude Code architectural audit + 寫入 CLAUDE.md）
- Build systems that replace founder attention（Cowork 接力）
- Make security & compliance a **product workstream**（不是 one-time project）
- Stand up product management processes you've been skipping

### 章 6：Scale Stage（頁 25-30）

**Exit criteria**：**defensible moat through accumulated depth**——3 種出場（profitability / IPO-readiness / acquisition）任一

**Goals**：
- Build systematic growth that's sustained by mature org operations
- **Build a defensible moat through accumulated depth**（產品 / 整合 / 系統 data / 客戶 workflows）

**4 大挑戰**：
1. Delegating operational layer
2. Scaling technical operations
3. Scaling organizational functions（hiring / payroll / accounting / legal）
4. Building GTM function

**Scale 工作流**：
- Hand off day-to-day to Cowork
- Scale technical operations into enterprise-grade infrastructure
- Build a real GTM function（market segmentation / messaging / analyst relations / sales playbooks）
- **Turn domain expertise into AI context**（用 Skills 把 founder 知識編碼）
- **Compound accumulated user data into defensible advantage**（time-locked / context-specific 數據護城河）
- **Create workflow lock-in**

### 章 7：Same job, new rules

> 「The founder's job hasn't changed: find a real problem, build something that solves it, and scale it into a company that matters. **What's changed is the path to get there.**」

> 「**The bottlenecks are no longer what you can build, but what you choose to build.**」

### Resources（頁 33-35）

#### Building with Claude（官方資源連結）
- Building AI Agents for Startups
- Claude Code docs / best practices / power user tips
- Using CLAUDE.md files（**「MVP-stage founders 必讀」**）
- Get started with Claude Cowork
- Tutorials: claude.com/resources/tutorials

#### Founder stories（9-10 家 customer case studies）

| 公司 | 描述 |
|---|---|
| **YC 三家**（HumanLayer F24 / Ambral W25 / Vulcan Technologies S25）| 用 Claude Code 從 prototype 到 market |
| **GC AI** | Claude-powered legal platform |
| **Carta Healthcare** | 22,000 surgical cases / year，data abstraction time **-66%** |
| **Anything** | 1.5M users（**non-technical founder** + Agent SDK，AI 自動 recruit platform）|
| **Cogent** | Applied AI lab，security agents |
| **Airtree** | **Cowork 為運營核心**，「一人建的 workflow 全公司可用」 |
| **Duvo** | Procurement / supply chain / category management（Agent SDK + Claude orchestrate）|
| **Zingage** | Home-care 24/7 自動化 agent platform |
| **Kindora** | Non-profit charity-funder 配對（MCP connector 讓 nonprofit 在 Claude 內存取 Kindora） |
| **Wordsmith** | Lawyer-turned-CTO 的 legal tech |

#### Startup support and opportunities
- **Anthropic Startups Program**：VC partner / free API credits / 最高 rate limits / exclusive founder events
- Claude community / Live learning resources

## 關鍵引用

> 「**The wall between 'people who can build' and 'people with ideas worth building' has dissolved.**」

> 「**Use Claude as structured devil's advocate is a core use case at every stage of the AI startup life cycle.**」

> 「The founder's role becomes much less individual contributor and much more **orchestrator of agents**.」

> 「The bottlenecks are no longer what you can build, but **what you choose to build**.」

> 「**42% of startups failed because they built something nobody wanted.** Now... that failure rate is only going to climb.」

## 信心評估

- **強**：4 階段框架與 exit criteria —— Anthropic 官方系統化梳理
- **強**：Claude 3 surface 分工（Chat / Cowork / Code）—— 第一手產品定位
- **強**：9-10 家 customer case studies —— 含具體數字（Carta -66% / Anything 1.5M users）
- **中**：「AI-Native Startup」範式名詞 —— Anthropic 用詞，可能跟 a16z / YC 等其他機構用詞略異
- **時效**：2026-05-06 當下；Claude Code Security 標 limited beta

## 與 Wiki 的關聯

### 新建頁面

- [[Claude-Cowork]]（entity）—— 本 wiki 的 Claude 產品地圖明顯缺角
- [[AI-Native-Startup]]（concept）—— 整篇核心範式

### 更新既有頁面（8 個）

- [[Claude Code]]：補 Chat / Cowork / Code 三 surface 完整分工
- [[Claude-Design]]：補 Claude 產品家族對照
- [[CLAUDE-md]]：補「MVP stage 開始就建 CLAUDE.md」官方版佐證
- [[Vibe-Coding]]：補「Agentic technical debt」反模式
- [[Agentic-AI-Workflow]]：補「10-person unicorn」「founder 路徑壓縮」官方版
- [[Adversarial-Code-Review]]：補「Claude as structured devil's advocate」官方版
- [[顧客終身價值]]：補 CAC/LTV/payback 在 Launch exit criteria 的位置
- [[Hybrid-XSS-Defense]] / [[Fields-Without-Enforcement-Anti-Pattern]]：對應「Insecure by inexperience」原則

### 形成的對話組

- **本來源（廠商觀點 of founder）** ↔ **[[src-honglong0420-asgard-x-thread]]**（內部人員 of skill 平台）：兩種「**AI 應用層論述**」對照——前者廠商視角全面 lifecycle，後者一線實踐視角
- **本來源** ↔ **[[src-claude-code-in-large-codebases]]**：Anthropic 兩份官方文件——一份對 founder，一份對企業工程團隊
- **本來源** ↔ **[[src-will-ai-kill-saas-design]]**（Yu-Chih Edward Hwang）：兩種「AI 改變什麼」視角——前者廠商「founder 工作如何變」，後者觀察者「SaaS 護城河如何變」

### 未來可延伸

- 補抓 Anthropic 官方 Cowork docs 強化 [[Claude-Cowork]]
- 9-10 家 customer 中若有特別相關（如 GC AI legal / Wordsmith 對 WordPress 接案參考）可獨立 ingest
- 「AI-Native Startup」與 a16z / YC 等其他機構的「lean startup」「one-person unicorn」論述對照
- Anthropic Startups Program 申請流程（若你考慮申請）
