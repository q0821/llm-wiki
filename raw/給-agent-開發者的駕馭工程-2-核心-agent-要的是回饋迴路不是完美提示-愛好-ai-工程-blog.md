<!-- source-url: https://blog.aihao.tw/2026/06/26/harness-engineering-2-what-is-harness-engineering/ -->
<!-- title: 給 Agent 開發者的駕馭工程 (2): 核心: Agent 要的是回饋迴路,不是完美提示 | 愛好 AI 工程 Blog -->
<!-- fetched: 2026-06-29 -->

[愛好 AI 工程 Blog](/) 

[關於本站](https://blog.aihao.tw/about/) [ 訂閱電子報 ](https://ihower.tw/opt-in/gai) 

# 給 Agent 開發者的駕馭工程 (2): 核心: Agent 要的是回饋迴路,不是完美提示

2026-06-26 

AgentContext EngineeringEval 

![給 Agent 開發者的駕馭工程 (2): 核心: Agent 要的是回饋迴路,不是完美提示](https://blog.aihao.tw/assets/images/harness-engineering-2/cover.png) 

📚 給 Agent 開發者的駕馭工程 (全 9 篇)

1\. [基礎: Deep Agent 的六項內建能力](https://blog.aihao.tw/2026/06/26/harness-engineering-1-deep-agent-capabilities/)

2\. **核心: Agent 要的是回饋迴路，不是完美提示** (本篇)

3\. [回饋時機一: 工具回傳值，是寫給 agent 的回饋](https://blog.aihao.tw/2026/06/26/harness-engineering-3-tool-execution-feedback/)

4\. [回饋時機二: 兩次 model request 之間，把訊息注入執行中的 agent](https://blog.aihao.tw/2026/06/26/harness-engineering-4-mid-run-injection/)

5\. [回饋時機三: 單輪結束的驗收，Goal 與 Outcomes](https://blog.aihao.tw/2026/06/26/harness-engineering-5-goal-and-outcomes/)

6\. [回饋時機四: 外層 Loop, Ralph、Symphony 與 Cron](https://blog.aihao.tw/2026/06/26/harness-engineering-6-outer-loop/)

7\. [進階: 自我改進 Harness, Meta-Harness 與爬坡](https://blog.aihao.tw/2026/06/26/harness-engineering-7-self-improving/)

8\. [收尾: 會過期的 Harness, Model-Harness-Fit 與 Bitter Lesson](https://blog.aihao.tw/2026/06/26/harness-engineering-8-model-harness-fit/)

9\. [自建 Agent 的框架選型: 全套 Deep Agent 還是從基礎構建?](https://blog.aihao.tw/2026/06/26/harness-engineering-9-agent-frameworks/)

🎞️ 搭配演講投影片: [給 Agent 開發者的 Harness+Loop Engineering](https://ihower.tw/presentation/harness.html)

上一篇把 Deep Agent 的六項內建能力一項一項拆完，結論是: 它們解決的全是「能不能做」，沒有一項回答「做得對不對、做完了沒」。這一篇進正題，把 Harness Engineering 這個詞講清楚: 它到底是什麼、不是什麼。這是整個系列的定位基準，後面幾篇談的具體做法，都會回到這裡。

先講結論: harness engineering 不是一份「裝了哪些功能」的清單。MCP、skills、sub-agent、hooks 這些都只是手段。真正的主軸是一件事: 怎麼讓 agent 在行動的迴圈裡被約束、被檢查、被修正，甚至越跑越好。

## 「做完了」誰說了算

上過線的人應該都遇過這個場景: agent 很有自信地宣稱「已全部完成 ✅」，但東西是壞的。測試沒跑、需求漏了一半，你一指出問題，它立刻道歉，然後再犯一次。

這不是個案。[Anthropic 整理長時間執行 agent 的失敗模式](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents)，排在第一名的就是「過早宣告完成」(premature completion)。自我感覺良好就交差，幾乎是今天模型的通病。六項能力讓 agent 能做很多事，卻沒有東西告訴它「這樣到底對不對、夠不夠」。

這就帶到 [Aparna Dhinakaran](https://x.com/aparnadhinak/status/2034160346840301706) 那句在社群被轉很多次的話:

> 「AI is not wrong, you just have not built the harness correctly.」 (AI 沒有錯，是你的 harness 沒搭好。)

這句話的態度很重要: 把 agent 的每次出錯，當成 harness 的一個**永久訊號**，而不是只當成模型一次性的失誤。它漏跑了測試，那就讓「漏跑測試」這件事在系統層面再也不可能發生，而不是下次再提醒它一遍。

能這樣做的前提，是 agent 的失敗通常**指認得出來**: 你多半講得出它哪裡錯、該補哪一塊。[Addy Osmani](https://addyosmani.com/blog/agent-harness-engineering/) 把它拆成一條條對照: agent 不知道某個慣例，就把慣例寫進 AGENTS.md;它跑了破壞性指令，就加一個 hook 擋掉;它在四十步的任務裡迷路，就拆成 planner 和 executor 兩個角色;它老是交出跑不過的程式碼，就把 typecheck 設成強制檢查，沒通過就不准收工。每個失敗都對得上一個具體修法，「把錯誤變成規則」才不只是一句口號。[HumanLayer](https://www.humanlayer.dev/blog/skill-issue-harness-engineering-for-coding-agents) 把這件事講得更白: 這通常不是模型問題，是配置問題。

Mitchell Hashimoto 有一句話總結了這個心法，被反覆引用 (HumanLayer 把它掛在他名下，Addy 那篇也拿它當開場):「每當你發現 agent 犯了一個錯，你就花時間做一個工程上的解法，讓它再也不會犯同一個錯。」英文社群把這套心法叫 the ratchet (棘輪)。不過棘輪是雙向的: 你只在看到真實失敗時才加一條約束，也只在某天模型強到讓那條約束變多餘時，才把它拆掉。所以一份好的 AGENTS.md，每一行都該追得回一個具體出過的包。至於「約束會隨模型變強而退場」這半邊，是這個系列最後一篇要回來談的，這裡先按下。

## 不是取代，是一層層疊上去

要定義 harness engineering，得先把它跟前面兩個熟悉的詞擺在一起。很多人會把 Prompt → Context → Harness 講成一條「演進」的路，好像後面的把前面的取代掉了。實務上不是這樣，它們高度重疊，只是每個詞出現的時候，社群正在試圖凸顯一個新的工程焦點。

| |  核心問題                 | 典型技術                                             |                                       |
| ----------------------- | ------------------------------------------------ | ------------------------------------- |
| **Prompt Engineering**  | 怎麼讓模型**這一次**回答得更好                                | system prompt、few-shot、格式指令           |
| **Context Engineering** | 在 context window 的限制下，怎麼**選擇、篩選**該放進 context 的資訊 | RAG、memory、compaction、工具輸出卸載          |
| **Harness Engineering** | 怎麼讓 agent 在**行動迴圈**裡被約束、檢查、修正，甚至越跑越好             | 前饋 guides、回饋 sensors、eval gates、hooks |

這三層是疊加，不是替換。Prompt 管單次呼叫怎麼把話說清楚;context 管模型當下該掌握哪些資訊、別被污染;harness 管 agent 一邊行動一邊怎麼收斂。HumanLayer 甚至直接把 harness engineering 視為 context engineering 的子集，差別只在它特別關注「用配置點來管理整個 agent 行動迴圈的 context」。所以這裡有個判斷標準: 凡是 harness 出現之前就已經存在的東西 (測試、linter、CI)，它們本來就在，不是 harness engineering 發明的;harness engineering 的新意，是把這些既有工具重新接成 agent 的回饋迴路。

> 編按: Context Engineering 這層不是本系列的主題，但它本身是個完整的題目。想補齊這塊的讀者，可以看 ihower 寫的 [什麼是 Context Engineering 上下文工程?](https://ihower.tw/blog/12817-context-engineering)，裡面把寫入、選擇、壓縮、隔離 context 這四種做法整理得蠻清楚;更偏實作的話，ihower 在 WebConf Taiwan 2025 的演講 [實戰 AI Agents 應用開發: TTFT 和 Prompt Caching](https://ihower.tw/blog/13501-practical-ai-agents) 也談了 Web Agent 的部署、可觀測性、Prompt Caching 與 Context Engineering 等實戰主題。

## Agent = Model + Harness，然後呢?

LangChain 在 [《The Anatomy of an Agent Harness》](https://www.langchain.com/blog/the-anatomy-of-an-agent-harness) 裡給了一個被大量引用的定義:

> 「模型提供智能，harness 是讓那份智能變得有用的系統。」(The model contains the intelligence and the harness is the system that makes that intelligence useful.)

配套口訣是: 「如果你不是模型，那你就是 harness。」(If you’re not the model, you’re the harness.) 模型以外的一切，system prompt、工具、編排邏輯、hooks，全算 harness。

這個定義乾淨，但 ihower 的吐槽是: 用「模型 + harness」來定義 agent，對理解 harness 幾乎沒幫助，等於把模型以外的東西全部塞進「harness」這個標籤，講了跟沒講一樣。它劃了一條邊界，卻沒告訴你 harness 內部該怎麼想、該往哪裡用力。我們需要的是更可操作的拆法，不是一句包山包海的話。

## 那 harness 的基本策略是什麼? 先 generate，再 verify

在拆解結構之前，先講大方向。如果問「harness 到底要讓 agent 建立什麼行為」，把這幾家的文章攤開看，反覆被當成核心策略明講的其實只有一件事: **驗證 (verification)**。

[LangChain 的第二篇實戰文](https://www.langchain.com/blog/improving-deep-agents-with-harness-engineering) 講得最直白。他們發現最常見的失敗長這樣: agent 寫完一個解法，回頭重讀自己的程式碼，確認「看起來沒問題」，然後就停了。這篇的結論是: 「自我驗證 (self-verification) 是最有效的槓桿」，而且「今天的模型是很強的自我改進機器，但它們沒有自發進入『寫完就驗證』這個迴圈的傾向」。換句話說，模型有能力自我修正，但你不逼它，它不會主動做。

那這套「先做、再驗」的策略，落到具體流程上長什麼樣? 常見的形狀是 **規劃 → 實作 → 驗證 → 修 (plan → implement → verify → fix)**:

* LangChain 直接把這四步寫進 system prompt: Planning & Discovery → Build → Verify → Fix。
* Anthropic 則主張把它拆給不同 agent: planner / generator / evaluator，讓「生成」跟「評估」由不同 agent 來做，比同一個 agent 自評更可靠。
* walkinglabs 的課程把它寫成一個 session 生命週期: START → SELECT → EXECUTE (內含 implement → verify → fix) → WRAP UP。

這套流程比較像是「驗證」這個核心主張的自然延伸，是小編從多份資料裡歸納出的共同形狀，不是哪一家冠名的策略。資料真正反覆強調的，上游是前面講的 ratchet 心法，下游是 verify 這一段。

策略講完，真正有意思的工程問題才浮現: 你怎麼確保 verify「真的會發生」? 寫在 prompt 裡求模型自律，跟用程式逼它非做不可，是兩種完全不同強度的做法。這就需要一組座標把它們分開。

## 兩個軸，把 harness 攤平

Thoughtworks 的 Birgitta Böckeler 在 [Harness engineering for coding agent users](https://martinfowler.com/articles/harness-engineering.html) 提供了小編覺得最好用的一組座標。她用兩個軸把 harness 攤平: 一個是**方向** (行動前 vs 行動後)，一個是**執行型態** (確定性的程式 vs 推論的 LLM)。

* **方向**: 前饋 (feedforward) 的「引導器 guides」，在 agent 動手**之前**先引導它，提高一次做對的機率;回饋 (feedback) 的「感測器 sensors」，在 agent 動手**之後**觀察結果、逼它自我修正。
* **執行型態**: 運算式 (computational) 是確定性的、毫秒級、結果可靠;推論式 (inferential) 是用 LLM 做語意判斷，比較慢、比較貴、也比較不穩。

兩軸交叉成一個 2×2，每一格都裝得下具體技術:

| |  運算式 Computational (確定性程式) | 推論式 Inferential (LLM 生成)                    |                                           |
| ---------------------------- | ------------------------------------------- | ----------------------------------------- |
| **前饋 Guides** (行動前引導)        | LSP、結構化改寫 (codemod／ast-grep)、機器可讀的架構約束      | AGENTS.md、Skills、bootstrap 指示、how-to 文件   |
| **回饋 Sensors** (行動後修正)       | 測試、linter、type checker、靜態分析、pre-commit hook | AI code review、LLM as Judge、review skills |

要補一句: Thoughtworks 原文整個都是站在 coding agent 的場景講的，ihower 這裡把它擴充到任意一種自建 agent 應用。這個框架本身跟 coding 無關，一個金融 data agent、一個 RAG 問答、一個訪談 agent，同樣可以問自己「我的前饋引導在哪、回饋感測在哪、哪些用程式判定就好、哪些非得用 LLM 不可」。

Böckeler 還具體談了這些 guides 跟 sensors「該擺在開發流程的哪個位置」: 快又便宜的 (linter、快速測試、基本 review) 應該盡量往左移，在 commit 前就跑;貴的 (mutation testing、需要看大局的深度 review) 放到整合後的 pipeline;另外還有一類「持續漂移感測」，像死碼偵測、測試覆蓋率品質、相依性掃描，是掛在整個 codebase 上長期跑的，不綁在單次改動上。這套「把品質檢查盡量往左」的思路，本來就是持續整合的老智慧，只是現在多了一種推論式的感測器可以擺進去。

回到那個強度問題，答案就藏在這張表的「上下兩列」: verify 寫在 AGENTS.md 裡求模型照做，屬於上面的前饋，是軟性的、機率性的;verify 用 hook 強制跑、不過不准收工，屬於下面的回饋，是硬性的、確定性的。同一個「要驗證」的願望，可以同時散落在不同格子裡，強度天差地別。

## 好的 harness 做兩件事

把 2×2 濃縮成一句話: 好的 harness 同時做兩件事，提高「一次做對」的機率，並且在出錯時自我修正。

🧭 Guides 前饋

提高「一次做對」的機率

文件、skills、範例、架構約束。軟性引導，做不做最後還是 agent 決定。

📡 Sensors 回饋

行動之後感測並逼它修正

測試、linter、judge、review。用程式強制執行，不靠模型自覺。

### 前饋 Guides: 一切從你的指令開始

前饋就是用自然語言事先告訴 agent 該怎麼做。自行開發 agent 時，這一步就是你寫的 system／developer prompt，你得在裡面把「好結果長什麼樣」講清楚。至於要寫到多明確、多強硬，不妨看看成熟的 coding agent 怎麼做，它們的 system prompt 直接把「要驗證」寫成了 MUST 等級的指示。

Claude Code 的 system prompt 裡有這麼一句:

> 「非常重要: 當你完成一個任務，你**必須**執行 lint 和 typecheck 指令 (例如 npm run lint、npm run typecheck、ruff 等)，如果有提供這些指令的話，以確保你的程式碼正確。」 (VERY IMPORTANT: When you have completed a task, you MUST run the lint and typecheck commands … to ensure your code is correct.)

它甚至接著交代: 如果找不到正確的檢查指令，要主動問使用者，問到了還要建議把它寫進 CLAUDE.md，這樣下次就知道要跑。Codex 那邊要求得更嚴格:

> 「如果 AGENTS.md 裡含有用來驗證你工作成果的可程式化檢查，你**必須**全部執行，並盡最大努力驗證它們通過。這條規定即使是看起來很簡單的改動，例如改文件，也一樣適用。」 (If the AGENTS.md includes programmatic checks to verify your work, you MUST run all of them … This applies even for changes that appear simple, such as documentation.)

回到你自己的 agent。如果是自行開發，這些前饋就寫在你的 system／developer prompt 裡;如果是在現成的 coding agent 上工作，對應的就是那份 AGENTS.md / CLAUDE.md，它每一輪都會被注入 system prompt，適合放專案慣例、領域知識、輸出格式、哪些事不要做。想看這類記憶檔該寫什麼、不該寫什麼，可以參考 [AGENTS.md / CLAUDE.md 該寫什麼、不該寫什麼?](https://blog.aihao.tw/2026/05/03/agents-md-research-and-practices/)。如果想看一份完整的前饋 harness 長什麼樣，walkinglabs 的 [learn-harness-engineering](https://github.com/walkinglabs/learn-harness-engineering) 把它拆成五個子系統: 指示 (instructions)、狀態 (state)、驗證 (verification)、範圍 (scope)、生命週期 (lifecycle)，它有一句總結很到位: 「模型決定要寫什麼程式碼，harness 決定它何時、在哪、怎麼寫。」敏捷三叔公那篇 [用 Claude Code 從零打造 To-Do List 的最小可行 harness](https://agile3uncles.com/2026/04/15/claude-code-harness-web-to-do-list/)，則是手把手示範怎麼用一份 CLAUDE.md，把「寫 → 測 → 修」這個回饋迴路的規則寫進去。

但前饋有個上限: **它終究只是軟性引導，是機率性的。** 你在 AGENTS.md 寫一百遍「一定要驗證」，模型還是有可能跳過。它就是個機率裝置，不是保證。

### 回饋 Sensors: 把 verify 變成強制執行的檢查

要讓「驗證」從一句願望變成強制執行，得靠回饋這一列的程式化感測器。

以 coding 場景來說，具體做法就是 hook、pre-commit、CI gate 這些程式碼層級的強制點:

* HumanLayer 用一個 Stop hook，在 agent 想收工時跑 typecheck 和 formatter，只要失敗就回傳 exit code 2，逼 agent 繼續修到通過為止。成功時完全靜默，失敗時才把錯誤訊息丟回去。
* LangChain 用一個 PreCompletionChecklistMiddleware，在 agent 退出前攔截它，強制它對著任務規格再跑一輪驗證才准走。
* walkinglabs 則把驗證收斂成一個 `harness-verify` 腳本 (lint + type-check + test + build 一次跑完)，設成強制檢查點。

缺了這些程式化的強制檢查，agent 永遠只能靠自我感覺良好交差，你也只能用肉眼一行行盯。

不過光靠回饋也有它的問題: 只有回饋、沒有前饋，常會看到 agent 寫程式碼 → 測試失敗 → 改 → 再失敗，繞好幾圈還是超時。這通常不是回饋不夠，而是 agent 從頭就不知道「對的結果」長什麼樣。此時該加強的是前饋 (架構文件、慣例、Skills)，前饋負責一開始走對方向，回饋負責把關，兩個都要。

而且回饋 sensors 不只 coding 場景用得到。這個系列會把場景擴大到非 coding 的自建 agent，而 sensors 正是本場的重點: 後面會細談回饋的四個時機點，以及每個時機能用哪些方式把回饋接回迴圈，不同做法在強制性、成本、可靠度上各有優缺點。

## 核心其實是控制論

為什麼回饋這麼關鍵? ihower 覺得控制論 (cybernetics) 拿來比喻 harness 蠻貼切的。

George ([@odysseus0z](https://x.com/odysseus0z/status/2030416758138634583)) 寫過一個對照很到位的例子。1780 年代瓦特的離心調速器發明之前，蒸汽機旁邊得站一個工人，用手調節汽門;發明之後，飛球機構自己感測轉速、自動調節汽門。工人沒有消失，他的工作變了: 從顧著轉閥門，變成設計那個調速器。

| |  感測                   | 致動              | 工程師的工作變成      |                                |
| ----------------------- | --------------- | ------------- | ------------------------------ |
| **瓦特離心調速器** (1780s)     | 飛球感測轉速          | 自動調節汽門        | 從顧著轉閥門，變成**設計調速器**             |
| **Harness Engineering** | 測試、judge、review | agent 自我修正、重試 | 從盯著 agent 一步步做，變成**設計環境與回饋迴圈** |

同樣的模式重演: 有人造出夠強的「感測器 + 致動器」，把控制迴圈在那一層接起來，人就從操作者變成設計者: 不再親手轉閥門，而是去設計整個迴圈。

反過來說，一個沒有感測器的 agent 就是一個**無回饋迴路 (open loop)**: 指令發出去、結果聽天由命，品質全靠運氣和模型當天的狀態。這也是為什麼這個系列想反覆強調的一句話是: agent 需要的是回饋迴路，不是完美的提示 (Agents need feedback loops, not perfect prompts)。你再怎麼改 prompt，沒有迴路它就收斂不了。

## harness 是影響表現的一大關鍵

harness 不是模型的附屬品，它本身就是決定 agent 表現的一大關鍵。同一個模型，換一套 harness，結果可以差很多，這點在公開 benchmark 上看得很清楚。

LangChain 拿 Terminal Bench 2.0 做過示範: 固定 `gpt-5.2-codex` 不換模型，只調 harness (system prompt、middleware、推理預算的分配)，分數就從 52.8% 拉到 66.5%。另一個常被引用的對照是 Opus 4.6: 同一個模型在不同 harness 下，差距已經大到足以改變它在排行榜上的排名。

## 本場的工作定義

把前面收攏成一句可操作的定義，作為整個系列的錨點:

> **Harness Engineering: 讓 agent 根據目標，持續、正確地動作的工程。**

核心材料是「回饋訊號」: 你得有東西能判斷**做得對不對、做完了沒**。沒有這個訊號，前面講的一切都只是無回饋迴路。

## 回饋的四個時機

那回饋到底「在哪裡」接回迴圈? 這是整個系列的骨架。把 agent 的迴圈由內而外攤開，有四個可以下手的時機，越往外越貴。其中三個 (①③④) 是 harness 自動觸發的，另一個 (②) 是兩次 model request 之間的注入點，可以由使用者主動 steer，也可以由程式注入:

| 時機                 | 多久觸發一次       | 成本     | 修正粒度     | 對應的 hook        |
| ------------------ | ------------ | ------ | -------- | --------------- |
| **① 工具執行內**        | 每次 tool call | 毫秒，最便宜 | 單一動作     | Pre／PostToolUse |
| **② request 之間注入** | 使用者或程式想注入時   | 趨近零    | 當前這一輪的方向 | 無專屬 hook        |
| **③ 單輪結束**         | 每一輪          | 秒級     | 整輪的產出    | Stop hook       |
| **④ 外層 Loop**      | 每個 session   | 分鐘到小時  | 整個任務     | 排程／外迴圈          |

畫成圖更清楚: 這些時機由內而外是巢狀的，而一輪 (Turn) 本身就包含好幾次「模型 request → tool call」，①②③④ 分別發生在這幾個邊界上:

④ 外層 Loop · 每個 session · 分鐘\~小時 · 修正整個任務 ③ 一輪 Turn · 秒級 使用者輸入 模型 request 1 🔧 tool calls ① 模型 request 2 🔧 tool calls ① 模型 輸出答案 ③ ② request 之間注入 (人 steer 或程式) ① 工具執行內 · Pre／PostToolUse · 毫秒級 · 修正單一動作 Stop hook 沒過 → 同份 context 再跑一輪 一輪 (Turn) = 多次「模型 request → tool call」反覆，直到模型輸出答案 ④ 通過後這個 session 收掉，換上全新 context 再跑一圈 

這四個時機，各自配上前面那兩種感測器 (運算式 vs 推論式)，或②那種即時注入，就構成這個系列接下來四篇的主體:

* **時機①** (下一篇): 在工具裡把最小的迴圈接起來。執行前驗證、執行後檢查修復、回傳值夾帶導引。最便宜，幾乎不會增加主迴圈的負擔。
* **時機②**: 兩次 model request 之間的注入點。agent 還沒輸出答案、還在迴圈裡時，使用者可以中途 steer 或 interrupt，程式也能把背景工具結果、外部事件注入進來。
* **時機③**: 單輪結束時的驗收。不能因為「模型覺得做完了」就算數，要對著一個可驗證的停止條件去檢查。
* **時機④**: 外層 loop。當任務大到一個 context 裝不下，用外迴圈把任務一段段交給全新的 agent。

這四層由內而外，就是接下來四篇的主線。

下一篇先從最小、最便宜的那一層開始: 怎麼在一次 tool call 裡，就把回饋接回迴圈。

© 2026 [愛好資訊科技](https://aihao.tw/)

[關於本站](https://blog.aihao.tw/about/) [訂閱電子報](https://ihower.tw/opt-in/gai) [RSS](https://blog.aihao.tw/feed.xml) 
