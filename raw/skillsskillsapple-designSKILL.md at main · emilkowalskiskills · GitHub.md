[skills/skills/apple-design/SKILL.md at main · emilkowalski/skills · GitHub](https://github.com/emilkowalski/skills/blob/main/skills/apple-design/SKILL.md)

<!-- source-url: https://github.com/emilkowalski/skills/blob/main/skills/apple-design/SKILL.md -->
<!-- raw-url: https://raw.githubusercontent.com/emilkowalski/skills/main/skills/apple-design/SKILL.md -->
<!-- title: apple-design SKILL.md（emilkowalski/skills） -->
<!-- fetched: 2026-07-22（WebFetch 結構化抽取；逐字全文因版權判斷未取得） -->

## 擷取方式說明

fetch-url.sh 對 GitHub blob 頁面逾時；改用 WebFetch 抓 raw.githubusercontent.com。
WebFetch 拒絕逐字重製全文（版權判斷），改以「列出所有章節、規則與具體數值」方式
結構化抽取。以下為抽取結果，非逐字原文。

---

## 文件章節（17 節）

### 1. Response — 消除延遲
- 核心規則：延遲出現時，直接操作感（directness）就消失
- 在 pointer-down 時給反饋，不是 click / touch-up
- 需稽核所有延遲來源：debounce、人工計時器、轉場等待、~300ms tap delay
- 反饋要全程連續，不是只在結束時出現
- CSS 例：`transform: scale(0.97)` + `transition: 100ms ease-out`

### 2. Direct manipulation — 1:1 追蹤
- 內容與觸點必須同步移動
- 使用 Pointer Events + `setPointerCapture`
- 追蹤速度／位置歷史（最近數個 pointermove 事件）以取得釋放時速度
- 尊重抓取偏移量，不要把元素對齊到中心

### 3. Interruptibility — 單一最重要原則
- 任何動畫必須隨時可中斷與反向
- 永不鎖定轉場期間的輸入
- **一律從呈現值（current presentation value）開始動畫，不是從目標值**
- 手勢驅動避免用 CSS transitions / keyframes，改用 spring
- 反向時融合速度，不要硬切
- 2D 運動分解為獨立的 X、Y spring

### 4. Behavior over animation — 使用 Spring
- Spring 參數（damping ratio + response）優於物理三元組（mass / stiffness / damping）
- Damping ratio：`1.0` = 臨界阻尼（無彈跳）；`< 1.0` = 有彈跳
- Response：達成目標所需秒數（非固定時長）
- 預設值：UI 預設 `damping 1.0`；動量互動（滑動／甩動）`damping ~0.8`

| 互動類型 | damping | response |
|---|---|---|
| 移動／重定位 | 1.0 | 0.4s |
| 旋轉 | 0.8 | 0.4s |
| 抽屜／sheet | 0.8 | 0.3s |

### 5. Velocity handoff — 拖曳銜接動畫
- 動畫應以放手當下手指的確切速度接續
- 相對速度：`relativeVelocity = gestureVelocity / (target − current)`
- Framer Motion / Motion 接受絕對 px/s 速度

### 6. Momentum projection — 動量投射
- 不要從放手點直接快速對齊邊界
- 投射函數：`(v / 1000) × d / (1 − d)`，其中 `d ≈ 0.998`
- 選擇離投射終點最近的 snap point，再帶速度播放 spring

### 7. Spatial consistency — 對稱路徑、錨定源點
- 進入與退出走同一條路徑
- 互動應源自觸發它的元素
- 可逆轉場的緩動曲線互為鏡像

### 8. Hint in the direction of the gesture
- 中間影格要傳達運動方向
- 例：Control Center 模組「向上向外生長」

### 9. Rubber-banding — 軟邊界
- 邊界處漸進阻力，不是硬停
- 公式：`(overshoot × dim × 0.55) / (dim + 0.55 × |overshoot|)`

### 10. Gesture design details
- Tap：touch-down 時高亮（即時），touch-up 時提交；約 10px 遲滯
- Drag / swipe：約 10px 方向閾值後開始 1:1 追蹤
- 平行偵測所有手勢，意圖明確後取消非目標手勢
- 避免只回報最終狀態的識別器

### 11. Frame-level smoothness
- 單影格位置變化低於感知閾值
- 高速運動可加微妙動態模糊／拉伸
- 使用 `requestAnimationFrame`
- 只動畫 `transform` 與 `opacity`
- 用 `will-change` 提示

### 12. Materials & depth — 半透明質感傳達層級
- `backdrop-filter: blur()` + 半透明背景
- 材質權重編碼層級：深色＝結構分離；淺色＝互動引注
- 不要疊加多層淺色半透明
- 大表面＝強模糊 + 深陰影
- Vibrancy 提高文字清晰度：提高對比、加粗、增加 letter-spacing
- 滾動邊界用漸層遮罩，不用硬分隔線

```css
.toolbar {
  background: rgba(255, 255, 255, 0.6);
  backdrop-filter: blur(20px) saturate(180%);
  border-top: 1px solid rgba(255, 255, 255, 0.4);
}
```

### 13. Multimodal feedback — 動作 + 音效 + 觸覺
1. 因果性：觸發於實際原因，符合動作物理性
2. 和諧：視覺、音效、觸覺同影格觸發
3. 實用性：只在有意義的時刻使用（成功、錯誤、提交、貼齊）

### 14. Reduced motion & accessibility
- `prefers-reduced-motion: reduce`：淡出而非滑動，去除彈性
- `prefers-reduced-transparency: reduce`：改用更不透明的表面
- `prefers-contrast: more`：近實心背景、對比邊框
- 避免全螢幕移動背景、慢速振盪（~0.2 Hz）、亮度突跳

```css
@media (prefers-reduced-motion: reduce) {
  .sheet { transition: opacity 200ms ease; transform: none !important; }
}
@media (prefers-reduced-transparency: reduce) {
  .toolbar { background: white; backdrop-filter: none; }
}
```

### 15. Typography — 光學尺寸、字距、行距
- Letter-spacing 隨尺寸變化：大字用負字距（-0.02em），內文接近 0
- Line-height 與尺寸反向：標題緊、內文寬鬆
- 用重量 + 尺寸 + 行距組合建立層級
- 尊重使用者文字尺寸設定（Dynamic Type）
- 優先系統字體（內建光學尺寸、字距表、清晰度調校）

```css
:root { font: 100%/1.5 system-ui, sans-serif; }
.display {
  font-size: clamp(2rem, 5vw, 4rem);
  line-height: 1.05;
  letter-spacing: -0.02em;
  font-optical-sizing: auto;
}
```

### 16. Design foundations — 八項原則
1. Purpose — 有意圖的決策、知所不為
2. Agency — 使用者掌控；提供選擇；寬容設計（易復原）
3. Responsibility — 使用者利益優先；隱私透明；安全預警
4. Familiarity — 建立在已知認知上；行為一致；破例須驗證
5. Flexibility — 適配多情境／裝置／能力；個人化選項
6. Simplicity — 剝除不必要；清晰層級；進階選項次層
7. Craft — 細節無妥協；每個間距／時間／對齊都要能辯護
8. Delight — 前七項做到的結果，不是附加元素

戰術規則：
- 反饋四類：狀態、完成、警告、錯誤
- 尋路四問：我在哪？可以去哪？有什麼？怎麼離開？
- 分組映射：接近性表示關聯；控制項靠近它影響的東西
- 直白具體的標籤優於安全通用的標籤

### 17. Process
- 互動原型優於靜態設計稿
- 互動與視覺同時設計
- 用真實使用者、真實情境測試
- 慢速／逐影格檢視，捕捉全速看不見的細節

---

## 快速參考表

| 需求 | 技術 | 具體數值 |
|---|---|---|
| 預設 UI spring | 臨界阻尼 | damping 1.0, response 0.3–0.4 |
| 動量／滑動 spring | 欠阻尼輕彈 | damping ~0.8, response 0.3–0.4 |
| 手勢→spring 速度 | 速度交接 | `v / (target − current)` |
| 滑動著陸點 | 投射動量 | `current + (v/1000)·0.998/(1−0.998)` |
| 乾淨中斷 | 從呈現值啟動 | 讀取即時 on-screen transform |
| 避免反向「撞牆」 | 帶速度重定目標 | 融合速度的 spring |
| 可逆轉場 | 鏡像緩動 | 反向 cubic-bezier |
| 反向 vs 提交判斷 | 用速度符號 | 不用位置 |
| 1:1 拖曳 | Pointer Events + capture | 尊重抓取偏移 |
| 反饋時機 | pointer-down 起、全程 | 不是只在終點 |
| 邊界 | 橡皮筋非硬停 | 漸進阻力 |
| 半透明層 | `backdrop-filter` 層 | 內容在其下滾動 |
| 字距 | 依尺寸而非固定 | 標題 -0.02em、內文 0 |
| 減少動態 | 淡出取代滑動／spring | `@media (prefers-reduced-motion)` |
