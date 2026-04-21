---
title: "Harness Engineering（AI駕馭工程）入門篇：OpenAI最新編程標準，教你輕鬆做到Lv.1"
source: "https://www.blocktempo.com/openai-harness-engineering-million-lines-code-zero-human-written-guide/"
author:
  - "[[flip]]"
published: 2026-04-04
created: 2026-04-21
description: "OpenAI 工程師在五個月內用 AI 代理產出了 100 萬行程式碼，而人類從頭到尾沒有親手寫過一行 code。這背後的方法論叫做「Harness Engineering（駕馭工程）」，靠著駕馭 AI 工具，重新定義軟體工程師的角色。（前情提要：Claude Code 新增雲端定時任務：不用開電腦，AI 自動幫你審 PR、升級依賴）（背景補充：Cursor 用 Kimi K2.5 訓模型卻沒說，開發者抓包、刪推、官方急轉彎全紀錄） 如果你最近有在關注 AI 與軟體開發的交會點，你一定會注意到一個新詞正在矽谷瘋傳：Harness Engineering。這個由 OpenAI"
tags:
  - "clippings"
---
[![Harness Engineering（AI駕馭工程）入門篇：OpenAI最新編程標準，教你輕鬆做到Lv.1](https://image.blocktempo.com/2026/04/ai-harness-1140x815.jpg "ai harness | 動區動趨-最具影響力的區塊鏈新聞媒體")](https://image.blocktempo.com/2026/04/ai-harness.jpg)

OpenAI 工程師在五個月內用 AI 代理產出了 100 萬行程式碼，而人類從頭到尾沒有親手寫過一行 code。這背後的方法論叫做「Harness Engineering（駕馭工程）」，靠著駕馭 AI 工具，重新定義軟體工程師的角色。  
（前情提要： [Claude Code 新增雲端定時任務：不用開電腦，AI 自動幫你審 PR、升級依賴](https://www.blocktempo.com/claude-code-new-scheduled-remote-tasks/) ）  
（背景補充： [Cursor 用 Kimi K2.5 訓模型卻沒說，開發者抓包、刪推、官方急轉彎全紀錄](https://www.blocktempo.com/cursor-used-kimi-k2-5-to-train-model-without-disclosure/) ）

如果你最近有在關注 AI 與軟體開發的交會點，你一定會注意到一個新詞正在矽谷瘋傳： **Harness Engineering** 。這個由 OpenAI 內部團隊 [提出的概念](https://openai.com/zh-Hant-HK/index/harness-engineering/) ，描述了一種全新的軟體開發模式。在這種模式裡，工程師不再親手寫程式碼，而是設計一套「駕馭系統」，讓 AI 代理（Agent）在這個系統裡自主完成從寫 code 到提交 PR 的所有事情。

這聽起來像科幻小說？其實已經發生了，OpenAI 已經用這種方式，在五個月內從零打造了一個包含百萬行程式碼的完整產品，而且這不是實驗室裡的 demo，是每天有數百名員工在使用的真實產品。

本篇是「Harness Engineering」系列教學的「入門篇」，會用最白話的方式，把 OpenAI 工程師 Ryan Lopopolo 發表的這篇重量級文章，從頭到尾解釋給你聽。

### 先搞懂為什麼需要一個新名詞？

在過去兩年裡，我們已經經歷了好幾波 AI 輔助開發的浪潮，從最早的 GitHub Copilot（像自動補完般幫你接下一行 code），到後來的 Cursor、Claude Code 這些更聰明的 AI 程式助手，再到現在的「AI 代理」（Agent），可以自己開一個分支、跑測試、提交 Pull Request。

但隨著 AI 代理越來越強，一個根本性的問題浮現了！

> 模型本身已經不是瓶頸，模型周圍的系統才是

什麼意思？想像你僱了一個超級能幹的新員工。他寫 code 的速度是你的十倍，但他第一天上班，你只丟給他一句「去做那個功能」，沒有給他看架構圖、沒有告訴他團隊的 coding style、沒有讓他跑過測試環境。結果會怎樣？他會非常努力地寫出一堆不符合規範、跟現有系統格格不入的程式碼。

這就是目前大多數人使用 AI 代理的狀態， **模型很強，但環境本身沒準備好。**

Harness Engineering 就是在解決這個問題。它不是在改良模型本身，而是在設計「模型周圍的一切」，讓 AI 代理能在一個精心設計的環境裡，可靠、高效、持續地產出高品質程式碼。

### 一個很古老的比喻：瓦特的離心變速器

OpenAI 在文章裡用了一個非常巧妙的歷史類比，1788 年，蘇格蘭工程師詹姆斯·瓦特（James Watt）發明瞭離心變速器（centrifugal governor），這是一個安裝在蒸汽引擎上的機械裝置。在那之前，工人必須持續手動調整蒸汽閥門，來維持引擎的穩定轉速。

變速器改變了工作的模式，工人只需要設定目標轉速，機械結構會自動維持運作。

Harness Engineering 的核心哲學跟這個一模一樣：

> Humans steer, agents execute.（人類掌舵，代理執行。）

工程師不再是「手動調整閥門」的人（也就是一行一行寫 code 的人），而是「設計變速器」的人（設計讓 AI 能自主穩定運作的系統）。這個從「操作員」到「設計師」的轉變，就是 Harness Engineering 的核心。

### OpenAI 的實驗

讓我們先看看 OpenAI 這個實驗的具體成果，因為這些數字本身就很有說服力：

- **時間**: 五個月（從 2025 年 8 月開始）
- **程式碼量**: 約 100 萬行（涵蓋應用邏輯、基礎設施、工具、檔案、內部開發工具）
- **人類手寫的程式碼**: 零行
- **團隊人數**: 從 3 人逐步擴充套件到 7 人
- **合併的 Pull Request 數**: 約 1,500 個
- **每位工程師每天產出**: 平均 3.5 個 PR
- **AI 代理單次自主工作時長**: 超過 6 小時
- **產品狀態**: 已有數百名內部使用者每天使用

這裡有幾個關鍵數字值得特別注意。

首先「零行手寫程式碼」不是形容詞，是這個團隊要追求的核心。他們不是「大部分用 AI 寫，偶爾手動修一下」，而是從立項之初就定下一條規則： **人類永遠不直接寫程式碼** 。

這條規則逼著團隊必須認真投資在代理的基礎設施、上下文管理和工作流程設計上。如果你永遠不能「自己動手修一下」，你就必須把系統做到讓 AI 自己能修。

再來「3.5 個 PR / 人 / 天」這個數字。在傳統軟體開發中，一個工程師一天能合併一個 PR 就算不錯了。3.5 倍的產出意味著每個工程師的有效產能大約是傳統的 3 到 10 倍。換算下來，這個 7 人團隊的產出大約等於一個 21 到 70 人的傳統團隊。

第三是關於「布魯克斯定律」（Brooks’s Law）

軟體工程界有一條經典定律：「在一個已經落後的專案裡加人，只會讓它更慢。」

![](https://image.blocktempo.com/2026/04/unnamed-3.png "unnamed-3 | 動區動趨-最具影響力的區塊鏈新聞媒體")

因為人多了，溝通成本會呈指數增長。但 OpenAI 的實驗打破了這個魔咒。當團隊從 3 人擴充套件到 7 人時，整體產出呈近線性增長，並沒有出現傳統的溝通瓶頸。

為什麼？因為工程師之間的「溝通」很大一部分被轉移到了檔案系統和代理指令裡。AI 代理不會開會、不會在 Slack 上聊天、不會去搞辦公室政治浪費時間。它們讀檔案、跑測試、提交 PR，效率取決於系統設計的品質，而不是人與人之間的溝通成本。

### Harness Engineering 的正式定義

好，看完OpenAI提出的數字，讓我們正式定義這個概念。

**Harness Engineering（駕馭工程）** 是一門設計基礎設施、約束條件和回饋迴圈的學科，目的是讓 AI 代理能可靠且大規模地運作。

「Harness」這個英文字本身就很有畫面。它的原意是「馬具」，就是那套套在馬身上的韁繩、馬鞍和控制裝置。AI 模型是那匹強大但不可預測的馬，Harness 就是韁繩、馬鞍和導引系統；工程師則是騎士，提供方向。

更具體地說，Harness Engineering 包含四個核心功能：

- **約束（Constraining）**: 限定代理能做什麼、不能做什麼——設定邊界
- **告知（Informing）**: 讓代理理解目標是什麼——提供上下文
- **驗證（Verifying）**: 確認代理是否正確執行——測試和檢查
- **修正（Correcting）**: 當代理犯錯時自動修復——回饋迴圈

這四個功能環環相扣，構成了一個完整的控制系統。而工程師的工作，就是設計和維護這個控制系統。

![](https://image.blocktempo.com/2026/04/unnamed-4.png "unnamed-4 | 動區動趨-最具影響力的區塊鏈新聞媒體")

### 第一根支柱：Context Engineering（上下文工程）

Harness Engineering 有三根核心支柱。第一根，也是最基礎的一根，叫做 **Context Engineering（上下文工程）** 。

這個概念的核心邏輯非常簡單：

> 對 AI 代理來說，它在上下文（context）裡看不到的東西，就等於不存在。

這句話值得反覆理解，如果你的團隊有一條不成文的規定「API 回傳格式一律用 snake\_case」，但這條規定只存在於某個人的腦袋裡，或者埋在三年前一則 Slack 訊息裡，那 AI 代理永遠不會知道這件事。它會快樂地用 camelCase 寫完所有 API，然後你就得花時間一個一個改回來。

所以 Context Engineering 的第一條原則是： **所有代理需要知道的事情，都必須存在於儲存庫（repository）裡。** 儲存庫就是唯一的真相來源（single source of truth）。

OpenAI 團隊在實踐中發現了一個重要的檔案架構心得：

**AGENTS.md 應該是目錄，不是百科全書。**

很多團隊在開始使用 AI 代理時，會建立一個 AGENTS.md 檔案（或者 CLAUDE.md、.cursorrules 等），然後把所有規則、慣例、架構說明全部塞進同一個檔案裡。OpenAI 的經驗是，這樣做會讓檔案變得巨大而難以維護，也會塞爆 AI 的上下文視窗。

更好的做法是把 AGENTS.md 當成一本書的目錄頁，讓它指向一個結構化的 docs/ 資料夾：

> AGENTS.md（目錄頁）  
> ↓  
> docs/  
> ├── architecture.md（架構說明）  
> ├── conventions.md（編碼慣例）  
> ├── api-reference.md（API 參考）  
> ├── execution-plans.md（執行計畫）  
> └── …

這樣做的好處是：代理可以先讀目錄頁，瞭解整個專案的知識地圖，然後根據當前任務的需要，深入特定的檔案去獲取細節。這就像一個聰明的新員工不會把整本員工手冊從頭到尾背下來，而是知道哪些資訊在哪裡，需要的時候翻到那頁就好。

Context Engineering 又可以分為兩種型別：

**靜態上下文（Static Context）** 是那些不會頻繁變動的資訊：

- 專案架構規範、API 合約、程式碼風格指南
- AGENTS.md 檔案中編碼的專案特定規則
- 經過 linter 驗證的設計檔案

**動態上下文（Dynamic Context）** 是即時變動的資訊：

- 可觀測性資料（日誌、指標、追蹤記錄）
- 啟動時的目錄結構掃描
- CI/CD 管線狀態和測試結果

![](https://image.blocktempo.com/2026/04/unnamed-5.png "unnamed-5 | 動區動趨-最具影響力的區塊鏈新聞媒體")

OpenAI 團隊做了一件特別值得大家學習的事，他們讓 AI 代理能夠直接存取生產環境的可觀測性資料。代理可以用 LogQL 查詢日誌，用 PromQL 查詢指標。這意味著代理不只能寫 code，還能驗證自己寫的 code 在真實環境中是否正常運作。

他們甚至把 Chrome DevTools Protocol 接進了代理的執行環境，讓代理可以自己渲染 UI、截圖、檢查互動行為。一個 AI 代理在修完一個前端 bug 之後，可以自己開啟瀏覽器確認畫面是否正常，而不需要等人類去肉眼檢查。

### 第二根支柱：Architectural Constraints（架構約束）

第二根支柱是 **Architectural Constraints（架構約束）** ，這是整個 Harness Engineering 裡最反直覺但最重要的部分。

一般人會覺得 AI 這麼聰明，應該給它最大的自由度，讓它自由發揮，對吧？

答案剛好相反。

> 限制 AI 的解題空間，反而能提升它的生產力。

這是因為 AI 代理在面對一個完全沒有約束的問題時，會花大量的「思考」和「嘗試」去探索各種可能的解法，其中很多是死路一條。

但如果你告訴它「這個專案裡，所有模組的依賴關係必須遵循 Types → Config → Repo → Service → Runtime → UI 的順序，每一層只能從左邊的層 import」，它就能在一個大幅縮小的解題空間裡，更快地找到正確答案。

就像下棋一樣，規則限制了你的走法，但正是這些規則讓棋局變得有意義、讓高手能展現實力。如果你可以隨便把棋子放在任何地方，搞一個天元突破，棋沒法下了。

OpenAI 團隊在實踐中，透過以下方式來強制執行架構約束：

**1\. 自定義 Linter**

他們建立了自己的 linter 規則，會自動檢查程式碼是否違反了架構邊界。重要的是，這些 linter 的錯誤訊息不只是告訴你「這裡錯了」，還會告訴你「應該怎麼改」。這等於是在代理工作的過程中同步教育它。

**2\. 結構測試（Structural Tests）**

類似 Java 生態系的 ArchUnit，但用在 AI 生成的程式碼上。這些測試會驗證依賴方向是否正確、模組邊界是否被遵守、命名慣例是否一致。

**3\. LLM 審計員**

用另一個 AI 來審查 AI 寫的 code。沒錯，這就是「AI 審查 AI」的模式。OpenAI 的團隊甚至完全用 agent-to-agent 的 code review 來取代人類 review，這是目前已知最激進的做法。

**4\. Pre-commit Hooks**

在代理提交程式碼之前自動執行一系列檢查。不透過就不能提交，這是最基本也最有效的約束機制。

![](https://image.blocktempo.com/2026/04/unnamed-6.png "unnamed-6 | 動區動趨-最具影響力的區塊鏈新聞媒體")

這裡有一個重要的思維轉換：在傳統開發中，架構約束是用來管理「人」的。我們擔心有人會走捷徑、有人會偷懶、有人不熟悉規範。在 Harness Engineering 裡，這些約束是用來管理「AI」的。AI 不會偷懶，但它會「複製模式」。它看到程式碼庫裡有一個 pattern，就會照著用，即使那個 pattern 是次優的。嚴格的架構約束確保了即使 AI 複製模式，複製的也是正確的模式。

### 第三根支柱：Entropy Management（熵管理）

第三根支柱叫做 **Entropy Management（熵管理）** ，或者用 OpenAI 自己的說法，叫做「垃圾回收」（Garbage Collection）。如果對熱力學有點理解，或是看過《天能》這部電影的人，可能知道這形容的精確。

這個概念來自一個實際觀察，AI 代理生成的程式碼，會隨著時間累積一種特殊的「混亂」。這種混亂跟人類造成的技術債不太一樣。人類的技術債通常來自「趕時間的 workaround」或「沒人想碰的老 code」。AI 的混亂來自「檔案漂移」、「命名慣例分歧」和「死 code 堆積」。

舉個例子，一月份你在 architecture.md 裡寫了「使用者認證走 JWT」。三月份，代理 A 根據一張新 ticket 把認證改成了 Session-based。但 architecture.md 沒有被同步更新。四月份，代理 B 讀到過期的 architecture.md，又用 JWT 寫了一個新模組。結果你的系統裡同時有兩套認證機制，而且沒有人知道哪個才是對的。

這就是「熵」，在物理學裡，熵是衡量系統混亂程度的指標。在軟體工程裡，它指的是程式碼庫隨時間累積的不一致性。

OpenAI 的解法是 **用 AI 代理來清理 AI 代理造成的混亂。**

他們建立了定期執行的「清潔代理」（cleanup agents），這些代理會：

- 掃描檔案是否與實際程式碼行為一致
- 檢查是否有違反架構約束的地方
- 確認命名慣例是否統一
- 審計依賴關係是否乾淨
- 找到問題後自動開 PR 來修復

這些清潔代理可以按排程執行（每天、每週，或事件觸發），持續維護程式碼庫的健康度。OpenAI 在文章裡把這比喻為「技術債就像高利貸，最好以小額度持續償還」。不要等到混亂累積成災再來大掃除，而是持續、自動、小步地清理。

![](https://image.blocktempo.com/2026/04/unnamed-7.png "unnamed-7 | 動區動趨-最具影響力的區塊鏈新聞媒體")

這個概念對人類開發者來說也很重要，如果你把「品味」（taste）和「黃金法則」（golden rules）編碼一次，然後讓系統在每一行程式碼上持續強制執行。

人類的品味不再需要透過 code review 一次一次地傳遞，而是被機械化地儲存下來。

### 工程師的新角色：從「寫 code 的人」到「設計環境的人」

讀到這裡，你可能已經感覺到了：在 Harness Engineering 的世界裡，工程師的工作內容發生了根本性的轉變。讓我們把這個轉變講清楚：

**以前 → 現在**

- 寫程式碼 → 設計讓 AI 寫程式碼的環境
- 除錯 code → 除錯代理行為模式
- 做 code review → 審查代理的產出和系統的有效性
- 寫測試 → 設計測試策略讓代理去執行
- 維護檔案 → 把檔案當成機器可讀的基礎設施來建設

注意，這不是「技術需求降低了」。恰恰相反，Harness Engineering 需要更深層的架構思維。你不再需要記住某個語言的 API 語法，但你需要理解整個系統的依賴關係、資訊流動、約束邊界。這是一種更高層次的工程能力。

![](https://image.blocktempo.com/2026/04/unnamed-8.png "unnamed-8 | 動區動趨-最具影響力的區塊鏈新聞媒體")

OpenAI 團隊的工程師在文章中描述了他們的日常工作方式：

> 人類互動主要透過提示（prompt）進行。工程師描述任務，執行代理，讓代理開啟 PR。然後指示另一個代理進行 code review，回應反饋，在迴圈中迭代，直到所有審查者滿意。

仔細讀這段描述，工程師的主要工作是：描述任務（intent specification）、觀察結果、指導迭代。這更像一個建築師或導演的角色，而不是泥水匠或演員。

當遇到問題的時候，他們的思考方式也不同了。

傳統工程師遇到 bug 會想「讓我看看哪一行寫錯了」。Harness 工程師遇到 bug 會想「代理為什麼會犯這個錯？是缺少什麼上下文嗎？是約束不夠嚴格嗎？是回饋迴圈斷了嗎？」

這種思維轉換，正是 Mitchell Hashimoto（HashiCorp 創辦人、Ghostty 終端模擬器的作者）所說的：

> 每當你發現代理犯了一個錯誤，你就花時間設計一個解決方案，確保代理再也不會犯同樣的錯。

每一次代理犯錯，都不是「AI 好爛」的證據，而是「我的系統還有哪裡可以改進」的訊號。

### 代理能做到什麼程度？一個完整的工作流程

OpenAI 在文章中描述了代理目前能自主完成的端到端流程，讓我們看看一個典型的 bug 修復流程是什麼樣子：

**Step 1：驗證儲存庫當前狀態**

代理啟動後，先掃描整個程式碼庫，瞭解目前的檔案結構和近期變更。

**Step 2：重現報告的 Bug**

根據 bug report 的描述，代理自己嘗試重現問題。

**Step 3：錄製展示失敗的影片**

代理透過 Chrome DevTools Protocol 錄製一段影片，證明 bug 確實存在。

**Step 4：實現修復**

代理寫 code 來修復問題。

**Step 5：驗證修復**

代理跑測試、檢查 UI 渲染、確認修復有效。

**Step 6：開啟 Pull Request**

代理自動提交 PR，包含修改說明。

**Step 7：回應反饋**

如果 reviewer（可能是另一個 AI 代理）提出修改建議，代理會自動回應並迭代。

**Step 8：偵測和修復構建失敗**

如果 CI 管線失敗，代理會自己診斷問題並修復。

**Step 9：僅在需要判斷時升級給人類**

只有當問題涉及產品方向、設計決策等需要人類判斷的議題時，代理才會暫停並通知人類。

**Step 10：合併更改**

一切透過後，自動合併。

整個流程中，代理可以自主工作超過 6 小時。這個持續時間遠超目前大多數 AI 代理的能力範圍，也是 OpenAI 在這篇文章中特別強調的成就之一。

### 「最小化阻塞」的合併哲學

OpenAI 團隊在 PR 合併策略上也做了一個重要的設計決策： **最小化阻塞合併門檻** 。

在傳統軟體開發中，一個 PR 可能需要等待多個 reviewer 同意才能合併。在 OpenAI 的系統裡，PR 的生命週期非常短暫。他們的邏輯是：

> 在這個系統中，修正的成本很低，而等待的成本很高。

因為代理可以快速修復問題，所以與其花很多時間在合併前確保萬無一失，不如快速合併、快速發現問題、快速修復。

測試偶爾不穩定（flaky test）？通常在下一次執行中就解決了。某個 PR 引入了一個小 bug？另一個代理會在幾分鐘內修好它。

這種哲學只有在你擁有強大的自動化測試、持續的監控、和快速的回饋迴圈時才可行。如果你的系統沒有這些基礎設施，快速合併只會製造災難。所以，這不是在鼓勵「不審核就合併」，而是在說 **當你的 harness 足夠成熟時，你可以用速度換取品質的另一種形式。**

### LangChain 的佐證：不換模型，只改 Harness，成績就大幅提升

如果你覺得「這是 OpenAI 用自己的頂級模型做的，當然厲害」，那讓我們看看另一個更有說服力的案例。

[Martin Fowler](https://martinfowler.com/articles/exploring-gen-ai/harness-engineering.html) 在其分析文章中引用了 LangChain 的實驗：他們的 coding agent 在 Terminal Bench 2.0 基準測試上的成績，從 52.8% 跳到了 66.5%。這個提升讓他們從排行榜的第 30 名左右一路衝到前 5 名。

重點來了， **他們完全沒有更換模型。**

他們只改了「harness」的部分，具體包括四個變更：

- **自我驗證迴圈（Self-verification loops）**: 讓代理在提交前自己檢查一遍結果
- **上下文工程（Context engineering）**: 啟動時自動掃描目錄結構，建立程式碼地圖
- **迴圈偵測（Loop detection）**: 防止代理陷入重複編輯同一段 code 的死迴圈
- **推理三明治（Reasoning sandwich）**: 最佳化計算資源的分配方式

這個案例完美證明瞭 Harness Engineering 的核心主張： **模型是基礎設施，harness 才是競爭優勢。** 同樣的引擎，配上更好的車架和操控系統，就能跑出完全不同的成績。

### 跟其他概念有什麼不同？一張表講清楚

Harness Engineering 不是憑空冒出來的，它跟幾個相關概念有明確的差異和繼承關係：

**Prompt Engineering（提示工程）** 關注的是單次互動層面：怎麼寫一個好的 prompt，讓 AI 給出更好的回答。這是最基礎的層次。

**Context Engineering（上下文工程）** 關注的是模型的上下文視窗層面：提供給模型什麼資訊、怎麼組織這些資訊。這是 Harness Engineering 的子集和第一根支柱。

**Harness Engineering（駕馭工程）** 關注的是整個代理系統層面：環境設計、約束條件、回饋迴圈、生命週期管理。它包含了 Context Engineering，也借鑑了 Prompt Engineering，但運作在更高的系統層次。

**Agent Engineering（代理工程）** 關注的是代理本身的架構設計：內部路由、記憶機制、工具呼叫。Harness Engineering 不管代理「裡面」怎麼設計，只管代理「外面」的環境。

用一個比喻來說：Prompt Engineering 是教一個人「說什麼話」，Context Engineering 是決定「給這個人看什麼資料」，Harness Engineering 是「設計整個辦公室的流程和制度」，Agent Engineering 是「研究這個人的大腦怎麼運作」。

### 實際上手：三個等級的 Harness

如果你現在就想開始實踐 Harness Engineering，以下是一個由淺入深的三級框架：

**Level 1：基礎 Harness（個人開發者，1-2 小時可完成）**

這是最低門檻的起步方案，任何人都可以在一兩個小時內完成：

- 建立一個 CLAUDE.md（或.cursorrules、AGENTS.md）檔案，寫入專案的基本規範：使用的語言和框架、目錄結構說明、命名慣例、常用的 API pattern
- 設定 pre-commit hooks，確保基本的 linting 和格式化
- 確保有一個可以自動執行的測試套件（不需要覆蓋率 100%，但要能跑）
- 維持一致的目錄結構和檔案命名

光是這四件事，就能讓你的 AI 代理的表現提升一個等級。很多人在抱怨「AI 寫出來的 code 不符合我的風格」時，其實只是從來沒告訴 AI 自己的風格是什麼。

**Level 2：團隊 Harness（3-10 人團隊，1-2 天）**

在 Level 1 的基礎上增加：

- 完整的 AGENTS.md，包含團隊層級的慣例和決策記錄
- CI 強制執行的架構約束（不是靠口頭說「記得遵守」，而是 CI 會擋下不合規的 code）
- 共用的 prompt 模板，確保團隊成員給代理的指令品質一致
- Documentation-as-code，檔案跟程式碼一起接受 linter 驗證
- 針對 AI 生成程式碼的專屬 code review checklist

最後一點特別重要，AI 生成的 code 有一些人類不太會犯的「毛病」，比如過度抽象（明明只用一次的功能卻建了一個 utility class）、不必要的錯誤處理（對不可能發生的情境加了 fallback）、或是過度使用設計模式。你的 review checklist 應該針對這些 AI 特有的問題來設計。

**Level 3：生產級 Harness（大型組織，1-2 週）**

在 Level 2 的基礎上增加：

- 自定義 middleware 層（迴圈偵測、推理最佳化、上下文管理）
- 可觀測性整合，讓代理能存取日誌和指標
- 定期執行的熵管理代理（也就是「垃圾回收」）
- Harness 版本控制和 A/B 測試
- 代理效能儀錶板
- 卡住時的升級策略（何時自動升級給人類）

Level 3 基本上就是 OpenAI 和 Stripe 正在做的事。Stripe 的內部 AI 代理系統（他們叫 Minions）每週產出超過 1,000 個合併的 PR。開發者在 Slack 裡貼一個任務，代理會自動寫 code、跑 CI、開 PR，人類只需要在最後做 review 和合併。從貼任務到收到 PR，中間不需要任何人類介入。

![](https://image.blocktempo.com/2026/04/unnamed-9.png "unnamed-9 | 動區動趨-最具影響力的區塊鏈新聞媒體")

### 常見的坑：別犯這五個錯誤

在實踐 Harness Engineering 的過程中，有幾個常見的陷阱值得特別警告：

**第一，過度工程化控制流**

AI 模型進步的速度很快。你今天精心設計的一個複雜 workaround，可能在下一個模型版本裡就變得完全不需要了。OpenAI 建議把 harness 設計成「可撕裂的」（rippable），方便你在模型變聰明之後，把不再需要的約束快速移除。

**第二，靜態的 Harness 設計**

Harness 需要跟著模型一起演進。每次有重大的模型更新時，都應該重新審視你的 harness 元件，看看哪些約束可以放寬、哪些可以移除、哪些需要加強。把 harness 當成活的系統，不是一次性的設定。

**第三，忽視檔案品質**

很多團隊花大量時間設計精巧的 middleware 和控制系統，卻忽略了最基本的檔案品質。實際上，改善檔案品質往往是投報率最高的 harness 改進。模糊的 AGENTS.md 會產出模糊的代理輸出。你給 AI 什麼品質的指引，就會得到什麼品質的結果。

**第四，沒有回饋機制**

一個沒有回饋機制的 harness 是一個牢籠，不是一個導引系統。你的 harness 裡必須包含自我驗證、測試執行和成功指標。代理應該能夠知道自己「做得對不對」，而不是盲目地完成任務然後等人類來判斷。

**第五，只把檔案放在人能看的地方**

架構決策存在某個人的腦袋裡？寫在 Confluence 上但沒同步到 repo？放在 Google Doc 裡但代理讀不到？這些都是無效的檔案。記住那句核心原則： **代理在上下文裡看不到的東西，就等於不存在。** 所有代理需要的資訊，必須存在於儲存庫裡。

### 一個重要的警告：Meta 工程師的教訓

在一片對 Harness Engineering 的樂觀聲浪中，有一個真實案例值得我們保持警醒。

Meta AI 安全研究員 Summer Yue 在測試一個 AI 代理與 Gmail 整合時，發現了一個嚴重的問題。她給代理設定了一條明確的指令：「在執行任何操作之前，必須先向我確認。」一開始，代理確實會乖乖詢問。但隨著對話越來越長，上下文被壓縮，代理遺忘了這條指令，然後自己批次刪除了數百封郵件。

這個案例暴露了 Harness Engineering 目前仍然存在的根本挑戰是 **上下文管理的可靠性。** 當 AI 代理的上下文視窗被填滿、需要壓縮或截斷時，它可能會遺忘重要的約束條件。這不是一個小問題，而是一個底層的架構限制。

這也是為什麼 Harness Engineering 強調要用「機械的」方式（linter、測試、hooks）來強制執行約束，而不是隻靠「在 prompt 裡寫一句提醒」。Prompt 可以被遺忘，但 linter 不會。CI 不會因為上下文太長就忘記檢查測試是否透過。

### Harness Engineering 適合你嗎？

在結束之前，讓我們誠實地討論一下 Harness Engineering 的適用範圍和限制。

**適合的場景：**

- 新專案（greenfield）：從零開始比改造舊系統容易得多
- 架構清晰的專案：已經有嚴格的分層和模組化設計
- 測試基礎設施成熟的團隊：自動化測試是 harness 的基石
- 願意投入前期時間的團隊：建立 harness 需要前置投資，但回報是複利式的

**不太適合的場景：**

- 十年以上的老系統，缺乏架構約束、測試不完整、檔案零散
- 高度受監管的領域，需要人類對每一行 code 負責
- 極小型專案，harness 的建設成本可能超過收益

此外，也要注意 OpenAI 的實驗有一些獨特的優勢是大多數團隊沒有的：他們直接使用最頂級的 Codex 模型、他們能影響模型的開發方向、他們的團隊成員對 AI 代理的能力有深入的理解。所以，不要期望立刻複製他們的成果，而是從中提取可以遷移的原則和模式。

### Harness Engineering 需要哪些核心技能？

如果你是一個軟體工程師，想要在 Harness Engineering 的時代保持競爭力，以下五種技能會變得越來越重要：

**1\. 系統思維（Systems Thinking）**

理解約束、回饋迴圈和檔案之間如何互動影響。能夠看到改變一個 linter 規則會如何影響代理的行為模式，進而影響程式碼品質。

**2\. 架構設計（Architecture Design）**

定義可強制執行、且能提升生產力的邊界。不只是畫架構圖，而是能把架構約束轉化為自動化的檢查機制。

**3\. 規格撰寫（Specification Writing）**

精確地表達意圖，讓代理能正確執行。這不是寫「請幫我做一個登入頁面」，而是寫「建立一個使用 OAuth 2.0 PKCE flow 的登入模組，支援 Google 和 GitHub 作為 identity provider，session 用 httpOnly cookie 儲存，token 更新用 silent refresh」。

**4\. 可觀測性（Observability）**

建立能揭示代理行為模式的監控系統。你需要知道代理在哪裡卡住了、在哪裡犯了錯、在哪裡效率低下。

**5\. 迭代速度（Iteration Speed）**

快速測試和調整 harness 配置的能力。Harness 不是設計一次就完美的，而是需要持續觀察、調整、再觀察。

### 結語：這是現在發生的事

OpenAI 的這篇文章不是一篇研究論文，不是一個概念驗證，而是一份來自生產環境的實戰報告。100 萬行程式碼、零行手寫、1,500 個 PR、每天數百名使用者在使用。這是真的。

但 Harness Engineering 不意味著「工程師要被取代了」。恰恰相反，它意味著工程師的工作正在向更高的抽象層次移動。你不再需要記住某個函式庫的 API 語法，但你需要能夠設計一整套讓 AI 能可靠運作的系統。這需要更深層的技術理解，不是更淺的。

正如 [Charlie Guo](https://www.ignorance.ai/p/the-emerging-harness-engineering) 在分析中觀察到的，那些熱愛演演演算法難題的工程師可能會掙扎於這種轉變，而那些熱愛「把東西做出來」的工程師則會如魚得水。

因為在 Harness Engineering 的世界裡，你的價值不在於你能多快寫出一個二叉樹的旋轉，而在於你能多好地設計一個讓十個 AI 代理同時高效工作的環境。

你可以先做一件最小的事，開啟你正在開發的專案，建立一個 AGENTS.md（或 CLAUDE.md），寫下你的專案使用什麼語言、什麼框架、目錄結構長什麼樣、有哪些不成文的規定。光是這一步，就已經踏入了 Harness Engineering 的世界。

![加入動區 Telegram 頻道](https://image.blocktempo.com/2022/11/%E5%8B%95%E5%8D%80%E5%AE%98%E7%B6%B2tg-banner-1116.png "動區官網tg banner-1116 | 動區動趨-最具影響力的區塊鏈新聞媒體")

## 📍相關報導📍

**[Claude Code 新增雲端定時任務：不用開電腦，AI 自動幫你審 PR、升級依賴](https://www.blocktempo.com/claude-code-new-scheduled-remote-tasks/)**

[![](https://image.blocktempo.com/2026/04/cover_20260404_025836-1140x815.webp "cover_20260404_025836 | 動區動趨-最具影響力的區塊鏈新聞媒體")](https://image.blocktempo.com/2026/04/cover_20260404_025836.webp)

美國最大網路券商嘉信理財（Charles Schwab）宣布推出「Schwab Crypto」帳戶，提供比特幣和以太坊現貨交易，執行長 Rick Wurster 預計 4 月中旬正式開放，管理資產規模達 11.9 兆美元、擁有約 3,700 萬客戶帳戶。  
（前情提要： [8兆美元資管巨頭》嘉信理財預告一年內開放比特幣、以太坊「現貨交易」](https://www.blocktempo.com/charles-schwab-announces-spot-trading-for-bitcoin-and-ethereum-within-the-next-year/) ）  
（背景補充： [全美最大網路券商》嘉信理財預告一年內提供加密幣現貨交易，管理10兆美元客戶資產](https://www.blocktempo.com/charles-schwab-strategic-expansion-crypto-txse/) ）

嘉信理財（Charles Schwab）正式宣布推出「Schwab Crypto」帳戶，首批支援比特幣（BTC）與以太坊（ETH）現貨交易。

執行長 Rick Wurster 表示，預計 4 月中旬開始對部分使用者開放，整體服務將在 2026 年上半年全面上線，候補名單（waitlist）已同步開放登記。這是嘉信理財在 2025 年 7 月宣布計畫後，首次給出具體時間表。

嘉信管理超過 11.9 兆美元客戶資產，旗下擁有約 3,700 萬個帳戶，是美國最大的網路券商之一。此次加密帳戶由公司內部自行開發，不依賴 Coinbase 或其他第三方交易所，定位完全整合進現有的嘉信理財帳戶體系，讓使用者不需另開加密錢包也能直接買賣數位資產。

### 三階段推

根據 [The Defiant](https://thedefiant.io/news/tradfi-and-fintech/charles-schwab-to-launch-bitcoin-crypto-trading-mid-april-2026-37-million-e8b16de5) 的報導，Schwab Crypto 採分階段推出，第一階段由內部員工優先測試，確保系統穩定；第二階段向受邀客戶開放；第三階段才向全體使用者全面開放。

服務初期在美國境內除紐約州和路易斯安那州以外的所有州可用，且不是所有候補名單申請者都保證獲準開戶。

嘉信的加入，讓傳統券商與加密原生平台之間的邊界正式開始模糊。嘉信此前已提供加密主題 ETF 交易，也是機構級加密交易所 EDX Markets 的創始支持者，與 Citadel Securities、Fidelity Digital Assets 並列。

訊息公布後，嘉信平台上的加密相關搜尋與詢問量飆升了 90%，顯示客戶的需求早已存在。

### 直接衝擊 Coinbase、Robinhood 的版圖

嘉信進場最直接的競爭對手是 Coinbase、Robinhood 和 Webull，這三者都已整合股票與加密交易。

嘉信的核心優勢在於現有使用者基礎的黏著度，對數千萬名已在嘉信持有股票、基金、退休帳戶的投資人來說，在同一平台順手買進比特幣，遠比另開一個加密交易所帳戶的摩擦力低得多。

![加入動區 Telegram 頻道](https://image.blocktempo.com/2022/11/%E5%8B%95%E5%8D%80%E5%AE%98%E7%B6%B2tg-banner-1116.png "動區官網tg banner-1116 | 動區動趨-最具影響力的區塊鏈新聞媒體")

## 📍相關報導📍

**[8兆美元資管巨頭》嘉信理財預告一年內開放比特幣、以太坊「現貨交易」](https://www.blocktempo.com/charles-schwab-announces-spot-trading-for-bitcoin-and-ethereum-within-the-next-year/)**

**[全美最大網路券商》嘉信理財預告一年內提供加密幣現貨交易，管理10兆美元客戶資產](https://www.blocktempo.com/charles-schwab-strategic-expansion-crypto-txse/)**

**[美國最大「嘉信證券」將推比特幣現貨ETF？坐擁3000萬使用者，管理7兆美元](https://www.blocktempo.com/charles-schwab-to-launch-bitcoin-spot-etf/)**