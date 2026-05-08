---
title: The end of responsive images — Piccalilli (Mat Marquis)
type: source
sources: ["The end of responsive images - Piccalilli.md", "the-end-of-responsive-images-piccalilli.md"]
created: 2026-05-09
updated: 2026-05-09
tags: [前端, html, responsive-images, web-standards, sizes, srcset]
confidence: 強
---

# The end of responsive images — Piccalilli (Mat Marquis)

**作者**：Mat Marquis（前 RICG / Responsive Images Community Group 主席，《Image Performance》作者）
**發表平台**：Piccalilli（https://piccalil.li/）— Andy Bell 創辦的前端教育媒體
**發表日期**：2026-04-23
**原始連結**：https://piccalil.li/blog/the-end-of-responsive-images/

## 核心主張

- **`sizes="auto"` + `loading="lazy"` 的組合終結了手動描述 `sizes` 屬性的痛苦**
- 響應式圖片的歷史包袱可結案——RICG 14 年前推動的 `srcset` / `sizes` / `picture` 各有定位
- 作者公開「自白」：他主導了「explicitly vague」這個讓開發者無從掌控的設計決策，理由是**他知道大家會做錯**

## 兩種響應式圖片語法

| 語法 | 性質 | 用途 |
|---|---|---|
| `<picture>` | **prescriptive**（控制導向）| 完全掌控 source 與條件，作者明確說「I like `picture`」 |
| `<img srcset sizes>` | **descriptive**（描述導向）| 提供候選 + 渲染資訊，由 browser 決定要載哪張 |

## `sizes` 為什麼是地獄

- 需要描述「圖片在不同 breakpoint / container query 下的尺寸」
- 例：`(min-width: 1340px) 257px, (min-width: 1040px) calc(24.64vw - 68px), (min-width: 360px) calc(28.64vw - 17px), 80px`
- **抗拒自動化**：build 過程沒有 layout 資訊，無法產生
- **手寫不可能**：誰能光看 layout 就算出這串？
- 違背了「open any text editor and you can build a website」的精神

## 解方：`sizes="auto"`

時間軸：
- Blink 較早支援
- Gecko、WebKit 最近的 patch（Simon Pieters / Yoav Weiss 推動）已對齊
- WordPress core 已採用（Joe McGill 的 patch）

寫法：

```html
<img loading="lazy"
     src="..."
     srcset="...-650.jpeg 650w, ...-960.jpeg 960w, ...-1400.jpeg 1400w"
     sizes="auto, (min-width: 1040px) 650px, calc(94.44vw - 15px)"
     alt="…">
```

- 有支援的 browser 看到開頭 `auto` → 自己算
- 沒支援的 browser → 忽略 `auto`，用後面的 fallback
- **零成本，現在就可以加**

## 限制

- 只對 `loading="lazy"` 的圖片有效（lazy load 時 browser 已有 layout 資訊）
- 首屏的 hero / LCP 圖片仍需手寫 `sizes`，但這類通常 `sizes="100vw"` 就夠

## 哲學論點：為什麼要剝奪開發者的控制

- 控制權落到開發者手上 = 每個網站策略不一致 = 用戶體驗破碎
- Browser 知道更多（螢幕、密度、頻寬、user preferences），且不該讓開發者知道某些隱私資訊
- 「給予控制 = 用戶失去控制」

## 關鍵原文引用

> "I've been waiting for fourteen years to write this article. _Fourteen years_ to tell you about one relatively new addition to the way images work on the web."
> — Mat Marquis（前 RICG 主席的開場自白）

> "Then the browser, in strict technical terms, **just does whatever**."
> — 對 spec 中 "implementation-defined" 的吐槽

> "I personally thumbs-upped the decision that you should not have any say in how `srcset`/`sizes` work — that you can't even know how they work... It's because **I know you would have done it wrong**."
> — 為何 RICG 把控制權留給瀏覽器

> "we can't tailor asset delivery to a user's connection speed... what connection speed thresholds would _you_ set for your image sources, and what would I set for mine? **They're different, I bet.**"
> — 為何「給開發者控制」會讓使用者體驗破碎

> "describing the all of the sizes that an element will be, across every breakpoint and container query, as a single string, in an HTML attribute. **How disgusting.**"
> — 對手寫 `sizes` 的厭惡

> "We just want _faster images_, and `srcset` and `sizes` cover that use case handily — better than you or I ever could, if we had to. **It would be miserable if we _had to_.**"
> — 結論：descriptive syntax 是正解

> "I'm not here to apologize for `sizes`. **I'm here to help bury it.**"
> — 文章主旨

## 與本知識庫的關聯（弱）

- [[Adobe]] / [[Figma]] / [[Claude-Design]] — 響應式設計議題交集
- 對 [[科技翰林院]]、[[HC-AI-說人話]] 等內容創作者：用 [[CLAUDE-md|CLAUDE.md]] 規則叫 AI **產生 markup 時自動加 `sizes="auto"`** 是一個低成本優化

## 信心評估

- **強**：技術細節（瀏覽器支援、語法、WordPress 採用）— 來自當事人 + 引用 spec
- **強**：歷史脈絡（RICG、`picture`/`srcset`/`sizes` 設計選擇）— 作者親身經歷
- **中**：「現在就可以加，零成本」— 對舊瀏覽器（< 5 年）需驗證 fallback 行為

## 忽略區段

- Piccalilli 課程廣告 banner（重複多次，無資訊量）
- Newsletter / About / Footer 區塊
