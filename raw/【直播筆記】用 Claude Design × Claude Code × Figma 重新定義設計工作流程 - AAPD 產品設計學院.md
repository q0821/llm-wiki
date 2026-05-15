---
title: "【直播筆記】用 Claude Design × Claude Code × Figma 重新定義設計工作流程 - AAPD 產品設計學院"
source: "https://aapd.com.tw/all-articles/2026-livedemo-claudedesign-claudecode-figma"
author:
published: 2026-05-05
created: 2026-05-12
description: "用設計教育創造影響力，一起成為更好的產品設計師"
tags:
  - "clippings"
---
AI

Claude

Claude Design

Claude Code

Figma

UIUX

分享這則文章

![](https://framerusercontent.com/images/ORd3L9SL6ykCZecRUln2QNgfUo.svg?width=40&height=40) ![](https://framerusercontent.com/images/Scn81lWpK7BA4W3BKE4tgL7xQ.svg?width=40&height=40)

返回上一頁

## 【直播筆記】用 Claude Design × Claude Code × Figma 重新定義設計工作流程

##### 擁抱持續演化的新流程帶來具體的影響與改變！AAPD 辦了一場 Live Demo 直播，主題是聊聊我最近在嘗試的這套設計工作流，透過 Claude Design、Cloud Code、加上 Figma MCP 串接起來之後，設計師可以如果從零到一快速驗證一個概念。

![](https://framerusercontent.com/images/NpbSu7x1qO6NIjokTIRDComnk4Q.png?width=1080&height=1080)

Simon

2026年5月5日

![Live Demo  Claude Design × Claude Code × Figma ](https://framerusercontent.com/images/hk9at3zUa2nxTjrB8sqDK6A.png?width=3840&height=2160)

> 直播回放連結： [**Live Demo — 用 AI 快速實現你的設計想法 | Claude Design + Claude Code + Figma 工作流**](https://youtube.com/live/kWZycvnSBsw)

參與直播的觀眾不少，Q&A 大家也問得滿熱烈的，所以我想趁印象還新鮮，把整場分享整理成這份簡短筆記分享給大家

這套流程現在還在演化中，我自己也都還在實驗階段，所以這份筆記比較像是「目前我看到 AI 扮演的樣子」，絕對不是什麼終極答案。

## 設計交付的線性流程正在改變

過去設計師的執行端工作方式相對線性：畫好設計稿、寫規格文件、做 Prototype，接著交接給工程師開發，中間靠 Figma 作為交付介面，這個流程很多公司至今還是主流，本身也沒什麼問題。

**但這最近 AI 工具變化讓事情不太一樣了。**

我自己觀察到的新流程比較像是：設計師可以直接在 Claude 這類工具裡快速做出高保真 Prototype，甚至能簡單部署上線看看，當需要打磨細節、做協作標註的時候，再把成果導入 Figma，調整後接著可能又回到 Claude 上繼續開發迭代。

> 換句話說，Figma 跟 Claude 之間正在變成一種「雙向快速來回迭代」的關係，而不再是單向交付的角色。

但客觀而言，這個流程目前還在過渡階段，並不是說所有人都應該這樣做。

每個團隊的需求跟挑戰都不一樣，真正重要的不是工具誰取代誰，而是「重新思考流程哪裡可以調整」，在新工具出現後，我們需要更了解每個工具的特性與限制，找到適合自己團隊的混搭方式，而不是斷言說「設計師要寫 Code」或「工程師要做設計」。

## Claude Design 是什麼？我自己對它的定位

Claude Design 目前還在 Research Preview 階段，只能在瀏覽器版用，Claude 桌面 App 上還沒開放(以後會不會開放還不確定)。

介面分成 Prototype、Slide deck、Template、其他這四個 tab，而且它支援匯入既有的 Design System，可以從 GitHub repo、Figma 檔案、本地端程式碼、品牌資產等多種來源來建立。

Demo 中我用「綠色植物電商首頁」當案例丟進去，它沒有直接開工，而是先丟出一份結構化的小問卷來釐清需求：品牌名稱、品牌調性、主色綠色偏向哪一種、首頁要包含哪些區塊、商品要支援哪些互動、視覺創新程度等等。

老實說我覺得這個設計滿聰明的，一般人在想需求的時候其實不會想得這麼清楚，尤其在設計決策上，Claude Design 等於是把「寫 Prompt」這件事介面化了，把抽象的需求拆解成選擇題，讓非技術背景的人也能產出結構化的指令。

但它的限制也很明顯，我列幾個直播當下分享的觀察：

- 速度比預期慢，Token 消耗也滿快的(Pro 版可能用一兩趟就燒完)。
- 跑出來的東西很多是 hard-coded，沒有 component 化、沒有變數系統，難以擴展。
- 沒辦法直接輸出到 Figma，要先到 Claude Code 才能再透過 Figma MCP 串接。
- 沒辦法做到版本控制，如果方向有錯要回上一版不太方便。

所以我自己對它的定位是：比較適合 0 到 1 的前期探索，以及做快速 Demo 概念，一旦你想真的進入產品化階段，還是得轉到 Claude Code 上面繼續做會比較有效率。

## 把 Claude Design 成果交給 Claude Code 開發

在直播中，我從 Claude Design 產出第一版頁面後，點擊右上角的 share，選擇「Hand off to Claude Code」。系統會自動產生一段簡單的 prompt，內容大致是「請看一下這份設計檔案、讀取 README，把它重建出來」。

這個其實就是 Claude 生態系真正的價值所在，Claude Design 跟 Claude Code 之間有原生的銜接通道，你可以在 Claude Desktop App 直接貼上，也可以在任何 IDE(Cursor、VS Code、Google Antigravity 都可以)的 Terminal 裡呼叫 Claude Code。

這邊有一個我自己慢慢養成的習慣：接手專案後，第一件事不是急著改設計，而是請 Claude 先把基礎環境建好。我習慣用 React + Vite + Tailwind CSS 的組合，然後第一個指令就是請它幫我設定好專案環境、產生一份 [CLAUDE.md](https://medium.com/as-a-product-designer/CLAUDE.md) 檔案。

[CLAUDE.md](https://medium.com/as-a-product-designer/CLAUDE.md) 文件是 Claude Code 的核心概念之一，當每次 Claude 開始做事前，會先讀這份檔案，理解專案的技術選擇、架構、規範，再決定怎麼動工。

我在自己的 [CLAUDE.md](https://medium.com/as-a-product-designer/CLAUDE.md) 裡寫了相當多規則，例如「跟 Figma 同步時必須使用已定義的 design token」、「必須使用既有 component，沒有定義就先問我」。

直播當天我其實就是因為跳過了這一步，沒有先把環境設好就直接貼 prompt 過去，結果 Claude Design 翻譯出來的東西完全跑版，變成一個非常荒謬的成果，我只好打開另一個事先準備好的備案檔（還好有準備）。

## Design token、Component、CLAUDE.md：讓品質穩定的三件事

直播裡我反覆提到一個滿重要的觀念：

> 在 AI 時代，你有沒有一份完整的 Design System，直接決定了產出品質。

不過我示範了一個有點反向的流程：當頁面已經做出來，可以反過來請 Claude 幫忙生成 design system 頁面，把產品中用到的所有 design token、component 整理在一個獨立頁面中，並同步更新到 [CLAUDE.md](https://medium.com/as-a-product-designer/CLAUDE.md) 。

我甚至會丟給 Claude 一些成熟設計系統參考範例，例如 Adobe Spectrum 的 Button 規範頁，請它「參考這個結構」來幫我建立 Component 文件。

更進一步，Claude 也能直接生成 Design Token 用的 JSON 檔案 ，例如 primitive token、一份 semantic token，兩者之間做好 alias 對應，然後我可以透過 Figma 的 Variables Import plugin 一鍵匯入，在 Figma 端直接建立完整的變數系統。

這樣做的好處是，以後要做 component 層級的改動，我可以直接在 design system 上改，其他產品頁面也都會同步更新。雖然設計系統很重要，但我自己不覺得一定要是把 design system 完美定義好再開工。

**在 AI 時代，很多時候是邊走邊建立規則、邊走邊修** 。一開始會建立一些基本規則，但它可能只佔了五六成，其他的是在過程中一邊發現問題、一邊把規則補齊，當然，你的團隊文化如果允許先定義完整再開工，那也 OK，沒有標準答案。

## Figma MCP：讓 AI 真的能代替你操控 Figma

直播中其中比較有實驗性的部分是 Claude Code 透過 Figma MCP(Model Context Protocol)來雙向操作 Figma 的部分。

MCP 的概念我那天用「萬用插頭」來形容，它讓 AI 可以接上任何工具跟它溝通。透過 Figma MCP，Claude Code 可以在 Figma 裡新增 component、建立 variables、設定 layout，甚至直接畫出新頁面。

反過來，當你在 Figma 端調整了設計，也可以複製那個區塊的連結貼回 Claude Code，請它幫你同步到程式碼。

我示範了兩個方向：

1. **Code → Figma** ：我用了一段小腳本指令(`Figma capture` + `Figma delay`)，貼上某個區塊的 URL，系統就會自動把該區塊的 React 程式碼產出到 Figma 上，直接形成可編輯的設計檔案，這對於想要「把開發成果反向同步回設計檔」的場景滿好用的。
2. **Figma → Code** ：我在 Figma 上手動調整版位(把兩個區塊左右對調)，然後右鍵複製選取的 link，貼回 Cloud Code 說「我在 Figma 有調整設計，幫我更新到 Code 上」，整段對話完全用白話文，Claude 會自己讀取 Figma 的最新狀態並反映到程式碼。

不過目前 MCP 串接還有不少 bug，Figma 端的 Aauto layout 也還處理得不夠漂亮、顏色樣式可能都是 Hard-coded ，需要設計師事後手動檢查跟補強，整體流程算堪用但離完美、乾淨，還是有一段距離。

## 我自己跟 AI 對話時的幾個習慣

Demo 過程中我穿插分享了不少寫 prompt 的觀察，這邊也整理成幾個我自己會反覆用到的原則：

1. **描述不要太短或太模糊** ：要假設你在跟一個人類溝通，需求要給得清楚，但也不用過度結構化，現在的 AI 很聰明、善於推理，白話文反而更自然。
2. **精準描述目標物** ：如果你熟悉設計系統的命名例如 Button、Toast、Snackbar、Overlay、Fixed、Sticky、Slide-in、Fade-out，就用英文術語，AI 反而聽得最懂，中英夾雜不是壞事，而是工具溝通需要的精準度。
3. **複雜的事情先做計劃** ：我習慣請 Claude 先產出一份 Markdown 計畫文件，自己 review 沒問題後再開工，而不是直接動手。做計劃的成功機會更高。
4. **溝通萬用句** ：當自己也說不清楚需求時，就告訴 Claude：「你不清楚就先問我，問完再開始做，不要用猜的。」這句話我通常可以下不少來回修改的時間。
5. **講不清楚就拿參考範例** ：圖片、連結、任何視覺化的東西，對 AI 都比文字更有說服力。我在 demo 一開始就丟了四張 Dribbble 截圖當風格參考，而不是用文字描述「乾淨、極簡、綠色」。

這套對話心法的底層其實很簡單： **把 AI 當成一個有經驗但不認識你產品的合作夥伴** ，給夠 context、容忍它問問題、給出精準回饋，而不是期待它一次就讀懂你的腦袋到底想要什麼。

## 設計師的核心價值，從「雕刻畫面」轉向「判斷方向」

直播最後的 Q&A 有觀眾提問：「AI 現在這麼強，設計師的價值在哪裡？如果不想被 AI 取代，該怎麼辦？」這個問題我很難給一個標準答案，但有幾個我自己一直在想的角度想分享。

我覺得設計師真正的價值，從以前到現在都不在「產出畫面」本身，而是在判斷「這個畫面好不好、有沒有價值（商業或體驗上都是）、是不是真的解決到問題」。

使用工具只是過程，最終你還是要靠自己的判斷力告訴 AI 這個東西好或不好、該做不該做。

這個判斷力連結的不只是視覺品味，還包括例如設計本身在你的組織與產品中存在的意義是什麼？它能不能幫公司賺錢？能不能放大品牌價值？能不能節省工程成本、提高效率？

我覺得這些角度都是跟設計師非常有關係的，而不是「我會用 Figma 我就是厲害的設計師」這種綁定工具的自我定位。

直播尾段我有講一句話，寫筆記時又想了一遍，還是想把它放進來：

> **以前的時代就是透過一直在練習、一直在做產品、一直在設計來累積這些品味跟判斷力，而現在這樣的機會越來越少。**

某種程度上這句話想表達 AI 時代設計師職涯最弔詭的處境，工具讓產出變快了，但「品味」、「判斷力」這些相對抽象的能力，反而需要更多刻意練習才能養成。基本功不是過時的東西，而是區分「會用 AI 的人」與「真正會打造產品的人」的關鍵。

以上就是簡短的直播筆記分享，如果有興趣了解更多，歡迎 [觀看直播回放](https://www.youtube.com/live/kWZycvnSBsw?si=5h3FcZJvwS76A4pa) ！

AI

Claude

Claude Design

Claude Code

Figma

UIUX

分享這則文章

![](https://framerusercontent.com/images/ORd3L9SL6ykCZecRUln2QNgfUo.svg?width=40&height=40) ![](https://framerusercontent.com/images/Scn81lWpK7BA4W3BKE4tgL7xQ.svg?width=40&height=40) ![](https://framerusercontent.com/images/NpbSu7x1qO6NIjokTIRDComnk4Q.png?width=1080&height=1080)

關於作者

##### Simon

Product Designer with a curious mind. I'm from a beautiful tropical island － Taiwan, lived in Tokyo for 5 years, currently live in Sydney, Australia.

Product Designer with a curious mind — 更多關於我： [https://linktr.ee/simonlin](https://linktr.ee/simonlin)