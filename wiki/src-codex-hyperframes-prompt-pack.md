---
title: 課後 Prompt & 資源懶人包 — Codex × HyperFrames 30 秒 Demo
type: source
sources: ["課後 Prompt & 資源懶人包：Codex × HyperFrames 30 秒 Demo 3615edfc91bd80d19acee2ae9f0c5547.md"]
created: 2026-05-15
updated: 2026-05-15
tags: [prompt-pack, codex, hyperframes, short-video, vibe-coding, design-md]
confidence: 中
---

# 課後 Prompt & 資源懶人包 — Codex × HyperFrames 30 秒 Demo

**形態**：公開課程的課後 Notion 匯出資料（942 行）
**作者線索**：課程簡報 `paddy19981205.github.io/FLPDF/#17`（GitHub Pages 公開）
**主題**：用 [[OpenAI-Codex-CLI|OpenAI Codex CLI]] + [[HyperFrames]] 框架，自動產製 30 秒、9:16、1080×1920 短影片（Reels / Shorts / TikTok）

## 核心主張

- 影片 vibe coding 的最小工作流：**Spec → Files → HTML → Inspect → MP4**
- 用 7 個串連的 prompt（**Prompt Pack 00-06**）覆蓋從一句話開場到 Render 整條鏈
- 12 個 **Visual Beats** 命名範式組成可重用的「畫面節奏字典」
- 兩種 30 秒節奏配方：穩定教學版 vs 高速社群版
- 跑版 / 互動感 / 風格 / 資訊過載 / timeline 錯誤 / render 失敗六大類 **Fix Prompts**

## 詳細摘要

### 一、快速流程五階段

| 階段 | 產出 | 做法 |
|---|---|---|
| Spec | `DESIGN.md` | 先定觀眾、訊息、風格、色票、字體、不可做事項 |
| Files | `script.md` + `storyboard.md` | 每幕只保留一個主訊息 |
| HTML | `index.html` | 先做靜態 hero frame，再加 GSAP motion |
| Inspect | check report | `npm run check`，修文字溢出、track 重疊、timeline 問題 |
| MP4 | `renders/*.mp4` | 草稿用 draft，定稿再標準或高品質 render |

對應 [[DESIGN-md]] 一文中提到的「先建 design system 再讓 AI 產出」的範式——但**從 UI 領域延伸到短影片領域**。

### 二、Prompt Pack（7 個串連 prompt）

| # | 產物 | 限制重點 |
|---|---|---|
| 00 | 一句話開場 | 主題 / 觀眾 / 目標 / 風格四欄填空，**先不寫 HTML、先產三份 Markdown** |
| 01 | DESIGN.md | Style Prompt / Colors 5-8 token / Typography / Shapes / Motion / What Not To Do（至少 6 條）|
| 02 | script.md | Core Message / Scene Rhythm / Scene Script 表格 / Text Rules 中文斷行 |
| 03 | storyboard.md | 每幕 Time / Text / Visual / Components / Motion / Interaction Beat |
| 04 | HTML Composition | 用 1080×1920 vertical / 每個 timed visible element 有 `data-start` `data-duration` `data-track-index` + `class="clip"` / GSAP timeline 要 paused 並註冊到 `window.__timelines["main"]` / **不用 `Date.now()` `Math.random()` 外部 fetch**（保可重現） |
| 05 | Inspect + Revise | 跑 `npm run check`，修文字溢出 / 元素超出畫布 / track overlap / timeline 未註冊 / clip 缺 class |
| 06 | Render | `npm run check` 通過後 `npm run render`；失敗跑 `npx hyperframes doctor` |

**關鍵設計**：Prompt Pack 是一條**對話鏈**，每個 prompt 的輸出當下個 prompt 的輸入。對應 [[Prompt-Pack-Pattern]] 概念頁。

### 三、Visual Beats Library（12 個 beat 範式）

30 秒 demo 建議挑 6-9 個 beat 串成節奏：

| Beat | 用途 | Motion |
|---|---|---|
| **Typewriter Input** | 開場、prompt 輸入 | 每 0.04-0.08 秒一個字 |
| **Cursor Hover** | 讓 UI 看起來真被操作 | 卡片 scale 1.03、邊框變重點色 |
| **Click Ripple** | 送出 prompt、選模式、開始 render | pressed state + ripple |
| **Command Palette** | 選工具、建專案、切模式 | slide up、搜尋、高亮選項 |
| **File Cards Build** | 呈現 Codex 產出多個檔案 | 卡片依序 pop in |
| **Terminal Command** | build / check / render 工程感 | command 逐字輸入、output 逐行 |
| **Timeline Scrub** | 展示影片可控時間結構 | playhead scrub、keyframes 依序點亮 |
| **Drag And Snap** | 排版、對齊 | alignment guide 閃一下 |
| **Preview Reveal** | 第一次看到成果 | mask wipe、Ready badge 出現 |
| **Inspect Highlight** | 呈現檢查與修正 | warning outline → success outline |
| **Render Export** | 結尾成果感 | progress 到 100%、MP4 card 彈出 |
| **CTA Lockup** | 結尾記憶點 | 主標上滑、CTA pop、最後定格 |

> Visual Beats 是 [[Specification-by-Example]] 的影片版——**以具體 beat 範式凍結「應該長什麼樣」**，避免「卡片出現」這種模糊描述。

### 四、30 秒 Timeline 配方

**穩定教學版**：Big Kinetic Text → Typewriter Input → File Cards Build → Terminal Command → Timeline Scrub → Preview Reveal → Inspect Highlight → Render Export → CTA Lockup

**高速社群版**：Big Kinetic Text → Command Palette → Click Ripple + File Cards → Layer Stack → Timeline Scrub → Before/After Match → Render Export → Preview Montage → CTA Lockup

關鍵原則：**第一秒有 hook、5 秒前說清楚影片在做什麼、每 3-4 秒一次視覺狀態變化、至少 6 個互動 beat、主字幕每幕只講一件事**。

### 五、Fix Prompts 六大類

| 問題 | 修法核心 |
|---|---|
| 互動感不足 | 至少 4 幕加 input / hover / click / drag / terminal / timeline / preview / render beat，**每個互動要有起因與結果**，不只是裝飾動畫 |
| 跑版 / 文字溢出 | content container 用 `width: 100%` / `height: 100%` / `padding` / `flex` / `gap` / `box-sizing: border-box`；**只讓裝飾元素用 absolute** |
| 風格不一致 | 統一 DESIGN.md 色票、字體、卡片圓角、accent color 限用在 active state / CTA / 游標 / 重點字 |
| 資訊過載 | 每幕只保留一個主訊息、主字幕不超過 16 個中文字、terminal output 最多 5 行、長句拆成兩幕 |
| Timeline / Track 錯誤 | 檢查 `class="clip"`、`data-start` `data-duration` `data-track-index`、同 track 不重疊、GSAP `paused`+註冊到 `window.__timelines` |
| Render 失敗 | `npm run check` → `npx hyperframes doctor` → 檢查 package.json / 不可重現邏輯 / 外部資源 |

### 六、三個範例專案

#### 範例 1：Claude CEO speech 60 秒 Reels（影片 + TTS + 字幕組合）
- 7 步：抓主軸 → 60 秒剪輯表 → 字幕處理 → TTS 腳本 → UI 動畫設計 → 封面 → HyperFrames 實作
- 主軸範例：「Claude 成長速度超出預期，compute 成為瓶頸，團隊正在加速取得更多算力」
- 結構：0-3s hook / 3-18s 第一爆點數字 / 18-32s 問題 / 32-47s 解法 / 47-60s 反差結尾

#### 範例 2：「多音字學堂」App 介紹影片（20-24s）
- 9:16 / 1080×1920 / 30fps
- 模板：0-2s 痛點 → 2-5s 首頁 → 5-8s 點擊第一層 → 8-11s 列表 → 11-17s 詳情頁 → 17-20s 連續操作 → 20-24s 品牌收尾
- App 產品畫面占畫面 70-78%，UI 元件比原型放大 1.2-1.4×

#### 範例 3：「寵物 IG 衝出螢幕」教學
- 流程：上傳寵物照 → ChatGPT 生圖（寵物從手機 IG 畫面衝出來）→ Gemini 生動態影片 → HyperFrames 剪 Reels → Render
- 對應「**多 AI 工具串接 + HyperFrames 收尾**」工作流（不只是 Codex 單一工具）

## 關鍵引用

> 「建議第一步：先做一支 30 秒短 Demo，不要一次寫死所有規格。」

> 「先用 CSS 建立每幕最清楚的 hero frame，再用 gsap.from() / gsap.to() 加動態。」

> 「不要只寫『卡片出現』，要說明卡片如何出現、為什麼出現。」

> 「不使用 Date.now()、Math.random()、外部 fetch 或不可重現邏輯。」

## 信心評估

- **強**：Prompt Pack 結構、Visual Beats Library 命名範式、Fix Prompts 對應問題分類——文件本身就是這些 prompt 的字面版本，可直接重現
- **中**：作者身份與課程背景——僅見 GitHub username `paddy19981205`，未驗證真實課程平台
- **中**：[[HyperFrames]] 工具的實際運作——透過 prompt 內描述推斷其架構（composition + timeline + clip + GSAP），未獨立查證 HyperFrames 官方文件
- **時效**：2026-05 當下 prompt 內提到的 npm scripts / hyperframes CLI 子命令為快照，未來可能變動

## 與 Wiki 的關聯

### 新建頁面

- [[HyperFrames]]（entity）——本知識庫第一個影片生成框架
- [[OpenAI-Codex-CLI]]（entity）——把先前散落在 [[Claude Code]] 對照表中的提及集中
- [[Prompt-Pack-Pattern]]（concept）——「多段 prompt 串成完整工作流」設計模式

### 更新既有頁面

- [[DESIGN-md]]——應用領域從 UI 延伸到短影片
- [[Vibe-Coding]]——影片 vibe coding 的具體實作
- [[Agentic-AI-Workflow]]——Prompt Pack 是 Vision → AI → Output 鏈的具體實例
- [[Agent-Skills]]——對照「Prompt Pack 模式」與 Skill 的差別
- [[Claude Code]]——對照組強化（OpenAI Codex CLI 是同類但不同生態）

### 形成的對話組

- **本來源** ↔ **[[src-design-md-revolution]]**：DESIGN.md 範式在不同領域的延伸——後者偏 UI / 前者偏短影片
- **本來源** ↔ **[[src-aapd-claude-design-figma-workflow]]**：兩種「結構化 prompt 工作流」對照——後者是 Claude Design × Code × Figma 三件套（visual editor），前者是純文字 Codex × HyperFrames（CLI / code-first）

### 未來可延伸

- 補抓 HyperFrames 官方文件作獨立來源（驗證推斷的架構與 CLI）
- 探討 HyperFrames 與 Remotion（React-for-video）的關係——兩者設計哲學疑似同源
- 課程簡報 `paddy19981205.github.io/FLPDF` 可考慮另外 ingest
