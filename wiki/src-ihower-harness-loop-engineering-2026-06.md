---
title: 給 Agent 開發者的 Harness + Loop Engineering 系列（ihower，GAIConf 2026-06）
type: source
sources: ["給-agent-開發者的-harness-engineering-駕馭工程系列-愛好-ai-engineer-電子報-39-8211-ihower-blogging.md", "給-agent-開發者的駕馭工程-1-基礎-deep-agent-的六項內建能力-愛好-ai-工程-blog.md", "給-agent-開發者的駕馭工程-2-核心-agent-要的是回饋迴路不是完美提示-愛好-ai-工程-blog.md", "給-agent-開發者的駕馭工程-3-回饋時機一-工具回傳值-是寫給-agent-的回饋-愛好-ai-工程-blog.md", "給-agent-開發者的駕馭工程-4-回饋時機二-兩次-model-request-之間把訊息注入執行中的-agent-愛好-ai-工程-blog.md", "給-agent-開發者的駕馭工程-5-回饋時機三-單輪結束的驗收-goal-與-outcomes-愛好-ai-工程-blog.md", "給-agent-開發者的駕馭工程-6-回饋時機四-外層-loop-ralphsymphony-與-cron-愛好-ai-工程-blog.md", "給-agent-開發者的駕馭工程-7-進階-自我改進-harness-meta-harness-與爬坡-愛好-ai-工程-blog.md", "給-agent-開發者的駕馭工程-8-收尾-會過期的-harness-model-harness-fit-與-bitter-lesson-愛好-ai-工程-blog.md", "給-agent-開發者的駕馭工程-9-自建-agent-的框架選型-全套-deep-agent-還是從基礎構建-愛好-ai-工程-blog.md"]
created: 2026-06-29
updated: 2026-06-29
tags: [harness-engineering, loop-engineering, ihower, agent-development, feedback-loop, deep-agent, goal, outcome, ralph, symphony, cron, meta-harness, model-harness-fit, bitter-lesson, gaiconf]
confidence: 強
aliases: ["ihower Harness Engineering", "駕馭工程系列", "四個回饋時機點", "Loop Engineering", "Harness + Loop Engineering"]
---

# 給 Agent 開發者的 Harness + Loop Engineering 系列（ihower，2026-06）

[[ihower]] 在 2026/6/26 生成式 AI 開發者年會（GAIConf）的演講，搭配 9 篇 blog 系列《給 Agent 開發者的駕馭工程》（blog.aihao.tw）。

**獨特定位**：網路上多數 Harness Engineering 文章站在 **coding agent 使用者**角度，回答「harness 由哪些元件組成」（靜態清單）。ihower 這系列定位在**自行開發 AI Agent 的工程師**，回答「如何設計 Agent 的**回饋**，從工具執行內、request 之間、單輪結束、到外層 loop，由內而外四個時機點」——這是一個正交於既有元件清單的**時間軸切角**。詳細跨來源對照見 [[Harness-Engineering#四個回饋時機點框架ihower-視角]]。

> 演講投影片 ihower.tw/presentation/harness.html 為 reveal.js 動態渲染，本次未能擷取內容；以下整理自 9 篇 blog 子系列。

## 篇1 — 基礎：Deep Agent 的六項內建能力

- 今天所有 agent 的共同底層一句話：**一個 LLM 根據目標決定步驟、呼叫工具、觀察結果，再決定下一步，一圈一圈跑到任務完成**（Anthropic 稱 runtime 為「笨迴圈 dumb loop」——智能全在模型，迴圈只管每輪做什麼）。
- **Deep Agent（Agent 2.0）= 把六項能力內建進 LLM 迴圈**，讓 agent 從淺 agent 的 5–15 步升級到能跑 500 步、跨天的任務。六項：
  1. **Plan & Todos**（顯式 markdown 待辦取代隱式 CoT；Claude Code 的 Todo 工具其實是 no-op，純 context engineering）
  2. **Filesystem & Bash**（讀寫改檔 + 跑 shell，通常在 sandbox；「有 CLI 就能做完，不需要 GUI」）
  3. **Sub-Agent**（Orchestrator → 派耗 token 的研究/驗證給帶獨立 context 的子代理，只回精簡摘要；核心價值＝context 隔離 + 平行）
  4. **Memory**（跨 session 外部記憶如 CLAUDE.md/AGENTS.md；原則：記憶當 **hint 而非 fact**，行動前對照真實狀態驗證）
  5. **Skills**（按需動態載入的技能 prompt，用 progressive disclosure 避免 context rot）
  6. **更多工具**（MCP / Browser / Computer Use，非必要條件）
- **關鍵分界**：六項只解決「能不能做」，不解決「做得對不對、做完了沒」——後者（可驗收、可修正、可持續運行的回饋系統）才是整個 harness 系列要談的。
- 對照：LangChain《Deep Agents》四特徵（詳細 system prompt、規劃工具、子代理、檔案系統）；Philipp Schmid〈Agents 2.0: From Shallow Loops to Deep Agents〉。

## 篇2 — 核心：Agent 要的是回饋迴路，不是完美提示

> **系列主命題**：Agents need feedback loops, not perfect prompts。再怎麼改 prompt，沒有迴路就收斂不了。

- **Prompt → Context → Harness 三層疊加（不是取代）**：Prompt 管單次呼叫講清楚；Context 管當下掌握哪些資訊、別被污染；Harness 管 agent 一邊行動一邊怎麼收斂。Harness 的新意不在發明新工具（測試/linter/CI 本就有），而在**把既有工具重新接成 agent 的回饋迴路**。
- **基本策略：先 generate、再 verify**。模型有能力自我修正，但你不逼它，它不會主動做（LangChain：「自我驗證是最有效的槓桿」）。常見形狀：**plan → implement → verify → fix**。真正的工程問題是「怎麼確保 verify **真的會發生**」——寫 prompt 求模型自律 vs 用程式逼它非做不可，是兩種強度。
- **本質是控制論（cybernetics）**：沒有感測器的 agent = open loop，品質靠運氣。工程師從「盯著 agent 做」變成「設計環境與回饋迴圈」（類比瓦特離心調速器）。
- **Thoughtworks 兩軸 2×2 框架**（Birgitta Böckeler）：方向（前饋 guides / 回饋 sensors）× 型態（運算式 computational / 推論式 inferential）：

| | 運算式 Computational | 推論式 Inferential |
|---|---|---|
| **前饋 Guides**（行動前） | LSP、codemod/ast-grep、機器可讀架構約束 | AGENTS.md、Skills、how-to 文件 |
| **回饋 Sensors**（行動後） | 測試、linter、type checker、靜態分析、pre-commit | AI code review、LLM as Judge、review skills |

- **The Ratchet（棘輪）心法**（掛 Mitchell Hashimoto 名下）：把每次出錯當 harness 的永久訊號，做工程解法讓它再也不犯同一個錯。**雙向**——只在真實失敗時加約束，也只在模型強到約束變多餘時拆掉。「好的 AGENTS.md 每一行都該追得回一個具體出過的包。」→ [[Ratchet-Pattern]]
- **由內而外四個回饋時機點（系列骨架，越外越貴、巢狀）**：

| 時機 | 觸發頻率 | 成本 | 修正粒度 | 對應 hook |
|---|---|---|---|---|
| ① 工具執行內 | 每次 tool call | 毫秒 | 單一動作 | Pre/PostToolUse |
| ② request 之間注入 | 想注入時 | 趨近零 | 當前這一輪方向 | 無專屬 hook |
| ③ 單輪結束 | 每一輪 | 秒級 | 整輪產出 | Stop hook |
| ④ 外層 Loop | 每個 session | 分鐘到小時 | 整個任務 | 排程/外迴圈 |

## 篇3 — 回饋時機①：工具回傳值，是寫給 agent 的回饋

- **核心翻轉**：工具輸出不是寫程式的 function output，而是**寫給 agent 看的回饋（也是一段 prompt）**——可夾帶指示、metadata、下一步引導。這是修正成本最低、頻率最高的回饋點。
- **Tool Call 三段式介入**：執行前（驗證輸入，確定性檢查擋危險/無效呼叫）/ 執行後（檢查結果、必要時就地修復）/ 回傳時（夾帶指引）。
- **失敗要設計，成功也要設計**：錯誤訊息要可行動（附「該怎麼辦」），別把 DB 原始錯誤原封丟回；成功要回**完整狀態 (state)**（改幾行、影響幾筆、花多少 token）而非光禿禿的 `{"success": true}` 旗標——否則 agent 看不出「假完成」。
- **確定性檢查 vs 語意 Judge 取捨**：能事先寫死引導句的失敗用確定性檢查（快、穩、零延遲）；要看當下語意才講得清的才交給 judge（慢、貴、能附 reasoning）。四原則：能確定就不用 LLM、語意判斷才用 Judge、回饋必須可行動、延遲預算內完成。
- **回傳值控制大小**（Arize 逆向 4 個 harness：Pi/OpenClaw/Claude Code/Letta）：硬性上限（Claude Code 讀前 stat 擋 256KB）、頭尾保留、卸載到磁碟（只留 2KB 預覽 + 路徑）、附續讀提示（offset）。
- **second opinion**：自評不是獨立檢查（同套訓練/先驗/失誤模式）；工具如 consult-llm、Amp 的 oracle、`/codex:review`（合約寫死「只審查、不准改」）。

## 篇4 — 回饋時機②：兩次 model request 之間，注入訊息

- **時機定位**：agent 還在反覆呼叫工具、尚未輸出最終答案時，從外部插訊息立即影響後續動作。受 API 硬規則限制——每個 tool call 必須先補齊對應結果，中間不能插別的訊息（否則 400），所以注入只能在「當前工具結果收齊、湊成 API 合法狀態」後、下一個 model request 之前。
- **同位置承載兩類來源**：來源是「人」＝**steering**；來源是「程式」（背景工具結果、外部事件）＝**程式注入**。機制相同。
- **steering vs interrupt**：steering（不中斷，排佇列等下個 request 前注入，context 全保留）vs interrupt（中斷，harness 替沒答完的 tool call 補寫死字串 `aborted` 維持合法後停下）。對比 human-in-the-loop（刻意設計等待點主動停）。
- **背景工具結果的兩步機制**：第一步工具被呼叫時馬上回 `tool_result`（內容是「背景執行中，完成會自動通知你，先做別的」），配對完成；第二步背景完成時用 **user 角色** enqueue 結果（不能再用 tool_result）。
- 工具：Pydantic AI `enqueue`（`asap` / `when_idle` 兩模式）；Codex 2026-02 正式加入 mid-turn steering。
- **心法**：steering 是補救而非常態——一直需要中途修正，通常代表初始 prompt 不夠清楚；前饋（一次做對）與回饋（出錯再修）要一起設計。

## 篇5 — 回饋時機③：單輪結束的驗收，Goal 與 Outcomes（最長篇）

- **單步驗證 ≠ 整輪達標**：十句 SQL 句句合法，不保證合起來回答了問題。時機③在 agent「想完、正要收工」那刻攔截（Stop hook 層）。**核心精神：不能因為「模型覺得自己大概做完了」就算數**，要對著可驗證的停止條件（Goal）驗證，沒過就繼續。
- **Goal = 持久目標 (durable objective)**，是自我修正迴圈的基本構件。好的 Goal 是精簡契約，講清三件事：**終態**（做完什麼樣）、**證據**（用什麼驗證）、**限制**（不能弄壞什麼）。OpenAI Cookbook 模板：`/goal <終態> verified by <證據> while preserving <限制>`。
- **全篇主軸：三種實作沿「裁判有多獨立於做事的模型」排開**：

| | Codex /goal | Claude Code /goal | Managed Agents Outcome |
|---|---|---|---|
| 誰判定 | 主模型**自我審計** | 獨立的 **Haiku** | 全新 context 的 **grader** |
| 看什麼證據 | 自己 context 一切（含推理） | 刪減版 transcript | 只看 artifact，**實際操作**驗收（Playwright 點 UI/打 API/查 DB）|
| 怎麼宣告完成 | 主模型呼叫 `update_goal` | yes/no + 診斷 | rubric 逐條 pass/fail |
| 成本/延遲 | 趨近零 | 小 / 1–2 秒 | 數十倍 token / 約 8 分鐘 |

- **「資訊量」與「獨立性」是 trade-off 不是優劣**：Codex 資訊量最大但零獨立；Outcome 獨立性最大但只剩產出物，抓不到「亂改測試、違規操作」的 **corrupt success**；Claude Code 居中。學界同向：純自我修正缺外部回饋易失敗（Huang et al. ICLR 2024）；能讀檔跑指令的 Agent-as-a-Judge 可靠度接近人類（Zhuge et al. ICML 2025）。
- **驗證強度是 harness 可調參數**：「驗證的單價直接決定驗證能做到多細」——便宜驗證逐輪把關、昂貴驗證只能事後總驗（`max_iterations` 預設 3、最多 20）。成本量級：同一 2D 遊戲題，單一 agent 20 分鐘 ~$9（壞掉不能玩）vs 完整 harness 含獨立評估者 6 小時 ~$200（能玩），20 倍成本。
- **Codex 為何能不用獨立裁判**：把重心放模型層，靠 post-training 把自我驗證練進模型（薄 harness，呼應 Bitter Lesson），但訓練到位前是脆弱的（self-attribution bias：模型評估自己歷史行為時判斷力選擇性退化，錯誤行為退化最嚴重）。**勘誤**：網路文章誤稱 Codex 用 o4-mini 評分，讀原始碼 `ext/goal/` 根本沒有第二個模型。

## 篇6 — 回饋時機④：外層 Loop，Ralph、Symphony 與 Cron

- **定位**：前三時機都假設「一個 context 裝得下整個任務」；任務大到 context 裝不下（跑幾百步、跨天）、或新任務、或外部事件觸發，就要把迴圈往外推一層。
- **外層 Loop 最關鍵設計：把「進度」從 context 搬到磁碟**。每圈結束 context 清空，撐過多圈的不是模型記憶而是外部狀態（git history、progress.txt、看板 ticket）。Geoffrey Huntley：「**agent 會忘，但 repo 不會**。」
- **三種模式**：

| 模式 | 本質 | 情境 | 完成判定 |
|---|---|---|---|
| 🔁 **Ralph** | bash 蠻力重跑（`while :; do cat PROMPT.md \| claude-code; done`），每圈全新 context | 單一大任務 | 模型輸出 `<promise>COMPLETE</promise>`，外層 grep；配 max-iterations |
| 🎼 **Symphony** | 看板協調器當控制平面，以「任務」為中心非 session | 同時管很多平行任務 | 看板狀態機 + proof of work |
| ⏰ **Cron** | 定時/事件觸發 | 外部事件自動起跑 | 排程只管何時跑、不管完成度 |

- Ralph（Geoffrey Huntley）曾用 ~$297 API 成本做出原報價 $5 萬合約的 MVP；成功全靠內層（story 切到一個 context 裝得下、有 typecheck/測試、完成條件寫清楚）。**易混淆**：Anthropic 官方 `ralph-wiggum` plugin 用 Stop hook 在**同一 session** 攔結束重送 prompt，機制與原版「換新 context」**相反**——別只看名字，要讀 code。
- **Cron 的真正分界軸 = 每次觸發要不要沿用 context**：獨立 context（Claude Code **Routines** 雲端每次全新 clone、Codex standalone）vs 沿用 context **Heartbeat**（Claude Code `/loop` 綁單一 session、Codex thread automation、OpenClaw 24/7）。
- **Goal 與 Loop 不衝突**：Loop 管 scheduling（何時跑），Goal 管 termination（做到什麼程度才停）。swyx 五層 loop：token loop（秒）→ agent turn（分）→ /goal loop（時）→ **MetaLoop**（天，本篇外層 harness）→ open-ended loop（∞）。
- 金句（Peter Steinberger）：「你不應該再去提示寫程式的代理人了，你應該設計『讓你的代理人被提示』的迴圈。」

## 篇7 — 進階：自我改進 Harness，Meta-Harness 與爬坡

- **把「改 harness」本身也交給 agent**：前六篇是「人寫 harness、agent 在裡面跑」；本篇讓 agent 根據自己的 trace + eval 回頭改自己的 harness（Sydney Runkle 四層迴圈最外圈的 **hill climbing loop**）。
- **三層持續學習**（Harrison Chase）：Model 層（改權重，大廠的事）/ **Harness 層**（驅動程式 + 固定 prompt/工具，本篇主角）/ Context 層（指示、skills、記憶，OpenClaw 叫「做夢 dreaming」）。
- **心智模型**：傳統 ML 是「模型 + 訓練資料 + 梯度下降 → 更好的模型」；agent 是「**harness + evals + harness engineering → 更好的 agent**」。把 eval 當訓練資料。
- **三條自我改進路**：①讀 production traces → 錯誤分析 → 沉澱成新 Judge/規則；②Agent 當優化器用 eval 爬坡（紀律：切 holdout + regression gate）；③Self-Improving Skills（skillify，每輪教訓寫回帶測試的 skill）。
- **[[Meta-Harness]]（Stanford 論文）**：最佳化對象從 prompt 升級到「整個 harness」（system prompt + 工具定義 + 完成邏輯 + context 管理）。關鍵差別在「提案者能看到多少」——給提案者一個檔案系統放所有候選 harness 的原始碼/分數/traces，每步最多 1000 萬 token 診斷脈絡做「反事實診斷」。成績：讓 Haiku 4.5 演化出的 harness 在 TerminalBench-2 跑到 37.6%，所有 Haiku 4.5 agent 排第 1。
- **關鍵紀律**：自我改進 ≠ 想改什麼就改什麼。**「沒有關卡，就沒有自我改進」**——regression gate（每個修好的失敗變永久測試，整體不退步才收，否則 revert）+ 效益量測，是把「自我改進」與「自動作弊」分開的關鍵。否則 Goodhart / reward hacking（agent 為刷分移除「執行前確認」關卡、刪測試沒涵蓋的真功能）。
- **agent 越會自我改進，資深工程師越不可或缺**：被移出的是逐步操作那幾圈，留在最外圈做的是「**定義什麼叫做好，並守住它**」（grader/eval 設計、安全控管）。
- 金句：「**你的 system prompt 禁止清單，就是你的事故報告史。**」

## 篇8 — 收尾：會過期的 Harness，Model-Harness-Fit 與 Bitter Lesson

- **Harness 與模型綁在一起，而且會過期（一體兩面）**：模型是針對 harness 做 post-training 的，同套 harness 換個模型效果不一樣；harness 裡的元件多半在補某代模型的短處，模型變強後部分補強從幫手變阻力，該移除——難在事先分不出哪個是哪個。
- **Model-Harness-Fit**：harness 的工具格式、回饋節奏、context 策略、驗收方式，貼不貼合當下這個模型的訓練分布與能力邊界。描述「現在這個時間點」的狀態，非永恆定律。
- **「自建打贏原廠」與「模型對自家 harness 最順手」可同時成立**——把 harness 拆四層：任務分布 / **workflow 層（自建贏，貼任務分布）** / **內層 tool loop（原廠贏，一起訓練）** / 模型。守則：**內層留給原廠，workflow 層留給自己**。
- **每次模型升級都問「有什麼可以停止做？」**——逐項自查：這條 prompt 約束還在提高成功率還是只是慣性？這個強制規劃步驟還在防偏離還是只是拖慢？這個 subagent 真提高品質還是只多合併成本？這個工具格式還是這模型最熟的嗎？這是 ratchet 的**反方向**（也會減）。
- 相關概念：context anxiety（Sonnet 4.5 感覺 context 快滿就草草收尾）、scaffolding trap（舊腳手架反而跟模型新能力衝突）、The Harness Tax（「一月還在承重，三月就成了死碼」）。
- **最具體例子**：`apply_patch`（Codex 系 diff 格式）vs `edit_file`/`str_replace`（Claude 系字串取代）——同樣是改檔工具，但各自貼合自家模型訓練分布。
- **會過期 vs 不會過期（系列真正主軸）**：會過期的是各種具體 harness 做法（Bitter Lesson）；**不會過期的是「定義什麼叫做好」+「驗證它做到了」，即 Eval 與 Judge**。金句：「想待在前沿，你得在每次新模型發布時，刪掉你大半的程式碼。」

## 篇9 — 自建 Agent 的框架選型：全套 Deep Agent vs 從基礎構建

- **兩條路線**：(A)**全套 Deep Agent**（框架直接給跑得動、六項能力大多內建、附原廠調校 system prompt 的 agent，你做客製）：Codex SDK、GitHub Copilot SDK、Claude Agent SDK、LangChain deepagents；(B)**從基礎構建**（只給 agent/工具/handoff/workflow/session 元件，連 system prompt 都自己寫，換完全可控）：Strands→Google ADK→MS Agent Framework→OpenAI Agents SDK→Pydantic AI→Vercel AI SDK→LangGraph（最低階）。
- **用篇1 六項能力當統一對照標準**逐項檢視（✅內建/🟡要開/🔧自己接）。
- **「核心開不開源」是路線一最易被忽略的差異**：Codex 連 agent loop 都開源（Apache 2.0）；Claude Agent SDK / Copilot SDK 是「對外套件開源、真正核心閉源」——看得到改不了，對 production debug/維護影響大。
- **選型看用途**：B2C 大規模產品 → 從基礎構建（token/延遲/成本低、可換供應商）；自用/企業內部、要疊自己 harness → 從現成 deep agent 開始；要讓使用者帶自己 ChatGPT 訂閱登入 → 看 Codex SDK（Claude Agent SDK 第三方只能用 API key）。
- 金句：「框架是起點不是終點……不管選哪邊，框架幫你接好的都還是第 1 篇講的『能不能做』。真正讓 agent 做得對、做得完的那套 harness，不管哪個框架都得自己建。」

## 來源性質與信心

- **類型**：技術論述/框架型（資深工程師演講系列，大量引用一手原始碼觀察 + 學界論文 + 業界實作）。
- **信心：強**。9 篇互相支撐、論點有原始碼級證據（mitmproxy 攔封包、讀 `ext/goal/` 原始碼勘誤）、引用學界（ICLR/ICML）與多家業界實作，且作者明確標註自己的觀察 vs 引用。少數成本數字（$297、$200）為個案，當量級參考。

## Key Quotes（原文引用）

> 「Agents need feedback loops, not perfect prompts.」（系列主命題）

> 「AI is not wrong, you just have not built the harness correctly.」— Aparna Dhinakaran

> 「The model contains the intelligence and the harness is the system that makes that intelligence useful. If you're not the model, you're the harness.」— LangChain

> 「不能因為『模型覺得自己大概做完了』就算數。完成與否，要對著一個停止條件去驗證，沒過就繼續做。」（篇5）

> 「沒有關卡，就沒有自我改進。」「你的 system prompt 禁止清單，就是你的事故報告史。」（篇7）

> 「harness 會過期；替 harness 定義『對不對、完了沒』的那套 eval 與 judge，不會。」（系列收尾）

## 關聯

- [[Harness-Engineering]] — 本系列主要沉澱地；新增「四個回饋時機點」時間軸切角
- [[Meta-Harness]] — 篇7 Stanford Meta-Harness 論文 + 自我改進 harness
- [[Ratchet-Pattern]] — 篇2 棘輪心法來源之一；篇8 補上「棘輪也會減」的反方向
- [[Context-Engineering]] / [[Context-Rot]] — 篇1/篇3 的 progressive disclosure、回傳值控制大小、dumb zone
- [[Subagent-Driven-Development]] — 篇1 Sub-Agent context 隔離、篇5 獨立裁判 subagent
- [[決策疲勞]] — 與 [[src-jiuann-ai-codev-decision-fatigue-2026-06|酒Ann]] 互補：酒Ann 是「coding agent 使用者」如何降決策，ihower 是「agent 開發者」如何設計回饋讓 agent 自己收斂
- [[Agentic-AI-Workflow]] / [[Prompt-Pack-Pattern]] — plan→implement→verify→fix 工作流
- [[ihower]] — 作者實體頁
- [[AGENTS-md]] / [[CLAUDE-md]] — 前饋記憶檔（Thoughtworks 2×2 的推論式前饋格）

---

## 個人吸收（第 11 次 / spaced retrieval 預定 2026-07-13）

### Quiz 答案

**Q1（怎麼確認 agent 真的做完了）：**
> 「請他寫測試、另外一個 agent 例如 codex review、人工審核。」

**Q2（打算用在什麼場合）：**
> 「擴充認知背景 / 改善跟現成 coding agent 的協作。」

### LLM 觀察：論點 / 場合錯位分析

**Q1 對位極強（罕見的正向對位）**：你的三種驗證手段，正好落在 ihower 全系列篇5 的主軸——**「裁判有多獨立於做事的模型」這條光譜**上：
- 「請他寫測試」= 運算式回饋（篇2 的 computational sensor）+ 篇5「機械化證明完成」（測試全綠）
- 「另一個 agent codex review」= 篇3 second opinion + 篇5「獨立裁判」（資訊量 vs 獨立性 trade-off 的中段，Claude Code 用 Haiku 那一格）
- 「人工審核」= human-in-the-loop（篇4 對比過的「刻意等待點」）

你的直覺已經在實踐系列核心「驗證 > 完美提示」，且自發地覆蓋了獨立性光譜的三個點。這次沒有「記錯論點」的錯位。

**錯位 —「抽象層級 / 讀者層級錯位」（既有「場合 > 工具」大類新變體）**

關鍵在 Q2 的「改善跟現成 coding agent 的協作」場合。ihower 開篇就明確定位：**「多數 Harness 文章站在 coding agent 使用者角度，我這次定位在自行開發 AI Agent 的工程師」**。所以：
- **對「擴充認知背景」場合 → 全篇對位**（四個回饋時機點、驗證精神、ratchet、harness 會過期，都是上層心法）。
- **對「改善跟現成 coding agent 協作」場合 → 只有上層概念可遷移，大量實作篇幅對應不到你**：篇4（mid-run injection 的 API 400 規則、enqueue）、篇7（eval/regression gate/Meta-Harness）、篇9（框架選型）是給「**自建** agent 的人」的，你作為「**使用** coding agent 的人」用不到那個粒度。
- 這是與第 9 次「受眾錯位」不同的變體：第 9 次是「同一主張對不同受眾處方相反」；這次是**來源的預設讀者層級（開發者）≠ 你的實際身份（使用者），導致內容可操作粒度對你偏深**。
- > **紀律（沿用第 7–10 次）**：標為「場合 > 工具」大類的「**抽象層級/讀者層級錯位**」變體，樣本 1 次，不升大類。

### 重組路徑建議（把 9 篇拆成「使用者能用的」vs「開發者才用的」）

針對你的真實場合「改善跟現成 coding agent 協作」，**只要帶走這幾條上層心法，其餘當認知背景**：

1. **四個回饋時機點當心智地圖**：你跟 Claude Code 協作時，意識到自己的介入點落在哪一層——你現在的「測試/codex review/人工」全是**時機③（單輪結束驗收）**。可以往**時機①**補：用 hooks（PreToolUse 擋危險操作、PostToolUse 跑快速檢查），把驗證左移、變便宜。
2. **善用 `/goal`（Claude Code / Codex 都有）**：你已經在做「驗證」，但可以把它**形式化成 Goal 契約**——終態 / 證據 / 限制三件事寫清楚，讓 agent 自己對著停止條件迭代，而不是你每輪手動判斷（這也接回 [[src-jiuann-ai-codev-decision-fatigue-2026-06|酒Ann 的降決策]]）。
3. **「驗證強度是可調參數」**：低風險任務用便宜驗證（測試/型別檢查逐輪把關），高風險才上「獨立 agent / 人工」這種貴驗證。不要一律人工審核（耗你的決策腦力），也不要一律自評（漏掉 corrupt success）。
4. **記住「harness 會過期」**：你給 Claude Code 的 CLAUDE.md 規則，每次模型大升級（如 Opus 換代）該回頭問「哪條約束已經多餘了？」——別讓舊規則變死碼拖累更強的模型。

### Spaced retrieval 約定（~2026-07-13，14 天後）

回測題：
1. 不看本頁——「由內而外四個回饋時機點」是哪四個？你跟 coding agent 協作時，你的介入最常落在第幾個？
2. 「資訊量 vs 獨立性」這條 trade-off 你記得嗎？你的「codex review」是偏資訊量還是偏獨立性？
3. 這 14 天你有沒有把任何一次手動驗證，改成寫成 `/goal` 契約讓 agent 自己迭代？
4. 「harness 會過期」——你的 CLAUDE.md 有沒有哪條規則，其實在現在的模型上已經多餘了？

### 對應 [[Ratchet-Pattern]]

第 11 次吸收檢核促成的擴充：
- **對位 taxonomy「場合 > 工具」大類新增變體「抽象層級/讀者層級錯位」**（來源預設讀者層級 ≠ 使用者身份，導致可操作粒度不匹配）；樣本 1 次。
- **新 heuristic**：quiz 後追問「**這篇是寫給『做這個東西的人』還是『用這個東西的人』？你是哪一種？**」——專破「使用者讀了開發者文件，誤以為整篇都該照做」。
- **正向案例記錄**：本次 Q1 是 11 次以來少見的「直覺已對位核心論點」——使用者既有實踐（測試/獨立 agent/人工）自發覆蓋了來源的核心光譜。吸收不總是抓錯位，也要肯定對位，避免為了找錯位而強加。
