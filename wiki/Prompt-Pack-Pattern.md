---
title: Prompt Pack Pattern（多段 prompt 串成完整工作流）
type: concept
sources: ["課後 Prompt & 資源懶人包：Codex × HyperFrames 30 秒 Demo 3615edfc91bd80d19acee2ae9f0c5547.md"]
created: 2026-05-15
updated: 2026-05-15
tags: [prompt-engineering, workflow, design-pattern, vibe-coding]
confidence: 中
---

# Prompt Pack Pattern

> **多個 prompt 串成一條工作流**：每個 prompt 有明確的「輸入填空 + 限制清單 + 預期產出」，下一個 prompt 接收上一個的輸出。比單一巨型 prompt 更可控、比 free-form 對話更可重現。

## 定義

Prompt Pack 是一種 **prompt engineering 範式**——把一個複雜任務拆成 N 個有序 prompt，每個都：
1. 有明確**輸入填空**（`{主題} / {觀眾} / {核心訊息}`）
2. 有明確**限制清單**（「先不寫 HTML」「每幕主字幕不超過 16 個中文字」「不使用隨機動畫」）
3. 有明確**預期產出**（「請輸出 1. xxx 2. xxx 3. xxx」格式）
4. 上一個 prompt 的產出當作下一個的輸入

## 代表案例

[[src-codex-hyperframes-prompt-pack|Codex × HyperFrames 30 秒 Demo]] 的 **Prompt Pack 00-06**：

```
00 一句話開場
   ↓ 產出三份 markdown（DESIGN.md / script.md / storyboard.md）
01 DESIGN.md 生成
   ↓ 視覺系統 / 色票 / 字體 / 版面 / 不可做事項
02 script.md 生成
   ↓ 30 秒逐段文案
03 storyboard.md 生成
   ↓ 每幕畫面 / 元件 / motion / interaction beat
04 HTML Composition 生成
   ↓ 1080x1920 vertical / data-start / GSAP timeline paused
05 Inspect + Revise
   ↓ npm run check + 修正
06 Render
   ↓ MP4 輸出
```

每個 prompt 都遵守同一個範式：**輸入填空 + 限制 + 結構化產出**。

## 與相近範式的對照

| 範式 | 載體 | 動力來源 | 適用情境 |
|---|---|---|---|
| **Prompt Pack Pattern**（本頁）| 對話框內貼上的多段 prompt | 人類手動串接（複製 prev output → 貼到 next prompt）| 一次性 / 探索 / 教學 / 個人專案 |
| [[Agent-Skills]] | `SKILL.md` 結構化檔案 | Agent 自動觸發（基於 frontmatter 或 description）| 跨專案重用 / 標準化 SOP |
| Skill Factory（[[Self-Improving-Agent]]）| 自動寫 `SKILL.md` | AI 靜默監看後自動萃取 | 累積個人化 skill 庫 |
| [[Subagent-Driven-Development]] | Plan + subagent dispatch | Controller 分派、reviewer 把關 | 多 task / 需要 audit trail |
| [[Adversarial-Code-Review]] | 單 prompt 帶對抗式 focus | 一次性深度 review | 找跨檔組合 bug |

**核心差別**：Prompt Pack 是「**人類控制節奏**」（明白知道下一步要做什麼，手動串）；Agent Skills 是「**Agent 自動觸發**」（基於 description 或 frontmatter）；Skill Factory 是「**AI 自動萃取**」（靜默觀察後固化）。

三者**不互斥**，可組合：例如先用 Prompt Pack 跑通工作流，找到穩定 pattern 後固化成 Skill。

## 設計原則（從 [[src-codex-hyperframes-prompt-pack]] 萃取）

### 1. 每個 prompt 結構統一

明確的「輸入填空 → 限制 → 預期輸出」三段式，讓使用者複製貼上後只需要填空。

### 2. 限制清單比正向描述更有效

「不要使用隨機動畫」「不要依賴外部網路素材」「先不要寫 HTML」「不要重寫整支影片」——明確的 negative space 比「請寫得好」這類正向描述更能約束輸出。

對應 [[Harness-Engineering]] 的「**約束 > 自由**」原則——限制解題空間反而提升生產力。

### 3. 階段性產物可被獨立檢驗

每個 prompt 產出是一個檔案（`DESIGN.md` / `script.md` / `storyboard.md` / `index.html`），人類可在每個階段中斷檢查、修正、再進下一個 prompt。

這個設計呼應 [[Context-Rot]] 的對抗策略：**tool-call offloading**——大型中間產出存檔案系統，不塞進 context window。

### 4. 預期填空具體到「不超過 N 個中文字」

「每幕主字幕不超過 16 個中文字」「terminal output 最多 5 行」——把模糊的「不要太長」量化成具體數字。

對應 [[Specification-by-Example]]：具體範例凍結需求邊界。

### 5. 同套 Pack 配套 Fix Prompts

當輸出不符預期時，提供 6 類 Fix Prompts（互動感不足 / 跑版 / 風格不一致 / 資訊過載 / timeline 錯誤 / render 失敗），每類都是另一個小型 Prompt Pack。

這個設計呼應 [[Ratchet-Pattern]]：**每類觀察到的失敗都編碼成可重用的修正 prompt**。

## 何時用 / 不用

**用：**
- 任務複雜需要分階段（spec → plan → impl → verify）
- 教學 / 標準化操作流程（每步都明確）
- 想保留中間產物（人類可審查、可斷點）
- 不想花精力建 Skill 但又需要某種重用性

**不用：**
- 任務很簡單，一個 prompt 就能搞定
- 任務需要 agent 自動探索（Prompt Pack 限制太多）
- 跨多個專案重用 → 直接做成 [[Agent-Skills|Skill]] 或 `SKILL.md`

## 相關概念

- [[Agent-Skills]] — 規模化重用的下一步形式
- [[Subagent-Driven-Development]] — 更工程化的多階段執行範式
- [[Specification-by-Example]] — 具體範例凍結需求的同源思路
- [[DESIGN-md]] — 第一個 prompt 的常見輸出產物之一
- [[Harness-Engineering]] — 「約束提升生產力」的上位原則
- [[Vibe-Coding]] / [[Agentic-AI-Workflow]] — Prompt Pack 是這兩者的具體實作方法

## 應用與案例

- [[src-codex-hyperframes-prompt-pack]]：30 秒影片產製 7 個 prompt 鏈
- 本知識庫的 `/llm-wiki ingest|query|lint` 自身也是 Prompt Pack 的高層形式——但已被封裝成 Skill
