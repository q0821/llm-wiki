<!-- source-url: https://evoke728.github.io/jason-pages/2026-07-20-claude-code-plugins -->
<!-- title: Claude Code 五個外掛｜完整安裝與實戰指南 -->
<!-- fetched: 2026-07-22 -->

[ 裝好這五個外掛後 →加入 奇點研究所 × D11 ](https://www.skool.com/d11-lab/about) 

NEXT STEP

#### 讓一個人  
做出團隊的產出

裝好外掛只是開始。怎麼把 AI 接成能省時間、能變現的系統——我在 Skool 帶你。

[加入 奇點研究所 × D11](https://www.skool.com/d11-lab/about) 

CLAUDE CODE · 五個外掛實戰指南

# Claude Code  
五個外掛

完整安裝與實戰指南

五個外掛的完整安裝、實際指令、使用時機，以及每一個的**限制與陷阱**。  
我不會只講好話——每個工具後面都有「什麼時候不要用」，因為一個外掛裝錯場景，比不裝還糟。

5

個 · 外掛

·

23

個 · impeccable 指令

·

30+

個 · 生圖生片模型

傑森所長 @jasonxtsai

專注在一件事：用 AI 工具，讓一個人做出一個團隊的產出。這個帳號分享的只有三類——AI 工具怎麼用、自媒體怎麼變現、以及怎麼把兩件事接在一起。沒有心法、沒有雞湯，只有能直接跑起來的東西。

這份文件會給你什麼 

## 不是清單  
是照著做完的指南

* 五個外掛的**可複製安裝指令**
* 一套建議的安裝順序（**不要一次全裝**）
* 三個網路教學普遍寫錯的地方
* 一份給不寫程式的人的替代路徑

驗證日期：**2026 年 7 月**。所有安裝指令皆已對照官方 repo 與文件核實。開源專案更新快，若指令失效，以各專案 GitHub 為準。

先講一句實話 

## 這五個裡  
只有三個是真正的「外掛」

| 名稱         | 它到底是什麼                    |
| ---------- | ------------------------- |
| graphify   | skill + hook              |
| impeccable | skill + CLI + hook        |
| ponytail   | plugin（透過 marketplace 安裝） |
| Higgsfield | MCP server                |
| Obsidian   | 根本不是外掛，它只是一個資料夾           |

它們解決同一件事的不同層面

讓 Claude 少讀、少寫、少猜、有記憶。先理解這件事，再開始裝。

五個外掛 · 逐個拆 

## 展開任一個  
安裝指令直接複製

01graphify · 把 repo 建成知識圖譜 

Claude 在大型專案裡最貴的成本不是輸出，是定位——它要先讀懂架構才能動手，而讀懂的方式就是一個檔案一個檔案 grep。專案愈大，這筆錢燒得愈兇。

graphify 用 tree-sitter 做 AST 靜態解析，把程式碼、文件、PDF、圖片全部解成一張圖：節點是概念，邊是關係，還會自動抓出 **community（模組群）**和 **god node（被最多東西依賴的核心）**。Claude 從此照著地圖走，不是盲目搜。

安裝（需要 Python 3.10+）

複製

套件名是 graphifyy（兩個 y）

# 1. 安裝套件
pip install graphifyy
# 2. 安裝 skill
graphify install
# 3. 進專案資料夾，做 Claude Code 深度整合
cd your-project
graphify claude install

第三步做兩件事：在 CLAUDE.md 寫入指令，要 Claude 回答架構問題前先讀 **graphify-out/GRAPH\_REPORT.md**；並裝一個 **PreToolUse hook**，在每次 Glob／Grep 之前先攔截。這個 hook 是重點——它讓 Claude 在「搜之前」就先看圖。

建圖與查詢

複製

建圖（在 Claude Code 裡）

/graphify ./your-folder

| 產出               | 用途                               |
| ---------------- | -------------------------------- |
| graph.html       | 可點擊的互動視覺化                        |
| GRAPH\_REPORT.md | 一頁式摘要：god nodes、communities、意外連結 |
| graph.json       | 可查詢的持久化圖                         |
| cache/           | 增量快取                             |

複製

三個查詢指令

/graphify query "使用者登入流程經過哪些檔案"
/graphify path A B          # 追兩個東西之間的路徑
/graphify explain <concept> # 解釋單一概念

複製

進階：讓圖自己更新（post-commit / post-checkout）

graphify hook install

⚠️ **什麼時候不要用：**小專案（檔案不到 100）Claude 直接讀比較快，建圖反而是額外成本。文件／PDF／圖片的語意抽取會呼叫模型（程式碼用 tree-sitter 是本機免費），大型混合專案第一次建圖要有心理準備。另外 graphify install 會覆寫 SKILL.md，客製過的話升級後要重新確認。

**官方：**github.com/safishamsi/graphify｜graphify.net

02impeccable · 抓出前端的 AI 痕跡 

Claude 寫得出能跑的介面，但寫不出有意圖的介面。放著不管，它會往最安全的視覺平均值靠攏：Inter 用到底、紫到藍漸層 hero、卡片包卡片、彩色底放灰字、每個標題上面一個圓角 icon tile、彈跳動畫、所有東西置中。

這不是醜的問題，是識別度的問題。使用者看得出來，只是講不出名字。impeccable 給 Claude 一套設計詞彙，讓它知道「什麼不該做」——這比教它「該做什麼」有效得多。

安裝

複製

在專案根目錄執行（會偵測你的 AI 工具裝對應版本）

npx impeccable install

複製

然後在 Claude Code 裡

/impeccable init

init 會掃描 repo、合併 Tailwind theme、盤點元件，寫出 **PRODUCT.md**（產品脈絡）和 **DESIGN.md**（設計規範）。後面所有指令都靠這兩份檔案，**跳過這步效果減半**。

最常用的核心指令（共 23 個）

| 指令                   | 做什麼               |
| -------------------- | ----------------- |
| /impeccable audit    | 掃描 + 評分報告         |
| /impeccable critique | UX 檢視：層級、清晰度、情緒   |
| /impeccable polish   | 上線前最後一遍（對齊、間距、細節） |
| /impeccable distill  | 砍掉沒有存在價值的複雜度      |
| /impeccable typeset  | 修字體、層級、尺寸         |
| /impeccable arrange  | 修版面、間距、視覺節奏       |
| /impeccable bolder   | 把太安全太無聊的設計放大      |
| /impeccable quieter  | 把太吵的設計壓下來         |
| /impeccable animate  | 加有目的的動態（不是裝飾性抖動）  |
| /impeccable harden   | 錯誤處理、i18n、邊界情況    |

detect CLI：接進 CI

複製

46 條確定性偵測規則，純規則比對不呼叫模型

npx impeccable detect src/

抓的是 AI slop 特徵（漸層文字、側邊條、紫色系）、排版問題、WCAG 對比違規、版面反模式、動態問題。乾淨回傳 **0**，抓到問題回傳 **2**——可直接接進 PR check，在 merge 前擋掉 AI slop。加 **\--json** 給機器讀。

⚠️ **一個常見錯誤資訊：**網路上很多文章寫「impeccable 偵測 24 個設計破綻」，那是舊版本的數字。**現在是 46 條偵測規則**，引用前先自己跑一次。

⚠️ **什麼時候不要用：**它不生 UI（不是 v0、不是 Stitch），只讓既有專案的 agent 輸出更好。規則有立場，做實驗性高創意的東西會綁手綁腳。Live Mode 還在 beta。detect CLI 需要 Node 24+。設計 pass 跑完還是要跑 axe 做無障礙測試。

**官方：**github.com/pbakaus/impeccable｜impeccable.style｜作者 Paul Bakaus（jQuery UI 作者、前 Google DA）

03ponytail · 全場最懶的資深工程師 

你知道那種人。長馬尾、橢圓框眼鏡、在公司待得比版控還久。你給他看五十行程式碼，他看一眼，不說話，換成一行。

Claude 的毛病跟懶惰相反——它蓋太多。你要一個日期選擇器，它裝了 flatpickr、寫了 wrapper 元件、加了樣式表，順便開一個時區的討論。能跑，但一百行做了一行的事。ponytail 就是關掉這個反射。

懶惰階梯（Laziness Ladder）

寫任何程式碼之前，agent 從上往下走這道階梯，**停在第一個成立的階**：

Laziness Ladder

1. 這東西需要存在嗎？      → 不需要：跳過（YAGNI）
2. codebase 裡已經有了？   → 重用，別重寫
3. 標準函式庫做得到？       → 用標準函式庫
4. 原生平台功能做得到？     → 用原生（<input type="date">）
5. 已安裝的相依套件做得到？ → 用它，絕不為幾行程式碼新增相依
6. 一行寫得完？             → 一行
7. 都不行                   → 才寫「剛好能動的最小量」

SKILL.md 裡定義了這個人格：**階梯是反射，不是研究計畫。第一個能動的懶方案就是對的方案。**

安裝

複製

透過 marketplace 安裝

/plugin marketplace add DietrichGebert/ponytail
/plugin install ponytail@ponytail

需要 **node 在 PATH 上**（跑兩個 Node lifecycle hook）。Nix／nvm 使用者要在非互動 shell 的 PATH 上。node 找不到的話 skill 還是會動，只是「每回合自動啟用」會安靜失效。

| 模式       | 行為                        |
| -------- | ------------------------- |
| lite     | 照你要的做，但一句話點出更懶的替代方案，你自己決定 |
| full（預設） | 執行階梯。最短的 diff，最短的解釋       |
| ultra    | YAGNI 極端派。丟出一行版本，同時質疑需求本身 |

複製

切換與附帶指令

/ponytail lite
/ponytail off
/ponytail-review   # 對一個 diff review，列出該刪的行
/ponytail-audit    # 掃整包，給「該刪/簡化/換標準庫」排序清單
/ponytail-debt     # 收集所有 ponytail: 註解，做成技術債帳本

ponytail 每走一個捷徑，都會留一個 **ponytail:** 註解，寫明天花板和升級路徑。「以後再說」不會變成「永遠不說」，因為債是可見、可收割的。

⚠️ **關於「少寫 94% 程式碼」那個數字：**網路瘋傳「省 42–75% 成本、快 3–6 倍」——**作者自己修正過**。原始 benchmark 是單次 completion 比對，裸模型 baseline 會塞一堆散文，落差有一部分是「對話式 baseline 的假象」。ponytail 有用，但別引用那個數字。它的價值是成本論述：agent 沒寫的每一行，就是沒人要 review、要測、要背風險的程式碼。

⚠️ **什麼時候不要用：**有正當抽象需求的專案（circuit breaker、retry、backoff 不會因為「一行」而變好）。簡潔型推理模型可能反效果（階梯是審慎步驟，會先花 thinking token）。你要 Claude 建大型架構時——這時需要它蓋，不是需要它懶。

**官方：**github.com/DietrichGebert/ponytail｜授權 MIT

04Higgsfield MCP · 一條線接 30+ 生成模型 

一台 MCP server，把 Claude Code 接上 30+ 個圖片與影片生成模型——Soul、Cinema Studio、Flux、Seedream、Kling、Minimax Hailuo、Veo、Sora 等等。

最好的生圖模型每個禮拜都在換。以前用每一個都要管一組 API、一個帳號、一套 SDK，結果大部分人挑一個用到底——等於幾乎永遠沒在用最適合的工具。Higgsfield MCP 把這件事收攏成一個連線。

安裝（Claude Code）

複製

一行指令

claude mcp add --transport http --scope user higgsfield https://mcp.higgsfield.ai/mcp

**\--transport http**：這是 hosted HTTP server，不是本機 stdio。**\--scope user**：寫進 \~/.claude/mcp.json，所有專案都能用（想只在單一 repo 並 commit 給團隊就換 --scope project）。第一次呼叫工具時會開瀏覽器跑 OAuth，登入 Higgsfield 帳號即可。

複製

驗證（或在 session 裡打 /mcp 看綠勾）

claude mcp list

**沒看到？**完全關掉 Claude Code 再開。新的 MCP server 只在全新 session 才註冊。

**claude.ai／桌面版：**Settings → Connectors → Add Custom Connector → 貼上 https://mcp.higgsfield.ai/mcp → Connect → 瀏覽器登入。

⚠️ **網路上最多人寫錯的地方：你不需要 API key。**Higgsfield 在 2026-04-30 才推出官方 hosted MCP server，在那之前的教學都教你貼 HIGGSFIELD\_API\_KEY——照著做你會卡住。官方 hosted server 走瀏覽器 OAuth，沒有 key 要管。

❌ 這是舊做法，現在不用了

{
  "mcpServers": {
    "higgsfield": {
      "command": "higgsfield-mcp",
      "env": {
        "HIGGSFIELD_API_KEY": "your-key",
        "HIGGSFIELD_SECRET": "your-secret"
      }
    }
  }
}

使用時要知道的事

* **它不會通知你。**生成跑在它自己的伺服器上，做完不會 ping。要明確叫 Claude「每 60–90 秒 poll 一次，把結果拉回來」，不然它會無限等待或直接跳過。
* **批次要分組。**一次丟 10 個，第四個之後會安靜失敗。三個一組送，然後 poll。
* **任務是持久的。**Session 斷掉沒關係，任務在伺服器端繼續跑。長影片可以放著不管。
* **先估 credit。**200 張圖在 creator plan 沒問題；200 支 Veo 影片會在一個下午燒掉一整個月。開始前先叫 Claude 估。
* **檢查品牌名拼字。**自動轉錄會把 Claude Code 寫成 Cloud Code、Seedance 寫成 C-Dance。聲音對、字幕錯，發布前自己看過。

⚠️ **什麼時候不要用：**你只需要一種模型時，直接用那家 API 更便宜。你的內容不吃視覺時，這是內容生產工具、不是開發工具，裝著只會多一層 context。

**官方：**higgsfield.ai/mcp｜Endpoint：https://mcp.higgsfield.ai/mcp

05Obsidian · 給 Claude 一份共用記憶 

它不是外掛，是一個資料夾。但它解決這五個裡面最根本的問題：Claude 沒有記憶。每一次新 session 都是全新的——你上禮拜討論的架構決策、踩過的坑、定下的規範，全部歸零。

Obsidian vault 就是一堆 Markdown 檔的資料夾。把 Claude 指向它，你的筆記就變成共用記憶：可搜尋、會留存，每次新對話 Claude 都讀得到、也寫得回去。

設定（最小可行版本）

**建一個 vault：**就是建一個資料夾放 .md 檔。Obsidian 本身不是必須的——你要的只是「一個裝滿 Markdown 的資料夾」。

**在 CLAUDE.md 裡指路**（見下方範本）

**確認 Claude 讀得到路徑：**vault 在專案外面的話，Claude Code 需要權限，第一次它會問你。

複製範本

加進專案根目錄的 CLAUDE.md

## 專案記憶
我的長期筆記在 ~/vault/（Obsidian vault，Markdown 格式）。

在下列情況讀取它：
- 回答架構問題前
- 我提到「上次」「之前」「我們決定過」時
- 開始一個新功能前，先看有沒有相關的決策紀錄

在下列情況寫入它：
- 我們做出一個架構決策時 → 寫進 ~/vault/decisions/
- 我們踩到一個坑並解決時 → 寫進 ~/vault/gotchas/
- 我明確說「記下來」時

寫入格式：Markdown，開頭放日期與一句話摘要。

進階：讓它自己整理

在 \~/vault/ 放一個 INDEX.md，讓 Claude 每次寫入後更新它。這樣它有一份「目錄」可以先掃，不用每次全讀。

複製範本

\~/vault/INDEX.md

# Vault Index
最後更新：<Claude自動填>

## decisions/
- 2026-07-01｜為什麼不用 Redis：流量規模不到，先用 in-memory
- 2026-06-20｜前端狀態管理選 Zustand 不選 Redux

## gotchas/
- 2026-07-05｜Vercel edge function 不支援 Node fs，要改用 fetch

為什麼這招被低估

因為它太簡單，簡單到不像一個方案。但它門檻最低、回饋最大——前面四個都是讓 Claude 這一次做得更好，Obsidian 是讓它下一次不用重來。

⚠️ **什麼時候不要用：**筆記沒人維護時（過期的 vault 比沒有更糟，Claude 會照錯的資訊做決定）。vault 太大時（幾千個檔案需要索引或 graphify 上場）。裡面有機密時——Claude 讀得到的就是進了 context 的，API key、密碼、客戶資料不要放。

**官方：**obsidian.md（其實你只需要一個資料夾）

五個外掛講完了

### 裝好工具是基本  
接成系統才是重點

這五個讓 Claude 少讀、少寫、少猜、有記憶。想把它們接成一條能省時間、能變現的產線——我在 Skool 帶你做、每週更新。

[加入 奇點研究所 × D11 →](https://www.skool.com/d11-lab/about) 

安裝順序建議 

## 不要一次全裝  
五個都開會分不清誰在影響輸出

W1第一週｜Obsidian · 門檻最低、零風險 

回饋最大，而且不會改變 Claude 的行為——它只是給 Claude 多一個可以讀的東西。先建 vault、寫三份筆記，看 Claude 有沒有真的讀。

W2第二週｜ponytail · 先跑 lite 

裝上，用 lite 模式跑一週。觀察它點出的「更懶的替代方案」有多少是對的。覺得講得有道理，再切 full。

W3第三週｜impeccable · 只有做前端才裝 

純後端專案裝了沒用。先跑 /impeccable init，再跑一次 npx impeccable detect src/，看現有專案被抓出幾條——那個數字通常會讓你安靜三秒。

W4第四週｜graphify · 超過 200 檔再裝 

小專案沒有效益。建一次圖，打開 graph.html 看一眼——就算之後不用它，那張圖本身也值得看，你會發現你對自己的專案結構有誤解。

需要時Higgsfield · 要做圖做片再裝 

這是內容生產工具，不是開發工具。你要做圖、做影片的時候再裝。

給不寫程式的人 

## 不用 Claude Code  
你還是能用兩個

* **Higgsfield MCP**——在 claude.ai 的 Settings → Connectors 加自訂連接器，貼上 mcp.higgsfield.ai/mcp。之後在網頁版聊天裡就能直接叫 Claude 生圖生片。
* **Obsidian 的概念**——你不需要 Claude Code。在 Claude 的 Project 裡上傳你的筆記，效果類似：Claude 在那個 Project 裡永遠讀得到那些檔案。

其他三個（graphify／impeccable／ponytail）都是為寫程式的人設計的，硬裝沒有意義。

三個最後提醒 

## 裝之前  
先想清楚這三件事

一、外掛不是能力，是約束

這五個沒有一個給了 Claude 新能力，它們都是在限制 Claude——限制它讀什麼、寫多少、用什麼設計、記得什麼。好的工具不是讓 AI 做更多，是讓它做得更少但更準。

二、每一個外掛都是一張會過期的支票

ponytail 有效，是因為現在的模型會過度建構；impeccable 有效，是因為現在的模型有可辨識的視覺習慣。模型改了，這些外掛的價值就會縮水。裝的時候心裡有數。

三、skill 和 hook 都能執行程式碼

你在信任第三方外掛去塑形你的每一次生成、並且在每一回合執行程式碼。裝之前看一眼 repo——這五個都開源、有社群檢視，但這個習慣要養。

下一步

## 外掛你裝好了，接下來換我陪你把它接成系統

這五個讓 Claude 少讀、少寫、少猜、有記憶。但要把它們接成一整條「用 AI 省時間、用自媒體變現」的產線——那不該你一個人慢慢摸。

想用 AI 讓一個人做出一個團隊產出的人

會裝工具、卻不知道怎麼接成系統的你

收藏了一堆教學，卻從來沒真的用起來的人

進來你會拿到

AI ＋ 自媒體的完整變現工作流

我實際在跑、有結果才拿出來講的工具與流程，每週更新

一群跟你一樣、正在用 AI 翻身的人

[加入 奇點研究所 × D11 →](https://www.skool.com/d11-lab/about) 

你的時間值錢，工具的意義是把它還給你

傑森所長 @jasonxtsai

AI 工具怎麼用、自媒體怎麼變現、怎麼把兩件事接起來換回你的時間——都是我自己在跑的東西  
※ 本文所有安裝指令驗證於 2026 年 7 月，開源專案更新頻繁，若指令失效請以各專案 GitHub 為準
