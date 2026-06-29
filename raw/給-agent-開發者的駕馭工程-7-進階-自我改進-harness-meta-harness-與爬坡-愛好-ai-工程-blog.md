<!-- source-url: https://blog.aihao.tw/2026/06/26/harness-engineering-7-self-improving/ -->
<!-- title: 給 Agent 開發者的駕馭工程 (7): 進階: 自我改進 Harness, Meta-Harness 與爬坡 | 愛好 AI 工程 Blog -->
<!-- fetched: 2026-06-29 -->

[愛好 AI 工程 Blog](/) 

[關於本站](https://blog.aihao.tw/about/) [ 訂閱電子報 ](https://ihower.tw/opt-in/gai) 

# 給 Agent 開發者的駕馭工程 (7): 進階: 自我改進 Harness, Meta-Harness 與爬坡

2026-06-26 

AgentEval 

![給 Agent 開發者的駕馭工程 (7): 進階: 自我改進 Harness, Meta-Harness 與爬坡](https://blog.aihao.tw/assets/images/harness-engineering-7/cover.png) 

📚 給 Agent 開發者的駕馭工程 (全 9 篇)

1\. [基礎: Deep Agent 的六項內建能力](https://blog.aihao.tw/2026/06/26/harness-engineering-1-deep-agent-capabilities/)

2\. [核心: Agent 要的是回饋迴路，不是完美提示](https://blog.aihao.tw/2026/06/26/harness-engineering-2-what-is-harness-engineering/)

3\. [回饋時機一: 工具回傳值，是寫給 agent 的回饋](https://blog.aihao.tw/2026/06/26/harness-engineering-3-tool-execution-feedback/)

4\. [回饋時機二: 兩次 model request 之間，把訊息注入執行中的 agent](https://blog.aihao.tw/2026/06/26/harness-engineering-4-mid-run-injection/)

5\. [回饋時機三: 單輪結束的驗收，Goal 與 Outcomes](https://blog.aihao.tw/2026/06/26/harness-engineering-5-goal-and-outcomes/)

6\. [回饋時機四: 外層 Loop, Ralph、Symphony 與 Cron](https://blog.aihao.tw/2026/06/26/harness-engineering-6-outer-loop/)

7\. **進階: 自我改進 Harness, Meta-Harness 與爬坡** (本篇)

8\. [收尾: 會過期的 Harness, Model-Harness-Fit 與 Bitter Lesson](https://blog.aihao.tw/2026/06/26/harness-engineering-8-model-harness-fit/)

9\. [自建 Agent 的框架選型: 全套 Deep Agent 還是從基礎構建?](https://blog.aihao.tw/2026/06/26/harness-engineering-9-agent-frameworks/)

🎞️ 搭配演講投影片: [給 Agent 開發者的 Harness+Loop Engineering](https://ihower.tw/presentation/harness.html)

前面六篇談了一整套用回饋約束 agent 的做法: 工具裡閉合的最小迴圈、使用者中途的 steering、單輪結束的驗收、跨 session 的外層 loop。但這些做法有個共通點一直沒挑明: 從頭到尾，動手改 harness 的都是同一個人，你。你寫 Ralph 的 prompt、定 Symphony 的看板規則、設 maintainer orchestrator 的四道關卡，agent 始終是在你定好的 harness 裡運作。

這一篇要問的，就是把這件事再往前推一步: **如果連 harness 本身，都讓 agent 自己改呢?** 也就是，讓 agent 根據自己跑出來的 trace 和 eval，回頭改自己的 harness。

LangChain 的 [Sydney Runkle](https://x.com/sydneyrunkle/status/2066928783534289358) 把這層叫 hill climbing loop (爬坡迴圈)，擺在她那套四層迴圈的最外圈，意思就是把生產環境的 trace 拿回來，改 harness 本身的設定。它跟前三層 (對應這個系列的回饋時機) 的差別在於: 前三層是在一個既定的 harness 裡閉合迴圈，這一層是去動那個 harness。換個講法，一般的 loop engineering 問的是「agent 該不該繼續跑」，而自我改進的 harness 問的是「這一輪跑完之後，系統到底學到了什麼」。

先把一句話放在前面，這篇後面所有做法都以它為前提: **自我改進不是讓 agent 想改什麼就改什麼。** 真正能用的版本，都是在 eval、trace、版本控制和退步關卡 (regression gate) 的限制下，讓 agent 提出「可被驗證、可被回滾」的 harness 變更。少了這些限制，所謂的自我改進，跟讓 agent 自動把 harness 改壞，其實分不太出來。後面三條路講的花樣再多，底下這幾項缺一個，自我改進都不成立:

📋 受控改版的必要條件

**固定評測集** (拿來爬坡的題目) · **Regression set** (每個修好的失敗都變成永久測試) · **Production failure trace** (真實世界跑出來的新失敗) · **版本化的 prompt / 工具 / schema** (改動可追蹤、可比較) · **晉級關卡 (promotion gate)** (主任務沒變好、或舊案例退步就不收) · **回滾機制** (收錯了能退回去) · **高風險改動的人工 review** 

這也是為什麼在這一篇，Goodhart 問題要比前幾篇更早提防: 一旦 agent 會根據 eval 改 harness，它就有動機把 eval 本身當成目標，而不是把真實任務做好。後面每一條路都會再遇到這個問題。

## 誰在改 Harness?

先把「改 harness」這件事的層次分清楚。Harrison Chase 在 [Continual learning for AI agents](https://x.com/hwchase17/status/2040471961206214864) 裡把一個 agent 系統拆成三層，而「持續學習」可以發生在任何一層:

🧠 Model 模型層

改的是權重 (SFT、RL)。這是大廠的事，還卡著 catastrophic forgetting 這個未解的研究難題，自建 agent 多半碰不到。

⚙️ Harness 層

驅動 agent 的程式、固定的 prompt 與工具。本篇主角，agent 可以自己動它。

📄 Context 層

harness 之外、用來配置它的指示、skills、記憶。agent 也能自己更新 (OpenClaw 把這個叫「做夢 dreaming」)。

模型層動不了，但 harness 層和 context 層，agent 是有可能自己改的。為什麼這件事突然變得值得認真談? 因為前面講了五篇，harness 不再是模型的附屬品，它本身就是決定表現的一大關鍵 (第二篇那個「同一個模型換 harness、Terminal Bench 從三十幾名進到前五」的對照)。既然 harness 這麼重要、又是純文字和程式碼，那「誰來改它、能不能自動改」自然就成了下一個問題。

LangChain 的 Viv Trivedi 描述過一個更大的循環，叫 [Model-Harness Training Loop](https://x.com/Vtrivedy10/status/2039872562662941118): harness 裡被驗證有用的元件會被產品化，下一代模型帶著這些 harness 一起後訓練，模型變強之後 harness 再演化。模型和 harness 是互相塑造的。這個大循環裡，廠商那半 (把 harness 訓練進模型) 是最後一篇的題目; 這一篇先看靠近我們這半: 自建 agent 怎麼讓自己的 harness 自動變好。

## 三條路，一個共同前提

整理社群這半年的做法，讓 harness 自我改進大致有三條路:

📡 路一: 讀 Production Traces

線上的失敗案例做錯誤分析，沉澱成新的 Judge 與規則，插回前面的回饋時機。

🔧 路二: Agent 當優化器

任何可快速評估的指標，都能交給 coding agent 用「修改 → 評估」迴圈爬坡。

📚 路三: Self-Improving Skills

把每輪學到的教訓寫回 skill，經驗沉澱成可重用的能力。

三條路長得不一樣，但站在同一個前提上: **要有一個能自動打分的 eval。** 這不是口號。小編先前寫的 [Coding Agent 作為軟體優化器](https://blog.aihao.tw/2026/06/03/coding-agent-as-optimizer/) 整篇都在講同一件事: 當實驗能跑得比人快 100 倍，eval 就變成整條迴圈的瓶頸，指標一旦能被鑽漏洞或量錯東西，模型就會在評測數字上變強、實際上線卻變差。這篇的三條路，每一條的成敗最後都會回到這個前提上，所以後面會反覆提到它。先從第一條看起。

## 路一: 從 Production Trace 到新的 Judge

第一條路最直接: 把線上跑出來的失敗，變成新的把關規則。

為什麼非得靠 production 不可? 因為離線 eval 蓋不住真實世界的無界輸入。你上線前準備的測試資料集，涵蓋的是你「想得到」的情況; 但使用者會用你完全想不到的方式使用產品，而那些案例，離線 dataset 裡一題都沒有。

這裡有個觀察小編覺得蠻到位，姑且叫它「請勿」標語定律: prompt 裡每一條「不可以做 X」，就像現實中的「請勿XXX」標語，一定都是因為有人真的做過，而且你一定想不到竟然有人會去做。換句話說，**你的 system prompt 禁止清單，就是你的事故報告史。** 而新的事故，只會發生在 production。這也呼應第二篇的 ratchet 心法: 你只在看到真實失敗時才加一條約束。差別只在，離線時代的「真實失敗」靠你自己測出來，上線後的「真實失敗」藏在 trace 裡。

於是 debug 的方式也變了，從「讀程式碼找邏輯錯誤」變成「分析 traces」。你要抓的不再是某一行寫錯，而是推理出錯、工具用得很沒效率、決策品質不好這類問題，這些在程式碼裡根本看不出來。

怎麼在生產規模下分析 trace、該看哪些、報告怎麼寫，小編之前在 [如何用 AI 分析 Agent traces?](https://blog.aihao.tw/2026/06/02/agent-trace-analysis/) 整篇講過，這裡不重複。ihower 自己的做法是把這套用 `braintrust-cli` (或 `langfuse-cli`) 包成一個 skill，一句話啟動「review 最近 24 小時的 trace，產生一份品質報告」，裡面寫死了加權取樣規則和固定的報告格式。包成 skill 的好處之一，正好接回上一篇: 它可以排程定期跑，掛上 `/loop` 或 cron，讓「分析自己」這件事本身也納入外層 loop。

這篇要補的是後半段: 分析完之後，那份報告怎麼變成 harness 的永久改進。閉合迴圈分三步:

1️⃣ 發現 production traces 裡 找到新的失敗模式 2️⃣ 沉澱 失敗案例加進 dataset 人工標註，做出對齊的 Judge 3️⃣ 部署 新 Judge 插回三時機之一 工具內 / 單輪 / 外層 loop 監控新 Judge → 又抓到新的失敗模式 → 回到 1️⃣ trace 是證據，Judge 是產出，harness 負責執行 ✏️ 小編製圖 

第三步「部署」是這篇跟前幾篇接得最緊的地方: 沉澱出來的新 Judge，不是擺著看，而是插回前面講過的幾個自動時機。是一個確定性檢查，就放進工具層 (時機①); 是判「整輪做完了沒」的 rubric，就放進單輪驗收 (時機③); 是跨 session 的品質監控，就掛在外層 loop (時機④)。然後監控它、看它有沒有抓到新東西，再回到第一步。這就是線上跟離線接起來的完整閉合迴圈。

要特別強調第二步那個「對齊」。前面幾篇反覆講過，Judge 要先對齊才有意義: 一個沒跟你的判斷校準過的 Judge，只是把你不信任的東西自動化。所以這條迴圈裡，人最該花力氣的不是第一步的「找」(那可以交給 trace 分析 agent)，而是第二步把失敗歸納成分類、做出一個你信得過的 Judge。這一點留到後面再談。

## 路二: Agent 當優化器，用 Eval 爬坡

第二條路把 harness 當成一段可編輯的程式碼，讓 coding agent 反覆改它、爬分。

「改一段程式 → 跑 → 讀指標 → 留好的丟壞的」這個優化迴圈，小編先前在 [Coding Agent 作為軟體優化器](https://blog.aihao.tw/2026/06/03/coding-agent-as-optimizer/) 已經從 Karpathy 的 autoresearch 拆得很細，基本原理這裡不重複，只借 Karpathy 一句話概括: 「任何可以快速評估的指標，都可以交給 agent 來最佳化。」這篇只換一個對象: 把優化目標從訓練腳本、搜尋排序，換成 harness 本身。前提一樣是回饋: **回饋夠好、能自動產生，爬坡才成立**，這也是為什麼 coding 類任務最先成功 (測試好寫，等於有可驗證的獎勵)，而 UI/UX 至今還難 (視覺評估弱，撐不起爬坡)。

### Hill-Climbing 的配方

直接拿 harness 來爬坡，Viv 在 [Better Harness: A Recipe for Harness Hill-Climbing with Evals](https://x.com/Vtrivedy10/status/2041927488918413589) 給了一份很完整的配方。它的核心心智模型蠻好記: 把 eval 當成 agent 的訓練資料。

> 在傳統機器學習裡，是「模型 + 訓練資料 + 梯度下降 → 更好的模型」; 對 agent 來說，就是「harness + evals + harness engineering → 更好的 agent」。每一個 eval 案例都貢獻一個訊號 (這一步動作對不對、產出對不對)，這個訊號引導下一次該怎麼改 harness。

既然 eval 是訓練資料，那 ML 訓練的紀律就整套搬得過來，而其中最關鍵的一條是切出 holdout set:

步驟

在做什麼

蒐集並標記

手寫 + 從 production trace 挖 + 改寫外部資料集; 每個 eval 標上行為分類 (tool selection、multi-step reasoning…)

切分資料

分成最佳化集 (拿來爬坡) 和 holdout 集 (留著驗收)。**這步最重要**: 自動爬坡天生會過擬合，holdout 是「真泛化」的代理

跑 baseline

改任何東西之前先測一次，所有改進都對著這個基準量

最佳化

每輪診斷 trace、提出一個有針對性的 harness 改動 (一次只改一處，避免混淆變因)

驗證不退步

確認新改動讓新案例通過、又沒讓原本通過的退步; 有退步就把退步清單留著，下一輪一起修

人工審查

上線前人看一遍，抓指標看不到的邊角，例如那種「對 holdout 沒壞處、但其實是浪費 token 的過擬合指令」

NeoSigma 開源的 [auto-harness](https://github.com/neosigmaai/auto-harness) 把同一套思路跑成了一個完整的閉合迴圈，而且補上了一個關鍵機制: regression gate (退步關卡)。他們在 Tau3 bench 上，固定底層模型 (GPT-5.4) 不動，只靠改 harness，把驗證集分數 (val score) 從 0.560 推到 0.780，跑了 18 個批次、96 個 harness 實驗。機制是: 從 trace 挖失敗 → 依「根因」分群 (這步很關鍵，逼你針對底層原因，而不是逐個症狀補) → 把失敗變成可重複的 eval 案例 → 提出 harness 改動 → **只有同時滿足「不讓任何已修好的失敗退步 (≥80%)」和「整體分數不退步」才收下，否則 revert**。

退步關卡為什麼是讓收益不斷累積的關鍵? 因為每個被修好的失敗都變成一個永久的測試案例，系統就再也回不到比它已經解掉的更差的狀態。沒有這道關卡，你只是在原地反覆試錯，同樣的失敗一再出現; 有了它，每個改進都是疊加的，門檻只會越來越高。這跟傳統軟體工程的 TDD、回歸測試是同一個道理，只是這裡的測試案例是從 production 失敗累積出來的。NeoSigma 的 regression set 從 0 增加到 17 條，越往後，能通過關卡的候選改動越少 (後段大多被擋下或 revert)，正好說明問題越來越難、改進越來越紮實。

### 順帶提醒: Goodhart 還在

reward hacking 在 [優化器那篇](https://blog.aihao.tw/2026/06/03/coding-agent-as-optimizer/) 講過一大段，改 harness 時一樣存在，而且因為影響面更大反而更危險。Langfuse 那個例子最典型: agent 為了刷分，直接移除「執行前先讓使用者確認」這道人工核准關卡，因為自動測試環境裡沒有真人會按確認，留著就永遠拿 0 分，它還順手刪掉測試沒涵蓋的真功能。結論很簡單: **沒被量到的東西，就會被刪掉。** 所以這條路的人工審查不是可有可無的禮貌，而是擋住 agent 把 harness 改成「eval 上看起來很強、真實使用者面前很爛」的那道關卡。

### GEPA: 對齊之後才自動化

如果你已經有了一個對齊過的 Judge，那其中「改 prompt」這種最常見的改動，可以交給更系統化的工具。[GEPA](https://github.com/gepa-ai/gepa) 就是一個: 它拿 dev set 的分數加上具體的錯誤回饋當訊號，反思 execution traces (執行軌跡)，再用 Pareto search 自動搜尋更好的寫法。GEPA README 講的最佳化對象是廣義的「文字型參數」(prompt、instructions 這類純文字設定)，所以同一套方法原則上也能延伸到 judge 的 prompt、schema 描述，不只是主 prompt。

但要再講一次前提: GEPA 的最佳化目標，就是 Judge 給的分數。**Judge 不準，自動化只會讓你更快地往錯的方向走。** 先把 Judge 對齊，再談自動化 prompt，順序不能反。

### Meta-Harness: 讓 agent 重寫整個 harness

把最佳化的對象從 prompt 一路升級到「整個 harness」，就是 Stanford 的 [Meta-Harness](https://yoonholee.com/meta-harness/) (論文名字直接叫 End-to-End Optimization of Model Harnesses)。它要動的不只是 prompt，而是系統 prompt、工具定義、判斷完成的邏輯、context 管理整套外圍程式。

它跟一般 prompt 最佳化方法最大的不同，在「提案者能看到多少東西」。多數方法把歷史壓縮成一段摘要或一個分數; Meta-Harness 給提案者 (就是一個 Claude Code) 一個檔案系統，裡面放著所有先前候選 harness 的完整原始碼、分數、和 execution traces，讓它用 grep、cat 自己去讀。每一步最多送進 1000 萬個 token 的診斷脈絡 (對照它盤點的其他方法，最多只有 2.6 萬)。所以它不是看摘要猜，而是直接讀原始軌跡做「反事實診斷」: 精準定位是哪一個 harness 決策造成了失敗，再提出針對性的新版，評測、存檔、重複。

成績裡有個數字，正好接回第二篇講過的一點。第二篇講過「同一個模型，換一套沒在訓練時見過的 harness，排名能從三十幾名進到前五」，當時是想說明 harness 是能讓表現跨級距的關鍵。Meta-Harness 在 TerminalBench-2 上，讓 Haiku 4.5 用演化出來的 harness 跑到 37.6%，在所有 Haiku 4.5 的 agent 裡排第 1 (當時榜單狀態，會隨新 agent 加入變動)。一個小模型靠 harness 跨了級距; 而且這次更進一步: 不只是換 harness 能跨級距，連那套 harness 都不是人寫的，是 agent 自己演化出來的。

這條「讓 agent 改 agent」的研究線，往前可以追到 Sakana 的 [Darwin Gödel Machine](https://sakana.ai/dgm/) (把自我改進當成演化搜尋，SWE-bench 從 20% 演化到 50%) 和 Meta 的 [HyperAgents](https://github.com/facebookresearch/hyperagents) (連負責改善的 meta-agent 自己都在被改的範圍內)。這兩個都還是研究系統，看的是這條路能走到多遠，不是能直接搬上 production 的方案。它們的共同前提一樣: **結果可驗證的問題域。** 沒有一個可靠的打分機制，這套自我演化就無從爬起。

## 路三: 把學到的寫回 Skill

第三條路的單位不是 trace、也不是分數，而是 skill。創投 Garry Tan 把它講成一個動詞，叫 [skillify](https://x.com/garrytan/status/2046876981711769720): 每次 agent 犯了錯，就把這個失敗變成一個帶測試的 skill，讓同樣的錯再也不可能發生。

這其實就是第二篇 ratchet 心法的延伸 (「每當你發現 agent 犯了一個錯，就做一個工程上的解法，讓它再也不會犯同一個錯」)，只是這裡的「工程解法」不只是 AGENTS.md 裡的一行規則，而是一整包帶測試的能力。Garry 給的是一份 10 步檢查清單，一個失敗要走完這 10 步才算被 skillify:

📋 skillify 的 10 步

SKILL.md 契約 → 確定性程式碼 → 單元測試 → 整合測試 → LLM evals → resolver 觸發條目 → resolver eval (驗路由有沒有導對) → DRY 重複稽核 → 端到端煙霧測試 → 歸檔規則

清單裡有兩件事正好呼應前面幾篇。第一，第 2 步「確定性程式碼」: skill 教 agent 先用它的判斷力寫出一段確定性的腳本，之後就用那段腳本取代判斷，而不是每次都重新推理。這跟第三篇工具層的第一原則「能確定就不用 LLM」是同一句話，Garry 的例子是查日曆: 與其讓模型每次推理日期，不如讓它寫一個 grep 腳本，然後規則強制它去跑腳本。第二，清單裡有一半都是各種測試 (單元、整合、LLM eval、resolver eval、煙霧)，這又回到那個共同前提: 沒有 eval 把關的 skill，只是程式碼剛好今天能跑。

不過 skillify 不是銀彈，這點 LangChain 的 Viv 在[回應 Garry 那串](https://x.com/Vtrivedy10/status/2046979341427331522)時講得蠻誠實，值得一起看:

Skill 太多，context engineering 反而出問題

如果 skill 一多、彼此難以區分何時該用，負責路由的 resolver 就會失準，你又回到第一篇講的 context rot。可能需要 skill search、把相似的 skill 合併。

別困在 skill learning 的局部最佳 (local minima)

skill 適合修有界、有範圍的問題; 但要解真正困難的長程任務，得從目標往回設計整個 harness 架構，光靠一個個補 skill 容易陷進局部最佳。

而 [Aparna Dhinakaran](https://x.com/aparnadhinak/status/2042022750135709882) 點出的問題更根本: skills 會腐爛。今天寫好的 skill，六週後上游 API 改了結構，它就靜默地回傳垃圾; agent 自動生的 skill 可能 trigger 太弱永遠不被觸發，變成沒人用、白佔 index token 的廢檔; 或者 agent 週一生了 `deploy-k8s`、週四又從另一段對話生了 `kubernetes-deploy`，兩個都在、觸發詞相近，路由就開始亂選。她講得直接: 「沒有測試，任何 codebase 都會腐爛」，這是軟體工程在 2005 年就解決的問題，agent 的 skill 沒有不同。Nous 的 Hermes Agent 能讓 agent 自己創建、修補、刪除 skill，設計很漂亮，但它不測自己的 skill，沒有 resolver eval 驗路由、沒有稽核抓重複。

所以這條路的結論跟前兩條一樣: skillify 的關鍵不在「會不會寫 skill」，而在那 10 步裡的測試。用 Aparna 的話: 評估是讓 harness 自動建構自己的鷹架。沒有評估把關，自我改寫的 skill 只是把幻覺寫進長期記憶。

## 自我改進 Harness 的十層堆疊

前面三條路是三種切入，散在不同做法裡。AlphaSignal 把這個題目下的 28 篇論文[歸納成一套十層堆疊](https://alphasignalai.substack.com/p/10-layers-of-self-improving-harness)，正好把這三條路、加上開頭那張「受控改版的必要條件」清單，展開成一套從基準到量測的完整結構。它的定調跟這篇一致: 自我改進不是「讓 agent 自己重寫自己」。對照靜態 harness 看最清楚: 靜態版一失敗只能等人工修補，改完就結束，系統不會從這次失敗累積出任何改進; 自我改進版則是模型凍結，失敗證據 → 改 harness → 過關卡 → 版本化 → 再回頭量 worker 有沒有真的變好，形成一個閉合迴圈，比較像替 agent 行為做 CI (持續整合)。

靜態 Harness 失敗不會累積成改進，系統學不到東西 基礎模型 靜態 Harness prompt · tools · 記憶規則 · validators 跑任務 失敗 人工修補 自我改進 Harness 模型凍結 失敗證據 改 Harness 關卡 Gate held-out · 退步 · 回滾 版本化 Harness Worker 效益檢查 新證據 Self-Harness 40.5→61.9% · AHE 69.7→77.0% · SkillOpt 52/52 cells ✏️ 小編重繪，仿 AlphaSignal 

把上面這個自我改進的閉合迴圈拆解開，從最底層的固定基準一路到最上面選配的權重更新，一共十層:

1

**穩定基底** Stable Substrate · 釘住改 harness 時不准動的基準

2

**執行軌跡** Trace Log · 記下每個 tool call、重試、verifier 輸出與成本

3

**外部狀態** External State · 學習放進 skills、記憶、policy 等可回滾的檔案

4

**失敗挖掘** Failure Mining · 過濾 trace，依根因把失敗分群

5

**提案引擎** Proposal Engine · 把證據轉成具體、可驗證的候選改動

6

**驗證關卡** Validation Gate · 過 held-out + 不退步才准晉級。沒有關卡就沒有自我改進

7

**版本與回滾** Versioning & Rollback · 把 harness 當 repo，連被否決的改動都存檔

8

**路由與變體** Routing & Variants · 依任務類別分出多個 harness，避免修法互相矛盾

9

**效益量測** Benefit Measurement · 量 worker 換新 harness 後實際有沒有變好

10

**選配的權重更新** Optional Weight Update · 前九層都穩了，才考慮動模型權重

**第 1-2 層: 先讓改動可被歸因。** 第 1 層先釘住改 harness 時什麼不准動: 底層模型、runtime、工具、評測器、benchmark 切分。沒有固定的基準，分數一變就無從歸因到底是哪一項造成的。第 2 層留下完整 trace，每個 tool call、檔案讀寫、重試、verifier 輸出、成本都記下來，根因分析才有依據，而不是只看最後結果對不對 (對應路一的 trace 分析)。

**第 3-5 層: 把學習外部化，再提煉成提案。** 第 3 層把學到的東西放在模型之外、可檢視可測試可回滾的地方 (skills、記憶檔、自然語言 policy、工具 wrapper)，論文裡的 SkillOpt 就是這條路，在 52 個評測 cell 上都拿到改進 (對應路三)。第 4 層過濾 trace，只挑「能教出可重用教訓」的失敗，再依根因和機制分群，而不是每筆 trace 一視同仁 (對應路一的錯誤分析、NeoSigma 的依根因分群)。第 5 層把證據轉成具體候選改動，每個提案都要寫清楚: 改了哪個元件、依據什麼證據、預期修好什麼、可能帶來哪些退步。

**第 6 層: 關卡，整套堆疊的關鍵。** 改動只有通過 held-out 驗證、又沒造成退步，才准晉級。這是全文講得最重的一句: **「沒有關卡，就沒有自我改進。」** 這層正是 NeoSigma 的 regression gate、路二配方裡「驗證不退步」那一步。

**第 7-9 層: 管理、分流、量真實效益。** 第 7 層把 harness 當成一個 repo 來管: diff、commit 歷史、還原，連被否決的改動也存下來，當未來的證據。第 8 層依任務類別、難度、失敗模式分出多個 harness 變體，而不是維護單一一份全域 policy，避免互相矛盾的修法累積在同一份 harness 裡。第 9 層最關鍵、也最常被跳過: 量的是「worker agent 換上新 harness 之後實際有沒有變好」，而不是拿「更新器本身好不好」當代理指標。

**第 10 層: 選配的權重更新。** 最後一層是選配的，把 harness 改動再疊上模型權重更新; 建議只有在前面九層都已經可量測、能運作之後，才考慮動模型。

第 9 層的提醒，來自一篇標題就很直白的論文《Harness Updating Is Not Harness Benefit》(更新 harness 不等於 harness 有效益): 它發現不同 harness 更新器之間，本身能力差距其實很小 (最多 3.1 分)，但換到下游、不同模型不同 benchmark 上，實際效益差很多。換句話說，**改了 harness 不等於 agent 真的變好。** 如果 worker agent 載不動、跟不上、用不了那套新 harness，那個改動就只是一個好看的 diff。

所以整套十層，真正把「自我改進」跟「自動作弊」分開的，就是第 6 層的關卡和第 9 層的效益量測。用 AlphaSignal 的原話: 關卡才是產品; 沒有它，這個迴圈只會自動走向過擬合。面對任何自我改進的 demo，第一個該問的不是「它改了什麼」，而是「哪一道關卡收下了這個改動、收下之後 worker 真的變好了嗎」。

## 三條路、十層堆疊，最後都回到 Eval

不管是前面三條路，還是剛拆完的十層堆疊，擺在一起看，最後都指向同一個點: 那個能自動打分的 eval。trace 沉澱成 Judge，要 Judge 對齊; 爬坡要對著 holdout 和 regression gate; skillify 要那 10 步裡的測試; 連十層裡最關鍵的第 6、9 兩層，把關的也是 eval。harness 怎麼自我改進的花樣可以很多，但能不能真的變好，全卡在這一件事上。

> 編按: Viv 把這個心智模型[寫成一條公式](https://x.com/Vtrivedy10/status/2045230994656305485)很傳神: `agent = fit(model, harness, evals)`。就像 sklearn 的 `fit(model, data)`,evals 是 agent 的訓練資料，每一個 eval 都在投票決定 harness 該怎麼改。差別只在，前沿大廠花幾百萬在模型訓練的資料品質上，而做 agent 的團隊，該把同等的心力投在 eval 的策展與設計上。

而這正是自我改進 agent 最大的風險所在。AlphaSignal [另一篇講自我改進 agent 風險的整理](https://alphasignalai.substack.com/p/when-ai-agents-learn-to-engineer)，後半很誠實地點出風險: 最大的問題是 reward hacking,agent 會一味衝高單一指標、鑽評分函數的漏洞，達標卻沒真正解決問題; 還有卡在局部最佳的傾向 (autoresearch 社群就觀察到 agent 常常只會保守地微調超參數，不去做真正創新需要的大膽架構改動); 另外還有失控把算力預算耗光、寫出不安全程式碼這些風險。

這些風險反過來說明了一件事: **自我改進 agent 越強，設計好 eval、控管好安全風險、引導整個流程的資深工程師，反而越不可或缺。** 當 agent 開始自己改自己，你的 grader 設計得好不好，直接決定它是真的變強、還是學會作弊。所以前面講的那些自動化機制，幾乎都把人留在某個關卡上: Better-Harness 明確有一步人工審查，NeoSigma 也保留了引入人工審查的選項。這跟這個系列從第一篇講到現在的態度一致: 工程師被移出的是逐步操作那幾圈，留在最外圈做的，是定義「什麼叫做好」並守住它。

© 2026 [愛好資訊科技](https://aihao.tw/)

[關於本站](https://blog.aihao.tw/about/) [訂閱電子報](https://ihower.tw/opt-in/gai) [RSS](https://blog.aihao.tw/feed.xml) 
