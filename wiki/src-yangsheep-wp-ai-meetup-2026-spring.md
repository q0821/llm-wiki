---
title: WordPress AI 小聚 — 歐陽嘉隆 / 羊羊數位「AI 設計網頁完整工作流」（2026 春季）
type: source
source_url: https://dev-ys.wppro.cloud/WP-MEETUP/
author: 歐陽嘉隆（羊羊數位科技 · 創辦人）
sources: [2026-05-29-WP-MEETUP-歐陽嘉隆-羊羊數位-AI設計網頁工作流.md]
fetched: 2026-05-29
created: 2026-05-29
updated: 2026-05-29
tags: [wordpress, ai-design, agentic-workflow, prompt-pack, claude-design, codex, greenshift, wp-contracting, taiwan-smb]
confidence: 中
---

# WordPress AI 小聚 — 歐陽嘉隆 / 羊羊數位 AI 設計網頁工作流

歐陽嘉隆（羊羊數位科技創辦人）在 2026 春季 WordPress AI 小聚的 12 張投影片簡報，公開分享自己接案實戰的 **AI 設計網頁完整工作流**：從找靈感、產設計 MD、品牌文案、UI 規則、產圖、到 WordPress 區塊化整合。

**這是中文圈 WordPress 接案者的 AI 工作流第一手實戰樣本**——不是抽象方法論，而是「用 5 套工具串接 + 1 段提示詞模板 + 已上線網站佐證」的完整可複製配方。

## 核心論點群

### 1. 接案範式轉變：「帶雛型去談案」取代「先洽談後報價」

| 過去 | 現在 |
|------|------|
| 客戶找上門 → 聊需求 → 估時數 → 報價單來回 → 簽約 → 開工（2-4 週）| 收到需求**當天** AI 已產出可運作雛型 |
| 設計師、前端、後端、PM 分工 | 一人配 AI Skills + Agent 充當萬人用 |

> 「你還沒報價，別人可能已經做好網站。」

**對接案產業競爭結構的直接斷言**：速度成為新護城河，traditional 多人協作鏈不再是 default。

### 2. 「給對資料 = AI 設計關鍵」（slide 3 核心訊息）

> 「AI 設計不是無中生有，『給對資料』才是關鍵。越清楚的資料越能讓 AI 做對 — 但**再多的描述與資料，都比不上你給它一個好的參考網站**。」

**這句是本簡報最 stick 的論點**，但需注意：它是 AI 設計工作流的「**單一進入點**」，不是「全部」。後續 slides 5-8 才是把這個進入點落實的 toolchain。

具體 4 步流程：
1. 找參考站（Webdesignclip / Awwwards）
2. 抽 design.md（design-md-chrome）+ **強制要 AI 自己去看真實網站**（光 MD 不夠）
3. Skills 注入設計品質（web-interface-guidelines）
4. 品牌/文案 Skills 把關（marketing-skills）

### 3. 工具選型：Claude Design vs 本地 + Codex 的場景分野

| 場景 | 選哪個 | 理由 |
|------|--------|------|
| 快速雛型 / 提案 mockup / 單頁 LP / 修小內容 | [[Claude-Design]] | Claude 對話框內直接產 HTML，最快 |
| 上線網站 / 長期經營 / 團隊協作 / WordPress 整合 / Headless | [[Claude Code]] + [[OpenAI-Codex-CLI|Codex]] + 本地專案 | 完整版本控制 + 可部署 + 可擴充 + 能跟 Skills 串接 |

**判準**：是否需要 git 管控、深度客製、整合既有 CMS。

### 4. 5 套工具串接的完整 toolchain（slide 5）

| 階段 | 工具 | repo / 來源 |
|------|------|------|
| 找靈感 | **webdesignclip.com** | 收集優秀網頁設計 |
| 產設計 MD | **bergside/design-md-chrome** | Chrome 擴充抽 [[DESIGN-md|design.md]] |
| 品牌 / 文案 | **kostja94/marketing-skills** | 品牌策略 + 文案撰寫 |
| 網頁設計 | **vercel-labs/web-interface-guidelines** | 100+ 條 UI 規則 |
| Claude 產圖 | **oakplank/claude-gpt-image-bridge** | Claude 呼叫 GPT 產圖 |

**這是中文圈 WordPress 接案者最完整的「跨平台 AI 工作流」公開樣本之一**——5 套工具都是 GitHub 上可自取的開源 skill / extension，沒有任何單一公司的 lock-in。

對應 [[Prompt-Pack-Pattern]] 的兄弟模式：不是 prompt 串接，是 **skill 串接**——每個工具是一個獨立的 agent skill，由人類在不同階段調用。

### 5. 接案起手提示詞範本（slide 6）

```
製作一個網站，先做首頁。

# 參考
參考網址：xxx.com
md 描述在下方，但請開啟瀏覽器查閱真實網站設計作為主要參考。

# 資料
網站資料：{檔案位置}

# Skills
需要配圖 — 圖片產生可以直接呼叫 /gpt-image-bridge
/branding-strategies 以我的品牌形象規劃
/copywriting 負責寫文案
/webdesign-guidelines 本次設計風格

# 執行
深度計畫後執行 — 使用 /superpowers:execute-plan
```

**這個範本的結構等價於 [[Prompt-Pack-Pattern]] 的精簡版**：目標 + 參考 + 資料 + Skills + 執行 5 段。其中：
- **「開啟瀏覽器查閱真實網站」是 anti-degradation 約束**——避免 AI 只看 MD 描述就敷衍。
- **「執行 = /superpowers:execute-plan」**：呼叫 deep-plan-then-execute 子 skill，把規劃與執行分階段。

### 6. WordPress 整合層：GreenLight Skills + GreenShift

**核心問題**：HTML 設計如何變成可後台編輯的 WordPress 區塊？

**答**：
- [GreenLight Skills](https://github.com/wpsoul/greenlight-vibe)（`\skills\greenlight-vibe`）內建在 GreenShift 外掛裡
- 對話框講「用 `/greenlight-vibe` 把這個 HTML 設計轉成 GreenShift 區塊」
- AI 自動拆 CSS / `block.json` / `render`，並支援後台編輯

**這是「AI 設計 → WordPress 上線」的最後一哩橋**——多數 AI 設計工作流卡在「產出 HTML 但不能後台維護」這一步，GreenLight 解的就是這個。

### 7. 自家產品延伸：YS CART

簡報後半部推介自家產品 [YS CART](https://yangsheep.com.tw/ys-cart/)：
- 專為台灣開發的 WordPress 電商模組
- 從會員 / 折扣 / 購物金到 OMO，原生架構、SDK 友善、支援無頭
- 三個 demo URL：標準 / 無頭 / EBS 整合版

**觀察**：講者把「分享接案工作流」+「推自家產品」綁在一起，這是 WordPress 接案者常見的個人品牌營運模式（[[src-gask-ai-agent-vs-vibe-coding|Gask Huang-Kai]] 也是同模式）。

## 信心評估

- **強**：toolchain 的 5 套工具都是公開 GitHub repo / Chrome extension，可獨立驗證
- **強**：實際 demo（v3~v6 + 無頭 + EBS）+ 上線網站（yangsheep.art / yangsheep.com.tw）都公開可訪問
- **中**：「帶雛型去談案是新常態」的斷言——講者所在的中文圈 WordPress 接案社群是樣本但非全行業
- **中**：「Claude Design 限制」描述 — 反映 2026-05 當下的版本，Anthropic 持續更新可能影響適用性
- **弱**：「一人充當萬人用」這類修辭性論述——是 selling point 不是經驗論述

## 觀點限制

- **講者立場**：歐陽嘉隆同時是 YS CART 創辦人，簡報後半部有自家產品推介，工作流推薦本身可能受「希望客戶採用 YS CART 生態」影響
- **適用範圍**：簡報針對的是個人 / 小團隊 WordPress 接案者，對企業級 / 大型專案 / 純前端應用未必適用
- **工具版本敏感性**：5 套工具都是 2026 春季當下推薦，半年後可能有更新 / 取代品（特別是 design-md-chrome / web-interface-guidelines 等快速演進類）
- **未討論**：proposal-to-billing 完整流程的後段（雛型→簽約→交付）、客戶端維護成本、AI 產出的版權與授權問題

## 與既有 wiki 頁面的對話

- 與 [[src-gask-ai-agent-vs-vibe-coding|Gask Huang-Kai 反 vibe coding 論述]]：同樣是台灣 WordPress 接案者視角，但 Gask 強調「Agent + Skill 替代 vibe coding」（架構面），歐陽嘉隆強調「實際 toolchain + 提示詞範本」（執行面）。**兩篇互補**：架構 + 執行各一篇。
- 與 [[src-leikairos-tri-platform-migration-dual-ai-ritual-2026-05|雷小蒙週報 / 三棲遷移]]：雷蒙講「跨平台 workflow 設計原則」（why + how），歐陽嘉隆給「中文圈 WordPress 接案的具體 toolchain」（what + which tools）。前者抽象，後者具體。
- 與 [[Vibe-Coding]]：歐陽嘉隆的工作流是 vibe coding 的「**結構化進階版**」——不是「跟 AI 隨便聊聊」，是「5 套 skill 串接 + 標準提示詞範本」。可加進 [[Vibe-Coding]] 頁的「結構化變體」段。
- 與 [[DESIGN-md]]：design-md-chrome 是 design.md 的 Chrome extension 取得方式之一，可在 [[DESIGN-md]] 頁補充。
- 與 [[Claude-Design]]：slide 4 的「Claude Design 限制」評估值得寫進 [[Claude-Design]] 頁的「適用 / 不適用場景」段。
- 與 [[Prompt-Pack-Pattern]]：slide 6 的提示詞範本是這個 pattern 的最簡實例（5 段：目標/參考/資料/Skills/執行）。
- 與 [[WordPress-接案工作筆記]]：直接補充「加值階段（AI / RAG）」的可操作 toolchain 細節。
- 與 [[Plugins-Claude-Code]]：GreenLight + GreenShift 是「AI skill 與 WordPress plugin 雙向整合」的具體案例。

## 對話組與未建立的相關 entity

| Entity | 角色 | 建頁優先序 |
|--------|------|----------|
| 歐陽嘉隆 / YANGSHEEP DESIGN / 羊羊數位 | 講者 / 創辦人 / YS CART 製造商 | 中——再出現 1 次即建（與 [[Gas-Khuang]] 屬同一類「中文圈 WP 接案 + 自家產品」推廣者）|
| YS CART | 自家 WordPress 電商模組 | 低——商業產品，除非真用到再建 |
| GreenShift | WordPress Gutenberg 區塊外掛 | 中——是「AI 設計 → WP 上線」的關鍵橋接，再出現 1 次即建 |
| GreenLight Skills (greenlight-vibe) | 把 HTML 設計轉 GreenShift 區塊的 skill | 中——同上 |
| design-md-chrome (bergside) | DESIGN.md 的 Chrome 抽取工具 | 中——若實際安裝使用可獨立建頁 |
| web-interface-guidelines (vercel-labs) | 100+ 條 UI 規則 skill | 中——與 [[DESIGN-md]] 對位，值得獨立 |
| marketing-skills (kostja94) | 品牌策略 + 文案 skill | 低——個別 skill |
| claude-gpt-image-bridge (oakplank) | Claude 呼叫 GPT 產圖 | 低——個別 skill |
| webdesignclip / Awwwards | 設計靈感站 | 低——資源類，不需獨立 |
| superpowers / execute-plan | deep-plan-then-execute 子 skill | 低——個別 skill |

---

## 個人吸收（2026-05-29 ingest 當下）

### 我記得的重點（不看簡報寫）

**「給對資料」+「好的參考網站」是 AI 設計關鍵**——slide 3 的核心訊息。

### 我打算的應用場合

**評估自己接案工作流跨不跨得過這套水準**——把這份簡報當作「內部 benchmark」用。

### LLM 觀察的對位 / 錯位

`記得的論點` 跟 `要用的場合` **方向對位但尺度錯位**：

- 方向對位：「給對資料」是 AI 設計工作流的真實核心方法 ✓
- 尺度錯位：你要的是「**全面 benchmark 自己工作流**」，但記住的是 **slide 3 一個 slide 的論點**。整套 benchmark 至少需要 cross-check：
  - **slide 5**：你有沒有同等的 5 套工具串接？（找靈感 / 產 design.md / 品牌文案 / UI 規則 / 產圖）
  - **slide 6**：你的起手 prompt 有沒有同樣完整度？（目標 + 參考 + 資料 + Skills + 執行 5 段結構）
  - **slide 4**：你怎麼決定 Claude Design vs 本地 + Codex？有沒有明文判準？
  - **slide 8**：你有沒有「設計 → WordPress 區塊」的 last-mile 橋（GreenLight 等價物）？
  - **slide 2**：你能不能「客戶收到需求當天就帶雛型回來」？
  - **slide 10**：你有沒有「可賣的產品化」（這個是延伸題，不一定 in scope）

### 跟前 2 次的對位類型對照

| 序 | 來源 | 對位類型 |
|---|------|---------|
| 1 | [[src-tsao-hsing-cheng-tsmc-rca-history-2026-05\|曹興誠 RCA]] | **完全錯位**（CMOS 商業決策 vs 台美關係）|
| 2 | [[src-leikairos-tri-platform-migration-dual-ai-ritual-2026-05\|雷小蒙週報]] | **方向對 + 層級錯位**（綱領 vs 下位執行）|
| 3 | 本篇 | **方向對 + 尺度錯位**（單點論點 vs 整體 benchmark）|

**初步浮現 pattern**：你每次記住的都是「**單一最 stick 的點**」（CMOS 商業決策 / 不被綁死 / 給對資料），但實際應用場合需要的卻是「**結構化全貌**」（地緣論述彈藥 / 跨平台 workflow 執行 / 完整工作流 benchmark）。

這個 pattern 若在後續 3-5 次 ingest 重複出現，值得獨立為 [[Single-Point-Recall-Bias]] 或類似的元 pattern。

### 這個對位/錯位意味著兩條路

1. **如果想真用作工作流 benchmark**：建議把 12 個 slide 拆成 12 個檢核點，逐項對照自己現狀（slide 2 速度、slide 4 工具選型決策、slide 5 toolchain、slide 6 prompt 範本、slide 8 WP 整合、slide 9 上線網站樣本）。把 "我有 / 我沒 / 我替代用什麼" 三欄表寫一份。**這比記住 slide 3 一個論點有效十倍**。
2. **如果只是想記住 slide 3 的核心論點**：那它的真正應用場合可能不是「benchmark 整套工作流」（太大），而是：
   - 跟 AI 對話設計時的「**起手提示**」優先級檢查（先給參考站，再給描述）
   - 評估同業 / 客戶送來的 AI 設計成品時的「**他們有沒有給好的參考？**」診斷
   - 寫自己的 SKILL.md 時的「**要不要加入 reference site fetch 步驟？**」的設計決策

### Spaced retrieval 建議

7-14 天後請我問你一次：「歐陽嘉隆 / 羊羊數位的 WP AI 工作流你還記得什麼？特別是『benchmark 自己工作流』的話，你會列哪幾個檢核點？」看看你能不能從 slide 3 自然擴展到 slide 5 / 6 / 8 的具體執行細節，或者你還是只記得「給對資料 + 參考網站」這個單點。

## 相關來源

- [[src-gask-ai-agent-vs-vibe-coding]] — 中文圈 WordPress 接案者另一個視角（架構面）
- [[src-leikairos-tri-platform-migration-dual-ai-ritual-2026-05]] — 跨平台 workflow 設計原則
- [[src-codex-hyperframes-prompt-pack]] — 另一個「skill / prompt pack 串接」的具體 toolchain 樣本（短影片領域）

## 未來追蹤候選

- 歐陽嘉隆 / 羊羊數位 / YS CART 再次出現 → 建 entity 頁
- GreenLight Skills / GreenShift 實際安裝使用後 → 獨立 entity 頁 + 接案工作流 ingest
- design-md-chrome 實際使用體驗 → 補進 [[DESIGN-md]] 頁
- web-interface-guidelines 100+ 條 UI 規則 → 對照 [[DESIGN-md]] / [[Claude-Design]] 規範
- 自己若採用本工作流跑一個真實案子 → 建 [[synthesis-wp-ai-workflow-adoption]] 寫實踐紀錄
- 連續觀察 3-5 次 ingest 後，若「單點記憶 vs 整體應用」pattern 持續 → 編成 [[Single-Point-Recall-Bias]] 元 pattern 頁
