<!-- source-url: https://shingo0620.github.io/SPT/AI-%E5%93%81%E8%B3%AA%E5%85%B1%E8%AC%80 -->
<!-- title: AI 品質共謀（AI Quality Collusion）Search暗色模式亮色模式閱讀模式 -->
<!-- fetched: 2026-05-09 -->

## [SPT Wiki](.)

Search

搜尋

暗色模式亮色模式

閱讀模式

## 探索

* [](#)

[Home](./)

 ❯ 

AI 品質共謀（AI Quality Collusion）

# AI 品質共謀（AI Quality Collusion）

2026年4月21日閱讀時間約 5 分鐘

* [AI](./tags/AI)
* [測試](./tags/測試)
* [軟體品質](./tags/軟體品質)
* [反模式](./tags/反模式)
* [anti-pattern](./tags/anti-pattern)

# AI 品質共謀（AI Quality Collusion）

## 定義

當 AI 同時負責**生成程式碼**與**生成測試**時，產生的一種隱形共謀關係：

> AI 根據自己對規格的理解去寫程式碼，然後再根據**同樣的理解**去寫測試——結果測試只是在**驗證它自己的邏輯**，而不是在挑戰系統的真實需求。

這會造就「一切都沒問題」的集體幻覺：CI 綠燈、覆蓋率達標、PR 通過——直到上線後被真正的使用行為炸掉。

## 為什麼它叫「共謀」而非「錯誤」

單純的測試錯誤會被另一個 reviewer（人或另一個 agent）抓到；「共謀」的特性在於：

* **同源的理解** → 測試與實作共享同一套誤解
* **形式上的完整** → 覆蓋率、綠燈、code review 都通過
* **外觀上的勤勞** → 看起來比「沒寫測試」還認真，更難被質疑
* **集體的沉默** → 既然測試過了，團隊也不會主動去質問

## 形成條件

同時滿足以下三個條件就會發生：

1. **同一個 AI 做 code 與 test**——context 裡有相同的實作假設
2. **缺乏獨立的人類驗證層**——沒有人從「使用者視角」或「邊界條件視角」另行挑戰
3. **CI 綠燈被當作品質的終點**——通過 CI = 沒問題，省略了上線前的探索性測試

## 與既有測試反模式的區別

| 傳統反模式                 | AI 品質共謀                                              |
| --------------------- | ---------------------------------------------------- |
| 測試錯誤（tester 誤寫）       | 測試「正確地」對齊了實作，而實作本身偏離需求                               |
| 覆蓋率造假（寫空測試）           | 覆蓋率真實，但測試的是實作邏輯而非需求邏輯                                |
| 測試與實作耦合太緊             | **不只是耦合——是同源產生**，耦合性內建而非後天造成                         |
| 懶人測試（happy path only） | 可能包含 edge case 測試，但 edge case 也是 AI 自己想的，並非真實使用者會遇到的 |

## 對策

### 結構性對策

1. **隔離 code 生成與 test 生成的 context**  
   * 用不同的 session / subagent / 甚至不同模型來產生程式碼與測試  
   * 或先以規格（[SBE](./Specification-by-Example)）明文凍結需求，test 只依規格、code 只依規格，不互相參考
2. **保留人類定義的黃金測試**  
   * 不由 AI 產生的一組「真實使用者行為」測試  
   * 即使 AI 產的所有測試都綠，這組仍需獨立通過
3. **測試與 Bug 管理紀律不可省**  
   * Test Case 管理 → 事先標示風險分級  
   * Bug 追蹤 → 事後分析「哪些 AI 測試漏掉的 bug 先上線」  
   * 用 Bug 紀錄逆推「AI 測試的盲點分布圖」

### 流程性對策

1. **探索性測試（Exploratory Testing）作為最後一道牆**  
   * 人類手動去撞 AI 不會想到的操作路徑  
   * 特別是 UX、並發、錯誤訊息類 bug
2. **生產環境觀察**  
   * 不能用「沒報 bug」當作「沒 bug」的證明  
   * 低使用量的產品，需要刻意設計使用場景驗證

## 與其他概念的關係

* **[AI 輔助軟體工程](./AI-輔助軟體工程)**：結構化方法論中包含雙重 review——AI 品質共謀是當「雙重 review」省略時的典型失效模式
* **[src-Code Review已死](./src-Code-Review已死) 的 Swiss-cheese 五層信任模型**：AI 品質共謀對應「第一層（code 審查）失效」的擴散版——不只 review，連測試本身都是同一個 swiss cheese
* **[src-AI-Agent避坑指南](./src-AI-Agent避坑指南) 的上下文隔離**：避坑指南針對「單 agent 多任務」的 context bleed；AI 品質共謀則是「單 agent 跨角色（coder + tester）」的 context bleed

## 近似概念

* **Overfitting to Specification**：AI 過度擬合它對規格的解讀，而非規格本身
* **Self-validating AI**：AI 系統自我驗證導致的正回饋幻覺
* **Confirmation bias automation**：自動化版本的確認偏誤——AI 只測試它相信系統會做的事

## 來源

本概念由 [src-AI時代的測試管理](./src-AI時代的測試管理)（敏捷三叔）2026-04 文章提出，原文用語為「隱形的共謀關係」。

---

### 關係圖譜

### 目錄

* [AI 品質共謀（AI Quality Collusion）](#ai-品質共謀ai-quality-collusion)
* [定義](#定義)
* [為什麼它叫「共謀」而非「錯誤」](#為什麼它叫共謀而非錯誤)
* [形成條件](#形成條件)
* [與既有測試反模式的區別](#與既有測試反模式的區別)
* [對策](#對策)
* [結構性對策](#結構性對策)
* [流程性對策](#流程性對策)
* [與其他概念的關係](#與其他概念的關係)
* [近似概念](#近似概念)
* [來源](#來源)

### 反向連結

* [PluginEval](./PluginEval)
* [Scope Creep 守恆律](./Scope-Creep-守恆律)
* [Specification by Example](./Specification-by-Example)
* [index](./)
* [log](./log)
* [AI 寫 code 時代，不抓 Bug、不留 Test Case 真的沒事嗎？](./src-AI時代的測試管理)
* [src-bug-hunter — codexstar69/bug-hunter](./src-bug-hunter)
* [GitHub Trending 月報 — 2026-04](./src-github-trending-2026-04)
* [Hacker News 月報 — 2026-04](./src-hn-2026-04)
* [Kevin Lynagh — Sabotaging projects by overthinking, scope creep, and structural diffing](./src-overthinking-scope-creep-structural-diffing)
* [Product Hunt 月報 — 2026-04](./src-producthunt-2026-04)
* [月綜整 2026-04（04-13 \~ 04-30）](./月綜整-2026-04)
* [週綜整 2026-W17（04-20 \~ 04-26）](./週綜整-2026-W17)

Created with [Quartz v4.5.2](https://quartz.jzhao.xyz/) © 2026

* [GitHub](https://github.com/jackyzha0/quartz)
* [Discord Community](https://discord.gg/cRFFHYye7t)
