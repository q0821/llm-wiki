---
title: DESIGN.md
type: concept
sources: [designmd-革命一個純文字檔案讓-ai-coding-agent-秒生成-stripelinear-等級的-ui.md, oh-my-design-design-system-generator.md, github-voltagentawesome-design-md-a-collection-of-designmd-files-inspired-by-popular-brand-design-systems-drop-one-into-your-project-and-let-coding-agents-generate-a-matching-ui-github.md, "【直播筆記】用 Claude Design × Claude Code × Figma 重新定義設計工作流程 - AAPD 產品設計學院.md", "課後 Prompt & 資源懶人包：Codex × HyperFrames 30 秒 Demo 3615edfc91bd80d19acee2ae9f0c5547.md", "yt-ai-一小時做完電商頁面-uiux-設計師拆解它差在哪裡.md"]
created: 2026-04-16
updated: 2026-08-19
tags: [設計系統, AI工具, UI, Markdown, video]
confidence: 強
---

# DESIGN.md

DESIGN.md 是由 Google Stitch（2026 年 3 月）提出的**純 Markdown 格式設計系統規範**，讓 AI coding agent 能直接讀懂並執行視覺設計規則，解決 AI 生成 UI 風格不一致的問題。

## 核心概念

- **格式**：純 Markdown，LLM 原生理解
- **定位**：設計系統的 AI 可讀版本
- **作用**：放在專案根目錄，AI agent 自動讀取並遵循

## 相容工具

Claude Code、Cursor、Gemini CLI、GitHub Copilot、Windsurf

## 相關資源

- [[src-design-md-revolution]] — 完整介紹與 awesome-design-md 專案（含 68 個品牌分類），另補充規格化生成 prompt 與 `/design-guard` skill（防止 AI 未經確認就偷改設計規範）
- **awesome-design-md** — GitHub 策展，59.9k stars（2026-04-20），官方 https://getdesign.md/
- **oh-my-design** — 線上生成器，62 個品牌設計系統可選

## 採用動能

短短 2-3 週內，awesome-design-md 從 4.3k stars → 59.9k stars，收錄品牌從 55+ → 68。顯示 DESIGN.md 正快速成為 AI 時代的設計系統事實標準（de facto standard）。

## 兩種建立路徑：事前定義 vs 邊走邊建

| 路徑 | 主張者 | 立場 |
|---|---|---|
| **事前定義**（DESIGN.md / awesome-design-md）| [[src-design-md-revolution]] | 完整 design system 是 AI 產出品質的前提，先寫好品牌規範再開工 |
| **邊走邊建**（[[Simon-Lin|Simon]] 流派）| [[src-aapd-claude-design-figma-workflow]] | 一開始只建五六成基本規則，過程中發現問題逐步補齊；甚至可以反向用 Claude 從已產出頁面生成 design system 與 design token JSON |

兩者並不矛盾，是同一個目標（讓 AI 產出風格一致的 UI）的不同**時序選擇**。實務上多數設計師會混用——先建骨架規則，再讓 Claude 從產出反向擴充。

> Simon：「邊走邊建立規則、邊走邊修。一開始會建立一些基本規則，但它可能只佔了五六成，其他的是在過程中一邊發現問題、一邊把規則補齊。」

## 與 [[CLAUDE-md|CLAUDE.md]] 的分工

[[CLAUDE-md|CLAUDE.md]] 與 DESIGN.md 是兩個層次的規範檔，共同為 AI agent 提供 context：

- **[[CLAUDE-md|CLAUDE.md]]**：給當下 agent 看的工作規則（如「跟 Figma 同步要用 design token」、「沒定義的 component 要先問」）
- **DESIGN.md**：給 agent 看的視覺/品牌規範（color、typography、spacing、motion）

[[Simon-Lin|Simon]] 的工作流會兩者並用，CLAUDE.md 把品牌一致性的執行規則收斂下來。

## 與其他概念的關係

- [[Agent-Skills]] — DESIGN.md 是 design agent 的輸入規格
- [[RAG]] — 兩者都是讓 AI 取得外部知識的機制，DESIGN.md 更靜態、更精準
- [[CLAUDE-md]] — 同類規範檔，但作用層次不同
- [[src-claude-code-context-management]] — Claude Code 讀取 DESIGN.md 時的上下文策略
- [[src-aapd-claude-design-figma-workflow]] — 「邊走邊建規則」流派的代表來源
- [[src-akiraxclaw-app-flow-trick]] — 同類設計：App Flow JSON 是「系統地圖」型的 AI 可讀規範檔（DESIGN.md 是「視覺規範」型）
- [[impeccable]] — `/impeccable init` **自動產出 DESIGN.md**（掃 repo + 合併 Tailwind theme + 盤點元件），
  是「DESIGN.md 從手寫走向工具生成」的第一個具體實例
- [[src-taony-ai-ecommerce-page-uiux-2026-08]] — 補充沒有完整設計系統時的替代路徑：先用產品脈絡與具理由的回饋約束 AI，連續兩輪仍偏離時再進 Figma 人工收斂。
- [[src-apple-design-skill-emilkowalski-2026-07]] — **補 DESIGN.md 最弱的一塊：動態與互動**。
  DESIGN.md schema 雖有 Motion Principles 欄位，但通常只寫「動畫速度／easing」這種
  無法執行的描述；apple-design 給的是 damping `1.0`、response `0.3–0.4`、
  投射公式這類可直接落參數的值

## 應用領域擴張：從 UI 到短影片

DESIGN.md 原本針對 UI 設計，但 [[src-codex-hyperframes-prompt-pack]] 把它擴展到**短影片領域**——「Style Prompt / Colors 5-8 token / Typography / Shapes And Layout / Motion Principles / What Not To Do（至少 6 條）」這個 schema 對影片同樣適用：

| DESIGN.md 欄位 | UI 領域 | 短影片領域（[[HyperFrames]]）|
|---|---|---|
| Colors | 背景 / 主文字 / 重點色 | 同左 + accent 用在 active state / CTA / 游標 |
| Typography | 標題 / 內文 / UI label | 主字幕 / 副字幕 / UI label（手機可讀為主）|
| Shapes And Layout | 卡片 / 按鈕 / 容器 | 安全區 / 卡片 / 工具介面 / **9:16 比例** |
| Motion Principles | 動畫速度 / easing | 同左 + 互動節奏 / 轉場原則 |
| What Not To Do | 跑版 / 風格失控規則 | 同左 + 避免霓虹 / 粒子 / 厚重科技感 |

這證實 DESIGN.md 是「**AI 可讀的視覺規範**」的領域中性 schema——任何「需要 AI 生成視覺輸出」的任務都適用。
