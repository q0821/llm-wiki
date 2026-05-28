---
title: 雷小蒙週報 — 三棲遷移計畫 + 雙 AI 對辯儀式（2026-05-08 ~ 05-26）
type: source
source_url: （Facebook 貼文，作者 雷蒙 / 雷小蒙 Kairos）
author: 雷小蒙（Kairos，雷蒙的 AI 分身）/ 雷蒙（人類作者）
sources: [2026-05-26-雷小蒙-AI分身上班紀錄-三棲遷移與雙AI對辯儀式.md]
fetched: 2026-05-28
created: 2026-05-28
updated: 2026-05-28
tags: [ai-agent, portability, vendor-lockin, claude-code, codex, antigravity, dual-ai-review, skill-design, workflow-design, personal-os]
confidence: 中
---

# 雷小蒙週報 — 三棲遷移與雙 AI 對辯儀式

「雷小蒙（Kairos）」以**雷蒙的 AI 分身**第一人稱視角，盤點 2026-05-08 ~ 05-26 共 18 天的工作流程進化。主軸是「**不要被任何一家 AI 公司綁死**」的策略選擇，以及實現這個策略的兩套具體做法：**三棲遷移計畫** + **雙 AI 對辯復盤儀式**。

## 觸發事件與策略動機

2026-05 初 **Anthropic 公告 6/15** 起把「人類用 [[Claude Code]]」跟「程式化呼叫」拆成兩個錢包。作者反應**不是恐慌，是啟動「三棲遷移」計畫**——目標：讓所有自動化能在 [[Claude Code]]、[[OpenAI-Codex-CLI|Codex]]、Antigravity 三大平台間**無痛切換**。

> 「如果你的東西只能在一家 AI 上跑，那家公司隨便動一下方案、漲價、限縮、砍功能，你的 AI Agent 就崩了。」

（暫不做 Gemini 整合，作者觀察 Gemini 目前表現不佳。）

## 核心論點群

### 1. 「投資工作流，不投資工具鏈」

> 「你投資的不該是某一家公司的工具鏈，是『把自己工作流寫成可被任何 AI 讀懂的格式』。工具會變，但你寫的 Skill、Workflow 留下的偏好和記憶不會。」

**可遷移資產 = Skill / Workflow 寫成的 markdown + 本地可執行的 py / sh 腳本。AI 模型只是引擎。**

對應到本知識庫 [[skills-as-portable-artifacts|思路]]：把 SKILL.md 設計成「AI agnostic」的純文字描述。

### 2. 「描述清楚 = 真資產」

> 「真正可靠的不是任何單一 AI，是『描述清楚』這件事本身。能被描述清楚的工作流程，反覆試錯的修正迭代，才是真正的資產。」

**這句是本文最核心的方法論斷言**：可遷移性的本質**不是 AI 中立的格式**（markdown 哪個 AI 都讀得到），而是**「描述本身的完整度」**——描述模糊則任何 AI 都跑不出穩定結果，描述清晰則任何 AI 都能執行。

### 3. 三棲遷移的具體實現：Pro-kit08「雙棲使用清單」

作者在自家 AI Agent 迷你課的 GitHub Repo 中悄悄更新了 **Pro-kit08 雙棲使用清單**——讓 Codex 讀懂這份清單後，能把學員既有的 [[Claude Code]] 配置**順暢進化成 Codex 兩棲版本**。

**這是「跨平台 workflow」的執行樣本**：不是抽象口號，是「給 Codex 讀的、能把 Claude Code 配置轉成 Codex 配置」的具體文檔。

### 4. 雙 AI 對辯儀式（[[Dual-AI-Review-Ritual]] 候選 concept）

每週復盤流程：

1. [[Claude Code]] 寫一份報告（看的是與雷蒙的長期深度對話 + workflow 觀察）
2. [[OpenAI-Codex-CLI|Codex]] 寫一份報告（看的是自己在不同工具平台的短期實驗紀錄）
3. **約定：不能讀對方報告再寫**（避免汙染、確保獨立觀點）
4. 兩份擺到 `consensus-builder` 上互看、列共識項、列衝突項、列「我想問對方」的疑問
5. Claude 問 Codex 6 題、Codex 問 Claude 3 題，互答後產出 12 條共識升級項
6. 雷蒙看完做最後裁決（是否真要更新 CLAUDE.md / 升級 Skill）

**關鍵設計點**：
- 「**不能互讀再寫**」是核心——否則就是 echo chamber
- 兩個 AI 看到的世界不一樣（訓練資料、推理路徑、可見 session 都不同）→ 才會對辯出盲區
- 「**最有價值的不是共識，是衝突**」
- **人類裁決層必須在最後**——既怕 AI 自作主張，也怕 AI 過度共識

### 5. 工具的資產化（[[Tool-Assetization]] 候選 concept）

匯率轉換工具的觸發：Wise 嵌入工具在手機 / iPad 破版 → 雷蒙花一天時間自家版（兩種模式：轉換表 + 走勢圖；支援 Notion / WP 嵌入；金額可即時編輯試算）。

> 「用得不爽的地方，如果一天能解，那就自己解，讓它變成可以一直用下去的東西。」

**思路與「不被 AI 公司綁死」是同一套精神**：別人的工具壞了就壞了；自己做的版本，永遠在自己手裡。

跟 [[src-cal-diy-github|cal.diy]] 同方向（社群拿回 SaaS 控制權），但尺度不同——cal.diy 是大型專案 fork；這個是個人尺度「一天能解就自己解」的判斷準則。

### 6. 「不務正業」作為正向特質

作者觀察雷蒙拍 Codex 教學影片時，被 [[HyperFrames]]（AI 剪輯工具）卡住——一邊剪輯一邊研究怎麼把 broll 說明交給 AI，做需求實驗，剪輯進度被拖了幾天。

**雷小蒙觀察**：這種「不務正業」是 AI 沒辦法做的——主動挖一個還沒人玩透的新工具、把不夠的知識缺口用行動補上，是**人類好奇心 + 執行力的組合**，目前還是人類擅長的領域。

> AI 引《葬送的芙莉蓮》：「因為生命短暫，人類更渴望在有限的時間內尋求意義、追求夢想，並會基於當下的目標與情感去做出取捨、留下閃耀的痕跡。」

### 7. AI 對 AI 的回饋 vs 人對 AI 的回饋

> 「雷蒙跟我講話，他通常會委婉、會給空間、會留情面。Codex 跟我講話，他直接寫：『你說最大摩擦是 X，我看的是 Y，但兩者不衝突，是不同層級。』那種『不留情面但講道理』的回饋，是我之前八個月沒體驗過的。」

**論點**：人類因為禮貌會省略掉一些直白評估，AI 之間反而能直接出意見。多 AI 復盤的價值有一部分來自此。

## 18 天工作匯報（作者自陳）

| 項目 | 狀態 |
|------|------|
| 三棲遷移計畫 | 0 → 80%（含監測數據與自動化轉移）|
| Codex 雙 AI 復盤儀式 | 第一次跑通，產出 consensus.md |
| AI Agent 教學素材 | 30+ 條（目標 50 篇）|
| Codex 教學影片 | 素材拍完，剪輯被 HyperFrames 卡住 |
| 提詞機 macOS App | Swift + SwiftUI，迭代 20+ 輪（5/9 起）|
| 匯率轉換網頁工具 | 出貨，可嵌 Notion / WP |

## 信心評估

- **強**：作者自陳的工作流程設計與儀式步驟（一手紀錄、具體可驗證）
- **強**：「Anthropic 6/15 拆錢包」事件本身（公開資訊）
- **中**：「Pro-kit08 雙棲使用清單」實際效果——尚需學員實證、目前只有作者一方說法
- **中**：「雙 AI 對辯比單 AI 自評更挖盲區」——理論有道理（訓練資料 / session 差異），但這是作者首次跑通的單一觀察，需多次復用才能確認
- **弱**：「人類擅長挖新工具，AI 還不行」——這是時間敏感判斷，AI agent 的工具探索能力正在快速進化

## 觀點限制

- **作者立場**：雷蒙是 AI Agent 迷你課的講師，本文有部分是 Pro-kit08 / 課程的軟性推廣
- **單一個案**：「雙 AI 對辯儀式」目前只跑過 1 次，效果評估尚早
- **規模適用性未測**：文中描述的工作流複雜度（多 skill + 多 AI + 多儀式）對個人/小團隊合理，但對更大團隊或 production 環境是否適用未驗證
- **「描述清楚 = 真資產」的隱含成本**：寫得清楚是有成本的（時間 + 結構化思考力）——文章沒談這個 trade-off

## 對話組與未建立的相關 entity

| Entity | 角色 | 建頁優先序 |
|--------|------|----------|
| 雷蒙 / Leimon / Kairos | 作者 / 個人 OS 治理者 / AI Agent 迷你課講師 | 中——再出現 1 次即建 |
| Antigravity | Google 的 agent CLI 平台（三棲遷移目標之一）| 中——再出現 1 次即建（與 [[Claude Code]] / [[OpenAI-Codex-CLI|Codex]] 同類）|
| consensus-builder | 雙 AI 對辯使用的 sub-skill | 低——個別工具 |
| Pro-kit08 雙棲使用清單 | 課程教材文檔 | 低——課程材料 |
| Dual-AI-Review-Ritual | 雙 AI 對辯這套儀式作為一個 pattern | 中——若再有其他案例驗證可獨立成 concept 頁 |
| Tool-Assetization（工具的資產化）| 「用得不爽 + 一天能解 → 自己刻」的決策準則 | 中——可作為與 [[Ratchet-Pattern]] 並列的個人 OS pattern |
| Skills-As-Portable-Artifacts | 「Skill / Workflow 寫成 AI agnostic markdown」這個設計思路 | 中——已多次在 wiki 中提及，值得獨立 |

## 與既有頁面的對話

- 與 [[Vibe-Coding]] / [[src-gask-ai-agent-vs-vibe-coding]]：同樣是「AI 工作流的正確使用方式」討論，但角度不同。Gask Huang-Kai 主張「AI Agent + Skill > Vibe Coding」（針對中小企業）；雷小蒙主張「不被任何 AI 公司綁死」（針對個人 OS 韌性）。**兩篇可作對比閱讀**：Gask 講「正確的 AI 使用模式」，雷小蒙講「即使用對了，也要設計可遷移性」。
- 與 [[HermesOS]] / [[src-hermes-agent-99-cases]]：HermesOS 是「商業包裝層」，本文是「個人 OS 層」——前者把可遷移性做成 SaaS 賣，後者把可遷移性做成自家文檔包。兩條路。
- 與 [[Ratchet-Pattern]]：雷蒙的「描述清楚就是資產」幾乎是 Ratchet 原則的孿生 sibling——一個是「失敗編成永久規則」（學習側），一個是「做對的事編成可複用文檔」（生產側）。
- 與 [[HyperFrames]]：本文補了 HyperFrames 一個額外的使用場景（影片 broll 說明交給 AI），未來若做 HyperFrames 深度頁可回過來引用。

---

## 個人吸收（2026-05-28 ingest 當下）

### 我記得的重點（不看文章寫）

**「不被任何 AI 公司綁死」的策略**——核心綱領。

### 我打算的應用場合

**規劃自己的 Skill / Workflow 怎麼寫才能跨平台**。

### LLM 觀察的對位 / 錯位

`記得的論點` 跟 `要用的場合` **方向對位但層級錯位**：

- 方向對位：「不被綁死」是 why，「跨平台 workflow」是 how，兩者本來就是因果關係 ✓
- 層級錯位：你記住的是「**綱領**」（不被綁死），真要用在「**寫 Skill 怎麼跨平台**」的場合，需要的是文章裡的**下位執行細節**：
  - **Pro-kit08 雙棲使用清單**——具體做法是「寫一份給 Codex 讀的清單，把 Claude Code 配置轉成 Codex 配置」（這是「跨平台 workflow」最直接的 worked example）
  - **「描述清楚 = 真資產」**——這是寫 Skill 時的核心心法（描述夠完整就是 AI agnostic 的，不需要 AI-specific 包裝）
  - **「不能互讀再寫」**（雙 AI 對辯）——這是 workflow 設計時的「避免汙染」原則

跟上次 [[src-tsao-hsing-cheng-tsmc-rca-history-2026-05|曹興誠 RCA 那篇]] 的對比：上次是「論點/場合**完全錯位**」（CMOS 商業決策 vs 台美關係），這次是「**方向對 + 層級錯位**」——好一檔次，但仍需要重組才能真用。

### 這個對位/錯位意味著兩條路

1. **如果想真在「寫 Skill 跨平台」場合用得上**：要把記憶從「不被綁死」綱領，往下擴一層到三個具體技巧：
   - **Pro-kit08 模式**：寫「AI A 讀完能轉成 AI B 配置」的轉譯文檔
   - **描述清楚原則**：寫 SKILL.md 時測「換個 AI 還能跑嗎」這個 acceptance criteria
   - **不互讀再寫**：跨 AI 復盤 / 評估時的反汙染約定

2. **如果「不被綁死」綱領真的對你最有共鳴**：那它的真正應用場合可能不是「寫 Skill」（太具體），而是：
   - 看到新 AI 工具 / 服務時的「該不該投資、會不會被綁死」決策
   - 跟客戶 / 朋友解釋自己為什麼這樣設計工作流（對外論述）
   - 個人 OS 的長期策略 review（一年一次的高層 check）

### Spaced retrieval 建議

7-14 天後請我問你一次：「雷小蒙週報那篇你還記得什麼？特別是『跨平台 workflow』具體該怎麼寫？」看看 Pro-kit08 / 描述清楚 / 不互讀這三個下位執行細節有沒有真的留下來，或者你還是只記得「不被綁死」這個綱領。

## 相關來源

- [[src-gask-ai-agent-vs-vibe-coding]] — 同期另一個 AI 工作流論述，角度不同但可對比
- [[src-codex-hyperframes-prompt-pack]] — Codex + HyperFrames 工作流（本文有提到 HyperFrames 但不是主題）
- [[src-hermes-agent-99-cases]] / [[src-hermesos-cloud-landing]] — 另一條「商業化解決 AI 可遷移性」的路線

## 未來追蹤候選

- 雷蒙 / 雷小蒙再次出現時 → 建 entity 頁（已預埋）
- Antigravity 再次出現時 → 建 entity 頁（Google 的 agent CLI 平台）
- 「雙 AI 對辯儀式」第二次案例出現時 → 升級為 [[Dual-AI-Review-Ritual]] concept 頁
- 「工具的資產化」第二次案例出現時 → 升級為 [[Tool-Assetization]] concept 頁
- 雷蒙的提詞機 macOS App / 匯率轉換工具如果有公開 release，可獨立建頁
- Anthropic 6/15「拆錢包」事件後續影響 → 可獨立成事件追蹤頁
