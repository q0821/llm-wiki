<!-- source-url: https://blog.aihao.tw/2026/06/26/harness-engineering-9-agent-frameworks/ -->
<!-- title: 給 Agent 開發者的駕馭工程 (9): 自建 Agent 的框架選型: 全套 Deep Agent 還是從基礎構建? | 愛好 AI 工程 Blog -->
<!-- fetched: 2026-06-29 -->

[愛好 AI 工程 Blog](/) 

[關於本站](https://blog.aihao.tw/about/) [ 訂閱電子報 ](https://ihower.tw/opt-in/gai) 

# 給 Agent 開發者的駕馭工程 (9): 自建 Agent 的框架選型: 全套 Deep Agent 還是從基礎構建?

2026-06-26 

AgentCoding 

![給 Agent 開發者的駕馭工程 (9): 自建 Agent 的框架選型: 全套 Deep Agent 還是從基礎構建?](https://blog.aihao.tw/assets/images/harness-engineering-9/cover.png) 

📚 給 Agent 開發者的駕馭工程 (全 9 篇)

1\. [基礎: Deep Agent 的六項內建能力](https://blog.aihao.tw/2026/06/26/harness-engineering-1-deep-agent-capabilities/)

2\. [核心: Agent 要的是回饋迴路，不是完美提示](https://blog.aihao.tw/2026/06/26/harness-engineering-2-what-is-harness-engineering/)

3\. [回饋時機一: 工具回傳值，是寫給 agent 的回饋](https://blog.aihao.tw/2026/06/26/harness-engineering-3-tool-execution-feedback/)

4\. [回饋時機二: 兩次 model request 之間，把訊息注入執行中的 agent](https://blog.aihao.tw/2026/06/26/harness-engineering-4-mid-run-injection/)

5\. [回饋時機三: 單輪結束的驗收，Goal 與 Outcomes](https://blog.aihao.tw/2026/06/26/harness-engineering-5-goal-and-outcomes/)

6\. [回饋時機四: 外層 Loop, Ralph、Symphony 與 Cron](https://blog.aihao.tw/2026/06/26/harness-engineering-6-outer-loop/)

7\. [進階: 自我改進 Harness, Meta-Harness 與爬坡](https://blog.aihao.tw/2026/06/26/harness-engineering-7-self-improving/)

8\. [收尾: 會過期的 Harness, Model-Harness-Fit 與 Bitter Lesson](https://blog.aihao.tw/2026/06/26/harness-engineering-8-model-harness-fit/)

9\. **自建 Agent 的框架選型: 全套 Deep Agent 還是從基礎構建?** (本篇)

🎞️ 搭配演講投影片: [給 Agent 開發者的 Harness+Loop Engineering](https://ihower.tw/presentation/harness.html)

前面八篇談的都是 harness engineering 的觀念: 回饋迴路、工具層的檢查、使用者 steering、單輪驗收、外層 loop、自我改進、model-harness-fit。觀念講完，真要自己動手開發一個 agent 時，會先碰到一個很實際的問題: 該從哪個開發框架開始?

選擇一大堆: OpenAI 的 Codex SDK 和 Agents SDK、Anthropic 的 Claude Agent SDK、GitHub 的 Copilot SDK、LangChain 的 LangGraph 跟 deepagents、Google 的 ADK、Pydantic AI、Vercel 的 AI SDK、AWS 的 Strands Agents、微軟的 Agent Framework。每一家都說自己是做 agent 的好工具，而且還不只這些。這篇從裡面挑了小編覺得比較成熟、有實際產品或社群在用的幾個框架，用系列第 1 篇的「六項能力」當對照標準，分成兩條路線比較，最後給一點選型建議。

照例提醒系列定位: 這裡談的是「自己開發一個 agent (可能是 Text-to-SQL、知識庫 RAG、訪談 agent，未必跟寫程式有關)」要用哪個框架當基礎，不是「怎麼把 Claude Code、Codex 這類 coding agent 用得更順」，也不是叫你挑一個拿來做軟體開發的 coding agent。下面有些框架 (像 Codex SDK、Claude Agent SDK、GitHub Copilot SDK) 雖然源自 coding agent，但這裡是拿它們當基礎去打造你自己的 agent，用途可以跟寫程式完全無關。

## 兩條開發路線

先快速複習第 1 篇那六項 Deep Agent 能力: ① Plan & Todos、② Filesystem & Bash、③ Sub-Agent、④ Memory、⑤ Skills、⑥ 更多工具 (MCP、Browser、Computer Use)。小編就拿這個分類當對照標準，看每個框架幫你內建了幾項、哪些要自己接。用這個角度看，市面上的框架大致分成兩條路線:

* 一條是從**全套 Deep Agent** 開始: 框架直接給你一個跑得動的 agent，六項能力大多已經接好，你拿來改、加工具、改 system prompt 就能用。
* 另一條是**從基礎構建**: 框架給的是 agent、工具、handoff、workflow、session 這些基礎元件，agent 迴圈跟那六項能力大多要你自己決定要不要加、怎麼加。

## 路線一: 從全套 Deep Agent 開始

這條路線的共同點: 一上手就是一個會規劃、會讀寫檔案、會開子代理人的 agent，六項能力大多已經內建。你的工作是在它之上做客製，而不是從頭組裝。

還有一點容易被忽略但很重要: 除了那六項能力 (那些主要是工具)，全套 Deep Agent 還附帶一份原廠調校過的 system / developer prompt 跟 agent loop，裡面已經寫好大量預設行為: 怎麼規劃、什麼時候用哪個工具、出錯了怎麼自我修正、怎麼維護待辦清單。第 1 篇編按引用過 LangChain 對 Deep Agent 的四特徵定義，排第一個的就是「詳細的 system prompt」。這套預設行為，是 deep agent 開箱就比較會做事的一個重要原因。

**[Codex SDK](https://developers.openai.com/codex/sdk/) & [Codex App Server](https://developers.openai.com/codex/app-server) (OpenAI)**: 核心是 Rust 寫的 Codex CLI，完全開源 (Apache 2.0)，連 agent loop 本身都在開源 repo 裡，可以讀、可以改。對外有兩種嵌入方式，差別在於你要用什麼語言串接: 一種是 TypeScript / Python SDK 把 CLI 包成程式介面 (用這個方式你得寫 TS 或 Python)，另一種是 `app-server` 用 JSON-RPC 雙向溝通 (設計上刻意參考 MCP)，因為是協議介面，你的程式用什麼語言都能接。六項能力幾乎都有，sandbox 還是作業系統核心層級的隔離。一個實務上的差別: Codex 可以用 ChatGPT 訂閱帳號登入，不一定要用 API key，這點後面選型會再提。

**[GitHub Copilot SDK](https://github.com/github/copilot-sdk) (Node / Python / Go / .NET / Java / Rust)**: 它開放給你用程式呼叫的，是 [Copilot CLI](https://github.com/features/copilot/cli) 背後同一個、已在生產環境驗證過的 agent runtime。架構跟 Codex 很像: Node / Python / .NET 會自動把 Copilot CLI 當依賴一起裝進來，其餘語言的 SDK 則都透過 JSON-RPC 跟 Copilot CLI 的 server mode 溝通，所以 Go、Java、Rust 也能接，第一方支援的語言是這條路線裡最多的。六項能力大多內建: 規劃、檔案編輯與第一方工具 (等同 `--allow-all` 那組)、custom agents、skills、MCP 都有。核心則比較像 Claude Agent SDK: repo 裡各語言的外層套件是 MIT 開源，但真正的 agent loop 跑在那個一起裝進來的 Copilot CLI 執行檔裡，而它是 GitHub 的閉源產品，你能用它調好的迴圈，但看不到也改不了內部。

**[Claude Agent SDK](https://code.claude.com/docs/en/agent-sdk/overview) (Anthropic, Python / TypeScript)**: 前身是 Claude Code SDK。這裡有一個要特別留意的點: SDK 的外層包裝 (Python / TypeScript) 是 MIT 開源的，但真正的 agent loop 跟 harness 核心，是跑在一個閉源的 Claude Code 原生執行檔裡，SDK 只是去啟動那個執行檔、用 stdio 跟它溝通。換句話說，你能用 Anthropic 那套調好的 agent loop，但看不到、也改不了它的內部。再加上它受 Anthropic 商業條款規範、第三方產品不允許用 claude.ai 帳號登入 (只能用 API key)，可控性是這條路線裡最受限的。六項能力一樣大多內建。

**[LangChain deepagents](https://github.com/langchain-ai/deepagents) (Python / TypeScript)**: MIT 開源，建在 LangGraph 之上，等於把 Claude Code 那套 deep agent 的做法重新實作成一個開源套件。六項能力都有對應工具，不過預設的檔案系統是虛擬的 (記在記憶體裡、不會跨 session 留存)，bash / shell 要自己開啟。最大的好處是每一部分 (檔案系統、sandbox、記憶) 都是可替換的 backend，要改不用 fork 整包。

> 編按: 這條路線還有一個重要差別值得補充: 核心到底開不開源。三者其實差很多。Codex 連 agent loop 都放在開源 repo 裡 (Apache 2.0)，可讀可改; Claude Agent SDK 跟 GitHub Copilot SDK 則是「對外的各語言套件開源、真正的核心閉源」: 你能呼叫它調好的 agent loop，但看不到、也改不了。Claude 的核心是閉源的 Claude Code 原生執行檔; Copilot 的核心是 Copilot CLI，它雖然有一個 [github/copilot-cli](https://github.com/github/copilot-cli) 的 repo，但點進去會發現裡面只有安裝腳本 (install.sh)、README、changelog 和一份授權檔，沒有任何實作原始碼，而那份授權還是專有商業授權、明文禁止修改。換句話說那個 repo 是用來發佈安裝、收 issue 的，不是放原始碼的地方。如果你要做的是對外 production 服務、需要看得到原始碼才好 debug，這個差別要先想清楚。

## 路線二: 從基礎構建

這條路線的框架，給的是控制流、編排、型別、持久化這些基礎元件。六項 Deep Agent 能力不會預設都幫你啟用，要自己設定、添加。而且連那份預設行為很強的 system prompt 也要自己寫: 框架只給你一個近乎空白的起點，agent 該怎麼規劃、怎麼自我修正，都得你自己設計。換來的是完全的可控性。這條路線內部其實差異不小，與其硬分風格，不如照框架有多 opinionated (幫你預設了多少、規定了多少) 來排序: 排在前面的比較 opinionated，內建跟預設都比較多; 排在後面的比較低階，更多事情要你自己決定。順序大致如下 (每家支援的程式語言一併標在後面):

* **[Strands Agents](https://strandsagents.com/) (AWS, Python / TypeScript)**: Apache 2.0 開源，主打 model-driven 的迴圈: 不要開發者去畫複雜的流程圖，而是把規劃、串接、呼叫工具、反思交給模型自己在迴圈裡決定。這個取向讓 Strands 在這條路線裡相當 opinionated、也最接近 deep agent: 直接內建了讀寫檔案、shell、code interpreter、子代理人、browser、computer use 這些工具。AWS 內部的 Amazon Q Developer、AWS Glue 都用它。
* **[Google ADK](https://adk.dev/) (Python、Java 為主，另有 TypeScript / Go / Kotlin)**: Apache 2.0 開源，功能同樣齊全，但重點在多代理人編排而不是單一迴圈: 內建 planner (讓模型先產出一份規劃再行動，但不是逐項打勾的待辦清單)、Sequential / Parallel / Loop 的多代理人編排、以及分得很清楚的 session (對話內) 跟 memory service (跨 session 可搜尋的長期記憶)，還原生支援 A2A 協議跟 Computer Use。
* **[Microsoft Agent Framework](https://github.com/microsoft/agent-framework) (.NET 跟 Python)**: MIT 開源，是微軟把 Semantic Kernel 跟 AutoGen 合併後的接班框架。核心是 AI Agent 加上 graph-based 的 workflow 編排，多代理人跟記憶內建，主打企業級需求: 持久化 checkpoint、OpenTelemetry 可觀測性、middleware、A2A、人為介入。檔案系統這類則要自己接。
* **[OpenAI Agents SDK](https://openai.github.io/openai-agents-python/) (Python 跟 JS / TypeScript)**: MIT 開源，比較不 opinionated: 核心就是 Agent、Handoff、Guardrail、Session、Tool 幾個概念，內建一個預設的 agent 迴圈，但六項能力多半要自己補。多代理人協作靠 Handoff 跟「agent 當成工具」用一般 Python 串起來，不是用一張圖去定義。
* **[Pydantic AI](https://ai.pydantic.dev/) (只有 Python)**: MIT 開源，由 Pydantic 團隊出品，是型別優先的框架，強項是型別安全: 用 Pydantic model 定義結構化輸出、用依賴注入管理 agent 的相依資源，model 無關。MCP 是 client / server 雙向內建，還官方支援 Temporal、DBOS、Prefect、Restate 四種 durable execution (持久化執行) 引擎。
* **[Vercel AI SDK](https://ai-sdk.dev/) (只有 TypeScript / JavaScript)**: Apache 2.0 開源，TypeScript 優先的工具包。核心是呼叫 LLM 的統一介面加上 Zod schema 做型別安全的結構化輸出，v7 開始有正式的 agent 迴圈 (`ToolLoopAgent`) 和 sandbox 執行環境，但六項能力的工具大多要自己接或從社群套件補。跟其他框架最大的差別是內建前端 UI 整合: React、Svelte、Vue、Solid 都有現成的 chat hooks，如果你的 agent 需要即時串流到前端介面，這是其他框架都沒直接提供的。Model 無關，支援 30+ 個 provider。
* **[LangGraph](https://github.com/langchain-ai/langgraph) (LangChain, Python 跟 JS / TypeScript)**: MIT 開源，是這裡最不 opinionated、最低階的一個: 本質是用圖 (節點、邊、共享 state) 描述的狀態機，連 agent 迴圈都要你自己用節點接出來。它的強項是持久化: checkpointer 把每一輪 state 存起來，支援人為介入、時光回溯 (time-travel) 除錯、斷點續跑，跨 session 長期記憶則用 Store。前面提的 deepagents 就是建在它上面，等於有人幫你把那層 deep agent 接好了。

## 各框架的六項能力對照

用第 1 篇那六項能力逐一對照這些框架，差別就很清楚了。

開發語言 = 你串接這個框架時要寫的程式語言 (不是框架本身的實作語言)。能力欄對應第 1 篇六項: ① 規劃 (Plan & Todos) · ② 檔案/Bash (Filesystem & Bash) · ③ 子代理 (Sub-Agent) · ④ 記憶 (Memory) · ⑤ Skills · ⑥ 額外工具 (MCP 等)。標示: ✅ 內建 · 🟡 部分或要自行開啟 · 🔧 自己接。

| 框架                            | 開發語言                                | ① 規劃 | ② 檔案/Bash | ③ 子代理 | ④ 記憶 | ⑤ Skills | ⑥ 額外工具 |
| ----------------------------- | ----------------------------------- | ---- | --------- | ----- | ---- | -------- | ------ |
| 路線一: 全套 Deep Agent            |                                     |      |           |       |      |          |        |
| Codex SDK                     | TS · Py                             | ✅    | ✅         | ✅     | 🔧   | ✅        | ✅      |
| Codex App Server              | 不限 (JSON-RPC)                       | ✅    | ✅         | ✅     | 🔧   | ✅        | ✅      |
| GitHub Copilot SDK            | Node · Py · Go · .NET · Java · Rust | ✅    | ✅         | ✅     | 🔧   | ✅        | ✅      |
| Claude Agent SDK              | Py · TS                             | ✅    | ✅         | ✅     | 🟡   | ✅        | ✅      |
| LangChain deepagents          | Py · TS                             | ✅    | 🟡        | ✅     | ✅    | ✅        | ✅      |
| 路線二: 從基礎構建 (opinionated 由高到低) |                                     |      |           |       |      |          |        |
| Strands Agents                | Py · TS                             | 🔧   | ✅         | ✅     | 🟡   | 🔧       | ✅      |
| Google ADK                    | Py · Java · TS · Go · Kotlin        | 🟡   | 🟡        | ✅     | ✅    | 🔧       | ✅      |
| Microsoft Agent Framework     | .NET · Py                           | 🔧   | 🔧        | ✅     | ✅    | 🟡       | 🟡     |
| OpenAI Agents SDK             | Py · TS                             | 🔧   | 🟡        | 🟡    | 🟡   | 🔧       | ✅      |
| Pydantic AI                   | 只有 Py                               | 🔧   | 🔧        | 🟡    | 🟡   | 🟡       | 🟡     |
| Vercel AI SDK                 | 只有 TS / JS                          | 🔧   | 🟡        | 🟡    | 🔧   | 🔧       | 🟡     |
| LangGraph (核心)                | Py · TS                             | 🔧   | 🔧        | 🟡    | ✅    | 🔧       | 🟡     |

從開發語言看，幾乎每家都支援 Python 跟 TypeScript，這兩個是目前 agent 開發的主流語言 (ADK 另外還有 Java、Go、Kotlin，Pydantic AI 則只有 Python、Vercel AI SDK 只有 TypeScript / JavaScript，GitHub Copilot SDK 第一方支援到六種、是最多的)。比較特別的是 Codex App Server: 它做成 JSON-RPC server，所以不限定你的程式用什麼語言 (Copilot SDK 同樣靠 JSON-RPC 跟 CLI 溝通)。

## 兩條路線的優缺點

全套 Deep Agent

優點

馬上有能跑的 agent; 六項能力、加上一份調校過、預設行為很強的 system prompt 都已內建，不用從頭做; 這套 harness 是原廠針對自家模型調過的。

缺點

是給通用任務用的，會帶你的場景用不到的 context 跟工具; 可控性、可改性、可維護性受限 (Claude Agent SDK 閉源最明顯); 通常和特定模型供應商綁定。

從基礎構建

優點

完全可控，可以貼著自己的任務分布，把無關的 context 跟工具拿掉; model 無關，可換供應商、好控制成本; 適合要精準掌握 context / 延遲 / 成本的產品場景。

缺點

要自己設計、組裝需要用到的能力，花的時間跟工程量會多一些。

還有一個容易被忽略、但對 production 服務很重要的維度: 維護跟 debug。全套 Deep Agent 路線有不少底層不在你的控制範圍內，一旦出問題比較難處理; 核心閉源的更麻煩 (Claude Agent SDK、GitHub Copilot SDK 都是這型): 底層出狀況你改不了、只能等官方。以 Claude Agent SDK 為例，它 GitHub 上其實累積了不少還沒解決的 issue (官方不一定有空處理)。如果你要做的是對外的 production 服務，這個底層夠不夠單純、好不好維護 (至少要能看到原始碼)，會是很實際的考量。從基礎構建雖然一開始要自己接，但底層都在你自己這邊，要 debug、要改都比較有把握。

## 那到底該選哪條?

沒有一體適用的答案，要看你做的是什麼。小編整理三個比較清楚的情境:

🔹 **特定情境應用，或是 B2C 使用者規模比較大的產品 → 建議從基礎構建**。從基礎構建可以更有效率: 貼著單一任務分布做的精簡版本，token 成本比較低、延遲也比較低。使用者一多，這些成本、延遲、可控性的差異會更明顯，你會希望把通用 deep agent 那些用不到的 context 跟工具都拿掉 (也就是貼著單一用途的 vertical agent)。能換模型供應商、能精算每一項成本，這時候很重要。

🔹 **自用、或企業內部軟體開發、要打造自己團隊用的 harness 跟 outer loop → 建議從現成 deep agent 開始**。這種場景你要的本來就是一個強的通用開發 agent，原廠已經幫你把內層調好了，沒必要重做。使用者數量沒那麼大，每個 session 多帶一點通用能力的成本不是重點，先有個能跑的東西、把你的 outer loop 疊上去比較划算。

🔹 **如果你想做的是讓使用者用自己的 ChatGPT 訂閱帳號 → 可以看看 Codex SDK / app server**。Codex 支援用 ChatGPT 訂閱帳號登入，不一定要用 API key 計費。對比之下 Claude Agent SDK 第三方使用只能用 API key、不能用 claude.ai 帳號登入。如果你的產品設計是「使用者帶自己的帳號來用」，這個差別會直接影響你做不做得出來。

## 最後: 框架只是起點

框架是起點，不是終點。選全套 Deep Agent，起點比較高，一開始就有個能跑的 agent，但相對不好改; 選從基礎構建，起點低、要自己接的多，但彈性跟可控性比較好，可以一步步朝你想要的設計前進。

不管選哪邊，框架幫你接好的都還是第 1 篇講的「能不能做」。真正讓 agent 做得對、做得完的那套 harness (工具層檢查、單輪驗收、外層 loop、eval gate)，不管哪個框架都得自己建。

© 2026 [愛好資訊科技](https://aihao.tw/)

[關於本站](https://blog.aihao.tw/about/) [訂閱電子報](https://ihower.tw/opt-in/gai) [RSS](https://blog.aihao.tw/feed.xml) 
