<!-- source-url: https://blog.aihao.tw/2026/06/26/harness-engineering-3-tool-execution-feedback/ -->
<!-- title: 給 Agent 開發者的駕馭工程 (3): 回饋時機一: 工具回傳值, 是寫給 agent 的回饋 | 愛好 AI 工程 Blog -->
<!-- fetched: 2026-06-29 -->

[愛好 AI 工程 Blog](/) 

[關於本站](https://blog.aihao.tw/about/) [ 訂閱電子報 ](https://ihower.tw/opt-in/gai) 

# 給 Agent 開發者的駕馭工程 (3): 回饋時機一: 工具回傳值, 是寫給 agent 的回饋

2026-06-26 

AgentTool UseContext Engineering 

![給 Agent 開發者的駕馭工程 (3): 回饋時機一: 工具回傳值, 是寫給 agent 的回饋](https://blog.aihao.tw/assets/images/harness-engineering-3/cover.png) 

📚 給 Agent 開發者的駕馭工程 (全 9 篇)

1\. [基礎: Deep Agent 的六項內建能力](https://blog.aihao.tw/2026/06/26/harness-engineering-1-deep-agent-capabilities/)

2\. [核心: Agent 要的是回饋迴路，不是完美提示](https://blog.aihao.tw/2026/06/26/harness-engineering-2-what-is-harness-engineering/)

3\. **回饋時機一: 工具回傳值，是寫給 agent 的回饋** (本篇)

4\. [回饋時機二: 兩次 model request 之間，把訊息注入執行中的 agent](https://blog.aihao.tw/2026/06/26/harness-engineering-4-mid-run-injection/)

5\. [回饋時機三: 單輪結束的驗收，Goal 與 Outcomes](https://blog.aihao.tw/2026/06/26/harness-engineering-5-goal-and-outcomes/)

6\. [回饋時機四: 外層 Loop, Ralph、Symphony 與 Cron](https://blog.aihao.tw/2026/06/26/harness-engineering-6-outer-loop/)

7\. [進階: 自我改進 Harness, Meta-Harness 與爬坡](https://blog.aihao.tw/2026/06/26/harness-engineering-7-self-improving/)

8\. [收尾: 會過期的 Harness, Model-Harness-Fit 與 Bitter Lesson](https://blog.aihao.tw/2026/06/26/harness-engineering-8-model-harness-fit/)

9\. [自建 Agent 的框架選型: 全套 Deep Agent 還是從基礎構建?](https://blog.aihao.tw/2026/06/26/harness-engineering-9-agent-frameworks/)

🎞️ 搭配演講投影片: [給 Agent 開發者的 Harness+Loop Engineering](https://ihower.tw/presentation/harness.html)

上一篇整理出回饋的四個時機點，從這篇開始，由內而外一層一層做。先從最內、最便宜的那一層著手: 在一次 tool call 裡，就把迴圈閉合掉。

這一層的好處是: 它就發生在 tool call 內部，對主迴圈幾乎沒有額外負擔，卻是修正成本最低、頻率最高的回饋點。一個失誤在這裡就被擋下，不會擴散到後面整輪、甚至整個任務，變成更大的代價。

## Tool Call 裡的三段式

一次工具呼叫，其實有三個可以介入的位置: 執行前、執行後、回傳時。

執行前: 驗證輸入

用確定性檢查擋掉危險或無效的呼叫，不讓它真的送出去。

執行後: 檢查結果

對拿回來的結果做品質檢查，必要時就地修復或重試。

回傳值: 夾帶指引

tool response 不只回資料，還夾帶指示與 metadata，引導 agent 下一步。

前兩段比較直覺，真正容易被忽略、也是這篇最想講清楚的，是第三段。寫程式的人很習慣把 function 的回傳值當成「資料」: 查到什麼就回什麼，出錯就丟出一個 exception。但在 agent 的場景裡，tool response 不只是資料，它同時也是一段 prompt: 你可以在裡面夾帶指示、metadata、甚至直接告訴 agent「下一步該怎麼做」。

這裡有個關鍵的觀念要翻轉: **工具輸出不是寫程式的 function output，它是你寫給 agent 看的回饋**。下面幾個案例，從純確定性的檢查，一路走到語意 Judge，由淺入深把這三段式逐一展開。

## 案例 A: Text-to-SQL Agent 的 SQL 驗證

先看一個最適合用「執行前驗證」的場景。

使用者發問，agent 看著資料庫 schema 自己生成 SQL，再用一個 `execute_sql(sql_query)` 工具去查。問題是，LLM 生成的 SQL 帶著一堆機率性的風險:

LLM 生成 SQL 的風險

* 查詢白名單以外的資料表
* 全表掃描、忘記分頁 (沒加 LIMIT)
* 瞎掰一個不存在的欄位
* 生成 SELECT 以外的危險語法

這些風險，你沒辦法靠 prompt「請不要這樣做」來解決。前一篇講過的前饋，在這個場景就是: 你會在 system prompt 裡寫好每張 table 的 schema、每張 table 是做什麼的、哪一類問題該查哪張 table，引導模型一開始就往對的方向生成 SQL。但前饋終究是機率性的引導，寫得再清楚，擋不住模型偶爾把欄位記錯、或忘記加 LIMIT。要擋，得在工具內部用一道確定性的關卡。

做法是把 SQL parse 成語法樹 (AST)，在送進資料庫之前先檢查、再改寫。Python 生態可以用 [SQLGlot](https://sqlglot.com/sqlglot.html) 這個函式庫:

```
import sqlglot
from sqlglot import exp

tree = sqlglot.parse_one(sql_query, dialect="postgres")

# 1. 只允許 SELECT 查詢
if not isinstance(tree, exp.Select):
    return "只允許 SELECT 查詢"

# 2. 資料表白名單
for table in tree.find_all(exp.Table):
    if table.name not in ALLOWED_TABLES:
        return f"資料表 {table.name} 不在允許範圍,可用的有: {ALLOWED_TABLES}"

# 3. 沒有 LIMIT 就補一個安全上限; 已有更嚴格的限制就保留,不覆蓋
limit = tree.args.get("limit")
if limit is None or int(limit.expression.name) > 200:
    tree = tree.limit(200)
# 4. 注入這個使用者該有的權限條件 (例如 WHERE tenant_id = ...)
safe_sql = tree.sql(dialect="postgres")

```

注意這道關卡有兩種動作: 一種是擋下來 (不是 SELECT、查到白名單外的表就直接回傳錯誤)，另一種是補強 (沒加 LIMIT 就補一個安全上限，但若原本就有更嚴格的 LIMIT 就保留、不覆蓋; 再注入這個使用者該有的權限條件)。這裡的分寸是: 補強只做「擋不住會出事」的最小改寫，不是假設任何 SQL 都能安全地自動改。它純粹靠程式運算: 不呼叫 LLM、零延遲、結果完全可重現。能用程式確定判斷的事，就不要請模型來猜。

## 失敗回饋: 同樣的錯誤，訊息寫得好不好差很多

驗證沒過的時候，你回傳什麼，直接決定 agent 自我修正的速度。這就回到剛剛講的「回傳值也是 prompt」。

對比一下同一個錯誤的兩種寫法:

❌ 爛的錯誤訊息

ERROR: column "revenue_growth"
does not exist

agent 只能瞎猜重試，常常越改越歪。

✅ 好的錯誤訊息

欄位 revenue_growth 不存在。
financial_metrics 可用欄位:
revenue, revenue_yoy, gross_margin…
年增率請改用 revenue_yoy。

下一步直接被導正。

爛的錯誤訊息把資料庫原始的訊息原封不動丟回去，那是寫給機器看的; agent 拿到只能再猜一次欄位名，猜錯再來一輪。好的錯誤訊息是寫給 agent 看的: 它附上這張表實際有哪些欄位、還直接點出「年增率你要的應該是 revenue\_yoy」。下一步直接被導正，不用反覆試錯。

這件事的重點是: **每個失敗都是你引導模型的免費機會，大多數人都浪費掉了。** 錯誤訊息要寫給 agent 看、要可行動，不是只丟一個 error code。不只 SQL，延伸到別的情境也一樣，例如查詢成功但回傳 0 筆，這不是錯誤，但對 agent 是個該被提醒的訊號: 你可以回「查詢成功但 0 筆，可能是公司名稱的字面值對不上 (資料庫存的是全名)，或時間區間超出資料範圍 (本表只有 2015 到 2025)」，免得它把空結果當成「答案就是沒有」直接回給使用者。

## 連「成功」都要回傳完整狀態，不是只回成功旗標

上面那個 0 筆的例子其實點到一件更通用的事: 需要設計的不只有失敗，**成功一樣要設計**。寫程式的人很習慣讓工具成功時就回一個 `{"success": true}` 了事，但對 agent 來說，一個光禿禿的成功旗標 (flag) 也可能是「假完成」的訊號。

回到 Text-to-SQL 的場景: 假設 agent 跑的是一個寫入查詢 (UPDATE／DELETE)，工具若只回 `{"success": true}`,agent 根本看不出來這次到底動了 5 筆還是 5 萬筆。一個你以為只會更新一位使用者的操作，可能因為 WHERE 條件寫太鬆而掃過整張表，但從一個光禿禿的成功旗標完全看不出來，agent 只會當作沒事繼續。(coding agent 也是同個毛病: 工具只回「File updated」，看不出是精準地只改了該改的 3 行，還是順手把 200 行無關的程式碼重排了一遍。)

所以工具成功時，回傳值要給的是 **完整狀態 (state)，而不只是一個成功與否的旗標 (status)**: 影響了幾筆資料、動了哪些欄位或哪些區塊、有沒有碰到不該碰的、目前進行到什麼狀態。把規模和範圍量化回來 (改了幾行、影響幾筆、花了多少 token),agent 才有依據判斷「這次的結果到底合不合理」，而不是看到 true 就繼續做下去。一句話: 錯誤要設計，成功也要設計。

## 案例 B: 文件摘要 agent 的 grader，寫死的固定訊息也是一種引導

案例 A 的好錯誤訊息是手寫的。你可能會想: 真實系統難道要一條一條把失敗訊息寫死嗎? 看一個把這件事系統化的案例，OpenAI Cookbook 的 [Self-Evolving Agents](https://developers.openai.com/cookbook/examples/partners/self%5Fevolving%5Fagents/autonomous%5Fagent%5Fretraining) (Bain 與 OpenAI 合作)，場景是製藥法規文件的摘要。

它跑的是一個品質檢查迴圈: 摘要 agent 產出摘要 → 一組 grader 對著摘要評分 → 沒過，就把失敗回饋交給一個 metaprompt agent 去重寫 prompt → 新版 prompt 再跑一輪，直到分數過門檻。重點在那組 grader 的設計: 它不是只丟一個 LLM judge 了事，而是把確定性檢查跟語意判斷組起來，四個一起跑:

* **chemical\_name\_grader** (Python，確定性): 檢查摘要有沒有保留原文的化學名稱，確保忠於原文的專業用詞
* **word\_length\_deviation\_grader** (Python，確定性): 以 100 字為目標，偏離越多分數越低，控制冗長
* **cosine\_similarity** (確定性): 確保摘要沒有語意漂移
* **llm\_as\_judge** (語意): 抓前三個規則型 grader 漏掉的細緻品質

跟這篇主題最相關的，是這組 grader「沒過時回傳什麼回饋」。沒過的 grader 會被一個 `collect_grader_feedback()` 翻成文字、塞進 metaprompt。而這裡有個關鍵分野:

```
def collect_grader_feedback(grader_scores):
    lines = []
    for entry in grader_scores:
        if entry["passed"]:
            continue                                  # 只處理沒過的
        if grader == "chemical_name_grader":
            lines.append("Not all chemical names were included…")    # 寫死的固定訊息
        elif grader == "word_length_deviation_grader":
            lines.append("The summary length deviates too much…")    # 寫死的固定訊息
        elif grader == "cosine_similarity":
            lines.append("The summary is not sufficiently similar…")  # 寫死的固定訊息
        elif grader == "llm_as_judge":
            lines.append(entry["reasoning"])          # judge 當場生成的語意說明
    return lines

```

三個確定性 grader (chemical／length／cosine) 只能給出「預先寫死的固定字串」，因為它們本身只回一個數字分數，講不出「為什麼不對」。只有 `llm_as_judge` 是評分模型 (score model)，能附上自己的推理說明 (reasoning)，給的回饋才帶當下的語意說明。

這帶出案例 A 沒講透的一個取捨。確定性檢查又快又穩又可重現 (案例 A 的 SQLGlot、這裡的三個 Python grader)，但它能給的回饋精細度有上限: 它只能回你「事先設計好、寫死」的那句引導，講不出這一次具體錯在哪。語意 judge 反過來，慢、貴、不穩，但能把問題講清楚。所以「能確定就不用 LLM」不是說 judge 沒用，而是說: 凡是你能事先想清楚、寫死引導句的失敗，就用確定性檢查擋掉; 剩下那些「要看當下語意才講得清楚」的，才交給 judge。

換個角度看，失敗回饋始終是你「設計」出來的，不是系統隨便給的。差別只在: 確定性 grader 的回饋是你寫程式時就一字一句定好的固定訊息，judge 的回饋是它當場生成的。兩種都要寫得可行動，這也是這整篇反覆在講的事。

## 回傳值的另一半責任: 別把 context 塞滿

回傳值除了夾帶引導，還有一個容易被忘掉的責任: 控制它自己的大小。這件事是 context engineering 的一環，設計工具回傳值的時候，別忘了 context engineering 還有一整套策略可以一起用。

ihower 在 [Context Engineering](https://ihower.tw/blog/12817-context-engineering) 一文裡 (沿用 Lance Martin 的框架) 把它分成四種策略: 寫入、選擇、壓縮、隔離。這幾種要一起考慮，其中兩種最容易在「工具回傳」這一步被漏掉: 「選擇 context」靠的是各種檢索技術 (RAG、reranker、查詢理解)，決定只把對的內容拉進來; 「隔離 context」靠的是 sub-agent，把龐大的中間過程交給另一份 context 去跑、只回傳結論。回到工具回傳值本身，要顧的就是別一次塞太多進 context，下面幾個例子都在講這件事。

LangChain 的 Vivek Trivedy 在一場[訪談](https://www.youtube.com/watch?v=NovNcsKX8AU)裡的建議是: 從第一天就帶著「對抗 context rot」的意識設計 agent，而不是等 context 塞滿再來補。第一篇提過 context rot,Viv 把它講得更具體: context window 一旦過了某個門檻，模型會明顯變笨，掉進他同事 (HumanLayer 的 Dex) 說的「dumb zone」。一坨沒裁過的 shell log、一個幾千筆的查詢結果，直接整包塞回 context，就是在把 agent 推向那個門檻。

以 coding agent 為例最具體: 檔案動輒上千行、shell log 輸出量又大，最容易把 context 塞滿。Arize 的 Aparna Dhinakaran [逆向觀察、比較了四個 agent harness](https://x.com/aparnadhinak/status/2048492731929149929) (Pi、OpenClaw、Claude Code、Letta) 怎麼管 context，整理出它們在工具輸出上頗為一致的幾個做法 (以下是她從工具行為逆向觀察的整理，細節數字以該串為準，不是官方文件):

* **硬性上限**: 檔案讀取一律設上限 (Claude Code 是讀取前先 stat 擋掉 256KB 以上的檔、讀取後再用 token 數把關)，工具結果也各有字元上限。
* **頭尾保留**: 截斷時不是只留開頭，而是看尾巴重不重要 (有錯誤、有 JSON 收尾大括號、有摘要關鍵字) 就切成「頭 + 尾」，中間捨掉。
* **卸載到磁碟**: 超大的工具結果寫到檔案，context 裡只留一個 2KB 的預覽和檔案路徑，模型需要細看時再自己去讀。
* **附上續讀提示**: 截斷後補一句「目前顯示第 1 到 2000 行，用 offset=2001 繼續」，讓模型知道它看到的是局部、還能怎麼拿更多。

換到 Text-to-SQL 場景也一樣具體: SQL 回傳 3,847 筆，別整包塞進去，裁成前 10 筆，後面補一段 metadata「共 3,847 筆已截斷，涵蓋 412 家公司; 若要加總或平均請直接用 SQL 聚合，不要逐筆讀回來自己算」。這樣 context 不會塞滿，模型又知道整體規模，還順手被導去用對的做法。

> 編按: 這四個 harness 在 context 管理上的趨同還不只工具輸出，連前面講的「壓縮」(對話 compaction)、「隔離」(子代理人) 這兩種策略，做法都很接近，Aparna 那篇值得一讀。

把這段收一句: 回傳值要同時顧兩件事，一是夾帶能引導下一步的訊號，二是別讓自己把 context 塞滿。下一個案例，正好把這兩件事結合在一起。

## 案例 C: 知識庫 RAG 的 facets，讓 agent 看見資料全貌

換一個語意更重的場景。企業知識庫問答 agent，配一個 `search_knowledge(query)` 工具 (關鍵字 + 向量搜尋，再加 reranker)。

RAG 的老問題是: 檢索品質參差不齊，空結果、低相關、版本過時、片段被截斷都有可能。而麻煩在於，**就算拿到品質差的 context,agent 還是會很有自信地生成答案**。檢索品質的把關不能等到答案生出來才做，要在工具層就介入。

最直接的介入，是在回傳結果時順手標註來源和相關度分數，讓 agent 有依據判斷哪些該引用、哪些該丟。再進一步，Jason Liu 在 [Beyond Chunks: Why Context Engineering is the Future of RAG](https://jxnl.co/writing/2025/08/27/facets-context-engineering/) 裡點出一個常被忽略的訊號: 當好幾個 chunk 都來自同一份文件，那其實是在暗示「這份文件整體很相關」，與其讓 agent 拿一堆零碎片段去拼湊，不如在工具回傳裡提示它直接把那份文件的整頁讀回來，完整脈絡比散落的 chunk 好用得多。而他文章裡更有意思的一招是 facets: 工具回傳的不只是 top-k 結果，還夾帶一份整個資料集分佈的統計。

舉他原文的例子 (場景是搜尋工單),search 回傳的內容長這樣:

```
<ToolResponse>
  <results query="API timeout issues">
    <ticket id="LIN-1247" status="Done">…</ticket>
    <ticket id="LIN-1189" status="Done">…</ticket>
    <ticket id="LIN-1203" status="Done">…</ticket>
  </results>
  <facets>
    <status_facet>
      <value name="Done" count="6"/> <value name="Open" count="5"/>
    </status_facet>
  </facets>
  <system-instruction>
    回傳的 3 筆全是 Done: 已解決的工單記載較完整、相似度排名較高。
    但 facets 顯示另有 5 筆 Open 沒進 top-k,
    請改用 search(query, status="Open") 追查進行中的問題。
  </system-instruction>
</ToolResponse>

```

這裡有兩個關鍵設計。一是 `<facets>`: 它告訴 agent「符合的不只你看到這 3 筆，還有 5 筆 Open 沒進 top-k」。相似度搜尋有個偏誤，已解決的工單因為文件寫得完整，分數本來就比進行中的高，於是真正該追的進行中問題反而被擠出 top-k。光看 top-k 是看不到這個的。二是 `<system-instruction>`: 它直接在工具輸出裡告訴 agent 下一步該怎麼搜。

這就是 facets 給 agent 的價值: 讓它在 top-k 之外，還能看見整個資料集的全貌。agent 不必一次就達到完美 recall，它本來就會持續地、系統性地探索; 你只要在每次工具輸出裡告訴它整個資料集長什麼樣，它就會順著線索一層層查下去。Jason Liu 那篇的核心洞見講得很到位: tool response 本身就是一種 prompt engineering，你回傳的 XML 結構和 metadata，直接形塑 agent 接下來怎麼思考。這跟前面 SQL 那段是同一個道理，只是這裡夾帶的不是錯誤修正，而是探索路徑。

## 案例 D: 把回饋交給「另一個模型」

前面三個案例，工具內部的把關不是自家寫的 (SQLGlot、Python grader)，就是自己跑的統計 (facets)。還有一種做法是: 工具內部直接去**呼叫另一個模型**，把當前的 context、相關資料丟過去，要它審查、給出第二意見 (second opinion)，再把那個模型的回饋當成 tool response 帶回來。從主迴圈的視角看，這還是一次普通的 tool call，只是這次 call 的是另一個模型。

先說清楚這招怎麼套到自建 agent 上，因為下面舉的成熟例子剛好都出自 coding agent (那邊的工具生態最成熟，不代表這招只有 coding 能用): 你的 Text-to-SQL agent 生出一條複雜查詢後，可以呼叫一個更強的模型，審查「這條 SQL 真的回答了使用者的問題嗎」; RAG 問答 agent 生成答案後，可以叫另一個訓練不同的模型，對著檢索到的文件檢查有沒有幻覺。這個做法是通用的，只是 coding 圈先把它做成了現成工具。

為什麼不讓 agent 自己重讀一遍就好? 因為**自評不是獨立檢查**。consult-llm 這個工具把話講得很白:

> 「一個模型審查自己的產出，不算是獨立的檢查。就算換到全新的 context，它仍然共享同一套訓練、同樣的先驗，以及許多相同的失誤模式。」 (A model reviewing its own work isn’t an independent check. Even in a fresh context, it shares the same training, priors, and many of the same failure modes.)

換一個訓練不同的模型，才換得到比較獨立的視角。[consult-llm](https://github.com/raine/consult-llm) 的定位就是「在你現有的 agent 工作流裡，直接跟另一個模型要第二意見」，實作是一支 CLI,agent 把 prompt 和相關檔案送進去、指定要問 GPT、Gemini 還是 Grok，回傳值就是那個模型的回饋。

工具大致長這樣 (示意):

```
@function_tool
async def consult_model(question: str, files: list[str], model: str) -> str:
    """遇到難解的問題、想確認方向、或要審查一段產出時呼叫,
    把問題交給另一個模型給獨立回饋。
    question: 你想問的問題、或要它審查的重點
    files: 要附上的相關資料或檔案
    model: 要諮詢哪個模型 (例如 gpt / gemini / o3)
    """
    # 工具內部就是去呼叫另一個模型,把它的回饋整段帶回來
    ...

```

[Amp](https://ampcode.com/news/oracle) (Sourcegraph) 把這招做成內建功能，叫 oracle: 主 agent 跑 Sonnet，但可以呼叫一個背後接 o3 的 oracle 工具，專門拿來審查、除錯、分析、想下一步該怎麼走。他們形容主 agent 跟 oracle 的關係是「一個寫程式、一個分析審查」。這裡有個值得參考的取捨: o3 更強，但也更慢更貴，所以 Amp **刻意不在 system prompt 裡催** agent 動不動就問 oracle，而是讓使用者需要時再明確要求。這點出一條通則: 諮詢另一個模型是工具層最貴的一種回饋，要不要觸發、多常觸發，是你可以調整的設定。

這招甚至不必跨產品。你現在用的 Claude Code，裝上 Codex plugin 後就多一個 `/codex:review` 工具: Claude 主 agent 把本地的 git 改動交給 Codex (背後是 GPT) 做 code review，合約還寫死「只做審查、不准順手改」，把 Codex 的審查結果原封不動帶回來。一個 Anthropic 的模型，呼叫一個 OpenAI 的模型來挑自己的毛病。

那「什麼時候該呼叫這個模型」，由誰來決定? 大致有三種做法:

* **使用者自行觸發**: 需要時才明確叫 agent 去問。Amp 預設就走這條，把決定權留給人，避免無謂的成本。
* **寫進前饋規則**: 在 AGENTS.md / system prompt 裡規定「遇到哪類情況 (例如連續改兩次測試還是紅的、或要動到核心模組) 就去呼叫這個工具」，把觸發時機半自動化。
* **讓 agent 自行判斷**: 最理想，但也最難。

第三條會遇到 [Advisor Strategy](https://blog.aihao.tw/2026/05/19/claude-managed-agents-architecture/) 碰過的同一道難題。Advisor Strategy 其實就是這招的一個典型特例: 用便宜的小模型 (Haiku、Sonnet) 當主力，只在卡關時呼叫貴的大模型 (Opus) 當顧問，給一段幾百 token 的精簡建議，目標是「Opus 級的智能、Haiku 級的價格」。它最難的地方不在怎麼把工具接上，而在: **小模型常常沒有足夠的自我覺察，不知道自己已經卡住、該求助了**。也就是說，「判斷一個問題難到需要外援」本身就是個困難問題，而且越弱的模型越判斷不出來: 要有「我搞不定」的判斷力，跟有能力把問題解掉，需要的其實是同一種能力，這形成一個循環依賴。所以實務上，先用前兩種方式 (使用者觸發、寫死規則) 把觸發時機定好，通常比寄望 agent 自己察覺來得穩。

> 編按: 小模型呼叫大模型的 Advisor Strategy,SWE-bench 數字與成本取捨可參考 [GitHub 與 Claude 的 caching、harness 與 advisor 策略](https://blog.aihao.tw/2026/06/01/github-claude-caching-harnesses-advisors/);而多代理在什麼情況反而是反模式 (動輒 3 到 10 倍 token 成本)，見 [Multi-Agent 反模式和業界收斂共識](https://blog.aihao.tw/2026/05/19/multi-agent-anti-patterns-and-patterns/)。

回到本篇主軸: 這個被諮詢的模型回來的東西，一樣是**夾帶在 tool response 裡的回饋**，一樣要可行動。差別只在，前面案例的回饋是你寫死的固定訊息、或自家小 grader 的判定，這裡的回饋是另一個 (通常更強、訓練不同的) 模型當場生成的。它要解的問題，跟「自我感覺良好就交差」其實是同一個，差別只在改用一個獨立的模型來檢查，而不是讓 agent 自己看自己。

> 編按: 「換一個獨立的模型來驗」這個做法，在時機三談單輪驗收時會是主軸 (fresh-context verifier、生成與評估分離)。這裡先在工具層看到它的雛形。

## 工具層的四個設計原則

把這幾個案例收斂成四條可以直接拿去用的原則:

1️⃣ 能確定就不用 LLM

SQL 驗證用 SQLGlot，不用 judge: 又快又穩又可重現。

2️⃣ 語意判斷才用 Judge

細緻品質好不好沒有 assert 可寫，才放一個 LLM judge 補規則型檢查的不足。

3️⃣ 回饋必須可行動

錯誤訊息要附「該怎麼辦」，不是只丟一個 error code。

4️⃣ 延遲預算內完成

工具層回饋在 tool call 內發生，要注意 latency，別讓把關拖慢整個迴圈。

## 接下來: 單步正確，不等於整體完成

工具層這道迴圈很便宜、很高頻，但它有一個結構性的限制: 它只看得到單一次 tool call。

每一步都驗得對，只代表「這一步」對。十次工具呼叫全部驗過，整輪的產出仍然可能沒達標: 需求漏做了一半、該跑的整體驗證根本沒跑，這些都不是任何一次單步檢查看得見的。SQLGlot 確認每一句 SQL 都合法，但它不會告訴你「這三句 SQL 加起來，有沒有真的回答使用者的問題」。

完成與否，得從整輪產出的層級來驗收。誰來看「這一輪的產出」，是時機三 (單輪結束的驗收) 要處理的事，不能因為「模型覺得做完了」就算數。不過下一篇先談一個性質不同、由人主動觸發的回饋: 在這一輪還沒結束時，使用者怎麼即時介入 (時機②,steering 與 interrupt)。

© 2026 [愛好資訊科技](https://aihao.tw/)

[關於本站](https://blog.aihao.tw/about/) [訂閱電子報](https://ihower.tw/opt-in/gai) [RSS](https://blog.aihao.tw/feed.xml) 
