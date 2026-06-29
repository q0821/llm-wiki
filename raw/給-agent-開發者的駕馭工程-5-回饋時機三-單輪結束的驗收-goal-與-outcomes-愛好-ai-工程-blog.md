<!-- source-url: https://blog.aihao.tw/2026/06/26/harness-engineering-5-goal-and-outcomes/ -->
<!-- title: 給 Agent 開發者的駕馭工程 (5): 回饋時機三: 單輪結束的驗收, Goal 與 Outcomes | 愛好 AI 工程 Blog -->
<!-- fetched: 2026-06-29 -->

[愛好 AI 工程 Blog](/) 

[關於本站](https://blog.aihao.tw/about/) [ 訂閱電子報 ](https://ihower.tw/opt-in/gai) 

# 給 Agent 開發者的駕馭工程 (5): 回饋時機三: 單輪結束的驗收, Goal 與 Outcomes

2026-06-26 

AgentEval 

![給 Agent 開發者的駕馭工程 (5): 回饋時機三: 單輪結束的驗收, Goal 與 Outcomes](https://blog.aihao.tw/assets/images/harness-engineering-5/cover.png) 

📚 給 Agent 開發者的駕馭工程 (全 9 篇)

1\. [基礎: Deep Agent 的六項內建能力](https://blog.aihao.tw/2026/06/26/harness-engineering-1-deep-agent-capabilities/)

2\. [核心: Agent 要的是回饋迴路，不是完美提示](https://blog.aihao.tw/2026/06/26/harness-engineering-2-what-is-harness-engineering/)

3\. [回饋時機一: 工具回傳值，是寫給 agent 的回饋](https://blog.aihao.tw/2026/06/26/harness-engineering-3-tool-execution-feedback/)

4\. [回饋時機二: 兩次 model request 之間，把訊息注入執行中的 agent](https://blog.aihao.tw/2026/06/26/harness-engineering-4-mid-run-injection/)

5\. **回饋時機三: 單輪結束的驗收，Goal 與 Outcomes** (本篇)

6\. [回饋時機四: 外層 Loop, Ralph、Symphony 與 Cron](https://blog.aihao.tw/2026/06/26/harness-engineering-6-outer-loop/)

7\. [進階: 自我改進 Harness, Meta-Harness 與爬坡](https://blog.aihao.tw/2026/06/26/harness-engineering-7-self-improving/)

8\. [收尾: 會過期的 Harness, Model-Harness-Fit 與 Bitter Lesson](https://blog.aihao.tw/2026/06/26/harness-engineering-8-model-harness-fit/)

9\. [自建 Agent 的框架選型: 全套 Deep Agent 還是從基礎構建?](https://blog.aihao.tw/2026/06/26/harness-engineering-9-agent-frameworks/)

🎞️ 搭配演講投影片: [給 Agent 開發者的 Harness+Loop Engineering](https://ihower.tw/presentation/harness.html)

前兩種回饋時機 (工具回傳值、中途注入) 都發生在 agent 工作的途中，不負責判斷「整輪到底做完了沒」。問題就在這: 每一次 tool call 都驗得對，不代表整輪的產出達標。十句 SQL 句句合法，不保證這三句加起來真的回答了使用者的問題; 需求漏做一半、該跑的整體驗證根本沒跑，這些都不是任何單步檢查看得見的。

這一篇處理時機③: 一輪結束時的驗收。

時機①發生在「一次 tool call 內部」，主迴圈甚至感覺不到它在跑。時機③的位置不一樣: agent 在這一輪裡已經想完、把該呼叫的工具全呼叫完、正準備收工，就在它要收工的那個時機點判斷: 這一輪到底做完了沒、該把控制權交還給你，還是讓 agent 繼續跑下去。對應到 Claude Code、Codex 這些成熟工具，這個介入點就是它們 Stop hook 這一層的攔截點。

核心精神一句話: **不能因為「模型覺得自己大概做完了」就算數。** 完成與否，要對著一個停止條件去驗證，沒過就繼續做。

## Goal: 一個可驗證的停止條件

要在單輪結束時驗收，你得先講清楚「做完」長什麼樣。這就是 Goal 這個東西要解的問題。Codex 的 Goal、Claude Code 的 `/goal`、Claude Managed Agents 的 Outcomes，都是同一個概念的不同產品化: 給 agent 一個持久的目標 (durable objective)，讓它對著一個評估標準持續修正，直到通過為止。它們是自我修正迴圈 (self-correction loop) 的基本構件 (primitive)。

一個好的 Goal 不是把 prompt 寫長，而是一份精簡的契約，通常要講清楚三件事: 終態 (做完是什麼樣)、證據 (用什麼來驗證)、限制 (過程中不能弄壞什麼)。OpenAI Cookbook 給的[合約模板](https://developers.openai.com/cookbook/examples/codex/using%5Fgoals%5Fin%5Fcodex)大致長這樣:

```
/goal <期望的最終狀態>
      verified by <用什麼證據驗證>
      while preserving <同時要保住什麼>.
Use <允許的工具與邊界>.
Between iterations, <每一輪之間怎麼選下一步>.
If blocked, <該回報什麼、什麼能解鎖進度>.

```

舉例: 「把 p95 latency 降到 120ms 以下，verified by 壓測報告，while preserving 正確性測試全綠。」這比「改善效能」這種模糊指令好得多，因為它給了 agent 一個知道「什麼時候還不能停」的依據: 從 180ms 降到 135ms 不算完成，降破 120ms 但測試掛了也不算完成。

其實連這份模板都不一定要自己填。任務本身夠清楚的時候，有個更省事的做法: 直接把任務描述交給 Codex 或 Claude，請它幫你改寫成一份夠扎實的 goal。一句 `Help me turn this into a strong /goal: <你的任務描述>` 就夠，模型會把終態、證據、限制這三件事補齊，你再順手微調。比起自己對著模板逐欄填，這招更簡單，也比較容易把一個清楚但還沒寫成契約的任務，收斂成可驗證的停止條件。

反過來，有兩類任務不適合套 Goal。一是完成條件模糊的，「把這個變更好」「重構這段程式碼」沒有可靠的完成條件，套上 Goal 只是把含糊換個地方放; 這種情況該做的是先把預期終態、驗證方式、限制定義出來，定義不出來代表問題不在工具，在你還沒想清楚要什麼。二是驗證不是二元判斷的灰色地帶 (例如重現一篇深度學習論文)，這時該在開工前先定義「可信度分級」: 哪些是用程式重建、數值驗證過的「確定」，哪些是重新訓練的替代品、行為接近的「近似」，哪些是原作者沒給隨機種子和 checkpoint、根本「做不到完全照原樣重跑」的部分。拿回來的就不是一句簡化的「重現成功」，而是一份按可信度分層、誠實標注的審計報告。

## Goal 實戰技巧

契約怎麼開，社群累積了幾個實用招式:

🤖 想不清楚就先跟它聊

連任務意圖都還沒想清楚時，先跟它聊，再請它收斂成 goal: 「請讀這個 session 和 repo，分析想達成的意圖，寫出對應情境的 /goal 提示詞」。

📊 進度儀表板

讓 agent 規律更新一個 `goal.html`，把目前進度、做了什麼、還差什麼畫出來，長時間跑的時候特別有用。

☑️ Checklist 勾選

先寫一份 checklist 或分階段的設計文件，讓它一條條勾掉，把模糊的「做完」拆成可逐項驗的小目標。

📄 Goal 放檔案

`/goal xxx.md`: 把契約寫成檔案，可以版本控制、可以重用，goal 不再是一次性的一句話。

招式來源: [@meta\_alchemist](https://x.com/meta%5Falchemist/status/2054214497443995694)、[@dkundel](https://x.com/dkundel/status/2054616381568815484)、[@dotey](https://x.com/dotey/status/2061260768729809096)、[@jxnlco](https://x.com/jxnlco/status/2057940480998932954)

這裡其實藏了一個工程師角色的轉變: 你交付的不再是一句 prompt，而是一份「目標 + 邊界」的契約，然後讓一個迴圈去「提示 → 讀產出 → 判斷完成沒 → 再提示」。思考單位從「一次對話 turn」換成「一輪工作 round」。但這個攔截點背後到底怎麼判斷「做完了沒」，三者的實作分歧很大，而這個分歧正是這篇的重點。

## 三種實作，沿著「裁判有多獨立」排開

同一個問題: 工作的模型自己說做完了，能信嗎? 這裡整理三種不同的實作來研究看看。

Codex Goals

harness 自己不判斷完成與否，只在 thread 閒置時重播同一份合約 prompt。完成與否由**主模型自我審計**，自己呼叫 `update_goal` 宣告。

Claude Code /goal

每輪結束把**刪減版 transcript** 交給獨立的 **Haiku** 裁決。沒過就把 Haiku 寫的診斷注入主 thread，逼著繼續。

Managed Agents Outcome

主 agent 交出產出物後，**全新 context 的 grader** 拿著 rubric 實際操作 artifact 逐條驗收。沒過帶著逐條缺失進下一輪。

## 實作一: Codex /goal，沒有裁判的自我審計

> 編按: 以下 Codex 的描述來自**官方文件**加上**讀開源原始碼** (goal spec、`continuation.md`，連結附在文中，可自行核對)，不是從外部行為推測的。

先看 Codex。它的表面行為很單純: 一輪結束會自動續跑，直到目標達成。但 Codex 是開源的，讀[原始碼](https://github.com/openai/codex/tree/main/codex-rs/ext/goal)就會發現一件事: 它根本**沒有第二個模型在判定**。

Codex 這邊的 harness 是一個確定性的狀態機，沒有任何 LLM 參與「做完了沒」的判斷。它做的唯一一件事是: 每當 thread 閒置，查一眼資料庫裡 `goal.status` 還是不是 `Active`。是，就把 `continuation.md` 這份模板重新注入、開一個新的 turn 續跑; 不是 (complete / blocked / paused)，就停。所以「沒完成」這件事在 Codex 裡其實沒有對應的動作: 不是有誰判它沒過，而是主模型結束這一輪時**沒有呼叫 `update_goal(complete)`**，僅此而已。完成的宣告權完全在主模型自己手上，而且呼叫了就算數，沒有任何人覆核。

update\_goal(complete) ✅ 注入 continuation.md 每輪同一份合約 prompt 主 agent 跑一輪 推理 + 工具呼叫 自我審計 達成目標? 是 否: 沒呼叫 update\_goal → thread idle 且 goal.status = Active → 再注入 判定者就是主 agent 自己，全程沒有第二個模型 ✏️ 小編製圖 

也因為判定者就是工作者本人，Codex 的續跑 turn 會帶著主模型完整的 (加密) 推理脈絡一路重播。這很合理: 它需要靠自己的推理歷史才知道接下來該做什麼。

判定權交在主模型手上，Codex 靠兩層 prompt 紀律約束它，防止「過早宣告完成」:

* **Tool 合約寫滿消極條款。** [update\_goal 的 description](https://github.com/openai/codex/blob/main/codex-rs/ext/goal/src/spec.rs) 一連串「only when / do not」: 只有在目標真的達成、沒有剩餘工作時才能設 `complete`; 不准因為預算快用完或想停工就標完成; 這個 tool 也不能拿來暫停或恢復 (pause/resume，那些狀態保留給使用者和系統)。`blocked` 更嚴格: 同一個阻礙原因要連續三個 goal turn 重複出現才准標記。
* **Continuation prompt 寫滿積極程序。** [continuation.md](https://github.com/openai/codex/blob/main/codex-rs/prompts/templates/goals/continuation.md) 裡有一段 Completion audit，逼模型把完成「當成尚未證明」，從目標拆出每個需求，逐項找出能證明它的證據，實際去檢查檔案、指令輸出、測試結果。原文的要求相當嚴格:

```
... treat completion as unproven and verify it against the actual current state ...
The audit must prove completion, not merely fail to find obvious remaining work.

```

(把完成視為尚未證明，對著當前真實狀態逐項驗證 … 這份審計必須證明完成，而不是只因為「沒看到明顯的剩餘工作」就算數。)

換句話說，Codex 沒有外部裁判，但它強迫主模型把「當前 worktree 和外部狀態」當成權威依據去自查，試圖在自我審計的框架裡逼近獨立判定的精神。

> 編按: 這正好是「別只看名字、要看實作」的好例子。網路上有流量不錯的技術文章明確寫 Codex 的 goal mode「用一個獨立小模型每回合評分」，還煞有介事給了 `check_model = "o4-mini"` 的設定範例。但翻原始碼就知道 `ext/goal/` 裡根本沒有第二個模型、沒有 grader。這是把「理想中該有的樣子」投射成「它已經這樣做了」的誤讀。harness 的細節，看文件不如自己攔一次封包、讀一次程式碼。

## 實作二: Claude Code /goal，獨立 Haiku 讀刪減 transcript

> 編按: 以下 Claude Code `/goal` 的描述，整體行為來自**官方文件**，而 Haiku、刪減 transcript、structured output 這些官方沒寫明的內部細節，是小編用 [mitmproxy](https://mitmproxy.org/) **實際攔封包觀察**到的，可能隨版本改動。

Codex 把判定權留在主模型自己手上; Claude Code 走相反路線，把判定交給另一個模型。它的 `/goal` 原理是: 主迴圈 (Opus) 跑完一輪、自認目標達成、正要收工時，harness 不直接把控制權交還給你，而是另外發一個請求，把整段對話交給一個獨立的小模型，問它一句:

```
Based on the conversation transcript above,
has the following stopping condition been satisfied?

<stopping condition>

Answer based on transcript evidence only.

```

這裡最值得注意的是最後那句 `Answer based on transcript evidence only`:

⚠️ transcript evidence only

判定者**只看對話紀錄，不會重新打開檔案、不會操作 artifact**。它能不能判對，完全取決於主 agent 有沒有把證據「印」在對話裡; 沒印出來的，對它就等於不存在。這條限制，等下對照實作三的 Outcome (裁判真的會去操作 artifact) 會更有感。

機制上，還有三個細節值得記:

* **判定者是一個獨立的小模型 (預設 Haiku)**，而且用的是另一份 system prompt (「你是一個 Claude agent」而不是「你是 Claude Code」)，跟[文件](https://code.claude.com/docs/en/goal)寫的「預設用小而快的模型」一致。值得注意的是，這個驗收 request 最上層的 `tools` 是空的: 它只能讀 transcript，不能再 fetch、不能再搜尋，純做驗收、不繼續工作。
* **這份 transcript 是重組過的副本，不是把原 request 原樣轉發。** 保留下來的是裁判判斷用得上的證據: 原始 `/goal` 指令、assistant 每一句可見回覆 (含中途敘述和最後總結)、每個 tool\_use 的 name 與 input (所以它看得到 `WebFetch` 真的被呼叫過、查了什麼)，以及文字型的 tool\_result (搜尋結果、網頁摘要、GitHub profile) 當判斷依據。拿掉的則是整塊 thinking 與 signature (主迴圈那幾輪的 thinking 本來就被清空、只留簽章給 API 驗證，跨模型的加密推理帶不過去)，還有最前面那一整包 claudeMd 工作環境; `ToolSearch` 回傳的那種結果 (裡面是一個個可呼叫的工具物件、不是文字)，因為驗收 request 已經沒有這些工具 (`tools` 是空的)，整段被換成一句 `[Tool references removed - tools no longer available]`。所以 Haiku 看不到主模型的推理，只看它「攤在 transcript 上的證據」(這跟 Codex 把完整推理一路保留剛好相反)。
* **用 structured output (結構化輸出) 強制回 `{ok, reason, impossible}`**，不能含糊其辭。三個欄位各管一件事: `ok` 回答「目標達成了沒」、`reason` 是判斷理由 (判 false 時要講清楚還缺什麼)、`impossible` 則回答「這目標是不是根本辦不到」。`impossible` 是用來處理一種棘手情況: 萬一目標本來就完成不了 (條件自相矛盾、或依賴一個拿不到的資源)，沒有這欄的話，Stop hook 會一直擋著不讓收工、無限重試下去。所以裁判一旦判 `impossible: true`，就算 `ok` 還是 false 也會放行結束。這裡還特別加了一道限制: 「辦不到」必須由獨立裁判看 transcript 證據自己判定，主 agent 自己宣稱「做不到」只算一項證據、不算證明，免得它喊一句「我放棄」就提早收工。

判定結果分兩條路。判「是」: 清除目標，在逐字稿記一筆已達成，把控制權還給你。判「否」: Stop hook 擋下停止，把 Haiku 寫的 `reason` 包成一段 `Stop hook feedback:` 注入回主 thread，當成下一輪該怎麼做的依據。因為 Haiku 被要求「引用 transcript 裡缺了什麼」，這個 reason 是針對性的診斷，每輪都不一樣，直接點出缺什麼。

主 agent 跑一輪 (Opus) 自認達成，要收工 Stop hook 攔下收工 複製刪減版 transcript (剝除 thinking) 獨立 Haiku 裁判 另一個模型，只讀 transcript ok: true ok: false 清除目標，交還控制 ✅ goal 達成 reason 注入回主 thread 針對性診斷 → 主 agent 繼續下一輪 ✏️ 小編製圖 

這裡有個有趣的隱性迴圈: 因為判定者只看得到 transcript 上浮現的證據，如果主 agent 做了某件事卻沒把證據印出來，它會收到「transcript 證據不足」的結果，等於 Haiku 在逼主 agent 把驗證結果明確印出來。另一面是，判定靠的是語意理解而非字面比對，所以停止條件就算寫得不夠精準，只要語意夠清楚，小模型多半還能照語意判斷，而不是拘泥字面。

把兩家的判定標準擺在一起看，剛好相反: Codex 把標準攤開給工作模型自己看 (continuation.md 的 audit 條款),Claude Code 則把判定標準密封在 Haiku 的 system prompt 裡，主模型完全不知道自己會被用什麼標準衡量。一邊是讓工作模型看著標準自評，一邊是把標準藏起來、由另一個模型來判。

### 判「沒完成」之後，兩家的主 thread 差在哪

把兩家放在一起看，「沒完成」這個訊號的性質完全不同:

| |  Codex /goal | Claude Code /goal                    |                                        |
| -------------- | ------------------------------------ | -------------------------------------- |
| **回饋形式**       | 重播同一份 continuation.md，只有 budget 數字在動 | Haiku 寫的針對性診斷，具體指出 transcript 裡缺了什麼    |
| **下一步依據**      | 環境證據 (測試失敗、編譯錯誤) + 自己保留的推理           | 外部裁判指出缺口                               |
| **context 代價** | 每輪累積一份完整模板 (靠 prompt cache 吸收)       | 每輪多一次 Haiku call，主 thread 只長一小段 reason |
| **失效模式**       | 模型自己有侷限時沒有外部視角來修正，可能連錯好幾輪            | Haiku 誤判: 會被自信的收尾語言騙過                  |

Codex 的「沒完成」是同一份指令重播，模型要繼續做什麼，完全靠它自己推理的連續性; Claude Code 的「沒完成」則是一段外部裁判寫的具體診斷，注入主 thread，明白告訴它還缺什麼。這也解釋了為什麼 Codex 必須保留推理、而 Claude Code 可以放心清掉 thinking: 前者要靠自己的推理紀錄才知道做到哪、下一步做什麼，後者則有外部診斷可依循。

## 實作三: Managed Agents Outcome，拿著 rubric 操作 artifact

> 編按: 以下 Outcome 的描述來自 **Anthropic 官方文件與 cookbook**。

第三種把獨立性推到底。Claude [Managed Agents 的 Outcome](https://platform.claude.com/docs/en/managed-agents/define-outcomes) 在你定義目標時，自動配一個 grader，用**全新的 context window** 拿著 rubric 來驗收主 agent 的產出物。重點是「全新 context」: grader 看不到主 agent 的推理和敘事，主 agent 那句「目標達成 ✅」騙不到它。

而且它不只是「看」最終產物。Anthropic 在 [Harness design for long-running apps](https://www.anthropic.com/engineering/harness-design-long-running-apps) 裡揭露了更強的版本: 評估者拿著 Playwright，像真實使用者一樣去點擊執行中的應用程式，測 UI、打 API、查資料庫狀態，再對 rubric 每一條評分。這已經不是讀文字了，是會動手的裁判。沒過，就帶著逐條缺失的回饋進下一輪迭代，`max_iterations` 預設 3、最多 20。

主 agent (generator) artifact (檔案 / app) 獨立 grader agent 全新 context + rubric 產出 拿 rubric 操作 點 UI / 打 API / 查 DB satisfied needs\_revision 交付 ✅ 逐條缺失回饋 主 agent 再改一輪 裁判完全獨立: 不看 transcript，直接對成品逐條驗收 ✏️ 小編製圖 

為什麼這種「事後拿產出物獨立驗收」會比讓 agent 自己驗有效? 上面那篇 Harness design 正是在強調評估者要獨立。它的觀察是: 要 agent 評自己做的東西，它傾向自信地稱讚，哪怕在人眼中品質明顯普通; 而且 context 裡的錯誤推理會不斷累積，前面說服了自己「方向對」，後面就一路錯下去。而它給的結論很乾脆 (翻譯):

> 「調出一個挑剔的獨立評估者，比教會 agent 自我批判容易得多。」

換句話說，問題不在「能不能批判」，而在「誰來批判」: 同一個 agent 很難對自己的產出下得了手，換一個全新 context 的 agent、再把它調得多疑，反而簡單得多。Cookbook 的 [Outcome grader 範例](https://platform.claude.com/cookbook/managed-agents-cma-verify-with-outcome-grader)有一段把這件事點得更具體 (翻譯):

> 「知道評分標準的撰寫者，仍然是在替自己的作品打分。只要它認為自己通過了，它就會說通過。評分者則別無選擇，只能真的去做那些檢查: 它在全新的 context window 開始，身上只帶著評分標準和成品。」

那篇 Cookbook 的實例很具體: 一個研究任務要求財務數字必須出自正式年報 (10-K / 10-Q)。撰寫者第一次拿了一篇第三方新聞報導就提交、自評通過; 獨立 grader 退回，要求 SEC 正式文件。第二次撰寫者找了個 sec.gov 的網址 (看起來合格了),grader 讀了網址發現那是一份 8-K 的新聞稿附件，不是 rubric 要的 10-K，又退回一次。第三次才找到真正的 10-K，通過。自我檢查抓不到這種錯，因為它「覺得自己過了」; 只有獨立 grader 對著 rubric 才會在這條界線上把它擋下來。

這套「生成跟評估交給不同 agent 做」的主張，不只 Anthropic 在講。[Lance Martin](https://x.com/RLanceMartin/status/2064397389189071163) 在談 Fable 5 的 loop 設計時也說「獨立、全新 context 的驗證者子代理人 (verifier subagent)，表現往往勝過自我批判」，而 Anthropic 在 [Harness design for long-running apps](https://www.anthropic.com/engineering/harness-design-long-running-apps) 裡更直接把一個 agent 拆成 Planner (規劃)、Generator (生成)、Evaluator (評估) 三個角色，結論是「把做事的 agent 和打分的 agent 分開，是解決自評偏差最有效的辦法」。代價也很實在: 同一個 2D 遊戲編輯器的題目，單一 agent 跑 20 分鐘、約 9 美元，完整 harness (含獨立評估者把關) 跑了 6 小時、約 200 美元，20 倍成本。但差別不是「好一點」: 單跑版的遊戲核心功能根本壞掉、不能玩，harness 版能玩。

## 三種實作的總比較: 獨立性與成本

把三種實作攤在三個維度上:

| |  Codex Goals | Claude Code /goal                       | Managed Agents Outcomes |                           |
| -------------- | --------------------------------------- | ----------------------- | ------------------------- |
| **誰來判定**       | 主模型自我審計                                 | 獨立的 Haiku               | 全新 context 的 grader agent |
| **harness 角色** | 不判斷，只在閒置時重播合約 prompt                    | 每輪結束送 transcript 裁決     | 自動配置 grader 評估迴圈          |
| **看什麼證據**      | 自己 context 裡的一切 (含推理)                   | 刪減版 transcript          | 只看 artifact，實際操作驗收        |
| **怎麼宣告完成**     | 主模型呼叫 update\_goal                      | yes/no + 診斷 reason      | rubric 逐條 pass/fail       |
| **沒完成時的回饋**    | 沒有診斷，只重播同一份 prompt 模板 (continuation.md) | 一段針對性診斷，指出缺什麼           | 逐條列出缺失，最具體                |

這三者其實是同一條軸上的三個刻度: 裁判有多獨立於做事的模型。

自己的思維跟逐字稿

Codex: 裁判就是工作者本人。**資訊量最大** (推理、工具輸出全看得到)，但**完全沒有獨立性**。

看別人的逐字稿

Claude Code: 裁判讀 transcript。資訊量與獨立性**各取一半**: 證據沒印在 transcript 上，等於不存在。

產出標的物

Outcome: 裁判操作 artifact。**獨立性最大**: 它只驗最後成品、不看模型怎麼說，所以不會被模型的敘事說服。代價是資訊量只剩產出物，**亂改測試、違規操作這類「過程不可接受」的問題看不到**。

沒有一家同時拿到「資訊量」與「獨立性」。Codex 把資訊量最大化但完全沒有獨立性; Outcome 把獨立性最大化但只剩產出物，於是違規操作、亂改測試、副作用這類「產出物完美但過程不可接受」的瑕疵成功 (corrupt success)，它就抓不到; Claude Code 介於兩者中間。這是取捨 (trade-off)，不是優劣排名。

這條獨立性排序，學界研究大致也指同個方向: 缺乏外部回饋時，純自我修正容易失敗 (Huang et al., ICLR 2024); 只讀文字的裁判偵測假性完成 (false success) 的能力有限，容易被「自信的收尾語言」帶著走; 相對地，看測試與執行結果的環境回饋、把驗收拆成逐條 rubric、以及能讀檔跑指令的 Agent-as-a-Judge (Zhuge et al., ICML 2025)，可靠度都明顯更高，最後一種甚至接近人類。越往獨立、越會實際操作的那端，判定越可信。

### 成本: 三者的成本花在不同地方

獨立性更高，代價就是成本與延遲。先看三者把帳記在哪:

| |  Codex Goals | Claude Code /goal       | Managed Agents Outcomes       |                                    |
| -------------- | ----------------------- | ----------------------------- | ---------------------------------- |
| **評估動作**       | 無模型呼叫: 查狀態，毫秒級          | 每 turn 一次 Haiku 呼叫            | 每 iteration 跑一次 grader agent，數分鐘起跳 |
| **成本花在**       | 主模型的 context: 模板與推理持續重播 | 第二個模型: Haiku 重讀漸長的 transcript | 評估即執行: 操作 artifact 是「跑 agent」的量級   |
| **回饋延遲**       | 模型自己發現走偏才回頭             | 每 turn 一次，最快                  | 整個 iteration 做完才被抓到                |

三者的成本花在不同地方。Codex 花在主模型的 context 上: 模板和推理都以最貴的費率持續重播，靠 prompt caching 壓下來。Claude Code 花在第二個模型上: Haiku 每輪重讀越來越長的 transcript，但單價低到官方敢直接寫「可忽略」，而且它反過來幫主模型省錢 (清掉 thinking、只注入短 reason)。Outcome 則是評估即執行: grader 要真的把 artifact 跑起來操作，這是跑 agent 的成本量級。

換成相對量級看會更直觀 (以下是粗略量級，不是精確 benchmark)。Codex 自我審計沒有模型呼叫，只查一次狀態; Claude Code 的 Haiku 評估也很便宜，只多跑一次小模型; Outcome 的一次評估則要跑一整個 grader agent (Anthropic 實測一次約 8 分鐘):

| 單次評估的額外開銷         | token 成本                          | 延遲              |
| ----------------- | --------------------------------- | --------------- |
| Codex 自我審計        | 趨近零 (無模型呼叫，只查狀態)                  | 趨近零 (折在 turn 裡) |
| Claude Code Haiku | 小 (小模型讀一次 transcript)，與 Codex 同量級 | 約 1-2 秒         |
| Outcome grader    | 約前兩者的數十倍 (跑一整個 grader agent)      | 約 8 分鐘，約前兩者的數百倍 |

**光是單次評估，Outcome 大約就是另外兩者的數十倍 token、數百倍延遲。**

不過延遲真正的差異不在「評估本身多久」，而在「錯誤方向多久才會被發現」。Claude Code 一個 turn 就被抓; Codex 要等模型自己發現走偏; Outcome 要等整個 iteration 做完。Anthropic 那個 DAW 實測就是這個樣子: Build 第一輪跑了 2 小時 7 分才迎來第一次 8.8 分鐘的 QA，發現核心互動是擺著好看的、不能用，於是第二輪又花 1 小時重做。回饋越獨立越紮實，錯誤被抓到的時間就越晚，等發現時要重做的工作量也越大。所以正確的比較單位不是「每次評估多少錢」，而是「達到同等可靠度要跑幾輪」: 收斂輪數才是成本的最大宗，每輪的評估開銷只是額外多出的一小筆。

把這個單次的數十倍差距乘上整個 goal 的輪數，落差還會放大，但這裡有個轉折: Outcome 的評估單位是「iteration」而非「turn」，而且預設就有 `max_iterations` 上限 (預設 3、最多 20)，它**根本不會**驗上百次。這不是巧合: **驗證的單價，直接決定了驗證能做到多細。** Codex 跟 Haiku 一次評估幾乎不花錢，負擔得起每一輪都驗; Outcome 一次評估貴上數十倍、又要好幾分鐘，只能驗少少幾次，而且驗的是整個成品。便宜的驗證逐輪把關，昂貴的驗證只能事後總驗，這個分野不是誰決定的，是成本算出來的。

(再強調一次: 上面只是「驗證」的額外開銷，不是總帳。真正佔大部分的是「做事」的基底成本，跑上百輪主模型工作本身就很可觀，而這部分三者差不多。)

最後值得點出: 三者的文件不約而同教你「把停止條件寫成可被指令輸出證明的形式」。背後的道理是，當條件夠具體、證據夠機械化，裁判是 Haiku 還是模型自己，差異就被壓縮了; 條件越模糊，三者的失效模式差異才會放大。也就是說，你愈把「做完」定義成可機械驗證的形式，愈不需要為了獨立性，去付 Outcome 那種昂貴的代價。

## 那為什麼 Codex 可以不用獨立裁判?

> 編按: 以下這節 (特別是「OpenAI 把自我審計練進模型」) 屬於**合理推測**，建立在公開研究與工具行為上，但沒有官方 model card 或論文直接背書，讀的時候請自行打折。

讀到這裡會有個疑問: Anthropic 自家文章明確說「把做事的 agent 和打分的 agent 分開，是解決自評偏差最有效的辦法」，前面引的研究也把純自評放在最弱的一檔。那 Codex 的自我審計，豈不是站在大家公認最弱的那一檔?

### 先拆成兩層: harness 層與模型層

ihower 的看法是: 這不代表 OpenAI 做錯了。「誰來判定完成」這件事，拆成兩層看就清楚了: **harness 層** (在模型外面怎麼接驗證: 換一個獨立裁判、還是只注入一段 prompt 要模型自己審) 和 **模型層** (模型本身的驗證能力到底行不行)。這正好對上系列第二篇的 Agent = Model + Harness。Anthropic 從 harness 層下手，多接一個獨立的模型來把關; OpenAI 則把重心放在模型層: 與其在 harness 上換裁判，不如把模型「驗證自己」這件事直接練起來。LangChain 的 Vivek Trivedy 的[立場](https://x.com/Vtrivedy10/status/2063068668049740254)很直接: 把「驗證」當成一門要認真拆解的任務; 與其糾結 harness 架構，真正的瓶頸是模型的驗證能力本身，要靠訓練補強。

### 把驗證練進模型

而這正是這半年的研究焦點: **驗證 (verification) 是一種可以被訓練進模型的能力，而不只是 harness 怎麼設計的問題。** Trivedy 指出，即時驗證本質上是「生成」的一個子領域，只是模型目前還很弱; 但他們在 Terminal Bench 的 harness 實驗裡發現，讓模型做自我驗證 (self-verification) 帶來明顯的效能提升，而真正的方向是「透過 harness engineering 加上訓練，逼模型把『驗證』這件任務，像它生成解題程式碼一樣認真拆解、做徹底」。CMU 的 Chen Wu 那條研究也是同一個主張: 業界一直在訓練模型「生成」得更好，為什麼不訓練它「驗證」得一樣好? 他們展示了訓練模型去精準定位自己的錯誤，讓同一個模型在困難數學題上的準確率接近翻倍。Philipp Schmid 在 [Can We Close the Loop in 2026?](https://www.philschmid.de/closing-the-loop) 把這個方向講得相當清楚: 今天 production 裡絕大多數的「回饋迴路」都還是 scaffolding (在模型外面搭一層驗證步驟)，但研究前沿正在走向 spontaneous verification (自發式驗證)，驗證不再是外掛上去的，而是模型預設就會做的事。

從這個角度看，「OpenAI 在 post-training 階段針對 goal 自我審計加強過模型」這個推測就很合理: 連有人對著單一 goal 把 Codex 跑超過 120 小時都撐得住，靠的就是模型本身被練到能持續自我審計、不中途降低標準。這也跟一個長期觀察對得上: GPT 系模型的指令遵循 (instruction following) 一向是強項，而 Codex /goal 那份寫滿「only when / do not」的自我審計合約，本來就依賴模型「把指令當真」的能力; 在這個基礎上，OpenAI 很可能又針對自我審計另外做過 post-training 強化。能力既然練進了模型，harness 那層就能做得很薄，這也正是 [Bitter Lesson](https://blog.aihao.tw/2026/02/17/bitter-lesson-agent-harness/) 的方向: 與其在 harness 上堆手工規則和外部仲裁機制，不如相信模型能力與算力終究會把這些招式收進去。Fable 5 這代模型「擅長在迴圈裡自我修正」已經寫進官方賣點，等於模型層面就為 self-correction loop 最佳化過 (這點留到系列 8 再談)。薄 harness 還有個現實好處: 成本。Trivedy 那串討論底下有人補充，點出高效驗證真正的瓶頸就是成本: 你能不能驗證一千個輸出，而不在算力上付出過高代價? 在會跑數小時、數天的長 goal 上，每回合都加一個外部裁判模型 (judge model)，等於每一步都多付一次推理的延遲與 token; 省掉這個每回合重讀 transcript 的裁判，正是 OpenAI 不走外部裁判的關鍵考量之一。

### 但這條路是脆弱的

當然，把重心壓在模型層不是沒有代價，而且在訓練到位之前是脆弱的。有一篇關於自我歸因偏差 (self-attribution bias) 的研究發現: 當模型評估「出現在自己對話歷史裡」的行為時，判斷力會選擇性退化，而且在「錯誤的行為」上退化最嚴重，偏偏那正是最需要被抓出來的危險案例。Codex /goal 的 continuation prompt 正是把指令注入同一條 thread 的歷史，完全落在這個情境裡。OpenAI 自己的修補紀錄也透露這條路不好走: 他們改過好幾版 continuation prompt (因為早期模型會把目標偷偷縮小成更容易通過的子集)，甚至把「已經過了多少時間」的回報從 prompt 裡拿掉，因為模型看到時間一直在減少，反而會開始草率行事; 社群也有 issue 實測抓到 goal 已宣稱完成、使用者一句「再檢查一次」又冒出一堆高重要性的問題。值得注意的是，OpenAI 面對這些問題的回應始終不是「換成外部裁判」，而是把自評 prompt 寫得更硬、要求把判斷建立在測試與 build 這類客觀證據上，並把「要一個獨立裁判」的需求，交給 subagents 生態系 (例如唯讀的審查者子代理人，reviewer subagent) 去補。也就是說，`/goal` 這個內建迴圈本身，是明確選擇了自我反思 (self-reflection) 加紀律這條路。

### 小結: 兩家把重心放在不同的層

兩家不是對錯之分，是把重心放在不同層。Anthropic 在 harness 層用職責分離來把關，假設「便宜的外部模型加一段短診斷」就夠用，而且它自己同時做了 Outcome 那種完全獨立的 grader，等於光譜兩端都做了; OpenAI 則把重心放在模型層，假設模型的自我驗證可以靠 post-training 練起來，harness 只要薄薄一層紀律。OpenAI 這個方向若成立，長期會更省、更快、更接近「驗證是模型本能」那個前沿，但前提是模型真的被練到位，否則就會掉回自我歸因偏差那種選擇性失靈的問題。Anthropic 不一定全對，OpenAI 也還在補 prompt，這場「重心該放在 harness、還是放在模型訓練」的分歧，目前還沒有定論。

## 如果是自行開發 agent，該怎麼選

回到這個系列的主軸 (自建 agent)，三種思路的調教難度和成本差很多:

自我審計 (Codex 式)

**調教難度最高。**它高度依賴主模型「不對自己放鬆標準」的自律，而 GPT 系模型指令遵循一向是強項，又 (照前面的推測) 可能針對自我審計另外做過 post-training 強化，才撐得住。自建 agent 用一般模型要複製，難度應該會比較高，容易過早宣告完成。

適合: 互動式開發的中短任務，開發者在場能即時檢查與修正，環境回饋 (測試、build、執行結果) 密集且可信，誤判完成的代價也低。

Transcript 裁判 (Claude Code 式)

**折衷做法。**用一個小模型對著 transcript 判，相對簡單實作、也比較好評估 (輸入輸出都是文字，容易離線測)。成本與可靠性的平衡點。

適合: 無人值守的中程任務，且完成條件能被指令輸出機械化證明 (測試全綠、佇列清空)。

獨立 verify (Outcome 式)

**效果最好，但成本最高、延遲是最大弱點。**每次驗收要把 artifact 跑起來操作，動輒數分鐘，還得花工夫把 rubric 和 grader 調對。

適合: 長時間、以交付物為終點的任務，「完成」完全體現在可操作的 artifact 上，假性完成 (false success) 的代價高到值得花評估開銷。

ihower 的傾向是: 自建 agent 想複製 Codex 那種純自我審計，調教難度會很高，因為你手上的模型不見得有對應的 post-training; Claude Code 那種「小模型讀 transcript」是相對好上手、也好評估的折衷起點; 而完全獨立的驗證效果最好，但你要先接受它最貴、延遲最久這兩個前提。

說到底，這呼應這個系列一直強調的一句話: **驗證強度是 harness 的一個可調參數，該隨任務風險和模型能力調整，而不是非黑即白的選擇。** 任務風險低、模型夠強，就往便宜的自評靠; 風險高、交付物明確，就值得上獨立 grader。Anthropic 自己同時擁有光譜的兩端 (`/goal` 和 Outcome)，也是用任務型態來切分，而不是宣告誰一定比較好。

## 綜合案例: 一個使用者訪談 Agent，把兩家的招組起來用

前面三種實作都是大廠的產品，各自落在光譜上一個固定的點。但自建 agent 不必二選一，你可以挑不同 pattern 組起來用。小編手邊一個實際做過的使用者訪談 agent 拿來收尾剛好: 它在同一套流程裡同時用上了兩家的招，借 Claude Code 的 transcript 裁判把關「這題問夠了沒」，又借 Codex 每輪重新注入 prompt 的做法，推著訪談往前走。

場景是一個使用者訪談 agent，按訪綱逐題訪問受訪者。難題是: 什麼時候該換下一題? 這一題的資訊問夠了沒? 受訪者答非所問怎麼辦? 不能等訪談全部結束才發現漏問，得在當下就判斷。而且模型自己很愛「覺得差不多了就想往下走」，這跟第二篇講的「過早宣告完成」是同一個毛病，只是把時機③那個「整輪做完了沒」，縮小成「這一題做完了沒」。

### 借 Claude Code 的招: 換題工具藏一個只讀 transcript 的 Judge

做法是: 當 agent 認為這題可以收、想跳下一題時，它呼叫一個 `switch_next_question_workflow` 工具來提出請求。但這個工具不直接換題，它先把請求交給一個獨立的 Judge 審核:

```
@function_tool
async def switch_next_question_workflow(reason: str, user_requested_next: bool) -> str:
    """當你判斷目前這題已取得足夠答案、或使用者明確要求跳題時呼叫。
    reason: 你認為可以換題的理由
    user_requested_next: 使用者是否明確說了「下一題 / 跳過」
    """
    # 真正的判定在 server 端,工具只是把請求轉過去
    ...

```

關鍵在 system prompt 裡對這個工具的描述，直接把規則寫死: 「這個工具會交給獨立審核模型再次判斷; 工具回傳 Y/已切換時，才代表真的進到下一題」「若工具回傳 N/留在本題，你 MUST 繼續聚焦同一題，換一種問法追問，不要自己跳題」「不要自行宣稱已進到下一題，必須等工具結果」。也就是說，主 agent 以為自己在「切換題目」，但每次切換都得先通過這道審核，而且它被明確禁止自己宣布已經切換。這跟實作一 Codex 把 `update_goal` 的宣告權限制住是同個用意，只是這裡更進一步: 連宣告權都不留給主模型，直接交給一個獨立的 Judge，做法上更接近實作二的 Claude Code。

### Judge 看什麼: 每題各自的 rubric，而且只讀逐字稿

審核不是看一個籠統的「問夠了沒」，而是每一題都配一份自己的完成標準 (rubric)。訪綱大致如下 (節錄):

```
QUESTION_WORKFLOW = [
    {
        "title": "最近一次使用情境",
        "question": "最近一次用產品的情境: 用什麼功能、什麼情境。",
        "completion_criteria": "回答需包含最近一次使用的具體情境,至少提到使用的功能,以及當時正在做的任務。",
    },
    {
        "title": "替代方案",
        "question": "不用這個產品你會用誰? 哪個最常用? 為什麼?",
        "completion_criteria": "回答需提到至少一個替代方案,最好能指出最常用者與原因。",
    },
    # …其餘題目
]

```

Judge 是一次獨立的小模型呼叫 (用 gpt-5.4-mini、reasoning effort 設 none、`max_output_tokens=16`，因為它只需要回一個字)，拿到的是「當前題目 + 該題的完成標準 + 到目前為止的逐字稿」，prompt 大致是:

```
You are a user interview quality reviewer.
Decide whether the current interview question has enough concrete
information to be considered complete.
Use only the transcript below. Do not infer facts that are not in the transcript.

Current question: {question}
Completion criteria: {completion_criteria}
Transcript (user and assistant only): {transcript}

Return exactly one character:
Y if the current question is complete. N if not.

```

有兩個地方剛好呼應這篇拆過的兩個重點。一是那句 `Use only the transcript below. Do not infer facts that are not in the transcript`，跟實作二 Claude Code /goal 的 `Answer based on transcript evidence only` 根本是同一句話: Judge 只認攤在逐字稿上的證據，不自己想像，沒印出來的對它就等於不存在。差別只在 Claude Code 一次判「整輪」，這裡一次判「一題」。二是每題各配一份 `completion_criteria`，不是用同一套標準衡量所有題目，正好就是前面比較三者時提到的「Rubric 分解」: 條件越具體，小模型越判得準。

### 沒過時的回傳值: 還是要可行動

Judge 回 N 的時候，工具不是冷冰冰地回一個 false，而是回一段可行動的指令，順便夾帶這是第幾次被退:

```
N: 仍停留在第 1 題「最近一次使用情境」。這是第一次追問。
請換一種問法追問目前這題,不要切換題目。

```

判定是透過工具回傳值夾帶的指令傳回主 agent 的，跟 Claude Code 把 Haiku 寫的 `reason` 包成 `Stop hook feedback:` 注入回主 thread，是同一個做法: 沒過不是終點，而是一段告訴它下一步怎麼做的訊息。

### 語意檢查要有上限與退出機制

Judge 如果是一道沒有上限的檢查會出問題: 遇到答得很跳的受訪者，某題可能永遠湊不齊完成標準，agent 就卡在那題出不來，限時訪談裡這很糟。所以 server 端多維護一個「這題被退幾次」的計數器，被退 3 次、或使用者明確說要跳，就強制放行，不再問 Judge。實際行為就是: 同一題最多追問兩次，第三次無論判定如何都往下走。

這跟實作三 Outcome 的 `max_iterations` (預設 3、最多 20) 是同一種設計: 給審核一個退出機制。通則: **語意檢查很好用，但它應該有界。** 給一個重試上限、一個使用者能手動覆蓋的出口，品質把關跟「別讓流程停不下來」才能兼顧。

### 借 Codex 的招: time\_control 每輪注入動態狀態

光有 Judge 擋著還不夠，你還得在每一輪推著 agent 往對的方向走，尤其是時間。但模型自己不知道「現在過幾分鐘了」「進行到第幾題了」，這是 harness 才算得出來的狀態，得主動提供給它。

這裡用的正是實作一 Codex 那一招: 每一輪結束、agent 要繼續時，harness 往對話裡注入一段 prompt。差別在 Codex 注入的是固定的 `continuation.md`，這裡注入的是動態的當下狀態:

```
<time_control>已過 7 分鐘 / 共 15 分鐘<current_question>第 2 / 5 題: …</current_question></time_control>

```

幾個設計點: 它是內部指示，prompt 裡明確交代「DO NOT 對使用者念出、引用，或提及時間、進度」; 而且做了去重，只有「分鐘數變了」或「換題了」才重新插一則，不會每輪都重複注入 (Codex 靠 prompt cache 吸收每輪重播的模板成本，這裡改用去重來省)。然後 prompt 教 agent 怎麼用這個訊號調節奏: 時間充裕就從容追問; 過半還卡在前段就精簡、加速; 最後 1 到 2 分鐘讓每題拿到最小可用答案就趕快推進。

### 一個推進度、一個把關，而且 pattern 不綁時機點

把兩半合起來看，正好是這篇兩種實作的縮影，一前一後配合: time\_control 是 Codex 式的每輪注入 (前饋)，動態提供給模型它自己算不出來的當下狀態，影響它「什麼時候想呼叫換題工具」; Judge 是 Claude Code 式的 transcript 裁判 (回饋)，在它真的呼叫時把關「這次能不能換」。time\_control 推進度、Judge 把關，合起來才讓一場限時訪談既問得夠深、又跑得完。

time\_control: 每輪注入動態狀態 (時間 / 題號) Codex 式 · 前饋: 給模型它自己算不出的當下狀態 訪談 agent 跑一輪 逐題問答 · 判斷這題問夠了沒 獨立 Judge · 只讀 transcript + 該題 rubric Claude Code 式 · 回饋: 把關「這題能不能換」 進到下一題 ✅ harness 推進到下一題 留在本題，換問法追問 回傳可行動指令 + 第幾次被退 影響何時換題 想換題: 呼叫 switch 工具 Y: 切換 N: 留本題 下一輪 退 3 次 / 使用者喊跳 → 強制放行 time\_control 推進度，Judge 把關: 一前一後讓限時訪談問得深又跑得完 ✏️ 小編製圖 

還有一點值得點出來: 這整套其實是做在工具層的 (時機①,Judge 藏在一次 tool call 背後)，不是 Stop hook 那種 turn-end (時機③)。但它借的兩個 pattern，正是這篇為時機③拆過的 transcript 裁判和每輪注入。這說明這些 pattern 並不綁死在某個時機點上，你可以在工具層、單輪結束、外層 loop 任何一個粒度上拿來組合，看你要把「做完了沒」這個判斷，放在多細的工作單位上。

## 銜接下一篇: 一個 context 裝不下的任務呢?

時機③的價值，是在「每一輪結束」這個邊界上，把「做完了沒」交給一個夠獨立的判斷，而不是任憑模型自我感覺良好就算完成。

但它仍有個結構性的上限: 不管是哪一種實作，它們都在「同一個 session、同一個 (或續跑的) context」裡運作。當任務大到一個 context window 根本裝不下 (要跑幾百步、跨好幾天)，光靠單輪驗收收斂不了，失敗的推理還會在 context 裡越積越多、污染後面的判斷。

這就帶到時機④: 外層 loop。下一篇談怎麼把一個任務一輪輪交給全新的 agent，讓進度在 context 之外傳遞，也就是 Ralph、Symphony、Cron 這些 loop engineering 的做法。

© 2026 [愛好資訊科技](https://aihao.tw/)

[關於本站](https://blog.aihao.tw/about/) [訂閱電子報](https://ihower.tw/opt-in/gai) [RSS](https://blog.aihao.tw/feed.xml) 
