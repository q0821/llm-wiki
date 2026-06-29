<!-- source-url: https://blog.aihao.tw/2026/06/26/harness-engineering-4-mid-run-injection/ -->
<!-- title: 給 Agent 開發者的駕馭工程 (4): 回饋時機二: 兩次 model request 之間,把訊息注入執行中的 agent | 愛好 AI 工程 Blog -->
<!-- fetched: 2026-06-29 -->

[愛好 AI 工程 Blog](/) 

[關於本站](https://blog.aihao.tw/about/) [ 訂閱電子報 ](https://ihower.tw/opt-in/gai) 

# 給 Agent 開發者的駕馭工程 (4): 回饋時機二: 兩次 model request 之間,把訊息注入執行中的 agent

2026-06-26 

AgentTool Use 

![給 Agent 開發者的駕馭工程 (4): 回饋時機二: 兩次 model request 之間,把訊息注入執行中的 agent](https://blog.aihao.tw/assets/images/harness-engineering-4/cover.png) 

📚 給 Agent 開發者的駕馭工程 (全 9 篇)

1\. [基礎: Deep Agent 的六項內建能力](https://blog.aihao.tw/2026/06/26/harness-engineering-1-deep-agent-capabilities/)

2\. [核心: Agent 要的是回饋迴路，不是完美提示](https://blog.aihao.tw/2026/06/26/harness-engineering-2-what-is-harness-engineering/)

3\. [回饋時機一: 工具回傳值，是寫給 agent 的回饋](https://blog.aihao.tw/2026/06/26/harness-engineering-3-tool-execution-feedback/)

4\. **回饋時機二: 兩次 model request 之間，把訊息注入執行中的 agent** (本篇)

5\. [回饋時機三: 單輪結束的驗收，Goal 與 Outcomes](https://blog.aihao.tw/2026/06/26/harness-engineering-5-goal-and-outcomes/)

6\. [回饋時機四: 外層 Loop, Ralph、Symphony 與 Cron](https://blog.aihao.tw/2026/06/26/harness-engineering-6-outer-loop/)

7\. [進階: 自我改進 Harness, Meta-Harness 與爬坡](https://blog.aihao.tw/2026/06/26/harness-engineering-7-self-improving/)

8\. [收尾: 會過期的 Harness, Model-Harness-Fit 與 Bitter Lesson](https://blog.aihao.tw/2026/06/26/harness-engineering-8-model-harness-fit/)

9\. [自建 Agent 的框架選型: 全套 Deep Agent 還是從基礎構建?](https://blog.aihao.tw/2026/06/26/harness-engineering-9-agent-frameworks/)

🎞️ 搭配演講投影片: [給 Agent 開發者的 Harness+Loop Engineering](https://ihower.tw/presentation/harness.html)

agent 還在執行、還在反覆呼叫工具，有一個位置可以把新訊息插進去，馬上影響它接下來的動作。這篇講的就是這個回饋時機 (一輪內、兩次 model request 之間): 它在哪、為什麼在這裡注入不會讓 server 端 API 出錯，以及會從這裡注入的兩類訊息。

第一類是**人中途 steer**: agent 還沒做完，使用者就主動輸入一段話介入，社群把這件事叫 steering。這在 Codex、Claude Code 這類互動式 coding agent 最常見。Codex 在 2026 年 2 月正式加了 [mid-turn steering](https://developers.openai.com/codex/changelog),Claude Code 也讓你[在它執行時輸入](https://code.claude.com/docs/en/how-claude-code-works)。

第二類是**程式注入**: 在同一個位置放東西進來的不是人，而是程式，例如一個背景工具跑完把結果送回、或一個外部事件 (webhook、告警) 需要讓 agent 知道。這類目前較少框架實作，少數像 Pydantic AI 把它做成通用機制。

兩類用的是同一個注入位置，差別只在來源是人還是程式。先看這個位置在哪。

## 這個時機點在哪: 兩次 model request 之間

要看懂這個時機點，得先記得一輪 (Turn) 的內部結構: 它不是「一次問、一次答」，而是「模型 request → tool call → 模型 request → tool call …」反覆好幾次，直到模型不再要求工具、輸出最後答案為止。注入就發生在這個迴圈內部、兩次 model request 之間。

一輪 Turn (agent 還在進行中) ↓ 在這裡注入訊息 (人 steer 或程式) 模型 request 1 🔧 tool calls 模型 request 2 🔧 tool calls 模型 輸出答案 (還沒到) 注入發生在每個「tool calls → 下一個 model request」之間 (圖中標記處) agent 還沒到「輸出答案」這一步，就把新訊息插進這一輪 ✏️ 小編製圖 

注意圖中最後那個「輸出答案」是虛線、還沒到。重點就在這: 不是等 agent 執行完才注入 (那是單輪結束的時機)，而是在它還在迴圈中間、還沒輸出答案時就把訊息插進去。

## 為什麼不能在 tool call 中間直接加訊息: server 端的硬規則

這裡有個很常見的疑問: 如果模型這一輪已經發出了 tool call，但你在它還沒拿到結果時就加一則 user message,API 不會出錯嗎?

會，而且會直接回 400。OpenAI 和 Anthropic 有同一條規則: **模型發出的每一個 tool call，都必須先補上對應的結果，中間不能再放別的訊息。**

* Chat Completions / Responses API: 每個 `tool_call` (Responses 裡叫 `function_call`，帶一個 `call_id`) 都要有對應的 `tool` 結果 (Responses 裡叫 `function_call_output`)。少補一個，下一個 request 就會報錯，類似 `No tool output found for function call call_xxx`。
* Anthropic Messages API: assistant 回合裡的每個 `tool_use`，下一個 user 回合都要有對應的 `tool_result`，而且 `tool_result` 要排在那個 user 回合的最前面，文字接在後面。

OpenAI 在 [Unrolling the Codex agent loop](https://openai.com/index/unrolling-the-codex-agent-loop/) 裡把這條規則講得很清楚: 一個沒有配對輸出的 tool call，會讓接下來的 request 直接壞掉。

所以 harness 不能真的把你的訊息放在 tool call 執行到一半的地方。它的做法是: **等當前這次 request 的工具全部執行完、結果都收回來，組成一個 API 合法的狀態，才在下一個 model request 之前把你的訊息加進去。** 這也是為什麼 steering 只能在「兩次 model request 之間」，而不是任意時刻: 那是這個迴圈裡唯一一個對 API 合法、又還沒結束的位置。

舉個具體例子。假設模型這一輪一次發出了兩個 tool call (A 和 B)，你只等到 A 的結果回來，就急著插入「改做 X」:

❌ 不合法

assistant 發了 tool calls → 還沒等到所有工具結果 → 直接加 user message。下一個 request 送出去就 400。

assistant: 呼叫 tool call A、tool call B

tool result: output A

user: 改做 X ← 還缺 output B

→ API error

✅ 合法

assistant 發了 tool calls → 每個 call 的結果都補齊 → 再加 user message → 下一個 request。完全沒問題。

assistant: 呼叫 tool call A、tool call B

tool result: output A

tool result: output B ← 補齊

user: 改做 X

assistant: ok

差別只在那一行 `output B`: 兩個 tool call 的結果都補齊、湊成合法狀態之後再插入 user message,steering 就成立了。

## 用途一: 人中途 steer

第一類，也是目前最常見的，是人主動介入，而 steering 和 interrupt 都是 Codex、Claude Code 這類互動式 coding agent 提供的內建功能。這跟一般框架的 human-in-the-loop 不一樣: human-in-the-loop 是你刻意設計一個等待點，讓 agent 停下來等使用者回饋 (最典型的是「執行某個工具之前，先請使用者確認」)，是 agent 跑到預先寫好的位置、主動停下來問你; steering 剛好相反，agent 沒有等待點、也沒打算停，是你在它還在執行時主動輸入。一個是 agent 停下來問你，一個是你主動介入。

### 兩種強度: steering 與 interrupt

使用者主動介入，有兩種強度，差別在要不要中斷正在執行的工具。

🧭 不中斷: steering

agent 繼續執行，你輸入的訊息先排進佇列，等當前這次 tool calls 的結果到齊、正要發下一個 model request 之前才注入。它沒有中斷，只是下一步多了你的訊息，已建立的 context 全部保留。

🛑 中斷: interrupt

使用者主動中斷，取消正在執行的工具和這一輪。沒答完的 tool call 還沒有結果，harness 會替它補一則 `tool_result`，內容就是固定字串 `aborted` (不是 AI 產生的，是寫死的字)，維持對話對 API 仍然合法，然後停下來等你的新指令。

[AgentPatterns](https://agentpatterns.ai/agent-design/steering-running-agents/) 還提了一個提醒: 如果你發現自己一直要 steer，常常代表一開始的 prompt 給得不夠清楚。手動修正是補救，不是常態，真正該補的往往是讓 agent 一開始就走對方向的前饋指令。這也呼應系列一直強調的: 前饋 (一次做對) 跟回饋 (出錯再修) 要一起設計。

## 用途二: 程式注入 (背景工具結果、外部事件)

第二類用途，是讓**程式**在同一個位置注入，而不是人。Pydantic AI 文件用一句話總結了這個位置的用途:

> 當執行期間發生某些 agent 應該知道的事，就用這個方法注入: 可能是工具想加入後續脈絡、外部事件需要引導 agent 的計畫，或背景工作完成時要讓 agent 收到結果。

換句話說，人 steer 只是「外部事件引導 agent 計畫」的一種，人就是那個外部事件;同一個位置也能讓程式注入。常見的有三種:

🔧 背景工具結果

長時間工具在背景跑完，把結果送回 agent

📡 外部事件

webhook、錯誤告警、聊天平台訊息主動送進來

📝 後續脈絡

工具執行中發現該補的資訊，加進對話

有提供這個時機點讓你注入的框架並不多: OpenAI Agents SDK、Google ADK 等都沒有。少數例外是 [Pydantic AI](https://ai.pydantic.dev/)，它在 v1.101.0 (2026 年 5 月) 加了 `enqueue` 方法，把人 steer 和程式注入當成同一件事處理。`enqueue` 有兩種模式: `asap` (盡快插入，也就是這篇講的時機點，對應官方文件 [Injecting messages mid-run](https://pydantic.dev/docs/ai/core-concepts/message-history/#injecting-messages-mid-run) 那一節)，以及 `when_idle` (等整輪結束後才插入)。

### 背景工具結果怎麼送回 agent

這三種裡最值得單獨看的是背景工具結果，因為它最能說明程式怎麼用這個位置。重點是它分兩步，剛好不會違反前面那條 API 規則:

**第一步 (工具被呼叫時)**: tool call 不等背景任務跑完，而是馬上回一個 `tool_result`，內容是一句寫給模型的英文 prompt，像這樣:「Tool ‘X’ is running in background (task N). You will receive the result automatically when it completes. Continue with other work in the meantime.」(意思是: 工具已放到背景執行，完成後會自動把結果送回來)。這個 `tool_result` 一補上，原本的 tool call 就配對完成、對話對 API 合法，agent 可以繼續做別的事。

**第二步 (背景任務完成時)**: 等背景真的跑完，用 `enqueue` 把結果送回去，而這時只能用一則 user 角色訊息 (prompt 像這樣:「Background tool ‘X’ (task N) completed. Result: …」)，不能用 `tool_result` (第一步已經回過 tool\_result 了)。agent 在下一個 model request 就會讀到它。

## 小結

不管來源是人還是程式，這個時機點都是「agent 還在執行時，從外部把訊息送進來」的回饋。下一篇換到 harness 自動觸發的回饋，談時機③: 一輪結束時，該由誰來驗收「這一輪到底做完了沒」。

© 2026 [愛好資訊科技](https://aihao.tw/)

[關於本站](https://blog.aihao.tw/about/) [訂閱電子報](https://ihower.tw/opt-in/gai) [RSS](https://blog.aihao.tw/feed.xml) 
