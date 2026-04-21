---
title: "Claude Code 工作階段管理與百萬上下文攻略"
source: "https://meta-ghost.notion.site/Claude-Code-3447b792315a81d7b80cc86544580eab"
author:
published:
created: 2026-04-16
description: "A collaborative AI workspace, built on your company context. Build and orchestrate agents right alongside your team's projects, meetings, and connected apps."
tags:
  - "clippings"
---
Created time

2026年4月16日 上午11:46

來源網址

https://x.com/trq212/status/2044548257058328723

倉鼠碎碎念

嗨嗨！這篇是 Anthropic 官方工程師 Thariq 寫的實戰教學，專治「Claude Code 那麼強，我怎麼還是覺得用起來卡卡的」這種困惑。用過很多 AI 工具的倉鼠我必須說：這篇乾貨滿滿，重點只有一個——管理上下文窗口，才是決定你用得好不好的關鍵。幾個我學到的：上下文不是越大越好，太多會「發霉」（Context Rot）；失敗了就按兩下 Esc 回溯，比一直說「不是那樣」強多了；子代理就像派小弟去辦事，只回報結果的那種。

情報群組

🐹 倉鼠特報

核心洞察標籤

Claude Code

AI

Context Window

工作階段管理

視覺地圖

Knowledge Map

![](https://pbs.twimg.com/media/HF-p1RUbEAIH-6t?format=jpg&name=orig) 今天我們推出了

/usage

的新更新，幫助你了解自己在 Claude Code 的使用情況。這次的更新來自於與客戶的多次對話。我們在這些對話中一再發現，大家對於如何管理工作階段有非常大的差異——特別是在 Claude Code 推出 100 萬上下文更新後。

你是只開一個或兩個工作階段放在終端機裡保持開著？還是每次輸入 prompt 都開新工作階段？你什麼時候會使用壓縮、回溯或子代理？什麼會造成糟糕的壓縮效果？這裡有出乎意料多的細節，其實會大大影響你使用 Claude Code 的體驗，而幾乎所有的一切都跟管理你的上下文視窗（Context Window）有關。

### 上下文、壓縮與上下文衰損快速入門

![](https://pbs.twimg.com/media/HF-nqWCbEAE3Oan?format=jpg&name=orig)

上下文視窗是模型在生成下一個回覆時能夠「看到」的所有內容。它包含了你的系統提示詞、到目前為止的對話、每一次工具呼叫及其輸出，以及每一個被讀取過的檔案。Claude Code 的上下文視窗有 100 萬個 tokens。

不過使用上下文是有代價的，這通常稱為上下文衰損（Context Rot）。指的是一種現象：隨著上下文增長，模型效能會下降，因為注意力被分散到更多的 tokens 上，而較舊的、不相關的內容開始干擾當前任務。

上下文視窗有硬性限制，所以當你接近尾聲時，你必須把一直在做的任務總結成一個較小的描述，然後在一個新的上下文視窗中繼續——這稱為壓縮（Compaction）。你也可以自己主動觸發。

![](https://pbs.twimg.com/media/HF-ntaxboAAZuCm?format=jpg&name=orig)

### 每個回覆都是一個分支點

![](https://pbs.twimg.com/media/HF-n6mMbEAEImhv?format=jpg&name=orig)

假設你剛剛請 Claude 做了某件事，而且它完成了，你現在的上下文裡有一些資訊（工具呼叫、工具輸出、你的指示），而你對於下一步要做什麼有出乎意料多的選項：

Continue（繼續） — 在同一個工作階段發送另一則訊息

/rewind（按兩次 Esc） — 跳回之前的某則訊息，從那裡重新嘗試

/clear — 開始一個新工作階段，通常會帶著你從剛學到的東西中提煉出來的簡報

Compact（壓縮） — 總結到目前為止的工作階段，然後在摘要的基礎上繼續

Subagents（子代理） — 把下一個工作區塊委派給一個擁有自己的乾淨上下文的代理，然後只把結果拉回來

雖然最自然的方式就是直接繼續，但其他四個選項是為了幫助你管理上下文而存在的。

### 何時該開新工作階段

什麼時候該保持一個長時間執行的工作階段，什麼時候該開新的？我們的一般原則是：

> 新任務 → 新工作階段

100 萬上下文視窗確實表示你现在可以更可靠地完成更長的任務，例如從零開始建構一個全端應用程式。有時候你可能會做相關的任務，其中部分上下文仍然有必要，但不是全部——例如為你剛實作的功能寫文件。雖然你可以開新工作階段，但 Claude 必須重新讀取你剛實作的檔案，這會比較慢而且更昂貴，這時候保留舊 session 就划算了。

### 用回溯取代修正

![](https://pbs.twimg.com/media/HF-oDqjbEAI94h5?format=jpg&name=orig)

如果要我選一個能代表良好上下文管理的習慣，那就是 Rewind（回溯）。

在 Claude Code 中，雙擊 Esc（或是執行

/rewind

）可以讓你跳回任何之前的訊息，從那裡重新 prompt。該時間點之後的所有訊息會從上下文中移除。

回溯通常是比「修正」更好的做法。舉例來說：Claude 讀了五個檔案，嘗試了一個方法，但沒有成功。你的本能可能是輸入「那個方法沒用，試試 X」——但更好的做法是回溯到檔案讀取之後，重新 prompt：「不要用方法 A，foo 模組沒有開放那個功能——直接用 B。

」

你也可以說「summarize from here」，讓 Claude 總結它的學習並建立一個交接訊息，有點像是來自未來自己的訊息——那個自己嘗試了某個方法但沒有成功，告訴過去的自己：「別重蹈覆轍」。

![](https://pbs.twimg.com/media/HF-oKwBbEAAdb6I?format=jpg&name=orig)

### 壓縮與新工作階段的比較

![](https://pbs.twimg.com/media/HF-oPtxaAAAUKMr?format=jpg&name=orig)

一旦工作階段變長，你有兩種方式來減輕負擔：\`/compact\` 或 \`/clear\`。它們感覺起來類似，但運作方式非常不同。

\`/compact\`：請模型總結到目前為止的對話，然後用那個摘要替換掉歷史記錄。這是一種有損的過程，你是相信 Claude 來判斷什麼是重要的，但你自己不需要寫任何東西，而且 Claude 可能會更徹底地包含重要的學習或檔案。你也可以透過傳送指示來引導它：

/compact focus on the auth refactor, drop the test debugging

\`/clear\`：你自己寫下重要的東西（「我們在重構 auth 中介層，約束條件是 X，重要的檔案是 A 和 B，我們已經排除了方法 Y」），然後乾淨地重新開始。這需要更多功夫，但最後的上下文是由你決定什麼是有關聯的。

### 什麼會造成糟糕的壓縮？

![](https://pbs.twimg.com/media/HF-oy22bEAE_Jd8?format=jpg&name=orig)

如果你執行很多長時間的工作階段，你可能會注意到有時候壓縮特別差的情況。我們經常發現，當模型無法預測你的工作方向的時候，糟糕的壓縮就會發生。

例如：自動壓縮在一個漫長的除錯工作階段後觸發，總結了調查過程，然後你的下一則訊息是「現在修復我們在 bar.ts 看到的另一個警告」。但因為工作階段的焦點在除錯上，那個其他警告很可能已經在摘要中被犧牲掉了。

更麻煩的是：由於上下文衰損的關係，模型在執行壓縮時，正好是它最不聰明的時候。

有了 100 萬上下文，你就有更多時間可以主動提前執行壓縮，並在指令裡說清楚你想要做什麼，而不是等 autocompact 被迫觸發。

### 子代理與乾淨上下文視窗

![](https://pbs.twimg.com/media/HF-o6v1bQAA7pS6?format=jpg&name=orig)

Subagents（子代理）是一種上下文管理工具，專門用在：你預先知道某段工作會產生大量中間產出，但那些東西之後再也不會用到。

當 Claude 透過 Agent 工具生成子代理時，那個子代理會獲得一個全新的乾淨上下文視窗。它可以做它需要的工作，然後整合結果，這樣只有最終報告會傳回主體。

內部用的判斷標準是：

> 「這個工具輸出，我之後還會需要嗎？還是只需要結論？」

雖然 Claude Code 會自動呼叫子代理，但你也可以明確告訴它這樣做，例如：

「生成一個子代理來根據以下規格檔案驗證這個工作的結果」

「生成一個子代理來閱讀那個程式碼庫並研究它如何實作了 Auth Flow，然後你用同樣方式在這裡實作」

「生成一個子代理來根據我的 git 變更為這個功能寫文件」

### 總結

![](https://pbs.twimg.com/media/HF-qwt9bEAEa1eq?format=jpg&name=orig)

說到底，每次 Claude 結束了一個回覆，而你準備發送新訊息時，你面臨一個決策點。

你是要 Continue？Rewind？Compact？Clear？還是派 Subagent？

隨著時間推移，我們期待 Claude 本身會幫助你處理這件事，但目前為止，這是你少數能主動引導 Claude 輸出結果的方式之一。

把上下文管理好，是用好 Claude Code 最關鍵卻最容易被忽略的能力。