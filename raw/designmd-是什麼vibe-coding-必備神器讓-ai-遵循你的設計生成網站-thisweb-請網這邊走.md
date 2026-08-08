<!-- source-url: https://www.thisweb.dev/articles/design-md -->
<!-- title: DESIGN.md 是什麼？Vibe Coding 必備神器，讓 AI 遵循你的設計生成網站 | ThisWeb 請網這邊走 -->
<!-- author: Kun | ThisWeb -->
<!-- published: 2026-04-12 -->
<!-- fetched: 2026-08-08（原 fetch-url.sh 於 2026-04-28、2026-05-09 兩次擷取皆為空殼，改用 read 工具直連 URL 重新擷取） -->

# DESIGN.md 是什麼？Vibe Coding 必備神器，讓 AI 遵循你的設計生成網站

Kun | ThisWeb 資深前端工程師｜發佈/更新於 2026 年 4 月 12 日

## 什麼是 `DESIGN.md`？

`DESIGN.md` 是一個由 Google（在其 AI 設計工具 Google Stitch 中）引入的全新概念，專門用來解決 AI 生成程式碼時的 UI 設計一致性問題。

他是一個**純文字的 Markdown 檔案，作為網站設計系統的資料**。

過去我們做網站時，需要依賴 Figma 的匯出檔或各種散落在各處和設計相關的需求，而 `DESIGN.md` 則直接使用純文字標記（tokens）來描述專案的視覺風格與介面規則。

透過 Markdown 格式，讓 AI（如 Claude Code、GitHub Copilot、Codex、Gemini CLI 等）理解專案的視覺設計，並應用在生成的程式碼中。

## 為什麼需要 `DESIGN.md`？

如果沒有 DESIGN.md，AI 生成程式碼往往會遇到以下問題：

1. **AI 生成 UI 的不一致性**：當你要求 AI 寫一個元件時，如果沒有給予明確限制，AI 往往會生成非常通用或每次都不一樣的介面，或是需要浪費上下文，理解你的專案設計。而 `DESIGN.md` 給予了 AI 明確且一致的視覺規則，確保生成的設計符合你的產品風格。
2. **約束 AI 以產生更好的結果**：受約束的 AI 比不受約束的 AI 能產生更一致、更有用的輸出。透過提供色碼、字體和間距的硬性規定，AI 就能專注於處理版面結構、響應式行為、功能實現等複雜的決策，不需要胡亂猜測設計細節。
3. **人類與機器皆可讀**：Markdown 格式不僅機器容易解析，設計師與開發者也能直接閱讀、編輯和討論，沒有什麼學習門檻。

## `DESIGN.md` 9 大內容

一個標準的 `design.md` 檔案通常涵蓋了 AI 做出視覺決策所需的所有具體標記（Tokens），主要內容包含：

基本 4 項：

1. **色彩配置（Color palette）**：主色、次要色和強調色的精確 Hex 色碼，以及語意化色彩（成功、警告、錯誤等）和文字顏色層級。
2. **排版與字體（Typography）**：字體家族與備用字體、字體大小縮放比例（標題、內文、註解）、字體粗細、行高與字距。
3. **間距與佈局（Spacing and layout）**：基礎間距單位（如 4px 或 8px 網格系統）、常用的間距數值、容器寬度與響應式斷點。
4. **元件樣式（Component styles）**：按鈕與卡片的圓角數值、陰影定義與層級、邊框樣式與粗細。

擴充 5 項：

1. **設計氛圍與主題（Visual Theme & Atmosphere）**：用文字描述整體視覺風格與品牌個性（如「溫暖極簡」、「科技冷冽」），讓 AI 面對沒有明確規範的決策時有方向感。
2. **陰影與層次（Elevation & Depth）**：不同高度層級對應的陰影規格。
3. **設計的 Do's and Don'ts**：明確列出設計禁區（如「不要用純黑 #000000 作為文字色」）。
4. **互動模式（Interaction & Motion）**：hover、focus、transition 的行為規則，含動畫時長與緩動函數。
5. **AI 提示詞指南（Agent Prompt Guide）**：直接放標準元件的 prompt 範本，供工程師複製貼上。

## 如何創建 `DESIGN.md`

1. 手動創建：參考上述內容直接在專案新增 `DESIGN.md`
2. 使用 Google Stitch：新專案可請 Google Stitch 生成
3. 參考社群最佳實踐：https://github.com/VoltAgent/awesome-design-md（蘋果、Figma、Airbnb、Spotify 等品牌現成範例）
4. 利用規格化的 Prompt（見下）

### 規格化生成 Prompt

```markdown
你是一位資深品牌顧問與產品策略師。

你的任務是一步一步引導使用者釐清品牌，透過對話收集資訊，最後產出可用於品牌網站的初步描述。

## 每次提問規則與格式

每次回覆請遵守：

1. 一次只問一個問題，等使用者回答後，才問下一題
2. 問題嚴格遵守下面提供的文字
3. 在第 1～5 題過程中，不要做任何總結或完整設計
4. 如果使用者回答不清楚，只針對該題做簡單追問
5. 每一步都要在內部整理目前已收集的資訊，並用來優化後續問題
6. 每次提問前，先用一句簡短自然的話，告訴使用者這一步要了解什麼

## 容錯規則

如果使用者出現以下情況：

- 回答「不知道」
- 回答過於模糊
- 回答「都可以」

請不要跳題。改為只針對該題提供 2～3 個簡單範例或選項，幫助他選擇。

## 對話流程（固定順序）

### 第 1 題：品牌名稱

詢問：「你的品牌名稱是什麼？」

### 第 2 題：主要顏色

詢問：「你的品牌主要顏色是什麼？你可以用顏色名稱回答，例如鮮豔的粉紅色、較淡奶茶色、暗沉的紅色、科技感的藍色…等等；也可以直接提供色碼，例如 #FFB6C1。」

### 第 3 題：品牌服務

詢問：「你的品牌主要產品或服務是什麼？例如可愛的手作飾品、男士服飾品牌、文青感的咖啡廳、線上課程等等。」

### 第 4 題：主要受眾

根據品牌名稱與品牌服務，生成 5 個目標客群選項，並詢問：「你的主要客群比較接近哪一種？」

規則：選項要彼此明顯不同、使用簡單語言避免專業術語、每個選項一句話內、先用一句簡短過渡再提供選項。格式：A~E + F. 其他（請描述）

### 第 5 題：網站風格

根據目前所有資訊，生成 10 個網站風格選項，並詢問：「你希望網站風格比較接近哪一種？」

規則：提供常見風格、描述簡單（如可愛插畫風、極簡質感風）、選項間有差異、每個選項後說明具體會如何影響網站風格。格式：A~J. 其他（請描述）

## 輸出品牌網站描述

（第 6 步才輸出，涵蓋以下九段）

1. Visual Theme & Atmosphere
2. Color palette
3. Typography
4. Spacing and layout
5. Component styles
6. Interaction & Motion
7. Responsive Behavior
8. Do's and Don'ts
9. Agent Prompt Guide

## 限制

- 你的角色是引導使用者釐清，不要在過程中做設計，只有在第 6 步，才進行完整輸出。
- 僅輸出合法 Markdown
- 不要輸出任何說明文字
- 不要產生程式碼
```

## 如何更新 `DESIGN.md`

`DESIGN.md` 應該是一個**活的文件**，當品牌顏色改變、新增子品牌、調整元件樣式或推行新的間距規範時就需要更新。最佳實踐：

1. **整合至 Git 版本控制**：透過 Commit 歷史追蹤設計標記變更，並透過 Pull Requests 審查設計更新，就像審查程式碼一樣。
2. **AI 自動更新或手動編輯**：可用 AI 工具（如 Google Stitch）透過自然語言提示自動產生或更新。
3. **保持規格具體且量化**：用具體數值而非模糊描述（`#1A73E8` 而非「讓人感到信任的藍色」；`8px` 而非「一點點圓的圓角」）。
4. **精簡扼要**：不要塞完整設計系統的教學或長篇大論，只保留 AI 需要的具體 token；也不要讓檔案過時，否則 AI 會生成不符合當前品牌的錯誤介面。

### `/design-guard` skill

```yaml
---
name: design-guard
description: 當使用者描述的元件或設計方向與 DESIGN.md 不一致時，主動詢問是否要更新 DESIGN.md
---

Before creating or modifying any UI component, read `DESIGN.md` and compare it
with the user's latest request.

If the user describes a component, layout, color, typography, spacing, motion,
or visual style that conflicts with `DESIGN.md`, do not update the file
silently.

First, explain the difference clearly and ask:

1. Should this new decision update `DESIGN.md`?
2. If yes, should it replace the existing rule, be added as a new rule, or be
   recorded as an exception for this specific component?

Only update `DESIGN.md` after the user confirms how the design system should
change.
```

好處：AI 不會偷偷把設計規範改掉，也不會因為 `DESIGN.md` 過時而硬做出不符合需求的介面。

## 如何在 Claude Code 中使用 `DESIGN.md`

目前 Claude Code 還沒有內建 `DESIGN.md` 規範，可在 `CLAUDE.md` 中手動加入敘述：

```markdown
This project uses a design system defined in `design.md` at the project root. Always refer to this file when generating or modifying any UI component.
```

## 總結

`DESIGN.md` 的核心價值，在於它把原本散落在 Figma、設計稿、Confluence 的設計決策，濃縮成一份 AI 可以讀懂的參考文件，讓每一次請 AI 生成元件，都能符合你的品牌風格。隨著 AI 工具逐漸成為前端開發的主要生產力，設計一致性的問題也會越來越重要。`DESIGN.md` 就是目前最輕量、最務實的解法。
