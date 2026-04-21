---
title: "只要 5 分鐘！Claude Code 無縫整合 NotebookLM 實戰"
source: "https://www.youtube.com/watch?v=22bjps4LMmU"
author:
  - "[[HC AI說人話]]"
published: 2026-04-17
created: 2026-04-20
description: "☕ 支持我的創作 (Buy me a Coffee): https://donate.stripe.com/bIYfZ51uT8yGd7qdQSHC Yt Search skills~- https://ultrclick.gumroad.com/l/YoutubeSearchSkills資源:Notebookl..."
tags:
  - "clippings"
---
![](https://www.youtube.com/watch?v=22bjps4LMmU)

## Transcript

### 為什麼要結合 Claude Code 與 NotebookLM？

**0:00** · 大家好我是HC 歡迎回到HC AI素人化 Claude Code應該是目前 最多人使用的AI Agent之一 拿來做研究 拿來做產品 大多數人用Claude Code做研究的時候 就是讓他上網去做搜尋 然後去web scraping 等等的 然後祈禱他會有一個好結果 同時Claude Code在處理影片的功能 目前還是比較缺乏的 但是如果我跟你講 只需要5分鐘的設定 我們就可以讓Claude Code 擁有一個自動化的工作流 擷取YouTube上面任何的影片

**0:33** · 用影片的內容擷取下來提取字幕 推送到一個免費而且 非常強大的RAG系統 去做深度的分析 甚至最後呢幫我們甚至投影片圖表 而且這一些呢還不消耗你Claude Code訂閱的token 聽起來是不是太美好了呢 這就是我們今天的主角 notebooklm 我們今天呢要把 notebooklm 接入Claude Code裡面 讓他成為Claude Code一個 不可或缺的研究工具

**1:04** · 讓他幫我們把 Claude Code的效益 增強十倍百倍 好這邊直接秀他如何去運作 我們要使用YouTube Search這個Skills 去找尋YouTube上面跟 Claude Code Skills 有關的這些熱門影片 那這個Skills怎麼來的 要怎麼獲取那notebook LM怎麼安裝呢 我等一下全部都會一起示範 那取得這些影片的連結之後呢 我們不是讓Claude去分析 我們用notebooklm 我們讓Claude把這些資料傳到

### 成果展示：自動化爬取影片並生成心智圖/圖表

**1:35** · notebooklm裡面 讓notebooklm呢去分析 進行分析把提取有價值的這個 這個Claude code skills 那這些呢他都會用 Gemini的模型去做使用 那這些呢就不會消耗我們Claude code的token 這個很重要 因為現在Claude code的 你知道 rate limit很快嘛 那我們把這些呢 然後我們要把這個 outsource到這個 notebooklm去 而且notebooklm又是 非常厲害的一個RAG系統 所以呢 這個完全就是 相輔相成的一個使用方式

**2:05** · 那最後我們讓notebook LM用手繪藍圖的方式 讓手 最後呢我們讓notebook LM用手繪藍圖的方式呢 呈現一個資訊圖表給 我們展現他的分析成果 好 那這個就 這個就讓 這個就讓Claude code呢 又有了這樣一個圖繪製

**2:25** · 這個又讓Claude code擁有 了圖表製作的功能 所以這個非常好用非常的強大 那我們來看一下他的成果 好這邊他用這個 youtube搜尋呢 找到了20個熱門影片 然後他精選了5個出來 然後並且呢送到了notebook LM去做深度分析 那我覺得他可以再送更多 這個我們可以再做調整 分析完之後呢 他給了一個摘要 這樣 然後他甚至幫我們做了這樣一個圖表

**2:55** · 那我們到 notebooklm裡面呢 去看一下他做哪些 這邊我們到 notebooklm裡面 我們看到5個source在這邊 他放進來的 他問了 notebooklm相關的問題 然後製作圖表 那我們會想說 這個示範就這麼短嗎 真的就這麼短 那 但是呢這樣一個看似簡單的功能

**3:15** · 幫Claude code開啟了非常多扇門 我們不只幫Claude code 建立了一個RAG的系統 他可以利用RAG系統 他還可以產生報告 資訊圖表 甚至是podcast 還有影片摘要 語音摘要 那重點是 這些摘要 或是內容的產出 都是依據我們給他的這些 source的來源 這個極大的解決AI的幻覺問題

### 痛點解決：告別 AI 幻覺與高昂的 Token 消耗

**3:44** · 好 審訊我們去youtube 自己去找尋影片 然後並把影片連結呢 加入到notebooklm裡面 那其實更大的優勢就是 這樣的一個研究流程呢 是可以融入到你其他Claude code使用的情境底下的 有了notebook LM不只是節省token 它可以更加完善化 我們其他的工作流程 那我們當然要讚嘆notebook LM這樣一個平台 要自己去開發RAG系統

**4:14** · 然後再加上webscraping 網路搜尋爬蟲等等的這些功能 那再結合圖表製作 影片製作 語音摘要 那這些多功能 真的是一個非常困難的事情 就是很麻煩 真的非常麻煩 但是呢 我們把notebooklm結合 到Claude code Claude code就有了這些功能 你不覺得真的是不可思議嗎

**4:40** · 要怎麼做到呢 我現在就來示範 好那Claude code怎麼和 notebooklm做結合 比我們厲害的人已經幫 我們解決了這個問題 這位林先生呢 林探 他已經幫我們做了這個 notebooklm PY Py的這樣一個CLI的工具

**5:00** · 讓我們可以做使用 跟Claude code去做結合 那它是一個CLI tool 所以如果我們是用網頁版 的其他agent的話 會稍微比較麻煩一點 那目前示範的是 如果在你的電腦的本地端 去跟你的AI agent做一個結合 好林先生的remie 基本上寫的非常清楚 那我們滑到下面來這裡有個

**5:24** · installation 把這個命令呢貼到我們的 terminal裡面 基本上他就會幫我們安裝了 OK 但是呢 但是最重要的是 我們要記得安裝這個skills agent setup 我們要安裝他的notebook LM skills 我們的agent呢 才知道怎麼樣去用這個 CLI的tools 那我自己的習慣是 人當然是越來越懶嘛 那我當然就是直接貼進來 把這個連結呢貼給 Claude code 然後叫他幫我安裝這個工具

**5:55** · 並且把這個skills 安裝在local裡面 或是呢 我就直接說我要安裝這個 skills就可以了 那notebooklm看出我們 要讓他所有的 project都可以使用 還是說我們只需要特定的 project可以使用 那這個就取決於我們個人的選擇 這算指令貼上去 讓Claude code去執行 幫你安裝這個tool 跟這個skills 但是呢如果Claude code 沒有回傳一個指令的話 你需要自己手動去做 就是這個notebook

### 實戰教學一：安裝 notebooklm-py CLI 工具

**6:25** · 就是下面這個notebook LM login 這個是 就是登入到我們的 notebooklm裡面 如果Claude code 沒有背景去執行這個動作 如果他有的話 他應該會展現一個視窗給你看 然後你就login 如果沒有的話我們就自己手動的去

**6:46** · notebook LM login 好 自己手動的去notebook LM login 他就會像這樣 有一個視窗出來 然後你就登入你的帳號 在notebook LM這段我們就安裝完成了 安裝完成呢 你要重新啟動你的 Claude code 然後打這個 notebooklm的指令 slashnotebooklm 那你應該就會看到這個指令 那我們就可以用這個指令呢 讓Claude code去使用任何

**7:16** · notebooklm的功能 或是更多功能 我覺得真的是蠻厲害的 就是林先生他還有增加 其他的一個串聯型的 像workflow型的功能 真的是蠻厲害的 另外一方面 YouTube的 search怎麼做 YouTube的search 我們會使用另外一個工具 叫做YTDLP 好這個工具 這個是非常完整的工具 它可以使用 YouTube非常多相關的功能 YTDLP呢它有非常多的功能

**7:41** · 這一整串都是它的功能 基本上你能想到的功能都有 就是你要分析影片 上傳 下載 基本上都可以 它是一個非常多功能的 也是一樣 是CLI的工具 所以也是要裝在電腦裡面 YT的skills我們要自己創建 因為我們剛剛有看到 這個YT的skills有 這個YT的CLI tool有非常多的工具 所以如果我們把它全部融到一個 Skills裡面 它會非常的龐大 那我們希望

**8:11** · 我們希望每個Agent它的效率 就是 我們希望每個Agent它利用 Token的效率高一點 那我們就把 特定 我們就製作特定的Skills給 特定的Agent 這邊我們就創立一個 Project Local的Skills 叫做YT Search 用於搜尋YouTube 並返還結構化的結果 然後我們這邊要特別標記 我們要用YT DLP這個工具去查詢 檢索影片 然後默認返還20個影片

**8:38** · 那我們可以讓它 這個可以再做調整 可以更多可以更少 然後我們要標題 頻道名稱 訂閱數量 觀看次數 時常上傳日期跟這個連結 預設情況下 我們要6個月內的影片 然後支援使用這個就是擴增 我們可以指定說我們要多久的影片

### 實戰教學二：介紹並設定 yt-dlp 搜尋外掛

**8:59** · 多久內的影片 然後我們要讓它再做 一個觀看次的計算 跟訂閱者數量 這邊我們就算是分析 就是萬一它是 我們希望是那種爆款的影片 就是 它的內容可能會更值得我們去看

**9:16** · 像是訂閱者數量不多 但是它影片非常多人看 那這個影片就值得我們去注意 這是它這個比率的運用法 那它會寫一個Python的程式 然後每次在搜索的時候 它就會去執行一次 然後換算成這樣的一個比率 然後作為這個用戶參與度的指標

**9:36** · 那這個對我們這個 agent它才有意義 好 那在做這個skills的時候 我們可以直接輸入這個 指令去製作skills 我們或是我們前面用 我們前面用這個skills creator 這個是anthropic 就是Claudecore 內建的這個skills 創建的skills 創建skills的skills 如果我們貼上後面這段指令以後

**10:02** · 它沒有自動的使用這個skills 那我們就讓它去用這個skills 這個skills會自己去 優化新建的skills 達到我們要的效果 因為如果你的 skills創建的這個指令呢 越清楚 就是你的目的越清楚 它越知道說 它要用什麼方式去衡量

**10:23** · 說這個skills 有沒有成功 或是就是建的好不好 好那我們就直接建立 這樣的一個skills 我會把這段指令的分享在下面 也會把這個skills分享出來 好那我非常推薦大家自己去玩一下 就是創建這個skills 那以後可能是 agent創建skills 那我們還是要知道說它到底在幹什麼 好那這裡呢 它就會說我要創建這個

### 實戰教學三：創建並優化 yt-search Skills

**10:46** · yt search 然後它說它檢查一下 yt dlp有沒有安裝 是否有可以使用 如果沒有的話 它會跟你講說 我們需要安裝這個 那你就說好 那它就會幫你安裝這個yt dlp 這樣的一個CLI tool 好這邊 這邊它基本上就是在 檢索yt dlp的功能

**11:06** · 這邊它基礎創建的skills 然後去做一個測試 它先測試嘛 然後測試完以後呢 它有數據 然後再去優化這個skills 所以有 這個是anthropic內建的 這個skills creator 如果你是用opus 4.6的話 它應該會自動就使用 這個skills 去幫你創建skills 那我們就等它創建完以後呢 我們測試一下可以使用的話 基本上我們就完成了 我們就可以讓 我們就可以用這個skills 去搜尋yt的影片 然後呢傳到 notebook.com裡面去 好

**11:39** · 那這裡它技能 它這個skills呢創建完成了 這裡可以看到說 它先做了一個skills 然後做了這個skills 要使用的一些小工具 小腳本 那這些腳本有相關的問題 就是沒有達到目的嘛 然後它去做了一些修正 然後修正完以後呢 再去修正這個skills 最後呢它就會說 這個skills建構完成

**12:04** · 然後 ydsearch技能已經創建了 那我們就可以用這個search 然後給它一個題目 然後它就會去search 那我們來測試看看 然後它這裡還有把month 就是寫在這邊 那我們就來測試看看 那基本上如果我們剛完成的時候呢

**12:22** · 它是你是收不到這個skills的 我們要重新 重新把Claude再開起來一次 然後呢 我們用yt 好那這邊 這邊碰到一個小插曲 就是它在創建這個skills 它沒有把它放到這個

**12:41** · Claude skills這裡面 基本上如果我們是在 project裡面的話 我們會有 好那我們要讓它可以搜尋到的話 我們基本上要把它放在 這個.Claude裡面 這裡面的skills 然後你創建的skills在這裡面 才能被搜尋到 如果沒有搜尋到的話 就代表說不在這裡面 那你要跟Claude講說 為什麼不在那裡面 好修正好以後 我們重新開一次Claude 就可以看到這個ytsearch了

**13:11** · 那我們就說 好那我們就讓它 然後也再重新搜尋一次 Claude code 的news 好那這樣我們就可以 使用這個skills 去搜尋youtube相關的影片 好那這樣你可以看到 它把這個Claude code newskill這樣的一個搜尋單 搜尋任務呢 搜尋到了20個我們相關的影片

**13:34** · 好那我就給它一個簡單的指令 叫它把所有的搜尋結果放到 notebooklm 讓 notebooklm去做深度的分析 提取有用的skills做成圖表 就跟我們最開始的 示範是做一樣的事情 好這邊呢 我們就看到它有找到 notebooklm 這個skills 基本上它有 你有 notebooklm這個關鍵字的話 它就會去使用notebooklm

**13:59** · 然後它剛剛有看到說 我們notebooklm裡面已經 有一個Claude code skills research了 那它把這個20個新的影片呢 把它放到這個source裡面 如果我們需要開一個新的 notebook 這時候我們可能就要 特別提醒它做這件事情

**14:14** · 好那我們打開notebooklm 就可以看到它把相關的 這個source呢 放到這裡了 這個好像有點重複 那我們叫它去做修正就可以了 ok notebook LM的深度分析完成了 那它生成了圖表文件 它把圖表跟文件呢 都一起做出來了 有點太多了 可能我的 那當然這個 因為這個指令呢不夠完整 所以它幻想要做的事情呢

### 終極測試：從搜尋到 NotebookLM 深度分析全流程

**14:39** · 就變得更多了 它把mind map data table infobl graphic 這個study guide跟quiz 全部都做出來了 好 那這個是它新產生的圖表 那它這裡呢還把這個 好這裡呢還把這個csv 就是表格呢也做出來了 好那這個 這個我們就可以做一個hook 或是讓下一個agent 去把這些 skills呢一個一個翻出來 然後看我們可以怎麼樣去運用

**15:08** · 好這個就蠻多可以想像的空間 但一個notebooklm 就幫Claude code打開了非常多的可能性 所以這個呢大家一定要去嘗試看看 今天分享的是notebooklm 和 Claudecode最基礎的連動方式 那我上一支影片呢 有結合obsidian LLM wiki 分享如何用hotcode notebooklm 結合一個資料整理的方式 LLM wiki 建構本地端的第二大腦

### 結語：結合本地端知識庫的更多可能性

**15:39** · 這樣的運用方式就可以讓你很自由的 去建構你的agent 讓agent呢 本地端可以第一時間擁有資料庫 那如果它的資料庫不足的話 用notebooklm去做搜尋 那用notebooklm的工具呢 去提供我們人類容易 理解的圖像資訊的成果

**15:58** · 或是影音等等的成果 如果你想深入瞭解的話 你可以去看我上一支影片 深入講解LLM wiki 怎麼去建構 如果今天的分享對你有所幫助的話 請幫我留言666 那接下來呢 會持續的更新ai agent相關的內容 為了不錯過這精彩的內容 請按讚並訂閱我的頻道喔 我是HC 我們一起上ai說人話 我們下支影片再見囉 拜拜