<!-- source-url: https://blog.aihao.tw/2026/06/26/harness-engineering-8-model-harness-fit/ -->
<!-- title: 給 Agent 開發者的駕馭工程 (8): 收尾: 會過期的 Harness, Model-Harness-Fit 與 Bitter Lesson | 愛好 AI 工程 Blog -->
<!-- fetched: 2026-06-29 -->

[愛好 AI 工程 Blog](/) 

[關於本站](https://blog.aihao.tw/about/) [ 訂閱電子報 ](https://ihower.tw/opt-in/gai) 

# 給 Agent 開發者的駕馭工程 (8): 收尾: 會過期的 Harness, Model-Harness-Fit 與 Bitter Lesson

2026-06-26 

AgentLLMEval 

![給 Agent 開發者的駕馭工程 (8): 收尾: 會過期的 Harness, Model-Harness-Fit 與 Bitter Lesson](https://blog.aihao.tw/assets/images/harness-engineering-8/cover.png) 

📚 給 Agent 開發者的駕馭工程 (全 9 篇)

1\. [基礎: Deep Agent 的六項內建能力](https://blog.aihao.tw/2026/06/26/harness-engineering-1-deep-agent-capabilities/)

2\. [核心: Agent 要的是回饋迴路，不是完美提示](https://blog.aihao.tw/2026/06/26/harness-engineering-2-what-is-harness-engineering/)

3\. [回饋時機一: 工具回傳值，是寫給 agent 的回饋](https://blog.aihao.tw/2026/06/26/harness-engineering-3-tool-execution-feedback/)

4\. [回饋時機二: 兩次 model request 之間，把訊息注入執行中的 agent](https://blog.aihao.tw/2026/06/26/harness-engineering-4-mid-run-injection/)

5\. [回饋時機三: 單輪結束的驗收，Goal 與 Outcomes](https://blog.aihao.tw/2026/06/26/harness-engineering-5-goal-and-outcomes/)

6\. [回饋時機四: 外層 Loop, Ralph、Symphony 與 Cron](https://blog.aihao.tw/2026/06/26/harness-engineering-6-outer-loop/)

7\. [進階: 自我改進 Harness, Meta-Harness 與爬坡](https://blog.aihao.tw/2026/06/26/harness-engineering-7-self-improving/)

8\. **收尾: 會過期的 Harness, Model-Harness-Fit 與 Bitter Lesson** (本篇)

9\. [自建 Agent 的框架選型: 全套 Deep Agent 還是從基礎構建?](https://blog.aihao.tw/2026/06/26/harness-engineering-9-agent-frameworks/)

🎞️ 搭配演講投影片: [給 Agent 開發者的 Harness+Loop Engineering](https://ihower.tw/presentation/harness.html)

這篇是系列觀念部分的收尾。前面七篇談的能力、回饋時機、自我改進，其實都在回答同一個問題: **在一個固定的模型上，怎麼把 harness 搭好。**

但有一個維度一直沒談到: 時間。模型會升級，而模型一升級，你辛苦做好的 harness 不見得還繼續有效。這一篇補上那條時間軸，替前面的觀念收尾;最後第 9 篇會轉到實作，談自己開發 agent 時怎麼選框架。

模型一升級會發生的事，其實是一體兩面: **harness 跟模型綁在一起，而且它會過期。** 拆開來看:

🔗 harness 綁在特定模型上

同一套 harness 換一個模型，效果不見得一樣好。模型是針對 harness 做 post-training 的，不只是針對 API。

⏳ harness 會過期

模型每次變強，某些當初補強它的元件就不再有用，該被移除。

其中「會過期」這面比較直覺: harness 裡的元件，大多是在補某一代模型的某個短處。它容易忘記，所以加 memory; 它還不會自己規劃，所以加一份 todo 清單; 它不會自己驗收，所以加 grader; 它不熟某種編輯格式，所以替它包一層工具 (這幾樣剛好分別是前面幾篇談過的重點)。模型一變強，這些補強有的仍然必要，有的就變成阻力，難的是事先分不出來是哪一種。

兩件事背後其實是同一個機制: 模型和 harness 在一個共演化的迴圈裡互相塑造 (這個迴圈第七篇借 Viv 的 Model-Harness Training Loop 提過)。先從第一面看起: 為什麼 harness 換個模型就不靈。

## 一套 harness，換個模型就不靈了

先看一個經驗證據。Terminal-Bench 2.0 這個 benchmark 有意思的地方，是它的排行榜不是只排「模型」，而是排「harness + 模型」的配對。同一個模型配上不同 harness，分數可以差好幾個百分點，差距甚至大過一個模型世代的升級。第二篇引過那個對照 (同一個 Opus，放在原廠 harness 排三十幾名，換進另一套進到前五)，就是這個 benchmark 上的事。

這裡有個乍看很矛盾的現象，Saurabh Shah 公開問過一個很多人心裡的疑惑: 怎麼可能有「別的 harness」，在某個頂級能力上，比「模型當初 RL 訓練時就對著用的那個 harness」還能幫到模型? 模型不是應該對自家 harness 最順手嗎?

這個問題要分兩步回答。第一步先講清楚「為什麼模型對自家 harness 特別順手」，也就是 Model-Harness-Fit (講的是 harness 的工具格式、回饋節奏、上下文策略、驗收方式，貼不貼合當下這個模型的訓練分布與能力邊界); 第二步再回頭解這個看似矛盾的現象。

### 模型是針對 harness 訓練的，不只是針對 API

OpenAI 工程師 nicbstme 在一篇深入比對 Codex、Claude Code、GitHub Copilot CLI 三家 harness 實作的[長文](https://x.com/nicbstme/status/2051131906327212298)裡，把這件事講得最透。一句話總結:

> 模型是針對 harness 做 post-training 的，不只是針對 API。

展開來說: tool 的名稱、它預期收到的 input schema、它包住記憶用的 citation 標籤、它呼叫 skill 的檔案結構、harness 要它「先做個計畫」時它遵循的規劃協定，這些都不是模型的通用能力。它們是 byte-level 的慣例，在 post-training 階段就內化成「某一個特定模型對上某一套特定 harness」的本能。把模型抽離它原本的 harness，你就放棄了一段補不回來的效能。

最直接的例子是工具格式。Cursor 的 harness 團隊在 [Continually improving our agent harness](https://cursor.com/en-US/blog/continually-improving-agent-harness) 講得很白 (翻譯):

> OpenAI 的模型被訓練成用 patch 格式來編輯檔案，Anthropic 的模型則被訓練成用字串取代。兩種模型其實都能用另一種工具，但給它不熟的那種，會多花推理 token、也會產生更多錯誤。所以在我們的 harness 裡，我們給每個模型它訓練時用的那種工具格式。

OpenAI / Codex 系

訓練成生 `apply_patch` 的 diff 格式。

Anthropic / Claude 系

訓練成用 `edit_file` 的 `old_string` / `new_string` 字串取代。

這不是「偏好」問題，是 Cursor 在上百萬筆實際運作的 agent 軌跡上量到的、可測量的成本: 兩種模型其實都能用另一種工具，但給它不熟的格式 (讓習慣字串取代的 Claude 用 apply\_patch、讓習慣 apply\_patch 的 OpenAI 用字串取代)，它就會在格式細節上犯更多錯、多花推理 token。

> 編按: 這兩種格式實際長什麼樣、用起來差在哪，留到文末「[補充: apply\_patch 與 edit\_file 實際差在哪](#patch-vs-edit-detail)」一節再展開，免得打斷主線。

而工具格式只是最明顯的一個面，同一套邏輯散落在很多地方:

* **citation 標籤**: Codex 系的模型用完記憶，會在訊息結尾附上一個 `<oai-mem-citation>` 標籤，它的 harness 有個 parser 會解析這個標籤、去累加那條記憶的使用次數，當成記憶該不該淘汰的訊號。把這個模型放到一個不認得這個標籤的 harness 上，使用者會直接看到一串原始 XML，而那個淘汰訊號也永遠不會被觸發。
* **skill 的隱性契約**: skill 看起來最像能跨 harness 共用的東西 (三家都用 `SKILL.md` 加 YAML frontmatter)，但這會誤導。**格式相同，不代表契約相同。** 一個 skill 的 body 裡會用祈使句點名特定工具:「用 TodoWrite 列三個子任務」「用 Agent 開 `subagent_type='Explore'` 的子代理」。這些工具名稱、參數形狀，是綁在寫出這個 skill 的那套 harness 上的。同一份 SKILL.md 搬到別家，TodoWrite 不存在、Agent 的形狀不一樣，skill 就靜默地失效、或跑出降級版本。

### 中途切換模型，是最清楚的失敗案例

把這個綁定看得最清楚的，是「對話進行到一半切換模型」。Cursor 的研究文章把這個失敗面拆得很清楚，三件事同時壞掉:

1️⃣ 對話歷史變 OOD

前一個模型留下的 tool call (patch 格式、citation 標籤)，對接手的模型是訓練分布外的東西。

2️⃣ prompt cache 失效

cache 綁 provider 和模型，一切換就是保證 cache miss，第一輪要全價重算整段歷史。

3️⃣ 工具形狀變了

新模型載入自己的工具集，跟使用者前面用的那套不一樣，它得自己搞懂哪些還能用。

Cursor 的結論很務實 (翻譯):「我們通常建議在一整段對話裡固定用同一個模型，除非你有理由要換。」更好的做法是: 不要切換主對話的模型，而是開一個帶不同模型的 subagent，它從一個乾淨的 context 起步，沒有前一個模型留下的 transcript 偏差，也沒有 cache 會失效。這正好呼應第四、五篇反覆出現的做法: 要換模型、換視角，就開子代理，別動主線。

> 編按: 這條「切換模型 = 換 harness + 換工具 + 讓 cache 失效，三件事一起發生」也說明了一件事: 你以為只是在下拉選單換個名字，實際上是把整個契約換掉。

講到這裡，模型跟 harness 綁得這麼緊，Saurabh 那個問題反而更尖銳了: 既然綁這麼緊，別人家的 harness 到底是怎麼贏過原廠的?

## 「harness」這個詞，被塞了太多意思

解開這個矛盾的關鍵，在 Viv 一串[公開討論](https://x.com/Vtrivedy10/status/2051451869017584112)底下，一位叫 Gangadhar 的人講得最好: 很多看似衝突的說法之所以衝突，是因為「harness」這個詞被塞了太多意思。一旦把它拆成四層，大部分矛盾就能同時成立。

任務分布

你實際要解的那群任務長什麼樣 (Text-to-SQL、客服、訪談…)。

← 你要對齊的目標

workflow 層

任務怎麼拆、subagent 怎麼調度、routing、塞哪些 skill 和專用工具。

← 自建贏在這層

內層 tool loop

怎麼提供 tool 描述、解析 tool call、把結果送回、context 滿了怎麼辦。

← 原廠贏 (一起訓練)

模型

純權重。post-training 有沒有把工具放進迴圈，決定這層的預設傾向。

← 原廠贏 (一起訓練)

拆開之後，矛盾就化解了: **原廠贏在前兩層 (模型加內層 tool loop)，因為它們是一起訓練出來的; 自建或開放 harness 贏在 workflow 層，因為它能貼著一個特定的任務分布去優化。** Model-Harness-Fit 講的是前兩層的契合，「自建打贏原廠」講的是後兩層的優化，兩者根本不在比同一件事，所以可以同時為真。Viv 之所以一度覺得這幾種說法互相矛盾，就是因為把這四層全用「harness」一個詞概括，自然會得出「不可能全部為真」的結論。

這個拆法還順手給了一條實作守則: **內層留給原廠，workflow 層留給自己。** 當你自建 agent、選用某個模型時，別去跟它訓練時的工具格式作對 (該給 `apply_patch` 就給，該給字串取代就給)，那是原廠用 post-training 訓練出來的契合，你動它只會掉分; 你的力氣要花在外層，針對你的任務分布去設計編排、context、skill。

## 自建為什麼打得贏原廠: 對齊你的任務分布

那「贏在 workflow 層」具體是贏在哪? Viv 給了一個三元組來回答: **Model-Harness-Task fit** ([出處](https://x.com/Vtrivedy10/status/2059712077925658717))。

他把 fit 拆成兩種。一種是大家常談的 Model-Harness fit: RL post-training 時把 harness 放進迴圈，模型自然跟特定工具形狀、提示風格產生契合 (就是前面講的那層)。另一種比較少人談、也比較少人實驗的，是 **Harness-Task fit**: 針對任務本身去調 harness，例如領域專屬的提示 (像驗證類的 coding 任務)，或刻意省略掉跟當前任務無關、只會造成混淆的 context。

Viv 點出一個很精準的觀察: Claude Code 這類原廠 harness 的 system prompt 裡塞了大量指令，因為它被迫服務一個非常通用的使用者，這個人基本上可能開口要任何東西。但如果你只針對一個窄任務，用一組高度聚焦、真正相關的 context 和工具，把其他雜訊全部拿掉，好處是很大的。他的原話 (翻譯):

> harness 裡的每一個元件，存在的目的都是為了誘發模型的某種行為。如果這些元件針對任務調校過，模型就受益; 如果是噪音和好內容混在一起，模型可能還行，但也可能被搞混。

這就是為什麼頂尖的垂直領域 AI 團隊，都替自家 agent 打造非常客製的 harness 和 eval。原廠是對著「通用分布」訓練的，你是對著「你使用者的真實任務分布」優化的，在那個窄分布上，你本來就該贏。

而對齊任務分布的方法，Viv 給的因果鏈很清楚:

Eval 形塑 → Harness 貼合 → Task 

先把能代表你使用者的 eval 蒐集好，eval 形塑 harness,harness 貼合 task。這條鏈正好接回第七篇的結論 (harness 自我改進的核心，是那個能自動打分的 eval)，也跟 ihower 一直在講的 eval-driven 方法論是同一回事。

這不是紙上談兵，兩個實作可以佐證「為每個模型分別客製」真的有效:

* **Cursor**: 所有 harness 抽象都做成不綁定特定模型 (model-agnostic)，但每個模型都能深度客製: 給 OpenAI 模型 patch 格式、給 Anthropic 模型字串取代，連 prompt 都按 provider、甚至按模型版本分開寫 (他們觀察到 OpenAI 模型對指令比較字面、精確，Claude 比較能容忍模糊的指令)。他們的描述是:「持續性地堆疊一個個小優化」，而不是指望一步到位。
* **LangChain Deep Agents**: 加了針對不同模型的設定檔 ([profiles](https://www.langchain.com/blog/tuning-deep-agents-different-models))，同一個 agent 換模型時自動套用對應的 prompt、工具、middleware，呼叫端完全不用改。他們在 tau2-bench 一個較難的子集上量到，光是套上對的 profile,GPT-5.3 Codex 從 33% 升到 53%,Opus 4.7 從 43% 升到 53%。改的不是模型，是 harness 那層按模型分流。

所以「自建能不能打贏原廠」這題的答案是: 能，但不是靠複製原廠那套通用 harness，而是靠對齊你自己的任務分布。前提是你得先有能代表使用者的 eval，沒有 eval，你連「贏了沒」都量不出來，更別說往哪裡調。

## harness 會過期

講完「綁模型」，再看一體兩面的另一面: harness 會過期。

Anthropic 在 [Harnessing Claude’s intelligence](https://claude.com/blog/harnessing-claudes-intelligence) 裡，把這件事講成一個該反覆問自己的問題:「有什麼是我可以停止做的?」(What can I stop doing?) 他們的論點是:

> harness 裡的每個元件，都編碼了一項「模型自己做不到什麼」的假設。當模型在某件事上變強，那個假設就過時了，那個元件也該被移除。

### 案例一: context reset，三個世代拆掉三層

Anthropic 自己給的例子很具體: 做過一個跑長任務的 agent，在 Sonnet 4.5 上，模型一感覺到 context 快滿，就開始草草收尾、推說任務太大 (他們叫它 context anxiety，上下文焦慮)。為了補這個，他們在 harness 裡加了「定時清空 context、用結構化交接檔把狀態帶過去」的機制。結果 Opus 4.5 一出，reset 就變得多餘; Opus 4.6 再一出，連更上層的任務拆解 (sprint decomposition) 都整個拿掉，效果反而更好。三個模型世代，拆掉三層 harness。Portkey 的[整理](https://portkey.ai/blog/the-harness-tax/)下了一句很到位的註腳: 這些元件「一月還在承重，三月就成了死碼」。

### 案例二: TodoWrite 退役

更能說明「補強措施怎麼從幫手變成累贅」的，是 Claude Code 的待辦清單。Claude Code 團隊的工程師在 [Lessons from Building Claude Code](https://x.com/trq212/status/2027463795355095314) 裡完整講了這條演化:

* **一開始**: Claude Code 剛推出時，模型撐不住長任務，需要一份待辦清單讓它不偏離任務，於是給了 `TodoWrite` 工具: 開工先寫一份 todo，做完一項勾掉一項。
* **還是會忘**: 光有清單不夠，模型常常忘記自己要幹嘛，於是 harness 每 5 輪插一次 system reminder，提醒它原本的目標。
* **模型變強之後，清單反而綁手綁腳**: 新一代模型不只不需要被提醒，還會被那份提醒限制住: 一直被提醒這份 todo list，反而讓模型以為自己必須照著清單做，而不是動態修改它。再加上 Opus 4.5 變得很會用子代理，但多個子代理要怎麼協作在同一份 todo list 上?
* **於是 TodoWrite 退役，換成新的 Tasks 系統**: 這裡的 Tasks 是一組新工具 (`TaskCreate`、`TaskUpdate`、`TaskList` 等)，不是那個會開子代理、後來改名叫 `Agent` 的舊 Task 工具，兩者只是名字像。Todos 和 Tasks 管的事根本不同: Todos 是「讓單一模型在一個 session 內不偏離任務」，Tasks 是「讓跨 session、跨多個子代理的長專案能協調起來」。

兩者具體差在三個地方，而且最關鍵的第一點 (持久化) 常被忽略:

TodoWrite (舊)

**存在 context 裡**,session 結束或 compaction 一來就消失。扁平清單，沒有依賴關係。單一模型私有，子代理看不到。

Tasks (新)

**寫到磁碟 `~/.claude/tasks/`**，跨 session、跨 compaction 都還在。任務間有依賴 (A 擋著 B,A 完成 B 自動解鎖)。多個 session 和子代理共用同一份，更新即時廣播。

把這三點接回前面幾篇就更清楚: 持久化對應第六篇外層 loop 裡 Ralph 那種「拿外部 plan 檔手動追進度」的做法，Tasks 等於把它變成內建; 依賴與跨代理共享，則對應 Opus 4.5 之後模型很會開子代理、但多個子代理沒辦法協作在同一份扁平 todo list 上的那個缺口。

那篇收尾的一句話正是這一篇的主軸 (翻譯):「隨著模型能力提升，你的模型曾經需要的工具，現在可能正在限制它。不斷回頭檢視『到底需要哪些工具』的舊假設，很重要。」

這裡有個比「變成死重」更精準的觀察，Shane Deconinck 把它叫 scaffolding trap (腳手架陷阱): 當模型變強，腳手架不只是變成死重而已，它會反過來跟模型新獲得的能力衝突。你當初為了補一個短處寫的 workaround，現在正擋著模型去用它學會的更好做法。TodoWrite 就是教科書級的例子: 那些每 5 輪一次的提醒，本來是怕模型忘記，後來卻變成逼模型死守一份它其實該動態修改的清單。

> 編按: 同一篇文章還有一個例子。Claude Code 早期用 RAG 向量資料庫給模型 context，後來發現模型夠強了，直接給它一個 `Grep` 工具讓它自己搜、自己建 context，效果更好也更不易壞。補強措施退場，是個反覆出現的模式，不是單一個案。

### 不是變少，是該做的會變

不過這裡要補一個容易誤會的地方:「模型變強 → 拆掉 harness」不等於「harness 會一路縮到零」。Addy Osmani 講得好: 隨著模型變強，值得做的 harness 不會變少，只是該做哪些會跟著變。Opus 4.6 淘汰掉 context anxiety 那一類腳手架，但能做到的上限也跟著提高了: 原本做不到的任務 (跨好幾天的記憶、協調三個專職 agent、替生成的 UI 設計品質評估器) 現在變得可行，而它們有自己的新失敗模式，需要新的腳手架去補。拆掉舊的、補上新的，假設在變，腳手架也跟著變。

### 沒有一體適用的 harness

同樣的道理不只適用在時間軸上（同一個模型越變越強），在同一個時間點、不同大小的模型之間也成立：harness 該做得多精巧，跟你用多強的模型有關，沒有一套適合所有模型。小模型一次做不對、也撐不住長任務，更需要靠外層的 harness 去補：把工作流拆成多階段、分給不同模型、一段段把關。夠強的大模型常常一次就做完，還能全程待在同一份 context 上，prompt cache 一路有效。

harness 的精巧程度和模型能力綁在一起：小模型得配上一套比較複雜、設計精巧的 harness，表現才會好；同一套複雜 harness 換上大模型卻多半是浪費，多出來的那幾層都是多餘。所以 harness 的架構選擇，沒辦法脫離模型來談。

### 廠商會主動把 harness 訓練進模型

為什麼這些補強措施退場得越來越快? 因為廠商會主動把 harness 的做法訓練進模型。這就是開頭那個共演化迴圈運轉的方向: 一個 harness primitive 先上線，幾個月後它出現在幾百萬筆 agent 軌跡裡，這些軌跡變成下一代模型的訓練資料，再過一代，這個 primitive 就被訓練進模型的本能，harness 那層就能拿掉。幾個看得到的例子:

* OpenAI 把 `apply_patch` 這個編輯格式直接後訓練進模型，模型本身就會生成這個格式 (這跟前面「綁模型」那段是同一件事的兩面)。
* 第五篇提過一點留到這篇講: Fable 5 這代模型「擅長在迴圈中自我修正」已經寫進官方賣點。把這句話翻成 harness 的語言就是: 第五篇那些「逼模型寫完要驗證」的外層腳手架 (Stop hook 退件、催它再檢查一遍的 prompt)，有一部分正在被模型內建的自我修正取代。Anthropic 給的另一個更直白的數據是: 早期 Claude 連玩寶可夢 FireRed 都要一整套含地圖、導航的輔助 harness,Fable 5 只靠純視覺、極簡 harness 就破關了。模型越強，需要的腳手架越少。

OpenAI 那邊也一樣，prompt 和 harness 會跟著一代代模型不斷調整 (Codex CLI 是開源的，這些演進在它的 commit 歷史裡都看得到)。所以「拆 harness、改做法」不是哪一家的專利，是整個產業共通的動作。

這正好把第二篇那個 ratchet (棘輪) 原則補完整。第二篇說，你只在看到真實失敗時才加一條約束; 但棘輪是雙向的，你也只在某天模型強到讓那條約束變多餘時，才把它拆掉。一份好的 AGENTS.md，每一行都該追得回一個具體出過的包; 而當那個包再也不會發生，那一行就該刪掉。加約束和拆約束，是同一套紀律的兩個方向。

第一篇也先提過一點: filesystem 和 sandbox 這些能力「有效，但不代表永遠」。放在這條時間軸上就清楚了: 今天每一個看起來理所當然的 harness 元件，都是某一代模型某個短處的對應物。哪些會被吸收回模型、哪些會留下來、價值持續累積，得看模型往哪裡變強，沒有哪個元件保證能一直留著。

### 每次模型升級，問一次「有什麼可以停止做?」

前面這些拆 harness 的案例，可以歸結成一條給自建 agent 的例行檢查: 每次模型大升級，都重新審一遍 harness，問一次「有什麼是我現在可以停止做的?」把已經派不上用場的腳手架拆掉。具體可以對著手上的 harness 逐項問:

* 這條 prompt 約束，還在提高成功率嗎，還是只是慣性留著?
* 這個強制的規劃步驟 (開工先寫 todo、先列計畫)，還在防止模型偏離任務，還是只是拖慢它?
* 這個 context reset 或交接，還在避免錯誤，還是已經在打斷模型的長程推理?
* 這個 subagent，是真的提高了品質，還是只多了合併成本?
* 這個工具格式，還是這個模型最熟的那一種嗎?

而且這不限於大版本: Anthropic 在 Opus 4.7 的發布說明就提醒，4.7 對指令的遵循變嚴格了，「為早期模型寫的 prompt 可能產生非預期結果，使用者該重新調校自己的 prompt 和 harness」。連小版本升級都可能要回頭重調。這件事不做，你的 harness 會越積越臃腫，反而拖累一個已經更強的模型。

## 幾個不同看法

Model-Harness-Fit 這套說法聽起來很順，但也有一些不同看法，而且講這些的就包括最積極推廣這套框架的 Viv 自己。把不同角度都擺出來才公道:

* **聰明的模型本來就該能輕鬆切換工具格式。** Viv 自己講過 (翻譯):「一個真正聰明的模型，要在不同的 patch 方法之間切換應該毫無困難; 是『把 harness 放進迴圈一起訓練』這件事，造成了這種過度擬合 (overfitting)。」換句話說，模型對自家工具格式的偏好，某種程度上是被訓練慣出來的，不是一種本質的好。
* **長期的解法，也許是用更多樣的 harness 去訓練，讓模型泛化。** 如果偏好來自過度擬合，那對著更多種 harness 訓練、讓模型在任何工具格式上都一樣行，就是更健康的方向。
* **成對推出 = 用可攜性換排行榜。** 廠商把模型和 harness 當成一個產品一起出，確實能在 benchmark 上拿到最好的數字，但代價是模型變得更不可替換。這筆交易划不划算，要看客戶在不在乎可攜性，而現在客戶大多只在乎排行榜。

另外，「harness 會過期」也有它的反面: 不是所有 primitive 都會被吸收回模型，有些會留下來，而且價值會持續累積。哪些被吸收、哪些留下，目前沒有人能事先說準，只能讀軌跡、看數據。

把這些不同看法擺出來不是要否定前面，而是想說: Model-Harness-Fit 是個有用的工程框架，但它描述的是「現在」這個時間點的狀態，不是一條永恆定律。它本身也會隨著時間改變。

## 會過期的，與不會過期的

把整個系列從頭收起來。這七篇講的是一套讓 agent 做得對、做得完的工程方法，但每一個做法、每一個元件，都會隨剛剛那條時間軸改變。那到底有沒有什麼是穿越模型世代、不會過期的?

有，而且這正是整個系列真正的主軸。把東西分成兩堆:

⏳ 會過期

各種 harness 做法與補強措施

對應 Bitter Lesson: 能隨算力擴大的通用方法，終究勝過手工規則。很多會隨更強的模型逐步不再需要。

♾️ 不會過期

定義「什麼叫做好」+ 驗證它做到了

這就是 Eval 與 Judge。穿越模型世代的基本功。

⏳ 會過期的，是各種具體的 harness 做法。這對應的是 [Bitter Lesson](https://blog.aihao.tw/2026/02/17/bitter-lesson-agent-harness/): 能隨算力擴大的通用方法，終究會勝過手工堆砌的規則。但 Bitter Lesson 在這裡不是叫你「別設計 harness」，而是「別把今天這個模型的限制，寫成永遠不動的架構」。工程上你還是需要 harness，只是它該被設計得更精簡、更容易替換、也更容易量出到底有沒有用，這樣模型一變強，你才拆得掉。你今天精心寫的工具、清單、reset、催驗證的 prompt，很多會隨著更強的模型逐步不再需要。用 nicbstme 那句話收尾最貼切: 想待在前沿，你得在每次新模型發布時，刪掉你大半的程式碼。

♾️ 不會過期的，是無論模型變多強，你永遠得回答的兩個問題: 定義「什麼叫做好」、以及驗證它真的做到了。這就是 Eval 和 Judge。

這兩堆的分界，其實貫穿了整個系列。第三篇工具層的確定性檢查和語意 judge、第五篇單輪結束的停止條件和獨立 grader、第六篇外層 loop 的完成判定、第七篇自我改進的核心，講的全是同一件事的不同粒度: 你得有東西能判斷「對不對、完了沒」。

而這件事為什麼不會過期? 因為就算模型強到能完美自我驗證 (第五篇講過，OpenAI 正把驗證往模型層訓練)，它驗證的，仍然是一個「由你定義的目標」。模型可以幫你檢查，但「什麼算達標」這個標準，是你給的。一個會自我修正的模型，也得有個目標可以對齊。所以定義「好」這件事，是那個無論模型多強，都得由你自己來的核心。

這也是為什麼整個系列從第一篇到現在，反覆把工程師的角色描述成同一個轉變: 你被移出的，是那些逐步操作的迴圈 (瓦特調速器那個比喻裡，顧著轉閥門的那一圈); 你留下來做的，是設計回饋、定義目標、把關「什麼叫做好」。模型會一代代把腳手架吸收掉，但它吸收不了那個替它定義成功、並驗證成功的角色。

harness 會過期; 替 harness 定義「對不對、完了沒」的那套 eval 與 judge，不會。這七篇談了這麼多，最後就收在這一句上。

## 補充: apply\_patch 與 edit\_file 實際差在哪

前面「綁模型」那節提到，OpenAI 系的模型被訓練成生 `apply_patch`、Anthropic 系被訓練成用 `edit_file` 的字串取代。這兩種編輯工具實際長什麼樣、用起來差在哪，這裡補充一下。

同樣是「把 `return None` 改成 `return result`」這一個改動，兩種工具的呼叫長這樣:

```
# apply_patch (Codex / OpenAI)
*** Begin Patch
*** Update File: src/handler.py
@@ def handle(req):
-    return None
+    return result
*** End Patch

```

```
# edit_file / str_replace (Claude / Anthropic)
old_string: "    return None"
new_string: "    return result"

```

apply\_patch 是一份 diff: 模型用 `@@` 標出附近的程式碼當定位的參考點，再用 `-` / `+` 標出要刪哪行、加哪行，一份 patch 裡可以同時改好幾個檔案、好幾個位置。str\_replace 則是「找字串、換字串」: 模型給一段必須逐字元完全相符、而且在檔案裡唯一的 `old_string`，加上要換成的 `new_string`，一次呼叫改一個地方。實際用起來，差別落在三處:

* **批次粒度**: 一次大改動，apply\_patch 可以一份 patch 解決多檔多處; str\_replace 通常一次改一個點，多處就要呼叫好幾次。
* **怎麼指出位置**: apply\_patch 靠上下文行定位 (像讀 git diff); str\_replace 要把目標那段原文一字不差地貼出來，還得保證它在檔案裡只出現一次。
* **失敗的方式**: apply\_patch 的上下文對不上 (檔案漂移、縮排差一格) 就套不上去; str\_replace 的 old\_string 差一個空白就找不到，在檔案裡出現兩次就不知道該改哪個。

但放回這篇的主題: 重點不是哪種比較好，而是模型被訓練成習慣哪一種。把 apply\_patch 給習慣字串取代的 Claude 模型，它容易把 diff 的上下文行抓錯、hunk 格式生壞; 把 str\_replace 給習慣 apply\_patch 的 OpenAI 模型，它會在「逐字複製、保證唯一」這件事上犯更多錯。兩種模型其實都能用另一種工具，只是給它不熟的那種，它會多花推理 token、也錯得更多。這就是 Model-Harness-Fit 最具體的一個例子。

© 2026 [愛好資訊科技](https://aihao.tw/)

[關於本站](https://blog.aihao.tw/about/) [訂閱電子報](https://ihower.tw/opt-in/gai) [RSS](https://blog.aihao.tw/feed.xml) 
