---
title: HyperFrames
type: entity
sources: ["課後 Prompt & 資源懶人包：Codex × HyperFrames 30 秒 Demo 3615edfc91bd80d19acee2ae9f0c5547.md"]
created: 2026-05-15
updated: 2026-05-15
tags: [video, short-video, framework, code-first-video, codex]
confidence: 中
---

# HyperFrames

**Code-first 短影片框架**——用 HTML + CSS + GSAP + 時間軌（timeline / track）結構化描述影片組成，透過 CLI 指令 preview / inspect / render 成 MP4。本知識庫第一個記錄的影片生成工具，定位為「**程式碼控制影片**」的代表（與 GUI 剪輯工具如剪映 / CapCut 形成路線對照）。

## 基本資訊

- **形態**：CLI + HTML composition 框架
- **影片規格範例**：9:16、1080×1920、30fps（Reels / Shorts / TikTok 友善）
- **典型工作流**：用 [[OpenAI-Codex-CLI]] 或其他 LLM 透過 [[Prompt-Pack-Pattern]] 產生 composition，再透過 `npm run render` 輸出 MP4
- **可重現性原則**（從 prompt 推斷）：禁用 `Date.now()`、`Math.random()`、外部 fetch——確保每次 render 結果一致

## 核心架構（依 [[src-codex-hyperframes-prompt-pack]] prompt 推斷）

| 元件 | 約束 |
|---|---|
| **Root composition** | `data-composition-id` / `data-width` / `data-height` / `data-duration` 屬性；**不要包在 template 裡** |
| **Clip**（時間軸上的可見元素）| `class="clip"` + `data-start` / `data-duration` / `data-track-index` |
| **Track**（軌道）| 同 `data-track-index` 不可有重疊 clip |
| **Timeline**（時間線）| GSAP timeline 必須 `paused`，並註冊到 `window.__timelines["main"]` |
| **DESIGN.md** | 視覺系統、色票、字體、版面、不可做事項；對應 [[DESIGN-md]] 範式 |
| **Hero frame 優先** | 先用 CSS 排好每幕最清楚的靜態畫面，再加 GSAP motion |

## 常用 CLI 指令

| 指令 | 用途 |
|---|---|
| `npm run check` / `hyperframes lint` | 跑檢查 report，找文字溢出、track 重疊、timeline 未註冊、clip 缺 class |
| `hyperframes inspect --samples N` | 取樣 N 個 frame 檢查 layout |
| `hyperframes preview --port 3020` | 開啟即時 preview 工作台 |
| `hyperframes render --output renders/*.mp4 --fps 30 --quality standard --workers N` | 輸出 MP4 |
| `npx hyperframes doctor` | render 失敗時的環境診斷 |
| `ffprobe -v error -show_entries ...` | render 後驗證輸出規格 |

## 與相關工具的對比

| 工具 | 性質 | 與 HyperFrames 的關係 |
|---|---|---|
| **HyperFrames** | Code-first 影片框架，HTML+CSS+GSAP+timeline | 本頁主題 |
| **Remotion** | React-based 影片框架 | 設計哲學**疑似同源**（composition + timeline + paused render）；待驗證 HyperFrames 是否為 Remotion 包裝 |
| 剪映 / CapCut | GUI 時間軸剪輯工具 | 根本路線對照——「程式碼操作影片」vs「GUI 操作時間軸」 |
| After Effects | 桌面合成 / 動畫工具 | 同對照——更專業但完全非 code-first |
| [[Claude-Design]] | AI 原生 UI 設計工具 | 同類「**AI 原生 X**」工具，但 X 是 UI 不是影片 |

> 對應 [[Figma]] 之於 [[Claude-Design]] 的路線對照：**GUI 視覺工具 vs AI 原生 / code-first 工具**——HyperFrames 在影片領域扮演 Claude Design 在 UI 領域的角色。

## 在各來源中的角色

- [[src-codex-hyperframes-prompt-pack]]：本知識庫首次提及。透過 [[Prompt-Pack-Pattern|Prompt Pack 00-06]] 串接 [[OpenAI-Codex-CLI]] 生成 HyperFrames composition；含 Visual Beats Library 12 個範式 beat 與三個範例專案

## 信心評估

- **中**：核心架構與 CLI 指令——透過課後 prompt 內容**反推**，未獨立查證 HyperFrames 官方文件
- **弱**：與 Remotion 的關係——同類設計哲學的觀察，需另外驗證
- **時效**：2026-05 當下 CLI 命令為快照

## 相關實體

- [[OpenAI-Codex-CLI]]：典型生成 HyperFrames composition 的 LLM agent
- [[Claude-Design]]：同類「AI 原生 / code-first」工具，但領域是 UI
- [[Figma]]：被 code-first 工具威脅的傳統 GUI 工具陣營（影片領域對應的是剪映 / CapCut）

## 相關概念

- [[Prompt-Pack-Pattern]]：HyperFrames 工作流的具體採用範式
- [[DESIGN-md]]：HyperFrames 工作流首步就是建 DESIGN.md
- [[Vibe-Coding]]：影片 vibe coding 的代表工具
- [[Agentic-AI-Workflow]]：Prompt Pack → HTML composition → MP4 是該範式在影片領域的具體鏈
- [[Specification-by-Example]]：Visual Beats Library 是「具體 beat 範式凍結畫面節奏」的影片版
