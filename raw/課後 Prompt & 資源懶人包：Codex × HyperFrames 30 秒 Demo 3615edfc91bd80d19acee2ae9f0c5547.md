# 課後 Prompt & 資源懶人包：Codex × HyperFrames 30 秒 Demo

### 使用方式

首先需要訂閱chatgpt並且安裝codex：[https://openai.com/zh-Hant/codex/](https://openai.com/zh-Hant/codex/)

課程簡報：[https://paddy19981205.github.io/FLPDF/#17](https://paddy19981205.github.io/FLPDF/#17)

這份文件整理課後練習用的 Prompt Pack、Visual Beats Library、30 秒 Timeline 與 Fix Prompts。目標是讓你用 Codex + HyperFrames 快速完成一支 30 秒、9:16、1080x1920 的短 Demo。

建議第一步：先做一支 30 秒短 Demo，不要一次寫死所有規格。先用模板讓 Codex 產生三份 Markdown，檢查後再轉 HTML，跑完 `Preview -> Revise -> Render`。

建議使用順序：

1. 先看「快速流程」
2. 再看「使用順序」
3. 複製 Prompt Pack 裡的提示詞
4. 從 Visual Beats Library 挑 3–5 個畫面節奏
5. 套進 30 秒 Timeline
6. 用 Fix Prompts 修正畫面
7. 最後用檢查清單確認成品

### 快速流程

| 階段 | 產出 | 做法 |
| --- | --- | --- |
| Spec | `DESIGN.md` | 先定觀眾、訊息、風格、色票、字體、不可做事項 |
| Files | `script.md`  • `storyboard.md` | 每幕只保留一個主訊息，先把節奏寫清楚 |
| HTML | `index.html` | 先做靜態 hero frame，再加 GSAP motion |
| Inspect | check report | 跑 `npm run check`，修文字溢出、track 重疊、timeline 問題 |
| MP4 | `renders/*.mp4` | 草稿用 draft，定稿再標準或高品質 render |

### 使用順序

1. 先用「Prompt Pack」產出 `DESIGN.md`、`script.md`、`storyboard.md`。
2. 從「Visual Beats Library」挑 6 到 9 個互動節奏，放進 storyboard。
3. 用「30 秒 Timeline」控制節奏，不要一開始做 60 秒。
4. 遇到互動感、跑版、風格一致性、資訊過載問題時，用「Fix Prompts」修。

### Prompt Pack

## 00. 一句話開場 Prompt

```
我想用 HyperFrames 做一支 30 秒、9:16、1080x1920 的短影片 Demo。

主題：{填入主題}
觀眾：{填入觀眾，例如 AI 愛好者 / 開發者 / 設計師 / 客戶}
目標：讓觀眾在 5 秒內理解 {核心訊息}
風格方向：{填入風格，例如 深色工具介面 / 亮色教學卡 / 高對比動態排版}

請先不要寫 HTML。請先產出三份 Markdown 規格：
1. DESIGN.md：視覺系統、色票、字體、版面規則、不可做事項。
2. script.md：30 秒逐段文案，每段只保留一個主訊息。
3. storyboard.md：每段的畫面、元件、motion、互動節奏。

限制：
- 每幕主字幕不超過 16 個中文字。
- 至少 6 幕要有明確互動行為，例如 input、click、drag、scrub、terminal output、preview reveal。
- 不要使用隨機動畫，不要依賴外部網路素材。
- 先做可以跑完 preview 的版本，不要一次追求最終精品。
```

## 01. [DESIGN.md](http://DESIGN.md) 生成 Prompt

可以參考這三個網站找到喜歡的風格
[https://styles.refero.design/](https://styles.refero.design/)
[https://www.typeui.sh/](https://www.typeui.sh/)
[https://github.com/VoltAgent/awesome-design-md/tree/main](https://github.com/VoltAgent/awesome-design-md/tree/main)

```
請幫我為這支 HyperFrames 30 秒短影片建立 DESIGN.md。

影片資訊：
- 主題：{主題}
- 觀眾：{觀眾}
- 核心訊息：{核心訊息}
- 形式：9:16 Reels / Shorts / TikTok，1080x1920
- 氣質：{例如 工具感、教學感、科技感、品牌感、活潑感}

請輸出：
1. Style Prompt：一段可給 AI agent 讀懂的視覺方向。
2. Colors：5 到 8 個 token，包含背景、主文字、重點色、成功色、警示色、面板色。
3. Typography：標題、內文、UI label 的字體與大小原則。
4. Shapes And Layout：安全區、卡片、按鈕、工具介面、影片比例規則。
5. Motion Principles：動畫速度、easing、互動節奏、轉場原則。
6. What Not To Do：至少 6 條避免跑版或風格失控的規則。

請用繁體中文，格式要能直接存成 DESIGN.md。
```

## 02. [script.md](http://script.md) 生成 Prompt

```
請根據 DESIGN.md 的方向，幫我寫一份 30 秒短影片 script.md。

需求：
- 格式：9:16，1080x1920。
- 長度：30 秒。
- 節奏：Hook -> Input -> Build -> Preview -> Inspect -> Render -> CTA。
- 每幕 3 到 4 秒。
- 每幕只保留一個主訊息。
- 文案要像手機短影片字幕，不要像簡報段落。

請輸出：
1. Core Message：一句話說明影片要讓觀眾記住什麼。
2. Scene Rhythm：每幕秒數與節奏名稱。
3. Scene Script：表格，包含 Time、On-screen Copy、Purpose。
4. Text Rules：中文斷行、字數上限、哪些字要強調。

請不要寫 storyboard，也不要寫 HTML。
```

## 03. [storyboard.md](http://storyboard.md) 生成 Prompt

```
請根據 DESIGN.md 與 script.md，幫我寫 storyboard.md。

每一幕請包含：
- Time：起訖秒數。
- Text：畫面主字幕。
- Visual：畫面長什麼樣。
- Components：需要哪些 UI / 圖形 / 文字 / media 元件。
- Motion：進場、互動、轉場、出場。
- Interaction Beat：這一幕是否有 input、click、drag、scrub、terminal、reveal、render 等動作。

限制：
- 至少 6 幕要有明確互動行為。
- 不要只寫「卡片出現」，要說明卡片如何出現、為什麼出現。
- 每一幕都要能用 HTML / CSS / GSAP 做出來。
- 主字幕不可被裝飾元素遮擋。
- 手機安全區要保留。

請用繁體中文，格式要能直接存成 storyboard.md。
```

## 04. HTML Composition 生成 Prompt

```
請根據目前專案中的 DESIGN.md、script.md、storyboard.md，生成 HyperFrames 的 index.html。

請遵守：
- 使用 1080x1920 vertical composition。
- root composition 不要包在 template 裡。
- 每個 timed visible element 都要有 data-start、data-duration、data-track-index，並加上 class="clip"。
- GSAP timeline 必須 paused，並註冊到 window.__timelines["main"]。
- 先以 CSS 建立每幕最清楚的 hero frame，再用 gsap.from() / gsap.to() 加動態。
- 不使用 Date.now()、Math.random()、外部 fetch 或不可重現邏輯。
- 不新增 DESIGN.md 色票以外的主色。
- 文字要在手機安全區內，中文不能被截斷。

請先建立可跑完 npm run check 的版本。若需要取捨，優先保證 layout 正確、timeline 清楚、可 render。
```

## 05. Inspect + Revise Prompt

```
請檢查目前 HyperFrames 專案，並修正會阻礙 preview / inspect / render 的問題。

請執行：
1. npm run check
2. 根據錯誤修正 index.html 或相關 composition 檔案。
3. 若有文字溢出、元素超出畫布、track overlap、timeline 未註冊、clip 缺少 class 等問題，請直接修。
4. 修完後再跑一次 npm run check。

修正原則：
- 不改變影片主題與文案核心。
- 不引入新風格。
- 不用刪減整幕來逃避問題，除非該幕本來就重複。
- 優先修 layout、時間軌、文字可讀性。

最後請回報：
- 修了哪些問題。
- 還有哪些殘留風險。
- 是否已經可以 render。
```

## 06. Render Prompt

```
請把目前 HyperFrames 專案 render 成 MP4。

流程：
1. 先跑 npm run check。
2. 若 check 有錯，先修到通過。
3. 再執行 npm run render。
4. 回報輸出的 MP4 路徑。

如果 render 失敗，請先跑 npx hyperframes doctor，根據環境錯誤提出最小修正。
```

### Visual Beats Library

30 秒 demo 建議挑 7 個 beat：

1. Hook：Typewriter 或 Big Kinetic Text。
2. Input：Prompt Box 或 Command Palette。
3. Build：File Cards 或 Progress Stack。
4. Terminal：Command Run 或 Log Output。
5. Preview：Canvas Reveal 或 Timeline Scrub。
6. Inspect：Error Highlight 或 Fix Pass。
7. Render：Export Bar 或 MP4 Card。

## 常用 Beat

| Beat | 用途 | 畫面 | Motion |
| --- | --- | --- | --- |
| Typewriter Input | 開場、prompt 輸入、搜尋框 | 大型 input field，游標閃爍，文字逐字輸入 | 每 0.04 到 0.08 秒出現一個字 |
| Cursor Hover | 讓 UI 看起來真的被操作 | 游標移到卡片或按鈕 | 卡片 scale 1.03，邊框變重點色 |
| Click Ripple | 送出 prompt、選取模式、開始 render | 按鈕被點擊 | pressed state + ripple |
| Command Palette | 選擇工具、建立專案、切換模式 | Cmd+K palette | slide up、搜尋、高亮選項 |
| File Cards Build | 呈現 Codex 產出多個檔案 | `DESIGN.md`、`script.md`、`storyboard.md`、`index.html` | 卡片依序 pop in |
| Terminal Command | Build、check、render 的工程感 | terminal panel | command 逐字輸入，output 逐行出現 |
| Timeline Scrub | 展示影片是可控時間結構 | 多軌 timeline、playhead、keyframe dots | playhead scrub，keyframes 依序點亮 |
| Drag And Snap | 排版、對齊、修正 timeline | 元件被拖曳到 grid | alignment guide 閃一下 |
| Preview Reveal | 第一次看到成果 | skeleton preview 到完成畫面 | mask wipe，Ready badge 出現 |
| Inspect Highlight | 呈現檢查與修正 | 問題標紅，再修正 | warning outline -> success outline |
| Render Export | 結尾前成果感 | render panel、progress、MP4 card | progress 到 100%，MP4 card 彈出 |
| CTA Lockup | 結尾記憶點 | 品牌字、slogan、CTA pill | 主標上滑，CTA pop，最後定格 |

## Visual Beat Prompt 範例

```
請加入 terminal command beat：輸入 `{command}`，下方依序出現 3 到 5 行 output，最後以成功狀態收尾。terminal 不要太小，手機上要讀得清楚。
```

```
請加入 timeline scrub beat：底部有 3 條 track，playhead 掃過時 keyframe dots 依序亮起，對應畫面中的文字、卡片、按鈕同步變化。
```

```
請做 drag and snap：游標拖動「{元件}」到正確位置，接近時出現對齊線，放開後元件 snap 到 grid，不要讓元件蓋住主字幕。
```

```
請用 render export beat 收尾：顯示 render progress，完成後生成一張 MP4 file card，檔名為 `{檔名}`，旁邊有 success check。
```

### 30 秒 Timeline

最小可行結構：`Hook -> Input -> Build -> Preview -> Inspect -> Render -> CTA`。

## 基礎版：30 秒 Demo

| Time | 節奏 | 畫面任務 | 建議文案 |
| --- | --- | --- | --- |
| 0-3s | Hook | 用一句話點出痛點或新鮮感 | `影片也能用 HTML 控制。` |
| 3-6s | Input | 顯示 prompt input 或 command palette | `先輸入一個主題。` |
| 6-9s | Spec | 產出 DESIGN / SCRIPT / STORYBOARD | `規格先變成檔案。` |
| 9-13s | Build | file cards 生成 HTML composition | `畫面變成 composition。` |
| 13-17s | Timeline | 展示 keyframes / tracks / playhead | `動畫變成 timeline。` |
| 17-21s | Preview | preview canvas reveal | `先預覽，再修改。` |
| 21-24s | Inspect | highlight 一個問題並修正 | `跑版，交給 inspect 抓。` |
| 24-27s | Render | terminal render + progress bar | `最後輸出 MP4。` |
| 27-30s | CTA | 主題、slogan、下一步 | `改一個主題，練一次。` |

## 可直接貼的 Timeline Prompt

```
請把我的主題改寫成 30 秒 HyperFrames demo timeline。

主題：{主題}
觀眾：{觀眾}
核心訊息：{核心訊息}

請使用這個結構：
0-3s Hook
3-6s Input
6-9s Spec / Files
9-13s Build
13-17s Timeline
17-21s Preview
21-24s Inspect / Fix
24-27s Render
27-30s CTA

每段請輸出：
- On-screen copy：不超過 16 個中文字。
- Visual beat：從 input、click、terminal、file cards、timeline scrub、preview reveal、inspect highlight、render export 中選。
- Motion：一句話說明進場與轉場。
- Risk：這段最容易跑版或太無聊的地方。
```

## 節奏配方

### 穩定教學版

- 0-3s：Big Kinetic Text
- 3-6s：Typewriter Input
- 6-9s：File Cards Build
- 9-13s：Terminal Command
- 13-17s：Timeline Scrub
- 17-21s：Preview Reveal
- 21-24s：Inspect Highlight
- 24-27s：Render Export
- 27-30s：CTA Lockup

### 高速社群版

- 0-2s：Big Kinetic Text
- 2-5s：Command Palette
- 5-8s：Click Ripple + File Cards
- 8-12s：Layer Stack
- 12-16s：Timeline Scrub
- 16-20s：Before / After Match
- 20-24s：Render Export
- 24-27s：Preview Montage
- 27-30s：CTA Lockup

### Fix Prompts

## 互動感不足

```
目前這支 HyperFrames 影片看起來太像靜態簡報，請提升互動感。

請檢查 storyboard 與 index.html，至少挑 4 幕加入明確操作：
- input typing
- cursor hover
- click ripple
- drag and snap
- terminal command output
- timeline scrub
- preview reveal
- render export

限制：
- 不改變核心文案。
- 不新增外部素材。
- 每個互動都要有起因與結果，不要只是裝飾動畫。
- 手機安全區內的主字幕不可被遮擋。

請修改後說明每一幕新增了哪個 interaction beat。
```

## 畫面跑版 / 文字溢出

```
請修正目前 HyperFrames composition 的跑版與文字溢出問題。

請優先檢查：
- 主字幕是否超出 1080x1920 canvas。
- 中文是否被固定寬高截斷。
- 卡片內文字是否溢出容器。
- 裝飾元素是否遮住主字幕。
- content container 是否使用不安全的 absolute positioning。

修正原則：
- 先用 CSS 建立每幕最清楚的 hero frame，再調整動畫。
- content container 盡量使用 width: 100%、height: 100%、padding、flex、gap、box-sizing: border-box。
- 只讓裝飾元素 absolute positioning。
- 必要時縮短文案，但不要改掉核心意思。

請修完後跑 npm run check，並回報修正結果。
```

## 風格不一致

```
目前影片風格不夠一致，請根據 DESIGN.md 統一視覺語言。

請檢查：
- 是否使用 DESIGN.md 以外的主要顏色。
- 字體、字重、標題大小是否忽大忽小。
- 卡片圓角、邊框、按鈕樣式是否一致。
- accent color 是否用在 active state、CTA、游標、重點字，而不是到處亂用。
- 場景之間是否像同一支影片。

請修正 index.html 的 CSS 與必要的 class 命名。
不要重寫整支影片，只修風格一致性。
```

## 資訊過載

```
目前畫面資訊太多，請做資訊減量。

請逐幕檢查：
- 每幕是否只保留一個主訊息。
- 主字幕是否超過 16 個中文字。
- 同一秒是否同時出現太多 label、badge、card、terminal output。
- UI 文字是否可以改成 icon、status 或短 label。

修正方式：
- 刪掉重複說明。
- 把長句拆成兩幕。
- terminal output 最多保留 5 行。
- 卡片內文改成 1 行摘要。
- 重要資訊用 stagger 依序出現，不要一次全上。

請保留影片原本的核心訊息與節奏。
```

## HyperFrames Timeline / Track 錯誤

```
請修正 HyperFrames timeline 與 track 錯誤。

請檢查：
- 每個 visible timed element 是否有 class="clip"。
- 每個 clip 是否有 data-start、data-duration、data-track-index。
- 同一 data-track-index 是否有重疊 clip。
- root composition 是否正確使用 data-composition-id、data-width、data-height。
- GSAP timeline 是否 paused 並註冊到 window.__timelines。
- 是否有空 tween 只為了撐 duration。

請跑 npm run check，依錯誤逐項修正。
修正時不要移除必要 scene，只調整 track index、duration 或 timeline 註冊。
```

## Render 失敗

```
HyperFrames render 失敗，請幫我排查。

請依序做：
1. npm run check
2. npx hyperframes doctor
3. 檢查 package.json scripts
4. 檢查 index.html 是否有不可重現邏輯或外部資源
5. 再嘗試 render

請只做最小必要修正，不要重寫整個 composition。
最後回報失敗原因、修正內容、MP4 是否成功輸出。
```

### 課後練習

先拿同一個模板改三個主題：

- 工具介紹：把一個 AI 工具講清楚。
- 產品功能：把一個功能拆成「問題 -> 操作 -> 結果」。
- 個人作品：把一個 project 做成短影片展示。

每次只改一個變因：主題、視覺風格、節奏或 CTA。這樣比較容易知道哪個改動真的讓影片變好。

### 最終檢查清單

- 第一秒有沒有清楚視覺鉤子。
- 第五秒前有沒有說清楚影片在做什麼。
- 每 3 到 4 秒有沒有一次視覺狀態變化。
- 有沒有至少 6 個互動 beat。
- 主字幕是否每幕只講一件事。
- Preview 與 Render 是否真的給觀眾成果感。
- CTA 是否是下一步行動，不只是口號。
- `npm run check` 是否通過。
- 是否成功輸出 MP4。

### **範例1.影片 + TTS + 字幕短影音教學組合技**

這份流程用來把一支長影片或演講，整理成 30-60 秒的 Reels / Shorts：先找主軸，再剪掉廢話，最後加字幕、TTS、UI 動畫和封面使用方式：

[https://drive.google.com/file/d/13703ndCHNPh0cvhSylW_g1OK2r06V7F6/view?usp=sharing](https://drive.google.com/file/d/13703ndCHNPh0cvhSylW_g1OK2r06V7F6/view?usp=sharing)

1. 用 .srt 先理解內容和找時間碼。
2. 用原始影片確認字幕錯字、專有名詞和口氣。
3. 剪輯時刪掉 um、重複字、停頓、沒有資訊量的句子。
4. 保留原音時，影片和 audio clip 要用同一組 data-start / data-media-start。
5. 若要改成 TTS，就用逐字稿重寫成旁白，再用 TTS 音檔取代原音。

## **1. 先抓主軸**

先把整支影片壓成一句話。

範例：

`Claude 成長速度超出預期，compute 成為瓶頸，團隊正在加速取得更多算力。`

提示詞：

`請理解這支影片和逐字稿，幫我找出最適合剪成 60 秒 Reels 的主軸。
請輸出：核心敘事、爆點、要保留的段落、要刪掉的段落。`

## **2. 做 60 秒剪輯表**

建議結構：

`0-3s：冷開場 hook
3-18s：第一個爆點或數字
18-32s：問題或瓶頸
32-47s：解法或下一步
47-60s：反差結尾或 takeaway`

這支影片的版本：

`0-3s：Claude 成長快到 compute 跟不上？
3-18s：第一季年化約 8x growth
18-32s：原本規劃到 10x，仍遇到 compute 壓力
32-47s：正在取得更多 compute，拿到就釋放給用戶
47-60s：希望回到「mere 10x」的反差結尾`

## **3. 字幕處理**

字幕原則：

- 中文主字幕最大
- 英文只保留關鍵原句
- 每行中文 14-18 字內
- 不放 um、口吃、重複字
- 專有名詞要人工確認：8x、10x、compute

提示詞：

`請把逐字稿整理成短影音字幕。
中文為主，英文只保留關鍵句。
刪掉口吃、um、重複字。
每句請附剪後時間碼。`

## **4. TTS 腳本**

如果不用原音，可以把內容改寫成 TTS。

TTS 寫法：

- 一句 8-18 個中文字
- 每 2-4 秒一個重點
- 不要照念逐字稿
- 像短影音旁白，不像文章

範例：

`Claude 的成長，比預期更快。
CEO 提到，第一季年化約 8 倍。
問題不是沒有需求。
而是 compute 開始跟不上。
他們原本規劃到 10 倍成長。
但需求還是衝得太快。
AI 產品的瓶頸，正在變成算力供給。`

## **5. UI 動畫設計**

互動感要服務內容，不要堆小字。

這支影片的 UI 對應：

`講 8x growth：出現大型 8x metric card，bar chart 上升
講 10x plan：出現 10x capacity card，進度條接近上限
講 compute：出現 acquire more compute queue
講 as soon as possible：queue 從 running 變成 pass to users
結尾：只留一句大 takeaway`

避免：

- 上下方小字
- 太多 dashboard 同時出現
- 手機看不清的 label
- 進度條搶畫面
- 霓虹、粒子、厚重科技感

## **6. 封面**

封面只要一眼看懂。

建議文案：

`Claude 成長太快？
Compute 成為瓶頸
8x growth`

AI 郵報風提示詞：

`請生成 9:16 Reels 封面，AI 郵報設計風格。
溫暖白紙背景、細黑線、現代報紙版面、低彩度。
主標題：Claude 成長太快？
副標題：Compute 成為瓶頸
加入大數字 8x 和 compute pressure 資訊框。
不要官方 logo，不要霓虹，不要科技藍紫漸層。`

## **7. HyperFrames 實作順序**

檔案結構：

`claude-ceo-reels/
  index.html
  DESIGN.md
  assets/
    claude-ceo-speech.mp4
    narration.wav
    captions.srt
  renders/
    claude-ceo-reels.mp4
    cover.png`

實作流程：

`1. 匯入影片和字幕
2. 根據字幕建立剪輯清單
3. 在 index.html 建立 1080x1920 composition
4. 放 video track
5. 放 audio track 或 TTS track
6. 放中英字幕
7. 放大型 UI cards
8. 加入簡短動畫
9. lint / inspect
10. render`

常用指令：

`hyperframes lint
hyperframes inspect --samples 15
hyperframes render --output renders/claude-ceo-reels.mp4 --quality standard
ffprobe -v error -show_entries format=duration,size:stream=width,height,r_frame_rate,codec_type,codec_name -of default=noprint_wrappers=1 renders/claude-ceo-reels.mp4`

## **8. 最後檢查**

發布前確認：

- 前 3 秒有 hook
- 靜音也看得懂
- 字幕夠大
- 沒有小字干擾
- 聲音和畫面同步
- 沒有剪接黑格
- 8x、10x、compute 正確
- UI 動畫跟講話內容同步
- 封面在手機上能一眼看懂

### **範例2.APP 動畫介紹影片**

這份範例以「多音字學堂」9:16 Reels 產品影片為模板，可套用到其他 App 介紹、教學、功能展示影片。

https://drive.google.com/file/d/1n0u66Rbgfs9hEADX_U2ebm9mQSZkgt4-/view?usp=sharing

## **1. 影片規格先鎖定**

- 尺寸：1080 x 1920
- 比例：9:16
- 長度：20-24 秒
- 幀率：30fps
- 觀看情境：手機直式短影音，必須靜音也看得懂
- 主要目的：讓使用者快速知道「這個 App 做什麼」和「怎麼操作」

## **2. 腳本節奏模板**

| **時間** | **畫面** | **文案** | **Motion** |
| --- | --- | --- | --- |
| 0-2s | 痛點或關鍵畫面快速出現 | 一秒看懂主功能 | 快速閃入、聚焦手機 |
| 2-5s | App 首頁或分類頁 | 核心功能總覽 | 卡片 stagger 進場 |
| 5-8s | 點擊第一層功能 | 先選類型 | 小手游標、tap ripple |
| 8-11s | 進入列表或搜尋結果 | 再找目標內容 | 列表滑入、重點卡片高亮 |
| 11-17s | 詳情頁或主要功能頁 | 一頁看懂重點 | 重點元件 pulse、內容逐步出現 |
| 17-20s | 連續操作 | 可以快速切換/複習 | swipe、按鈕高亮、進度跳動 |
| 20-24s | 回到產品主畫面 | 品牌 + 一句價值 | 手機定格、CTA 收尾 |

## **3. 畫面比例原則**

- App 產品畫面要是主角，手機 mockup 至少占畫面寬度的 70-78%。
- 不要只把整個手機放大，App 內部元件也要同步放大。
- 手機框比例要貼近真機，避免做成太寬的「平板感」。
- 上方標題區要壓縮，不能吃掉產品畫面高度。
- 底部字幕不要壓住 App UI，應放在安全區或手機外。

## **4. UI 元件放大建議**

以原本 mobile app 為基準：

- Header：比原型放大約 1.2-1.4x
- 列表卡片：高度要足夠，短影音中建議 110-130px
- 主標題/大字：可以放大到視覺焦點，但不要壓縮詳情內容
- 注音/標籤/按鈕：短影音裡要比產品原型更清楚
- 詳情文字：只展示重點，不要塞滿整頁

## **5. 互動 Motion 範例**

推薦保留：

- 小手游標點擊
- 點擊 ripple
- 卡片輕微放大
- 頁面橫向 swipe
- 注音/重點標籤 pulse
- 底部按鈕點擊高亮
- 進度數字跳動

避免：

- 額外加產品原本沒有的線條或裝飾
- 讓高亮卡片放大到碰到邊界
- 字幕蓋住 App 內容
- 動效太多導致看不懂操作流程

## **6. HyperFrames 實作流程**

1. 建立 DESIGN.md
    - 寫清楚顏色、字體、motion 風格、不要做什麼。
2. 建立 index.html
    - data-composition-id
    - data-width="1080"
    - data-height="1920"
    - data-duration="24"
3. 用 CSS 先排好最終畫面
    - 先做靜態 layout，再加 GSAP。
    - 不要一開始就靠動畫定位。
4. 用 GSAP 控制時間線
    - 所有 timeline 都要 paused: true
    - 註冊：window.__timelines["duoyin-reels"] = tl
5. 檢查 layout

`hyperframes lint
hyperframes inspect --samples 24`

1. 輸出影片

`hyperframes render --output renders/duoyin-reels.mp4 --fps 30 --quality standard --workers 1`

1. 開啟工作台

`hyperframes preview --port 3020`

## **7. 成品檢查清單**

- 影片是 1080x1920
- 長度約 20-24 秒
- App 畫面是第一視覺主角
- UI 字夠大，手機預覽也能看清楚
- 沒有產品原本不存在的奇怪線條或圖形
- 字幕沒有蓋到 App UI
- 點擊指示器是游標或小手，不是難懂符號
- 每 2-4 秒 有一個清楚狀態變化
- 靜音觀看也能理解操作流程

## **8. 可直接套用的短影音文案**

`多音字，一秒查清楚
6 大類整理讀音規則
先選類型
再點要查的字
讀音、詞例、意思，一頁對照
左右切換，連續複習
多音字學堂｜把讀音規則變好查`

## **9. 這次專案的重點修正紀錄**

- 手機畫面放大，避免產品看起來太小。
- 改成更接近真手機 App 的窄長比例。
- App 內元件同步放大，而不是只放大外框。
- 把點擊符號從閃電改成小手。
- 移除產品原本沒有的藍色連線。
- 底部字幕移到更安全的位置，避免壓住 UI。

### **範例3.寵物 IG 衝出螢幕教學**

影片範例：[https://drive.google.com/file/d/1n6-fTqs3p2jgF6p45487kLjKOdJNg8xO/view?usp=drive_link](https://drive.google.com/file/d/1n6-fTqs3p2jgF6p45487kLjKOdJNg8xO/view?usp=drive_link)

**1. 準備素材**

先準備 3 種素材：

- 寵物原始照片
    
    盡量選臉部清楚、毛色明顯、眼睛有神的照片。
    
- ChatGPT 生成後的成效圖
    
    也就是「寵物從手機 IG 畫面衝出來」的超寫實圖片。
    
- Gemini 生成的動態影片
    
    把成效圖延伸成「狗狗突破手機螢幕」的動態版本。
    

**2. 用 ChatGPT 生成圖片**

打開 ChatGPT，上傳寵物照片，貼上提示詞：

```
請把我上傳的寵物照片，製作成「寵物從手機 IG 畫面衝出來」的超寫實風格圖片。

圖片需求：
使用 iPhone 畫面構圖
寵物要有「衝出螢幕」的立體效果
前腳／肉球朝鏡頭伸出
寵物動作自然流暢
加入玻璃碎裂飛散特效
背景是宇宙風格
畫面有柔焦與景深效果
保留原本寵物的臉型、毛色、眼睛特徵
IG 帳號名稱改成「XXX」
IG 頭像同步使用同一隻寵物
整體風格像高級 Instagram 廣告
超寫實、4K、毛髮毛流自然真實
直式 9:16 手機桌布比例
```

生成後檢查 4 件事：

- 寵物臉型、毛色、眼睛是否像原圖
- 前腳或肉球是否有朝鏡頭伸出
- 手機 IG 畫面和玻璃碎裂是否明顯
- 背景是否有宇宙感、景深和廣告質感

**3. 用 Gemini 生成動態影片**

把 ChatGPT 生成好的成效圖上傳到 Gemini。

可以輸入類似這樣的指令：

```
請將這張圖片製作成一段直式 9:16 動態影片。

畫面中狗狗要像真的從手機 IG 螢幕裡衝出來，前腳朝鏡頭伸出，玻璃碎片向外飛散，背景有宇宙光效與景深。鏡頭可以有輕微推近和震動，整體要像高級 Instagram 廣告，動作自然流暢，超寫實。
```

生成後選擇最流暢的一版，建議長度控制在 3 到 6 秒，方便放進 Reels 中段當高潮。

**4. 規劃 Reels 分鏡**

這支影片可以切成 6 段：

1. 開場 Hook
    
    顯示原圖和成效圖對比。
    
    字幕：
    
    「這張寵物照，變成 IG 衝出螢幕」
    
2. Prompt 重點
    
    顯示提示詞或關鍵詞。
    
    字幕：
    
    「重點不是長，是畫面指令夠精準」
    
3. ChatGPT 操作模擬
    
    模擬上傳照片、貼上 prompt、生成圖片。
    
    字幕：
    
    「上傳照片，貼上 prompt，請 ChatGPT 生成」
    
4. 圖片成果展示
    
    放大展示 ChatGPT 生成後的圖片。
    
    字幕：
    
    「手機、玻璃、宇宙背景，把立體感撐起來」
    
5. Gemini 動態成果
    
    插入 Gemini 生成的動態影片。
    
    字幕：
    
    「圖片完成後，再拿去做動態延伸」
    
6. 製作流程懶人包
    
    用 5 步驟收尾。
    
    字幕：
    
    「準備素材 → ChatGPT 出圖 → Gemini 做動態 → HyperFrames 剪 Reels → Render 輸出」
    

**5. 用 HyperFrames 製作影片**

把素材放進 HyperFrames 專案：

- 原始寵物照
- ChatGPT 成效圖
- Gemini 動態影片
- 背景、字幕、特效元素

影片規格建議：

- 比例：9:16
- 尺寸：1080 x 1920
- 長度：20 到 30 秒
- 幀率：30fps
- 風格：高級 Instagram 廣告、宇宙背景、玻璃碎裂、超寫實

**6. 安排畫面節奏**

節奏可以這樣抓：

- 0 到 3 秒：用大標題和前後對比抓注意力
- 3 到 7 秒：快速展示 prompt 重點
- 7 到 11 秒：模擬 ChatGPT 操作流程
- 11 到 14 秒：放大展示圖片成品
- 14 到 18 秒：插入 Gemini 動態影片
- 18 秒後：收尾懶人包和收藏提醒

重點是每一段都不要停太久，文字要大，畫面要有推近、彈跳、點擊或光效，讓觀眾有「一直往下看」的節奏。

**7. 加入互動感與特效**

可以加入：

- 點擊游標
- 送出按鈕動畫
- ChatGPT 生成中的打字點點
- 圖片放大推近
- 玻璃碎片飛散
- 3D 星塵或光環
- Gemini 影片段落的動態衝擊
- 最後 CTA 按鈕：收藏這套流程

這些特效的目的不是炫技，而是讓觀眾看懂流程，並覺得「我也可以照做」。

**8. 檢查成片**

輸出前確認：

- 所有中文字都有清楚顯示
- 字幕沒有超出畫面
- 圖片和影片比例沒有變形
- ChatGPT 流程看得懂
- Gemini 動態段落有出現
- 最後懶人包步驟完整
- 整支影片是直式 9:16

**9. Render 輸出**

最後用 HyperFrames render 成 MP4。

建議輸出：

- 1080 x 1920
- MP4
- 30fps
- 適合 Reels / Shorts / TikTok 上傳

**10. 發佈文案可以這樣寫**

```
把寵物照變成 IG 衝出螢幕大片。

流程：
1. 上傳寵物照到 ChatGPT
2. 貼上 Prompt 生成圖片
3. 用 Gemini 做成動態影片
4. 用 HyperFrames 剪成 Reels

Prompt 已整理好，收藏下次直接套用。
```

### 其他Motion範例

[範例包.zip](%E8%AA%B2%E5%BE%8C%20Prompt%20&%20%E8%B3%87%E6%BA%90%E6%87%B6%E4%BA%BA%E5%8C%85%EF%BC%9ACodex%20%C3%97%20HyperFrames%2030%20%E7%A7%92%20Demo/%E7%AF%84%E4%BE%8B%E5%8C%85.zip)