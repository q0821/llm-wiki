---
title: "(5) Will AI Kill SaaS系列：... - Yu-Chih Edward Hwang"
source: "https://www.facebook.com/fatality1117/posts/pfbid0ZSgVjwAvZbKBXAQ1GVTW5dUrov5X5UybqiUXec1eRdjSiuCbVMJBLG4tMMAucM6pl"
author:
published:
created: 2026-04-24
description:
tags:
  - "clippings"
---
Will AI Kill SaaS系列：

來談談軟體開發的設計，Adobe/Figma之死？

Design to Code vs. Code to Design

前幾天Claude推出 Claude Design，有人說會殺死Figma。

Figma 上市120元，現在剩不到20元，短短不到一年。Adobe去年還有400，現在250有找。

其實他們也是不斷積極的推出各種 AI 工具與整合,所以也不是他們不擁抱 AI而死，那到底是甚麼原因？

我們來概括性的談談以繪製設計圖為主的SaaS現今所遇到的問題，這大概要從這一年來的軟體開發沿革講起：

一、 路徑的沿革與差距：從接力賽到中央輻射

​1. 傳統路徑 (The Relay Race)

​模式： 瀑布式或敏捷式的線性傳遞。

​特徵： 高度依賴「中間產物」（Artifacts）來溝通。

老闆高談過論講出一個抽象概念的Vision。

PM 依需求產出 PRD（規格書）or User Story(用戶故事）。

Designer 產出 Mockup（視覺稿），Engineer 看稿產出 Code。

QA則按照 PM 規格及驗收標準檢查。

​痛點： 降維傳達的溝通成本極高。PM無法將老闆的大餅畫成可執行的需求、設計師勉勉強強將需求塞成設計、工程師又常常在猜設計師的意圖、QA 常常在抓規格書的漏洞。而這個流程即便再快再快一個週期至少也要兩週，慢則可能數個月。

​2. Vibe Coding (直覺式開發)

​模式： Vision -> AI -> Code。

​特徵： 繞過所有中間人，只要有靈感（Vibe），透過自然語言直接讓 LLM 生成程式碼。

​差距與缺陷： 雖然爽快，但缺乏工程嚴謹性與可維護性。它就像是沒有地圖的狂飆，在做簡單原形（Prototype）時很美好，但一旦專案變大，沒有架構的 Vibe Coding 會迅速演變成一場災難（技術債）。

​3. Contextual Coding (脈絡化開發 - 類似 Cursor / Copilot)

​模式： (Vision + Context) -> AI Assistant + Engineer -> Code。

​特徵： AI 開始理解你的「 codebase 全局脈絡」。工程師依然是主導者，但 AI 成為了極其強大的外骨骼，幫你處理掉無聊的樣板程式碼、重構和語法細節。

​差距： 這裡依然保留了傳統的「設計」與「規格」階段，AI 主要優化的是 Engineer 這一端的生產力。

​4. Agentic AI Workflow (代理式工作流)

​模式： 從「線性接力」變成「同心圓迭代」（Concentric Iteration）。

第一條正推法：Design to Code (由形入理)

​特徵： Vision 輸入後，AI Agent 可以同時生成規格、產出 UI 元件、並寫出底層邏輯，人類在中間扮演「審批者（Reviewer）」與「指揮家」的角色。

改變：可以想像成是團隊擴增的溝通邊際成本降很低，每個人幾乎都有可能有能力做到一定程度的產品，原本流程是要線性接力（降低來回溝通成本），現在作業流程可以同步進行輻射，分派給不同 Agent，最終再收斂。（原本來回修正的成本被Agent 吸收）

第二條逆推法：Code to Design (由理生形)

​核心概念：以「商業邏輯與資料結構」驅動介面生成與更新。

​特徵： 當底層架構、資料模型（Data Schema）或商業規則改變時，AI Agent 能夠反向推演，自動生成或更新對應的 UI 元件、視覺呈現，甚至同步更新設計文件。

​在 Agentic 架構下的運作方式：

這是在過去完全做不到的事情。想像一個情境：工程團隊決定在資料庫的「會員資料」中，新增一個「VIP 忠誠度積分」的欄位。

​在傳統路徑：這需要 PM 重新開票、設計師重新畫 Figma（把積分放在哪裡？長什麼樣？）、前端再把圖刻出來，最後接上後端。

這兩者相互循環其實也形成一個很好的 AI 補充資料的方式：原本的舊設計圖與程式碼拿來餵給 AI，AI更理解整個設計的脈絡與規範，未來在產出更符合的程式碼，這份程式碼最終修修改改，還能同步更新到原始設計文件。

二、 抽離最核心的價值：這四個不同流程，我們到底在試圖改變什麼？

​如果我們抽離出最核心的價值，這波路徑變革的本質是：「將『溝通與實作』的邊際成本無限趨近於零（or Token費），讓『意圖（Intent）、品味（Taste）與架構（Architecture）』成為唯一有價值的東西。」

​過去，軟體開發有 80% 的時間花在把「想法」翻譯成「機器懂的語言」或「開發者懂的規格」。未來，這 80% 的髒活由 AI 包辦，人類核心價值會收斂到三個點：

1. ​定義問題（What to solve?）

2. ​設定邊界與架構約束（How to scale and secure?）

3. ​驗收結果（Is this what Customers want?）

Figma, Adobe 能提供什麼？（護城河在哪裡？）

​傳統上，Figma 和 Adobe 提供了「將想像力具象化成視覺像素」的能力。但在 AI 時代，他們能提供的核心價值會轉變為：

​「美學共識」與「品牌靈魂」的錨點（Source of Truth）： AI 可以快速生成幾百個介面，但要確保這些介面符合特定品牌的 Design System（字體、間距、情緒、微互動），還是需要一個高精確度的控制中心。Figma/Adobe 就是這個控制中心。

​精細的像素級控制（Pixel-perfect Control）： AI 很難做到「把這個陰影往左下角移動 2px，並帶有一點點冷色調的模糊」。當你需要極端精緻的客製化時，人類依然需要這類專業工具。

​Claude Code and Claude Design 試圖取代什麼？

​它們的野心非常明確：消滅傳統的「Handoff（交接）」過程與靜態的中間產物。

​取代「靜態設計稿」： 過去設計師畫一張圖，工程師要把圖切成程式碼。Claude Design 試圖做到的是：你給我一個概念，我直接給你一個「活的、可以點擊的 React 元件」。

它直接把 UI 設計跟前端開發融合了。

​取代「過度詳細的規格書」： Claude Code 不只是寫 code，它具備 Agent 的能力，可以去讀 codebase、理解終端目標。

它試圖取代的是「PM 把大目標拆解成無數小工單給工程師」的這個過程。你只要給出高階指令，它自己去拆解、執行、測試。

會不會有更底層結構上的取代？

我原本想想應該是教育吧？

像是 Excel 綁定在會計系一樣，Adobe、Figma產品幾乎被綁定在設計系的學習當中，產學有良好的接軌。這跟當年微軟Dos、Word等等策略是一樣的。

Word + 印表機是如何從學生時代就取代了打字機。現在的年輕人會問：『蛤？什麼是打字機？』

但轉念想想有別於以往的 SaaS 在企業中都是Top Down 推動，AI 各種工具反而是從Bottom Up 推動上去，畢竟那個員工不想偷懶（x)。

所以好像也不用等到教育那麼久的循環。但也許未來的學生的確會問：『蛤？什麼是Excel？什麼又是Photoshop?』

下圖為Figma 的MCP架構如何做到Code to Design/Design to Code

至於你問我說會不會買 Figma 股票，我的答案應該是否定的。
![[Pasted image 20260424133004.png]]