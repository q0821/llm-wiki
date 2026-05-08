---
title: "科技翰林院怎麼用 Claude Code 終端機？8 個實戰設定全公開"
source: "https://www.techhanlin.tw/claude-code-workflow-8-settings-guide/"
author:
  - "[[AI導演林思翰Hans]]"
published: 2026-04-25
created: 2026-04-30
description: "科技翰林院分享 8 個 Claude Code 終端機實戰設定完整攻略：CLAUDE.md 規範撰寫技巧、中文狀態列顯示、Skill 技能自動化流程、Memory 記憶系統管理方式，以及 Token 節省策略，每個設定都附有可直接套用的實際操作範例，幫你開箱即可提升效率。"
tags:
  - "clippings"
---
我用 Claude Code 終端機寫程式、管專案、寫文章，一天大概省 3 到 4 小時的工作時間。但剛開始用的時候，我跟大多數人一樣，開一個終端機視窗，打字問問題，等回答，就這樣。

後來我發現，Claude Code 真正的威力不在對話跟寫程式本身，在那些你可以自己動手調整的設定。

==從終端機管理、Skill 自訂指令系統、Memory 到 Token 管理，每一個設定都是讓 AI 從通用助手變成「你的專屬助手」的關鍵。==

這篇把我在科技翰林院實戰半年的 Claude Code 工作流程全部攤開，8 個核心設定，從裝工具到進階優化，你照著順序做，第一天就能感受到效率的差距。

## 1\. 怎麼同時管理多個 Claude Code 終端機 Session？

當你開始認真用 Claude Code 工作，很快就會遇到一個問題：你需要同時開好幾個 session（工作階段）。

一個在寫文章，一個在改 CSS，一個在跑測試，如果每個都開一個獨立的終端機視窗，桌面馬上就亂了。

### cmux 是什麼？為什麼我推薦它？

[cmux](https://cmux.com/zh-TW) 是一個終端機多工管理工具，讓你在同一個視窗裡開多個分頁（session），用快捷鍵切換。我每天的工作畫面就是一個 cmux 視窗，左側列出所有 session 名稱，右側是目前在用的 Claude Code，一眼就知道哪個 session 在做什麼，隨時切過去看進度。

比起直接開多個終端機視窗，cmux 最大的優勢是：session 不會因為關視窗而消失。你可以 detach（暫時脫離）一個工作階段，去做別的事，回來再 attach（重新接上），所有對話紀錄都還在。

這對長時間跑的任務特別有用，比如讓 Claude Code 在背景跑測試，你切到另一個 session 繼續寫 code。

![cmux 終端機多工管理工具介面截圖](https://www.techhanlin.tw/wp-content/uploads/2026/04/CleanShot-2026-04-26-at-14.26.40@2x-jpg.webp)

cmux 終端機多工管理工具介面截圖

### 新手怎麼開始用 cmux？

安裝很簡單，直接下載 [cmux](https://cmux.com/zh-TW) ，或 macOS 用 Homebrew（套件管理工具）一行搞定： `brew install cmux` 。

![cmux 安裝與初始設定步驟截圖](https://www.techhanlin.tw/wp-content/uploads/2026/04/CleanShot-2026-04-26-at-14.19.49@2x-jpg.webp)

cmux 安裝與初始設定步驟截圖

裝完後打 `cmux` 就能開始用，按 `Ctrl+B` 再按 `C` 新增 session，按 `Ctrl+B` 再按數字鍵切換。

我的習慣是給每個 session 取有意義的名稱，比如「techhanlin」「counsel」「aiterms」，這樣在左側列表一看就知道每個 session 對應哪個專案。每個 session 裡面再開 Claude Code，就等於你有了多個 AI 助手同時幫你做不同的事。

## 2\. Claude Code 可以直接拖圖片進終端機？

很多人不知道，Claude Code 的終端機其實可以直接拖放圖片進去。

你不需要先把截圖存檔、找路徑、再貼指令，直接從 Finder（Mac 檔案管理器）或桌面把圖片拖進終端機視窗，AI 就能看到圖片內容並回應。

![Claude Code 終端機拖放圖片示範截圖](https://www.techhanlin.tw/wp-content/uploads/2026/04/CleanShot-2026-04-26-at-14.22.58@2x-jpg.webp)

Claude Code 終端機拖放圖片示範截圖

### 什麼時候會用到拖放圖片？

最常用的場景是 debug（除錯）UI。你看到畫面有問題，截圖後直接拖進去說「這個按鈕的間距不對，幫我修」，AI 看到截圖就知道你在講什麼，不用你花時間描述「第三個區塊的右邊有一個藍色按鈕，它的 margin-bottom 太大」。一張圖抵一百個字。

其他場景包括：拖入設計稿讓 AI 照著刻 UI、拖入錯誤訊息的截圖讓它診斷、拖入別人的網站截圖說「我要做成這樣」。

==Claude Code 是多模態的，它不只看得懂文字，也看得懂圖片，善用這一點可以大幅減少你打字描述的時間。==

### 拖放圖片有什麼要注意的？

幾個小技巧：圖片越清晰越好，模糊的截圖 AI 會看不清楚細節，如果你要指出畫面上的特定位置，可以先用截圖工具畫個框或箭頭再拖進去。

另外圖片會佔用 context window（AI 的記憶容量）的空間，一張大圖大約等於幾千個 Token（AI 消耗的計算單位），所以不需要的時候不用一直拖圖片進去。

## 3\. CLAUDE.md 是什麼？最重要的 Claude Code 設定檔

CLAUDE.md 是 Claude Code 的個人設定檔，放在你的專案根目錄或 `~/.claude/` 底下，每次開新對話 AI 都會自動讀取。

這就是你跟 AI 之間的「合作備忘錄」，把你的偏好、規則、工作習慣全部寫進去，AI 就不會每次都從零開始

![CLAUDE.md 設定檔內容範例截圖](https://www.techhanlin.tw/wp-content/uploads/2026/04/CleanShot-2026-04-26-at-15.05.52@2x-jpg.webp)

CLAUDE.md 設定檔內容範例截圖

### CLAUDE.md 該寫什麼、不該寫什麼？

很多人第一次聽到 CLAUDE.md，會想把所有東西都塞進去。

但根據我的經驗，寫太多反而會浪費 Token，因為每次對話開頭 AI 都要讀一遍，重點是寫「不寫的話 AI 一定會搞錯的事」。

我的 CLAUDE.md 大概分成這幾個區塊：身份定位（告訴 AI 你是誰、它的角色是什麼）、工作流程（先規格再開發、改完要驗證）、硬規則（絕對不能做的事，像是不要用 em dash、不要 force push）、還有常用的專案資訊。

| 該寫進 CLAUDE.md | 不該寫進 CLAUDE.md |
| --- | --- |
| 你的身份和 AI 的角色定位 | 程式碼的架構細節（AI 會自己讀） |
| 硬規則（絕對不能做的事） | Git history（用 git log 查就好） |
| 工作流程和驗證步驟 | 暫時性的 debug 筆記 |
| 語言偏好（如：回覆用中文） | 已經寫在 README 裡的東西 |
| 常用的 API endpoint 和環境資訊 | 每次都會變的動態資料 |

**CLAUDE.md 設定檔內容建議對照表**

### 讓 AI 每次開對話就知道你的習慣？

關鍵在分層，Claude Code 支援兩層 CLAUDE.md：全域的放在 `~/.claude/CLAUDE.md` ，不管開哪個專案都會讀到；專案層級的放在專案根目錄，只有在那個專案裡才會載入。

我的做法是把通用偏好（語言、Git commit 格式、安全規則）放全域，把專案特定的規則（API 端點、部署流程、框架限制）放專案層級。這樣換專案的時候，AI 會自動切換到對的上下文，你不用每次重新交代。

![Claude Code 全域與專案設定結構截圖](https://www.techhanlin.tw/wp-content/uploads/2026/04/CleanShot-2026-04-26-at-15.07.32@2x-jpg.webp)

Claude Code 全域與專案設定結構截圖

舉個例子，我在全域 CLAUDE.md 裡寫了「回覆用中文」「commit message 用英文」「修完東西一定要跑驗證」，這三條規則不管我在哪個專案都適用。

但在科技翰林院的專案裡，我額外加了 WordPress API 的操作規範、SEO 文章的格式規則，這些只有在寫文章的時候才需要。

==如果你看不懂我以上的說明沒有關係，把這篇文章丟給你的 Claude Code，它就會理解了，不用自己去改 CLAUDE.md。==

## 4\. Claude Code 狀態列怎麼增加中文與倒數？

Claude Code 的狀態列是終端機底部那一行小小的文字，預設顯示英文的 model 名稱和 context window 百分比。

但對中文使用者來說，這些資訊不夠直覺，而且少了幾個你每天都需要看的關鍵數字。

### 預設狀態列少了什麼資訊？

預設的狀態列只告訴你 model 和 context window 剩多少，但不會告訴你：你的 5 小時額度還剩多少、幾個小時後重置、你現在在哪個專案的哪個 branch（分支）、這個 session 已經跑了多久，這些才是你每天盯著終端機最想知道的事。

特別是額度倒數，Claude Code 的 Pro 方案有 5 小時和 7 天兩個額度窗口，如果你不知道剩多少，很容易在關鍵時刻被限速，整個工作節奏就斷掉了。

### 怎麼加上額度倒數、專案名稱和 Session 計時？

Claude Code 的狀態列可以透過 `settings.json` 指定一個自訂腳本，顯示你想看的任何資訊。背後的原理是 Claude Code 每隔固定秒數執行腳本，但你不需要懂這些，只要把指令貼給 Claude Code 就好。

我的狀態列長這樣：

![Claude Code 狀態列顯示額度與計時器截圖](https://www.techhanlin.tw/wp-content/uploads/2026/04/CleanShot-2026-04-26-at-13.52.01@2x-jpg.webp)

Claude Code 狀態列顯示額度與計時器截圖

一眼就知道現在用哪個模型、在哪個專案的哪個分支、session 跑了多久、記憶還剩多少、額度還剩多少、幾個小時後重置。不用切到別的畫面查，寫 code 的時候餘光就能掌握全局。

==你不需要自己寫腳本或改設定檔，把以下指令貼給你的 Claude Code，它會自動建立腳本、設定 settings.json、處理所有技術細節：==

```
幫我設定 Claude Code 狀態列，顯示以下資訊（中文標籤，各段用 · 分隔）：

1. 模型名稱：從 model ID 解析，如 claude-opus-4-6[1m] → Opus 4.6 (1M context)
2. 專案 + git 分支：專案 myproject  main，非 git 目錄只顯示專案名
3. session 時間：已跑 1時19分
4. context window 剩餘：記憶剩 91%
5. 5小時額度剩餘 + 重置倒數：5小時額度剩 79%（2時43分後重置）
6. 7天額度剩餘 + 重置倒數：7天額度剩 47%（14時53分後重置）

腳本放 ~/.claude/statusline.sh，settings.json 加上 statusLine 設定，refreshInterval 30 秒。
Claude Code 透過 stdin 傳入 JSON，用 INPUT=$(cat) 讀取，jq 解析。
額度 JSON 值是「已用百分比」，顯示時轉成「剩餘」（100 - used）。
缺少的欄位直接隱藏，不顯示空白標籤。
顏色規則：剩餘 >50% 無色，20%-50% 黃色，≤20% 紅色。
```

貼完之後 Claude Code 會自動幫你建好腳本、設定好 `settings.json` ，重開 Claude Code 就能看到中文狀態列了。

記憶和額度的數字會根據剩餘比例自動變色：超過 50% 維持預設灰色，20% 到 50% 變黃色提醒你注意，低於 20% 就變紅色警告。

## 5\. 什麼是技能 Skill？讓 Claude Code 自動化重複工作

Skill 是 Claude Code 的自訂指令系統，你可以把一整套工作流程寫成一個 Skill 檔案，之後只要打 `/skill-name` 就能觸發。AI 會照著 Skill 裡的步驟執行，不用你每次重新解釋一遍。

![Claude Code Skill 自訂指令系統使用截圖](https://www.techhanlin.tw/wp-content/uploads/2026/04/CleanShot-2026-04-26-at-14.34.19@2x-jpg.webp)

Claude Code Skill 自訂指令系統使用截圖

### Skill 跟直接打 Prompt（提示指令）差在哪？

直接打 Prompt 的問題是，你每次都要重新描述完整的流程。

比如我要寫一篇科技翰林院的文章，需要讀 SOP、檢查語氣規範、上傳到 WordPress、設定 SEO，如果每次都從頭打一遍，光是 prompt 就要幾百字，而且很容易漏步驟。

Skill 把這些全部封裝起來了，我打 `/techhanlin-write` ，AI 就會自動讀取寫作 SOP、語氣指南、HTML 模板，然後照著流程一步一步走，從寫內容到上傳 WordPress 到設定 Rank Math SEO，整條產線一次完成。

我目前有 10 個常用的 Skill，涵蓋寫文章、WordPress 操作、CSS 修改、SEO 批次處理、部署、驗證等等。每個 Skill 都是從實際工作中反覆踩坑後整理出來的。

| Skill 名稱 | 用途 | 觸發方式 |
| --- | --- | --- |
| /techhanlin-write | 寫文章：讀 SOP → 寫內容 → 上傳 WP → 設 SEO | 要寫新文章時 |
| /techhanlin-wp | WordPress 純操作：改頁面、注入 CSS、清快取 | 不寫內容只改設定時 |
| /wp-seo-batch | 批次 SEO 優化，每 5 篇自動驗證 | 大量修 SEO 時 |
| /css-fix | CSS 修改流程：先診斷再動手 | 要改樣式時 |
| /check | Session 開始驗證環境和需求 | 每次新 session 開頭 |
| /verify | 修改後強制驗證，確認真的生效 | 任何修改完成後 |
| /deploy | 部署到 production 並確認成功 | 要上線時 |

**科技翰林院常用的 Claude Code Skill 清單**

### 怎麼從零建立你的第一個技能 Skill？

你不需要知道 Skill 檔案放在哪裡、格式長什麼樣，直接告訴 Claude Code 你想自動化什麼流程就好，比如我想建一個部署指令，就直接說：

```
幫我建一個 /deploy 的 Skill，步驟是：
1. 跑 tsc 型別檢查
2. 跑建置
3. 確認變更內容
4. commit
5. push 到 GitHub
6. 提醒我用 Cmd+Shift+R 刷新瀏覽器
```

Claude Code 就會在正確的目錄建好 Skill 檔案，下次打 `/deploy` 就能一鍵觸發整套流程。建議從你最常重複做的事情開始，如果你發現自己每次都在跟 AI 說一樣的話，那就是應該變成 Skill 的時候了。

## 6\. Memory 和 Handoff 怎麼解決記憶的問題？

Claude Code 的 Memory 系統是一個檔案式的記憶資料庫，放在 `~/.claude/projects/` 底下，讓 AI 跨 session 記住你的偏好、教訓和專案狀態。每次開新對話，AI 會自動讀取相關的 memory 檔案，不用你重新交代。

### Memory 系統怎麼讓 AI 跨 Session 記住你？

Memory 分成幾種類型：user（你是誰、偏好什麼）、feedback（你糾正過 AI 的事，讓它不要再犯）、project（專案的進行狀態）、reference（外部資源的位置）。每種記憶都存成獨立的.md 檔案，由一個 MEMORY.md 索引檔統一管理。

最有用的是 feedback 類型，比如我曾經糾正 AI「不要用 em dash」「部署後一定要驗證頁面渲染」「遇到問題不要放棄，反覆嘗試」，這些都會存成 memory，下次 AI 就不會再犯同樣的錯。

Memory 就是讓 AI 從你的糾正中學習，變成越來越懂你的專屬助手。

你不需要手動建立或管理這些 memory 檔案，日常對話中，你每次糾正 AI，它就會自動把教訓存成 memory，如果你想主動讓它記住什麼，直接說就好，比如：

```
記住：我的專案都用 pnpm 不用 npm，commit message 一律用英文。
```

Claude Code 會自動建好 memory 檔案，下次開新對話就會記得。

![Claude Code Memory 系統跨 Session 記憶設定截圖](https://www.techhanlin.tw/wp-content/uploads/2026/04/CleanShot-2026-04-26-at-15.55.52@2x-jpg.webp)

Claude Code Memory 系統跨 Session 記憶設定截圖

### Handoff 接力是什麼？為什麼 Compaction 會丟失指令？

Claude Code 有一個隱藏的坑叫 auto-compaction（自動壓縮）。當對話太長，系統會自動壓縮之前的訊息來節省 context window，但壓縮的過程中，你在 CLAUDE.md 裡寫的規則可能會被丟掉。

我實測過，壓縮後 AI 對 CLAUDE.md 規則的遵守率可以降到接近 0%。

解決方法是 handoff 機制。每次 session 結束前，讓 AI 把「做了什麼、還沒做什麼、下次要注意什麼」寫進 `handoff.md` ，下次新 session 開頭先讀這個檔案，就能無縫接續，這比依賴 compaction 可靠太多了。

設定方式很簡單，直接跟 Claude Code 說：

```
幫我設定 handoff 機制：在 CLAUDE.md 加上兩條規則，
第一條是每次新對話開始先讀 ~/.claude/tasks/handoff.md，
第二條是 session 結束前主動寫 handoff.md，
記錄做了什麼、還沒做什麼、下次要注意什麼。
```

Claude Code 會幫你把規則寫進 CLAUDE.md，之後不管哪個 AI session 接手，都知道前一個 session 做到哪裡。

![Claude Code Handoff 接力文件截圖](https://www.techhanlin.tw/wp-content/uploads/2026/04/CleanShot-2026-04-26-at-15.59.29@2x-jpg.webp)

Claude Code Handoff 接力文件截圖

## 7\. 怎麼管理 Skill 和設定，避免浪費 Token？

Claude Code 的每一個 Skill、每一行 CLAUDE.md、每一個 memory 檔案，都會佔用你的 context window，如果不注意管理，光是設定檔就可能吃掉大量 Token，留給實際工作的空間就變少了。

### Skill 重複會多燒多少 Token？

這週我做了一次 Skill 全面盤點，發現有 4 個 Skill 同時存在 `~/.claude/skills/` 和 `~/.claude/commands/` 兩個地方，內容幾乎一模一樣。光是這 4 個重複的 Skill，就浪費了大約 580 行、約 20,000 個 Token。

20,000 個 Token 是什麼概念？大約等於一篇 5,000 字的中文文章。

==也就是說每次開新對話，AI 光是讀重複的 Skill 就等於讀了一篇長文，然後什麼事都還沒開始做。==

### 怎麼一次檢查並清理重複的 Skill？

方法很直接：請 AI 幫你讀取所有 Skill 檔案，列出每個 Skill 的位置、行數和內容摘要，然後比對哪些是重複的。

我這次就是直接跟 Claude Code 說「幫我檢查所有 skill 有沒有重複或不必要的」，它 5 分鐘內就掃完了，告訴我哪些重複、哪些跟 CLAUDE.md 有內容重疊。

除了 Skill 重複，還有幾個常見的 Token 浪費點：CLAUDE.md 寫太多（超過 200 行就該精簡）、memory 檔案沒整理（過時的 memory 還在被載入）、Skill 的 description 寫太長（會出現在每次的指令列表中）。

定期做一次「Token 體檢」，把不需要的東西清掉，整體效率會明顯提升，還會幫你省錢。

## 8\. Claude Code 還能幫你自動化做的事

Claude Code 不只是寫程式的工具，它能操作你電腦上任何終端機能做的事，這週我用它完成了幾件原本以為要手動處理的工作，效果出乎意料。

### 用 AI 掃描電腦、批次清理磁碟空間

我的 Mac 硬碟容量快不夠了，但不知道什麼東西佔了最多空間，直接跟 Claude Code 說「幫我掃描電腦裡有哪些專案，哪些可以刪」，它用 `du` 和 `git log` 把所有專案列出來，標明每個專案的大小、最後 commit 時間、有沒有推上 GitHub、有沒有未提交的檔案。

然後我只要看表格，告訴它「刪掉 1、3、4、5」，它就會先檢查有沒有未推的變更，需要的話先推上 GitHub，然後才刪除。

整個過程大概 10 分鐘，回收了 30GB 的空間。如果自己一個一個資料夾去檢查，至少要花一個小時。

它甚至主動掃描了 `~/Library/` 底下的快取，找到 Homebrew 舊下載、pip 快取、Playwright 瀏覽器快取、Chrome Service Worker 等等，全部加起來又清了 15GB，這些是你平常根本不會去動的隱藏目錄。

### GitHub 狀態也能一句話搞定？

另一個例子是 GitHub repo 管理，我有一個專案不再維護了，直接說「幫我把這個專案 repo 設成停止更新」，它用 `gh repo archive` 一行指令搞定，repo 變成唯讀，任何人都不能再 push。這種事情如果自己去 GitHub 網頁上找設定，要點好幾層選單。

## 結論：Claude Code 工作流程優化，從第一個設定開始

這 8 個設定不是什麼高深的技術，每一個都是我在日常工作中反覆踩坑後整理出來的。

cmux 讓你管理多個 session，拖放圖片讓溝通從打字變看圖，CLAUDE.md 讓 AI 認識你，狀態列讓你掌握全局，Skill 讓重複工作一鍵完成，Memory 和 Handoff 讓 AI 跨 session 延續記憶，Token 管理讓你用最少的成本發揮最大效率，而終端機的系統操作能力讓你把很多原本手動的雜事全部自動化。

==Claude Code 工作流程優化的核心概念就是一句話：把你重複在做的事情，變成 AI 自動就會做的事情。==

每次你發現自己在跟 AI 說一樣的話，那就是應該建一個 Skill 的時候。

每次你發現 AI 又犯了同樣的錯，那就是應該寫一條 Memory 的時候。

不用一次全部設定完，從裝 cmux 和寫 CLAUDE.md 開始就好，你會很快發現，AI 開始變得越來越像一個真正了解你的工作夥伴。

當以上操作都熟練之後，我蠻推薦你可以做自己的 [第二大腦與知識管理 LLM Wiki](https://www.techhanlin.tw/claude-code-obsidian-second-brain/) ， [知識管理 Obsidian 新手教學可以看這篇](https://www.techhanlin.tw/obsidian-tutorial-beginner-guide/) ，從下載到入門的完整操作指南都有。

如果你也有自己的 Claude Code 設定心得，歡迎來科技翰林院與我分享，我們一起讓工作流程越來越順！

---

## 推薦閱讀

[Claude + Obsidian 打造 AI 第二大腦，Karpathy 的知識管理 LLM Wiki](https://www.techhanlin.tw/claude-code-obsidian-second-brain/)

[Obsidian 新手教學：從下載到入門，完整操作指南，常用外掛懶人包](https://www.techhanlin.tw/obsidian-tutorial-beginner-guide/)

[OpenClaw 龍蝦 4 月更新！有 Claude Code 還需要裝龍蝦嗎？](https://www.techhanlin.tw/openclaw-april-2026-update-claude-code-tutorial/)

[Claude Design 實戰：5 個場景示範與 Anthropic 設計師 Ryan 7 個 Tips](https://www.techhanlin.tw/claude-design-use-cases-tips/)

[Claude Opus 4.7 更新比較：4 大模型企業主怎麼分配最划算](https://www.techhanlin.tw/claude-opus-4-7-%e6%9b%b4%e6%96%b0%e6%af%94%e8%bc%83%ef%bc%9a4-%e5%a4%a7%e6%a8%a1%e5%9e%8b%e4%bc%81%e6%a5%ad%e4%b8%bb%e6%80%8e%e9%ba%bc%e5%88%86%e9%85%8d%e6%9c%80%e5%88%92%e7%ae%97/)

---

## 參考資料

[Anthropic (2026). “Claude Code Overview”](https://code.claude.com/docs/en/overview)

[Anthropic (2026). “Extend Claude with Skills”](https://code.claude.com/docs/en/skills)

[Anthropic (2026). “Claude Code GitHub Repository”](https://github.com/anthropics/claude-code)

[Anthropic (2026). “Pricing — Claude API Docs”](https://platform.claude.com/docs/en/about-claude/pricing)

[Builder.io (2026). “How to Write a Good CLAUDE.md File”](https://www.builder.io/blog/claude-md-guide)

[Builder.io (2026). “How I use Claude Code (+ my best tips)”](https://www.builder.io/blog/claude-code)