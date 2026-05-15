---
title: 用 Claude Design × Claude Code × Figma 重新定義設計工作流程（AAPD Live Demo 直播筆記）
type: source
sources: ["【直播筆記】用 Claude Design × Claude Code × Figma 重新定義設計工作流程 - AAPD 產品設計學院.md"]
created: 2026-05-14
updated: 2026-05-14
tags: [claude-design, claude-code, figma, mcp, design-workflow, design-system, prototype]
confidence: 強
---

# 用 Claude Design × Claude Code × Figma 重新定義設計工作流程

**作者**：[[Simon-Lin|Simon]]（Product Designer，台灣 → Tokyo 5 年 → 現居 Sydney）
**發表平台**：[[AAPD]] 產品設計學院
**發表日期**：2026-05-05（直播）／文章整理日同步
**原始連結**：https://aapd.com.tw/all-articles/2026-livedemo-claudedesign-claudecode-figma
**直播回放**：https://youtube.com/live/kWZycvnSBsw
**作者介紹頁**：https://linktr.ee/simonlin

## 核心主張

- 設計師的交付流程從「線性接力」轉為 [[Figma]] 與 [[Claude-Design]] 之間的「雙向快速迭代」，[[Figma]] 不再是單向的交付介面
- [[Claude-Design]] 適合 0→1 探索與概念 Demo，產品化必須轉到 [[Claude Code]] 才有效率（hard-coded、無 component、無版本控制是當前限制）
- 「Design token、Component、[[CLAUDE-md|CLAUDE.md]]」是 AI 時代讓品質穩定的三件事——沒有完整 Design System 直接決定產出品質
- [[Figma]] [[MCP]] 已可雙向操作（Code → Figma、Figma → Code），但 Auto Layout 與色彩 hard-code 等問題仍需設計師人工補強
- AI 時代設計師的核心價值從「雕刻畫面」轉向「判斷方向」——品味與判斷力反而需要更刻意練習

## 詳細摘要

### 一、設計交付的線性流程正在改變

過去：畫設計稿 → 寫規格 → 做 prototype → 交接給工程師，[[Figma]] 是單向交付介面。

Simon 觀察的新流程：

> 「設計師可以直接在 Claude 這類工具裡快速做出高保真 Prototype，甚至能簡單部署上線看看，當需要打磨細節、做協作標註的時候，再把成果導入 Figma，調整後接著可能又回到 Claude 上繼續開發迭代。」

換句話說，[[Figma]] 跟 Claude 變成「雙向快速來回迭代」的關係，而不再是單向交付——這與 [[src-will-ai-kill-saas-design]]（Yu-Chih）的 [[Agentic-AI-Workflow]] 「同心圓迭代」論述吻合。

Simon 明確標註這是過渡期：「真正重要的不是工具誰取代誰，而是『重新思考流程哪裡可以調整』」。

### 二、Claude Design 的定位與限制（第一手 Demo）

[[Claude-Design]] 介面分四個 tab：Prototype、Slide deck、Template、其他。支援匯入既有 Design System（GitHub repo、Figma 檔案、本地端程式碼、品牌資產）。

Demo 用「綠色植物電商首頁」當案例。Claude Design 沒直接開工，**先丟結構化小問卷**釐清需求（品牌名稱、品牌調性、主色綠色偏向哪一種、首頁要包含哪些區塊、商品支援哪些互動、視覺創新程度等）。

> Simon：「Claude Design 等於是把『寫 Prompt』這件事介面化了，把抽象的需求拆解成選擇題，讓非技術背景的人也能產出結構化的指令。」

**直播當下的限制**（信心：強，第一手 Demo）：
- 速度比預期慢，Token 消耗快（Pro 版可能用一兩趟就燒完）
- 跑出來很多 hard-coded，沒有 component 化、沒有變數系統，難擴展
- 無法直接輸出到 [[Figma]]，要先到 [[Claude Code]] 才能透過 Figma MCP 串接
- 沒有版本控制，方向有錯要回上一版不太方便

**Simon 的定位結論**：

> 「比較適合 0 到 1 的前期探索，以及做快速 Demo 概念，一旦你想真的進入產品化階段，還是得轉到 Claude Code 上面繼續做會比較有效率。」

### 三、把 Claude Design 交給 Claude Code（Hand off 機制）

從 [[Claude-Design]] 產出第一版頁面後，點右上角 share → 「Hand off to Claude Code」。系統會自動產生一段 prompt：「請看一下這份設計檔案、讀取 README，把它重建出來」。

> Simon：「這個其實就是 Claude 生態系真正的價值所在，Claude Design 跟 Claude Code 之間有原生的銜接通道。」

可以在 Claude Desktop App 直接貼上，或任何 IDE（Cursor / VS Code / Google Antigravity）的 terminal 呼叫 [[Claude Code]]。

**Simon 養成的習慣**：接手專案後第一件事**不是急著改設計**，而是請 Claude **先把基礎環境建好**：
- 技術棧：React + Vite + Tailwind CSS
- 第一個指令：請它幫忙設定專案環境、產生 [[CLAUDE-md|CLAUDE.md]]

**直播當天的失敗教訓**：

> 「直播當天我其實就是因為跳過了這一步，沒有先把環境設好就直接貼 prompt 過去，結果 Claude Design 翻譯出來的東西完全跑版，變成一個非常荒謬的成果，我只好打開另一個事先準備好的備案檔（還好有準備）。」

### 四、品質穩定的三件事：Design Token、Component、CLAUDE.md

> 「在 AI 時代，你有沒有一份完整的 Design System，直接決定了產出品質。」

Simon [[CLAUDE-md|CLAUDE.md]] 範例規則：
- 跟 [[Figma]] 同步時必須使用已定義的 design token
- 必須使用既有 component，沒有定義就先問我

**反向流程示範**：頁面做出來後，可以反過來請 Claude **生成 design system 頁面**，把產品中用到的所有 design token、component 整理在一個獨立頁面，並同步更新到 [[CLAUDE-md|CLAUDE.md]]。

進一步，Claude 可生成 **Design Token 的 JSON 檔**（primitive token + semantic token + alias 對應），透過 Figma 的 Variables Import plugin 一鍵匯入 Figma，建立完整變數系統。

> 「在 AI 時代，很多時候是邊走邊建立規則、邊走邊修。一開始會建立一些基本規則，但它可能只佔了五六成，其他的是在過程中一邊發現問題、一邊把規則補齊。」

這個觀點與 [[DESIGN-md]] 強調的「設計即文件」形成補充——DESIGN.md 強調事前規範，Simon 強調邊走邊建立。

### 五、Figma MCP：AI 雙向操控 Figma

[[Claude Code]] 透過 [[Figma]] [[MCP]]（Model Context Protocol）雙向操作 [[Figma]]。

Simon 對 [[MCP]] 的白話比喻：

> 「萬用插頭，它讓 AI 可以接上任何工具跟它溝通。透過 Figma MCP，Claude Code 可以在 Figma 裡新增 component、建立 variables、設定 layout，甚至直接畫出新頁面。」

**Demo 兩個方向**：

1. **Code → Figma**：用小腳本指令（`Figma capture` + `Figma delay`），貼上某個區塊的 URL，系統自動把該區塊的 React 程式碼產出到 Figma 上，形成可編輯設計檔——「把開發成果反向同步回設計檔」場景好用
2. **Figma → Code**：在 Figma 手動調整版位（兩區塊左右對調），右鍵複製選取的 link，貼回 Claude Code 說「我在 Figma 有調整設計，幫我更新到 Code 上」——白話文，Claude 自己讀取 Figma 最新狀態反映到程式碼

**現況限制**（信心：強，第一手 Demo）：
- MCP 串接還有不少 bug
- [[Figma]] 端的 Auto layout 處理得不夠漂亮
- 顏色樣式可能都是 hard-coded，需要設計師事後手動檢查跟補強
- 整體流程「堪用但離完美、乾淨還有一段距離」

### 六、與 AI 對話的五個習慣（Simon 自述）

1. **描述不要太短或太模糊**：要假設你在跟一個人類溝通，需求清楚但不過度結構化
2. **精準描述目標物**：熟悉設計系統的命名（Button、Toast、Snackbar、Overlay、Fixed、Sticky、Slide-in、Fade-out）就用英文術語，中英夾雜是工具溝通的精準度
3. **複雜的事情先做計畫**：先請 Claude 產出 Markdown 計畫文件，自己 review 沒問題後再開工
4. **溝通萬用句**：「你不清楚就先問我，問完再開始做，不要用猜的。」
5. **講不清楚就拿參考範例**：圖片、連結、視覺化的東西對 AI 比文字更有說服力（Demo 一開始就丟 4 張 Dribbble 截圖當風格參考）

> 「把 AI 當成一個有經驗但不認識你產品的合作夥伴，給夠 context、容忍它問問題、給出精準回饋，而不是期待它一次就讀懂你的腦袋到底想要什麼。」

### 七、設計師核心價值：從雕刻畫面轉向判斷方向

Q&A 觀眾問：「AI 現在這麼強，設計師的價值在哪裡？」Simon 的回應：

- 設計師真正的價值從以前到現在都不在「產出畫面」本身，而在判斷「這個畫面好不好、有沒有價值、是不是真的解決到問題」
- 判斷力連結的不只是視覺品味，還包括「設計在組織與產品中的意義」「能不能幫公司賺錢」「能不能放大品牌價值」「能不能節省工程成本」
- 反對「我會用 Figma 我就是厲害的設計師」這種綁定工具的自我定位

直播尾段的金句（也是文章結尾）：

> 「以前的時代就是透過一直在練習、一直在做產品、一直在設計來累積這些品味跟判斷力，而現在這樣的機會越來越少。」

> 「工具讓產出變快了，但『品味』、『判斷力』這些相對抽象的能力，反而需要更多刻意練習才能養成。基本功不是過時的東西，而是區分『會用 AI 的人』與『真正會打造產品的人』的關鍵。」

## 關鍵引用

> 「換句話說，Figma 跟 Claude 之間正在變成一種『雙向快速來回迭代』的關係，而不再是單向交付的角色。」

> 「我自己對它的定位是：比較適合 0 到 1 的前期探索，以及做快速 Demo 概念，一旦你想真的進入產品化階段，還是得轉到 Claude Code 上面繼續做會比較有效率。」

> 「在 AI 時代，你有沒有一份完整的 Design System，直接決定了產出品質。」

> 「（MCP）萬用插頭，它讓 AI 可以接上任何工具跟它溝通。」

> 「把 AI 當成一個有經驗但不認識你產品的合作夥伴，給夠 context、容忍它問問題、給出精準回饋。」

> 「工具讓產出變快了，但『品味』、『判斷力』這些相對抽象的能力，反而需要更多刻意練習才能養成。」

## 信心評估

- **強**：[[Claude-Design]] 的四限制（hard-coded、無 component、不能輸出 Figma、無版本控制）、[[Figma]] [[MCP]] 雙向操作的 bug（Auto layout、色彩 hard-code）——皆為第一手 Demo 觀察
- **強**：「Hand off to Claude Code」機制、`Figma capture` + `Figma delay` 指令——Demo 實作
- **中**：「設計師價值轉向判斷力」「邊走邊建規則」——Simon 個人觀點，雖有共鳴但屬個人化判斷
- **中**：「[[Claude-Design]] 只能瀏覽器版用，桌面 App 還沒開放」——快照於 2026-05-05，後續可能變動

## 與 Wiki 的關聯

### 形成對話組

- **[[src-will-ai-kill-saas-design]]**（Yu-Chih，宏觀觀察）vs **本來源**（Simon，實作經驗）：兩篇可並讀
  - Yu-Chih 預測 [[Figma]] 護城河收斂為「美學錨點 + 像素級控制」；Simon 實際用 [[Figma]] [[MCP]] 發現 Auto layout、色彩 hard-code 仍需人工補強 → **實證了 Yu-Chih 的「人類依然需要這類專業工具」論點**
  - Yu-Chih 把 [[Claude-Design]] 視為「靜態 handoff 殺手」；Simon 補上**實作面警告**——Claude Design 仍是 0→1 探索工具，產品化要轉 [[Claude Code]]
  - 兩者對「設計師價值收斂為判斷力」有一致結論

### 支持與補強

- [[Agentic-AI-Workflow]] 的 Code↔Design 雙向流動：本來源是該抽象範式的**具體實作教學**（Hand off 流程、`Figma capture`+`Figma delay`、Claude → design system 反向生成）
- [[CLAUDE-md]] 的「該寫進去 vs 不該寫」：本來源提供具體 design 規則範例（「跟 Figma 同步必須使用 design token」、「必須使用既有 component，沒有定義就先問我」）
- [[MCP]] 的雙向應用：本來源是 Figma MCP 的代表使用案例
- [[DESIGN-md]] 與「邊走邊建規則」：互補——DESIGN.md 強調事前規範，Simon 強調漸進建立

### 新增實體

- [[Simon-Lin]]：產品設計師，台灣 → Tokyo 5 年 → Sydney，linktr.ee/simonlin
- [[AAPD]]：產品設計學院，繁中設計教育社群，本文發表平台

### 未來可延伸

- 直播回放（YouTube）若有時間可進一步擷取 transcript 補強 Demo 細節
- Simon 提到的「設計師價值」與 [[src-piccalilli-end-of-responsive-images]] Mat Marquis 自白（手寫 sizes 終結）可形成「設計與工程的舊技藝消亡」綜整題
