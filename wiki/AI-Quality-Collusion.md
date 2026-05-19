---
title: AI 品質共謀（AI Quality Collusion）
type: concept
sources: ["AI 品質共謀（AI Quality Collusion）.md", "ai-品質共謀ai-quality-collusionsearch暗色模式亮色模式閱讀模式.md"]
created: 2026-05-09
updated: 2026-05-09
tags: [ai-anti-pattern, testing, software-quality, agent, vibe-coding, context-bleed]
confidence: 強
---

# AI 品質共謀（AI Quality Collusion）

當 AI 同時負責**生成程式碼**與**生成測試**時，產生的一種隱形共謀關係——測試對齊實作而非對齊需求，造就「一切都沒問題」的集體幻覺。

## 定義

> AI 根據自己對規格的理解去寫程式碼，然後再根據**同樣的理解**去寫測試——結果測試只是在**驗證它自己的邏輯**，而不是在挑戰系統的真實需求。

結果：CI 綠燈、覆蓋率達標、PR 通過——但**真實使用行為一上來就炸**。

## 為什麼是「共謀」而非「錯誤」

「錯誤」會被另一個 reviewer（人或 agent）抓到；「共謀」的危險在於：

| 性質 | 說明 |
|---|---|
| **同源的理解** | 測試與實作共享同一套誤解 |
| **形式上的完整** | 覆蓋率真實、綠燈真實、code review 真實 |
| **外觀上的勤勞** | 比「沒寫測試」還認真，更難被質疑 |
| **集體的沉默** | 既然測試過，團隊不會主動質問 |

## 形成條件（三者同時成立才會發生）

1. **同一個 AI 做 code 與 test** — context 裡有相同的實作假設
2. **缺乏獨立的人類驗證層** — 沒人從「使用者視角 / 邊界條件視角」另行挑戰
3. **CI 綠燈被當作品質的終點** — 通過 CI = 沒問題，省略上線前探索性測試

## 與既有測試反模式的區別

| 傳統反模式 | AI 品質共謀 |
|---|---|
| 測試錯誤（tester 誤寫） | 測試「正確地」對齊了實作，而**實作本身偏離需求** |
| 覆蓋率造假（寫空測試） | 覆蓋率真實，但測試的是**實作邏輯而非需求邏輯** |
| 測試與實作耦合太緊 | **不只是耦合——是同源產生**，耦合性內建而非後天造成 |
| 懶人測試（只 happy path）| 可能含 edge case，但 edge case 也是 AI 自己想的 |

## 對策

### 結構性對策

1. **隔離 code 生成與 test 生成的 context**
   - 不同 session / subagent / 甚至不同模型分別產生
   - 或先以 **SBE（Specification by Example）** 明文凍結需求，test 與 code 各自只依規格、不互相參考
2. **保留人類定義的黃金測試**
   - 一組不由 AI 產生的「真實使用者行為」測試
   - 即使 AI 產的測試全綠，這組仍須獨立通過
3. **測試與 Bug 管理紀律不可省**
   - Test Case 風險分級（事前）
   - Bug 追蹤反推「AI 測試的盲點分布圖」（事後）

### 流程性對策

1. **探索性測試（Exploratory Testing）作為最後一道牆**
   - 人類手動撞 AI 想不到的操作路徑
   - 特別是 UX、並發、錯誤訊息類 bug
2. **生產環境觀察**
   - 不能用「沒報 bug」當作「沒 bug」的證明
   - 低使用量產品需刻意設計使用場景驗證

### 個人版直接對策：[[CLAUDE-md|CLAUDE.md]] 12 條規則的 Rule 9

[[src-bnext-claude-md-12-rules|Mnimiy]] 把這條反模式直接編成 CLAUDE.md 規則：

```
## Rule 9 — Tests verify intent, not just behavior
Every test must encode WHY the behavior matters, not just WHAT it does.
A test like expect(getUserName()).toBe('John') is worthless if the function
takes a hardcoded ID.
If you can't write a test that would fail when business logic changes,
the function is wrong.
```

核心判準：**「如果你寫不出一個會在業務邏輯改變時 fail 的測試，那個 function 就是錯的。」**

這比結構性對策（隔離 context）輕量得多，適合個人專案或小團隊作為**第一道牆**——AI 自己在寫 test 時就被規則約束去思考「這個 test 在驗證什麼業務語意」。但仍需配合結構性 / 流程性對策才完整。

## 與其他概念的關係

### 本知識庫對應

- [[Vibe-Coding]] / [[Agentic-AI-Workflow]] — AI 主導開發範式的**典型風險**之一
- [[Meta-Harness]] / [[Managed-Agents]] — 「subagent context 隔離」正是結構性對策的核心
- [[Agent-Skills]] — 不同 skill 處理 code 與 test 生成可實現結構性隔離
- [[Harness-Engineering]] — 「環境約束」設計可加入「禁止 test 直接讀取 implementation context」之類的硬規則

### 來源原文提到

- **`src-Code Review已死` 的 Swiss-cheese 五層信任模型**：AI 品質共謀對應「第一層 code 審查失效」的擴散版——不只 review，連測試本身都是同一個 swiss cheese
- **`src-AI-Agent避坑指南` 的上下文隔離**：避坑指南針對「單 agent 多任務」的 context bleed；AI 品質共謀則是「**單 agent 跨角色（coder + tester）**」的 context bleed

## 近似概念

- **Overfitting to Specification** — AI 過度擬合它對規格的解讀，而非規格本身
- **Self-validating AI** — AI 系統自我驗證導致的正回饋幻覺
- **Confirmation bias automation** — 自動化版本的確認偏誤：AI 只測試它相信系統會做的事

## 信心評估

- **強**：定義、形成條件、與既有反模式的區別 — 邏輯完整、區分清晰
- **強**：對策設計 — 「隔離 context」「人類黃金測試」與本知識庫既有的 [[Meta-Harness]] / [[Managed-Agents]] 設計理念呼應
- **中**：原始概念出處（敏捷三叔 2026-04）— 經 SPT Wiki 二手轉述，未直接讀原文

## 相關頁面

- [[src-spt-ai-quality-collusion]] — 來源摘要頁
- [[src-bnext-claude-md-12-rules]] — Rule 9「Tests verify intent」是該反模式的個人版對策
- [[Vibe-Coding]] / [[Agentic-AI-Workflow]] — AI 主導開發範式
- [[Meta-Harness]] / [[Managed-Agents]] — subagent 隔離設計
- [[Agent-Skills]] — 不同 skills 實現職責分離
- [[CLAUDE-md]] — Rule 9 編碼位置
- [[Adversarial-Code-Review]] — 對抗式 AI review 是該反模式的另一道對策
