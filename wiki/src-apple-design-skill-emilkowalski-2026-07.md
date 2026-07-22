---
title: apple-design SKILL.md（emilkowalski/skills）
type: source
sources: ["skillsskillsapple-designSKILL.md at main · emilkowalskiskills · GitHub.md"]
created: 2026-07-22
updated: 2026-07-22
tags: [agent-skills, ui-design, 動畫, 互動設計, spring, 無障礙, 規範型]
confidence: 強
---

# apple-design SKILL.md

來源： https://github.com/emilkowalski/skills/blob/main/skills/apple-design/SKILL.md

作者 Emil Kowalski，以互動與動畫著稱的前端開發者（Sonner、Vaul 等 React 元件作者）。
這份 SKILL.md 把 Apple 的互動設計語彙寫成 [[Agent-Skills|Agent Skill]]，
**特點是幾乎每條規則都附具體數值或公式**，不是「要流暢」這種無法執行的形容詞。

> **擷取說明**：`fetch-url.sh` 對 GitHub blob 頁逾時；改以 WebFetch 抓 raw 檔並做結構化
> 抽取（逐字全文因版權判斷未取得）。raw/ 中保存的是結構化抽取結果，非逐字原文。

## 為什麼這份值得留

多數「設計規範型」skill 給的是原則，agent 讀完還是不知道要寫什麼數字。這份給的是
**可直接落進 CSS / Motion 參數的值**：

| 需求 | 具體值 |
|---|---|
| 預設 UI spring | damping `1.0`、response `0.3–0.4` |
| 動量／滑動 spring | damping `~0.8`、response `0.3–0.4` |
| 抽屜／sheet | damping `0.8`、response `0.3` |
| 按下回饋 | `transform: scale(0.97)` + `transition: 100ms ease-out` |
| 手勢方向閾值 | 約 `10px` |
| 動量投射 | `(v / 1000) × d / (1 − d)`，`d ≈ 0.998` |
| Rubber-banding | `(overshoot × dim × 0.55) / (dim + 0.55 × |overshoot|)` |
| 大字字距 | `-0.02em`（內文接近 0） |

## 五條最可遷移的規則

### 1. Interruptibility 是單一最重要原則

> 任何動畫必須隨時可中斷與反向；**一律從呈現值（current presentation value）動畫化，
> 不是從目標值**。

實作推論：手勢驅動的東西不要用 CSS transition / keyframes（它們不可中斷），改用 spring；
2D 運動要拆成獨立的 X、Y spring。這條解釋了「為什麼有些網頁動畫就是感覺卡」——
不是速度問題，是不可中斷。

### 2. 反饋要在 pointer-down，不是 click

延遲出現時直接操作感就消失。要稽核所有延遲來源：debounce、人工計時器、轉場等待、
歷史遺留的 ~300ms tap delay。

### 3. Velocity handoff：動畫要接住手指的速度

`relativeVelocity = gestureVelocity / (target − current)`。放手時動畫從 0 開始加速，
就是「假」的來源。

### 4. Materials：材質權重編碼層級

`backdrop-filter: blur(20px) saturate(180%)` + 半透明背景；**深色＝結構分離、
淺色＝互動引注**；不要疊多層淺色半透明；滾動邊界用漸層遮罩而非硬分隔線。

### 5. 無障礙不是事後補，是三個 media query

`prefers-reduced-motion`（淡出取代滑動、去彈性）、`prefers-reduced-transparency`
（改用不透明表面）、`prefers-contrast`（近實心背景 + 對比邊框）。
另避免全螢幕移動背景、慢速振盪（~0.2 Hz）、亮度突跳。

## 八項設計基礎（Design foundations）

Purpose（有意圖的決策）／Agency（使用者掌控、易復原）／Responsibility（使用者利益優先）／
Familiarity（建立在已知認知上）／Flexibility（適配多情境與能力）／Simplicity（剝除不必要）／
Craft（每個間距與時間都要能辯護）／**Delight（是前七項做到的結果，不是附加元素）**。

最後一條是這節的重點：愉悅感不能當成一個獨立待辦事項去「加」。

## 信心評估

- **強**：作者為該領域公認的實作者（Sonner／Vaul 作者），內容為可驗證的技術參數，
  非主觀主張；規則彼此自洽且與 WebKit／Apple HIG 的公開行為一致
- 唯一注意：這是**一家之言的濃縮**，非 Apple 官方文件；數值是作者的實務預設值，
  不同產品情境仍需調整
- 本 wiki 未實測任何一組參數

## 與本知識庫的關聯

- [[Agent-Skills]] — 形態是純 SKILL.md，無 hook 無 CLI，屬「知識注入型」skill 的範例
- [[DESIGN-md]] — 同樣是「用 Markdown 規範讓 AI 產出風格一致 UI」的路線；
  DESIGN.md 管視覺 token，本篇管**互動與動態**，兩者互補而非競爭
- [[impeccable]] — 也在管 AI 產出的前端品質，但 impeccable 是**偵測既有問題**
  （46 條規則 + audit），本篇是**注入正確做法**。偵測 vs 注入是兩種互補策略
- [[Claude-Design]] / [[src-aapd-claude-design-figma-workflow]] — AI 產 UI 的上游
- [[src-transitions-dev]] — 同為網頁動態／轉場主題
- [[src-piccalilli-end-of-responsive-images]] — 同為前端實作規範型來源

## 實際可用場合（對本人）

- 客戶案的互動細節有爭議時，這份提供「可辯護的數值」而非個人偏好
- 寫進專案 `ui-principles.md` 或 DESIGN.md 的動態章節（目前該檔以版面為主，動態較弱）
- 交給 AI coding agent 產前端時，比「做得流暢一點」有效得多

## 未來追蹤候選

- emilkowalski/skills 其他 skill 是否值得一併收（該 repo 為 skill 集合）
- 若實際採用某組 spring 參數並驗證 → 補一手經驗與調整值
- 與 [[impeccable]] 的 46 條偵測規則做交叉比對 → 可能產出 comparison 頁
