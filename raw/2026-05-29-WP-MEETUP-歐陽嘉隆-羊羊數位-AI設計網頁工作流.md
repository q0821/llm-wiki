來源：https://dev-ys.wppro.cloud/WP-MEETUP/
活動：YANGSHEEP DESIGN · 2026 春季 WordPress AI 小聚
講者：歐陽嘉隆（羊羊數位科技有限公司 · 創辦人）
共 12 張投影片
fetched：2026-05-29

---

## Slide 0 [封面]
YANGSHEEP DESIGN · 2026 春季 WordPress AI 小聚
交流 · 學習 · 分享 — 一起讓 WordPress 社群更好。
講者：歐陽嘉隆 · 羊羊數位科技

## Slide 1 [個人介紹]
歐陽嘉隆 · 羊羊數位科技有限公司 · 創辦人
- 10 多年前因一份網管工作接觸快速架站領域，學了 Joomla 與 WordPress，一路斷續接案到現在。
- 從打帶跑到成立公司，中間也遇到一些大型專案 — 後續走向自己建伺服器、提供服務。
- 現在的工作 = 接案 × WordPress 主機 × WooCommerce 外掛 × AI 工作流。

## Slide 2 [AI 對我們的影響]
**時代轉折 — AI 對我們的影響**

「不只是工具改變 — 接案的步調、合作的方式，全都跟著變。你還沒報價，別人可能已經做好網站。」

| 過去 | 現在 |
|------|------|
| 先洽談、後報價 | 帶雛型去談案 |
| 客戶找上門 → 聊需求 → 估時數 → 報價單來回 → 簽約 → 開工。一個案子從洽談到動工，常常 2–4 週。 | 收到需求當天 — AI 已經幫你做出可運作的雛型。 |
| 多人協作：設計師、前端、後端、PM 各司其職。 | 速度取向：你還沒報價，別人可能已經做好網站。一人充當萬人用：AI Skills + Agent 輔助，已經是現在進行式。 |

## Slide 3 [談談 AI 設計網頁]
**AI 設計不是無中生有，「給對資料」才是關鍵。**

越清楚的資料越能讓 AI 做對 — 但再多的描述與資料，都比不上你給它一個 **好的參考網站**。

1. **找到好的參考網站**：不要空想設計 — 從 Webdesignclip / Awwwards 找一個你欣賞的站，當錨點。
2. **搭配 MD 描述輔助**：用 design-md-chrome 抽出參考站 token，但 **強烈要 AI 自己去看真實網站**。
3. **搭配設計 Skills**：用 web-interface-guidelines 等 Skills — 快速讓 AI 理解你要的設計品質。
4. **品牌 + 文案 Skills 把關**：用 marketing-skills 控制好你的網站 **不要走鐘**。視覺一致、語氣一致。

## Slide 4 [Claude Design vs 本地設計]
**Claude Design 不錯，但本地設計 + 圖片產出效率更佳。**

沒有絕對 — 如果只是想快速產出框架 + 修內容，先用 Claude Design 是最快。
但要做出能上線、可維護、可長期經營的網站，**本地 HTML 設計 + Codex 產圖** 的組合更靈活。

**Claude Design**（在 Claude 對話框內直接產 HTML）
- 適合：快速雛型、提案 mockup、單頁 LP、修小內容
- 限制：難深度客製、難整合既有 CMS、難 git 管控版本

**本地設計 + Codex 產圖**（Claude Code + Codex + 本地專案目錄）
- 適合：上線網站、長期經營、團隊協作、整合 WordPress / Headless
- 優勢：完整版本控制、可部署、可擴充、能跟 Skills 串接

## Slide 5 [我使用的工具]
**5 個工具串成完整工作流** — 從找靈感、產設計 MD、寫品牌文案、把關 UI、到產圖。

| 用途 | 工具 | 說明 |
|------|------|------|
| 找靈感 | webdesignclip.com | 收集優秀網頁設計 |
| 產設計 MD | bergside/design-md-chrome | Chrome 擴充抽 design.md |
| 品牌 / 文案 | kostja94/marketing-skills | 品牌策略 + 文案撰寫 |
| 網頁設計 | vercel-labs/web-interface-guidelines | 100+ 條 UI 規則 |
| Claude 產圖 | oakplank/claude-gpt-image-bridge | Claude 呼叫 GPT 產圖 |

## Slide 6 [我的提示詞]
**「這是我跑新網站案子時，第一句話。把目標、參考、資料、Skills 一次說清楚 — AI 不用反問你。」**

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

## Slide 7 [DEMO]
從 v3 到 v6 的設計迭代、無頭購物車、以及搭配 EBS 的版本。每個按鈕點下去都會新分頁開啟。

- DEV-YS · v3：dev-ys.wppro.cloud/v3/
- DEV-YS · v4：dev-ys.wppro.cloud/v4/
- DEV-YS · v5：dev-ys.wppro.cloud/v5/
- DEV-YS · v5-2：dev-ys.wppro.cloud/v5-2/
- DEV-YS · v6（最新）：dev-ys.wppro.cloud/v6/
- YS CART · 無頭版：dev-yscart.wppro.cloud
- EBS 整合版 · v4-index：dev-ys.wppro.cloud/ebs/v4-index.html

## Slide 8 [GreenLight + GreenShift]
**把 AI 設計變成 WordPress 區塊** — GreenLight Skills 內建在 GreenShift 外掛裡，路徑：`\skills\greenlight-vibe`。

- GreenLight Skills：github.com/wpsoul/greenlight-vibe — 把設計變 GreenShift 區塊的 Skills
- GreenShift 外掛：wordpress.org/plugins/greenshift-... — 免費版 Gutenberg 區塊與動畫

**怎麼用**：在 Claude / Codex 對話框講「用 /greenlight-vibe 把這個 HTML 設計轉成 GreenShift 區塊」— AI 會自動拆 CSS / block.json / render，並支援後台編輯。

## Slide 9 [成品]
這兩個都是用上面這套工作流跑出來的真實上線網站 — 不是 demo，是公司日常運營中的站。

- yangsheep.art — 創意 / 個人作品集
- yangsheep.com.tw — 羊羊數位科技 · 公司主站

## Slide 10 [YS CART 介紹]
**YS CART 是什麼？為什麼我們要做它？**

專為台灣開發 — 從會員 / 折扣 / 購物金到 OMO，原生架構、SDK 友善、支援無頭。土生土長台灣團隊多年累積。

- 產品介紹：yangsheep.com.tw/ys-cart/
- 標準 DEMO：dev-newecommerce.wppro.cloud
- 無頭 DEMO：dev-yscart.wppro.cloud（HEADLESS 架構示範）

## Slide 11 [感謝 + 贊助商]
小聚贊助商：
- **YS CART** — 專為台灣開發的 WordPress 電商模組 — 完整功能、原生設計、支援無頭整合（yangsheep.com.tw/ys-cart/）
- **SHOPLINE Payments** — 快速付、輕鬆收 — WordPress 金流整合，外掛免費下載、特約申請流程順暢（www.shoplinepayments.com）
- **MOKSA WEB** — 專業 WordPress 網站設計開發 — 客製化設計、SEO 友善、效能優化、網站維護（moksaweb.com）

© 2026 YANGSHEEP DESIGN · 一起讓 WordPress 社群更好
