<!-- source-url: https://ihower.tw/blog/13721-harness-engineering -->
<!-- title: 給 Agent 開發者的 Harness Engineering 駕馭工程系列 🚀 愛好 AI Engineer 電子報  #39 &#8211; ihower { blogging } -->
<!-- fetched: 2026-06-29 -->

[ 跳至主要內容 ](#content) 

[ihower { blogging }](https://ihower.tw/blog/)

 😆 👨🏻‍💻 ✨ 🚀 💰 

* [部落格首頁](https://ihower.tw/blog/)
* [關於我](https://ihower.tw/blog/about)
* [文章分類](https://ihower.tw/blog/posts)
* 技術寫作 ↗️  
   * 技術寫作 ↗️ [AI Engineer 電子報](https://ihower.tw/blog/category/aie)  
   * [愛好 AI 工程 Blog ↗️](https://blog.aihao.tw)  
   * [AI Engineer 知識庫筆記 ↗️](https://ihower.tw/notes/generative-ai-engineer)  
   * [Rails 實戰聖經 ↗️](https://ihower.tw/rails/)  
   * [Git 版本控制 ↗️](https://ihower.tw/git/)  
   * [App 開發基礎 ↗️](https://ihower.tw/cs/)

* * 返回

# 給 Agent 開發者的 Harness Engineering 駕馭工程系列 🚀 愛好 AI Engineer 電子報 #39

作者:[ihower](https://ihower.tw/blog/author/hower) [26 6 月, 202628 6 月, 2026](https://ihower.tw/blog/13721-harness-engineering) [在〈給 Agent 開發者的 Harness Engineering 駕馭工程系列 🚀 愛好 AI Engineer 電子報 #39〉發佈留言](https://ihower.tw/blog/13721-harness-engineering#respond) 

> [歡迎訂閱 📬](https://ihower.tw/opt-in/gai) 愛好 AI Engineer 電子報 [過往期數點這](https://ihower.tw/blog/category/aie) 📚

![](https://listmonk.aihao.tw/uploads/harness-9.png)

這是 2026/6/26 在 [生成式 AI 開發者年會](https://gaiconf.com/agenda) 分享的演講投影片(html)，這個題目可說是 2026 年上半年最熱門的 AI 工程主題，這次趁著準備演講，好好梳理了一次。

### ➡️ [給 Agent 開發者的 Harness + Loop Engineering 投影片](https://ihower.tw/presentation/harness.html)

網路上多數 Harness Engineering 的文章，是站在 coding agent 使用者的角度，回答「harness 由哪些元件組成」。我這次的切入點不一樣：定位在自行開發 AI Agent 的工程師，而 coding agent 只是目前最成熟的 Agent 產品範例。我更想回答的問題是如何設計 Agent 的回饋，從工具執行內、request 之間、單輪結束、到外層 loop，由內而外四個時機點，這是我自己整理出來的論述框架，希望對大家開發 AI Agent 產品有幫助。

### 演講介紹

當前的 AI Agent 已經能拆解任務、擁有技能、操作檔案、執行程式，卻仍常常自信地宣稱「完成了」，產出實際上卻仍不完整。它有能力把事情做出來，但「做得對不對、做完了沒」是接下來的挑戰。

這場演講將講解如何為它搭好 harness 框架，特別是如何在 Agent 運作的不同時機點，搭建檢查與修正的回饋(feedback loop)，讓 Agent 不再「自我感覺良好」就交差，而是對著明確的目標持續迭代、驗證到通過為止。演講內容將會搭配案例與不同主流工具的作法對比，聚焦在我們開發 Agent 產品時，也能夠參考實作的工程設計。

### 給 Agent 開發者的駕馭工程 系列文章

這場演講搭配有 9 篇的 blog 系列《給 Agent 開發者的駕馭工程》在 👉 [blog.aihao.tw](https://blog.aihao.tw/)

1. [基礎: Deep Agent 的六項內建能力](https://blog.aihao.tw/2026/06/26/harness-engineering-1-deep-agent-capabilities/)
2. [核心: Agent 要的是回饋迴路,不是完美提示](https://blog.aihao.tw/2026/06/26/harness-engineering-2-what-is-harness-engineering/)
3. [回饋時機一: 工具回傳值, 是寫給 agent 的回饋](https://blog.aihao.tw/2026/06/26/harness-engineering-3-tool-execution-feedback/)
4. [回饋時機二: 兩次 model request 之間,把訊息注入執行中的 agent](https://blog.aihao.tw/2026/06/26/harness-engineering-4-mid-run-injection/)
5. [回饋時機三: 單輪結束的驗收, Goal 與 Outcomes](https://blog.aihao.tw/2026/06/26/harness-engineering-5-goal-and-outcomes/)
6. [回饋時機四: 外層 Loop, Ralph、Symphony 與 Cron](https://blog.aihao.tw/2026/06/26/harness-engineering-6-outer-loop/)
7. [進階: 自我改進 Harness, Meta-Harness 與爬坡](https://blog.aihao.tw/2026/06/26/harness-engineering-7-self-improving/)
8. [收尾: 會過期的 Harness, Model-Harness-Fit 與 Bitter Lesson](https://blog.aihao.tw/2026/06/26/harness-engineering-8-model-harness-fit/)
9. [自建 Agent 的框架選型: 全套 Deep Agent 還是從基礎構建?](https://blog.aihao.tw/2026/06/26/harness-engineering-9-agent-frameworks/)

### 分享此文：

* [共享](#)

* [ 分享到 Facebook(在新視窗中開啟) Facebook ](https://ihower.tw/blog/13721-harness-engineering?share=facebook)
* [ 以電子郵件將連結傳送給朋友(在新視窗中開啟) 電子郵件 ](https://ihower.tw/cdn-cgi/l/email-protection#9ca3efe9fef6f9ffe8a1b9a9deb9d9a9b9a4a4b9a4aab9d9a8b9deddb9dddeb9d9a5b9a4acb9a5a5b9d9aab9a5aab9a4abb9d9abb9dddeb9ddacb9a9d8b9aeacb9d9abb9dea9b9ddaab9aeacddfbf9f2e8b9aeacb9d9a5b9a5aab9a4deb9d9abb9a5a5b9dedfb9d9a4b9a4acb9a4a9b9d9abb9a5ddb9a4a8b9aeacd4fdeef2f9efefb9aeacd9f2fbf5f2f9f9eef5f2fbb9aeacb9d9a5b9ddabb9a5a9b9d9a5b9ddaab9ddd8b9d9a9b9deabb9dda9b9d9abb9dda4b9a4deb9d9abb9deafb9dedeb9d9a9b9a4a4b9a5abb9aeacb9daacb9a5dab9a5ddb9a4acb9aeacb9d9aab9a4a8b9a5deb9d9a9b9dda9b9ded8b9aeacddd5b9aeacd9f2fbf5f2f9f9eeb9aeacb9d9a5b9a5deb9dedeb9d9a9b9ddd8b9a5acb9d9a9b9ddacb9deadb9dfaeb9ddacb9dfaeb9ddacb9aeafafa5babfacafa4a7fef3f8e5a1f4e8e8ecefb9afddb9aedab9aedaf5f4f3ebf9eeb2e8ebb9aedafef0f3fbb9aedaadafabaeadb1f4fdeef2f9efefb1f9f2fbf5f2f9f9eef5f2fbbabfacafa4a7eff4fdeef9a1f9f1fdf5f0)
* [ 分享到 X(在新視窗中開啟) X ](https://ihower.tw/blog/13721-harness-engineering?share=twitter)
* [ 在 Tumblr 上分享(在新視窗中開啟) Tumblr ](https://ihower.tw/blog/13721-harness-engineering?share=tumblr)
* [ 分享到 LinkedIn(在新視窗中開啟) LinkedIn ](https://ihower.tw/blog/13721-harness-engineering?share=linkedin)
* [ 列印(在新視窗中開啟) 列印 ](https://ihower.tw/blog/13721-harness-engineering#print?share=print)
* [ 分享到 Reddit(在新視窗中開啟) Reddit ](https://ihower.tw/blog/13721-harness-engineering?share=reddit)

### 請按讚：

喜歡 正在載入...

作者:[ihower](https://ihower.tw/blog/author/hower)[26 6 月, 202628 6 月, 2026](https://ihower.tw/blog/13721-harness-engineering)分類:[AIE](https://ihower.tw/blog/category/aie)、[LLM](https://ihower.tw/blog/category/llm) 

## 文章導覽

[上一篇文章 下一篇文章:  愛好 AI Engineer 電子報 🚀 Claude Fable 來了 + Tokenmaxxing 失靈中 #38](https://ihower.tw/blog/13693-aie-fable-tokenmaxxing)

##  發佈留言 

### 發表迴響[取消回覆](https://ihower.tw/blog/13721-harness-engineering#respond)

## 近期留言

* 「[如何設計能跳過 LLM 的多代理系統 - 超人行銷](https://www.isuperman.tw/%e5%a6%82%e4%bd%95%e8%a8%ad%e8%a8%88%e8%83%bd%e8%b7%b3%e9%81%8e-llm-%e7%9a%84%e5%a4%9a%e4%bb%a3%e7%90%86%e7%b3%bb%e7%b5%b1/)」於〈[AI Agent 架構比較: Multi-Agent 或 Single-Agent](https://ihower.tw/blog/12776-multi-agent-or-single-agent/comment-page-1#comment-77941)〉發佈留言
* 「[daouchovny](http://davidhkchen.wordpress.com)」於〈[愛好 AI Engineer 電子報 🚀 AI 工具大換血: Claude Code + Codex 新組合 #36](https://ihower.tw/blog/13658-aie-openai-codex/comment-page-1#comment-77937)〉發佈留言
* 「Tom」於〈[Framework Desktop (AMD Ryzen AI Max+395) 開箱](https://ihower.tw/blog/13294-framework-desktop/comment-page-1#comment-77933)〉發佈留言
* 「synEvo」於〈[使用繁體中文評測各家 Embedding 模型的檢索能力](https://ihower.tw/blog/12167-embedding-models/comment-page-1#comment-77932)〉發佈留言
* 「Zoe」於〈[Spec-Driven Development(SDD) 的美好願景與殘酷現實](https://ihower.tw/blog/13480-sdd-spec-driven-development/comment-page-1#comment-77926)〉發佈留言
* 「[ihower](https://ihower.tw)」於〈[淺談模型上下文協定 MCP 應用開發](https://ihower.tw/blog/12717-mcp/comment-page-1#comment-77919)〉發佈留言
* 「[劉健](http://liuchien.ink.tw)」於〈[淺談模型上下文協定 MCP 應用開發](https://ihower.tw/blog/12717-mcp/comment-page-1#comment-77918)〉發佈留言
* 「[chicken867Andrew Wu](https://gravatar.com/chicken867)」於〈[Framework Desktop (AMD Ryzen AI Max+395) 開箱](https://ihower.tw/blog/13294-framework-desktop/comment-page-1#comment-77917)〉發佈留言
* 「Min-Zheng Shieh」於〈[Framework Desktop (AMD Ryzen AI Max+395) 開箱](https://ihower.tw/blog/13294-framework-desktop/comment-page-1#comment-77916)〉發佈留言
* 「Wayne」於〈[Framework Desktop (AMD Ryzen AI Max+395) 開箱](https://ihower.tw/blog/13294-framework-desktop/comment-page-1#comment-77915)〉發佈留言

## 近期文章

* [給 Agent 開發者的 Harness Engineering 駕馭工程系列 🚀 愛好 AI Engineer 電子報 #39](https://ihower.tw/blog/13721-harness-engineering)
* [愛好 AI Engineer 電子報 🚀 Claude Fable 來了 + Tokenmaxxing 失靈中 #38](https://ihower.tw/blog/13693-aie-fable-tokenmaxxing)
* [愛好 AI Engineer 電子報 🚀 大神 AK 加入 Anthropic #37](https://ihower.tw/blog/13685-aie-ak)
* [愛好 AI Engineer 電子報 🚀 AI 工具大換血: Claude Code + Codex 新組合 #36](https://ihower.tw/blog/13658-aie-openai-codex)
* [愛好 AI Engineer 電子報 🚀 新型態代理人 OpenClaw 正夯，電子報改版 #35](https://ihower.tw/blog/13630-aie-openclaw)
* [愛好 AI Engineer 電子報 🚀 2025 AI 年度回顧 #34](https://ihower.tw/blog/13612-aie-2025-year-in-review)
* [Agentic Search: 搜尋技術不會消失，只是變成 Agent 工具](https://ihower.tw/blog/13595-agentic-search)
* [愛好 AI Engineer 電子報 🚀 2025 Q4 AI 模型與 Agent 開發 #33](https://ihower.tw/blog/13553-aie-2025-models-and-agents)
* [AI Agent 產品開發仍然不簡單](https://ihower.tw/blog/13513-agent-design-is-still-hard-2025)
* [實戰 AI Agents 應用開發: TTFT 和 Prompt Caching](https://ihower.tw/blog/13501-practical-ai-agents)

搜尋

搜尋

## 彙整

彙整 選取月份  2026 年 6 月 (2)  2026 年 5 月 (2)  2026 年 2 月 (1)  2026 年 1 月 (1)  2025 年 12 月 (5)  2025 年 9 月 (4)  2025 年 8 月 (3)  2025 年 7 月 (6)  2025 年 6 月 (3)  2025 年 5 月 (1)  2025 年 4 月 (3)  2025 年 3 月 (1)  2025 年 2 月 (1)  2025 年 1 月 (2)  2024 年 12 月 (2)  2024 年 11 月 (1)  2024 年 10 月 (2)  2024 年 9 月 (3)  2024 年 8 月 (2)  2024 年 7 月 (4)  2024 年 6 月 (2)  2024 年 4 月 (5)  2024 年 3 月 (1)  2024 年 2 月 (1)  2024 年 1 月 (2)  2023 年 12 月 (4)  2023 年 11 月 (1)  2023 年 10 月 (3)  2023 年 8 月 (1)  2023 年 7 月 (1)  2023 年 6 月 (1)  2023 年 5 月 (2)  2023 年 3 月 (2)  2023 年 1 月 (6)  2022 年 11 月 (2)  2022 年 9 月 (2)  2022 年 8 月 (2)  2022 年 7 月 (2)  2022 年 4 月 (1)  2022 年 2 月 (3)  2022 年 1 月 (1)  2021 年 10 月 (1)  2021 年 9 月 (2)  2021 年 7 月 (1)  2021 年 6 月 (2)  2021 年 4 月 (1)  2021 年 3 月 (1)  2021 年 1 月 (1)  2020 年 10 月 (2)  2020 年 7 月 (2)  2020 年 4 月 (1)  2020 年 1 月 (1)  2019 年 10 月 (1)  2019 年 6 月 (2)  2019 年 3 月 (1)  2019 年 1 月 (1)  2018 年 10 月 (1)  2018 年 9 月 (1)  2018 年 7 月 (1)  2018 年 4 月 (1)  2018 年 1 月 (1)  2017 年 12 月 (1)  2017 年 11 月 (1)  2017 年 10 月 (2)  2017 年 9 月 (1)  2017 年 6 月 (2)  2017 年 5 月 (1)  2017 年 4 月 (1)  2017 年 2 月 (1)  2016 年 10 月 (1)  2016 年 9 月 (6)  2016 年 8 月 (1)  2016 年 7 月 (3)  2016 年 2 月 (1)  2015 年 12 月 (2)  2015 年 8 月 (1)  2015 年 7 月 (1)  2015 年 4 月 (1)  2015 年 3 月 (1)  2015 年 2 月 (1)  2015 年 1 月 (2)  2014 年 12 月 (1)  2014 年 10 月 (3)  2014 年 9 月 (2)  2014 年 8 月 (1)  2014 年 7 月 (3)  2014 年 6 月 (1)  2014 年 3 月 (1)  2013 年 8 月 (4)  2013 年 6 月 (1)  2013 年 4 月 (1)  2013 年 2 月 (1)  2013 年 1 月 (2)  2012 年 12 月 (3)  2012 年 9 月 (5)  2012 年 7 月 (4)  2012 年 5 月 (2)  2012 年 4 月 (2)  2012 年 3 月 (1)  2012 年 2 月 (2)  2011 年 11 月 (1)  2011 年 9 月 (1)  2011 年 7 月 (3)  2011 年 6 月 (2)  2011 年 5 月 (5)  2011 年 4 月 (1)  2011 年 3 月 (3)  2011 年 2 月 (4)  2010 年 12 月 (3)  2010 年 11 月 (2)  2010 年 10 月 (3)  2010 年 9 月 (1)  2010 年 8 月 (4)  2010 年 7 月 (1)  2010 年 6 月 (2)  2010 年 5 月 (7)  2010 年 4 月 (2)  2010 年 3 月 (7)  2010 年 2 月 (7)  2010 年 1 月 (4)  2009 年 12 月 (9)  2009 年 11 月 (5)  2009 年 10 月 (4)  2009 年 9 月 (3)  2009 年 8 月 (3)  2009 年 6 月 (2)  2009 年 5 月 (2)  2009 年 4 月 (5)  2009 年 3 月 (2)  2009 年 2 月 (4)  2009 年 1 月 (6)  2008 年 12 月 (4)  2008 年 11 月 (1)  2008 年 10 月 (5)  2008 年 9 月 (3)  2008 年 8 月 (3)  2008 年 7 月 (2)  2008 年 6 月 (3)  2008 年 5 月 (5)  2008 年 4 月 (3)  2008 年 3 月 (4)  2008 年 2 月 (8)  2008 年 1 月 (2)  2007 年 12 月 (2)  2007 年 11 月 (1)  2007 年 10 月 (1)  2007 年 8 月 (1)  2007 年 7 月 (6)  2007 年 6 月 (1)  2007 年 5 月 (2)  2007 年 4 月 (8)  2007 年 3 月 (9)  2007 年 2 月 (5)  2007 年 1 月 (8)  2006 年 12 月 (14)  2006 年 11 月 (17)  2006 年 10 月 (15)  2006 年 9 月 (8)  2006 年 8 月 (6)  2006 年 7 月 (9)  2006 年 6 月 (3)  2006 年 5 月 (13)  2006 年 4 月 (17)  2006 年 3 月 (18)  2006 年 2 月 (16)  2006 年 1 月 (10)  2005 年 12 月 (7)  2005 年 11 月 (2)  2005 年 10 月 (1)  2003 年 11 月 (1) 

[![](https://ihower.tw/images/feed_32.png) RSS Feed](https://feeds.feedburner.com/ihower) 

[ihower { blogging }](https://ihower.tw/blog/),[ 本站採用 WordPress 建置 ](https://tw.wordpress.org/) 

%d
