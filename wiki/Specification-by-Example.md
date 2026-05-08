---
title: Specification by Example (SBE)
type: concept
sources: ["ai-品質共謀ai-quality-collusionsearch暗色模式亮色模式閱讀模式.md"]
created: 2026-05-09
updated: 2026-05-09
tags: [軟體工程, testing, bdd, agile, requirements]
confidence: 中
---

# Specification by Example (SBE)

以**具體範例**作為需求規格的軟體工程實踐，又名「Living Documentation」或部分等同於 BDD（Behavior-Driven Development）的需求面。

由 Gojko Adzic 在 2011 年同名書中系統化整理。

## 核心概念

把抽象規格 → **可執行的範例**：

| 傳統需求 | SBE 形式 |
|---|---|
| 「會員首次下單享 10% 折扣」 | 給定「Alice 是新會員、購物車 $1000」→ 結帳後總額為 $900 |
| 「VIP 會員免運費」 | 給定「Bob 等級 = VIP、訂單 $500」→ 運費 $0 |

範例本身既是規格、又是測試案例、又是文件——三合一。

## 為何重要：規格凍結

[[AI-Quality-Collusion]] 的核心對策之一：

> 用 SBE 明文凍結需求，**test 只依規格、code 只依規格**，不互相參考。

這切斷了「同一個 AI 同時生成 code 與 test」的同源理解風險：當 AI 寫 code 時看到的是 SBE 範例、寫 test 時也只看到同一份範例，**兩者都對齊外部需求而非彼此**。

## 與 BDD 的關係

| | BDD（Behavior-Driven Development）| SBE |
|---|---|---|
| 提出者 | Dan North, 2003 | Gojko Adzic, 2011 |
| 焦點 | **流程**：需求發掘 → 共識 → 自動化 | **產出物**：可執行範例 |
| 工具 | Cucumber、SpecFlow（Given-When-Then DSL） | 任何能把範例變測試的工具 |
| 關係 | SBE 可視為 BDD 的「規格產出物」面向 | BDD 是涵蓋 SBE 的更廣方法論 |

兩者實務上常混用，差異在學術/書籍語境才嚴格區分。

## 在 [[AI-Quality-Collusion]] 對策中的角色

[[AI-Quality-Collusion]] 列出三個結構性對策：

1. **隔離 code / test 生成的 context**（不同 session / subagent / 模型）
2. **以 SBE 凍結需求** ← 本頁主題
3. **保留人類定義的黃金測試**

第 2 點的具體操作：
- 在開發 ticket 寫具體 input/output 範例（不是抽象描述）
- 用 Gherkin / `*.feature` 等可執行格式記錄
- code agent 與 test agent 各自只依此範例操作，**無權瀏覽彼此的 prompt 或實作**

## Gherkin 範例

```gherkin
Feature: 新會員首次下單折扣

  Scenario: Alice 首次下單
    Given Alice 是新會員
    And 購物車總額是 $1000
    When 她完成結帳
    Then 訂單總額應為 $900
    And 折扣金額顯示為 $100
```

這份檔案：
- 產品經理可讀（自然語言）
- 工程師可實作（明確 input/output）
- 測試框架可執行（Cucumber 等）

## 信心評估

- **強**：定義、與 BDD 的關係、Gojko Adzic 來源 — 軟體工程公認知識
- **強**：在 [[AI-Quality-Collusion]] 對策中的角色 — 直接來自 [[src-spt-ai-quality-collusion]] 引用
- **中**：實務採用率 — 在 Web 開發圈普及率不及 unit test，但在金融/醫療等嚴謹領域常見

## 相關頁面

- [[AI-Quality-Collusion]] — 把 SBE 列為結構性對策的論述
- [[src-spt-ai-quality-collusion]] — 來源頁
- [[Vibe-Coding]] / [[Agentic-AI-Workflow]] — AI 主導開發範式中，SBE 可作為 prompt 邊界
