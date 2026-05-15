---
title: Subagent-Driven Development（多 subagent 兩階段審查工作流）
type: concept
sources: []
created: 2026-05-15
updated: 2026-05-15
tags: [agentic-ai-workflow, subagent, code-review, tdd, anti-pattern-prevention]
confidence: 強
---

# Subagent-Driven Development

> 給每個 task 派一個 fresh subagent 跑實作，**完工後依序派 spec reviewer + code quality reviewer** 獨立審查，抓到 issue 就退回 implementer 修，再 review，直到通過。

**來源**：個人實作累積（已去識別）。

## 核心構成

| 角色 | 模型負載 | 職責 |
|---|---|---|
| Controller（主對話） | 高（協調用） | 讀 plan、curate context、dispatch、整合 review、推進 task list |
| Implementer subagent | 中（依任務複雜度浮動） | fresh context、照 plan step 跑 TDD、實作、commit |
| Spec reviewer subagent | 低 | **「DO NOT trust implementer report」**，獨立讀 commit diff，逐項對比 spec 要求 |
| Code quality reviewer subagent | 中 | spec ✅ 後才跑；看 style / naming / test design / over-engineering |
| Final reviewer（task 全結束後） | 高 | 看整個 branch 是否 ready to merge |

## 設計原理

- **Fresh context per task**：避免 controller 自己累積的偏見污染後續 task；每個 implementer 從 plan 文字啟動，不繼承對話歷史
- **兩階段拆 review**：spec reviewer 機械化驗「做了什麼」；code reviewer 主觀評「做得好不好」。不要一個 reviewer 同時管兩件事
- **Curated context not file paths**：controller 把 plan 內 task 全文 + 必要 context 直接寫進 dispatch prompt，**不要叫 subagent 自己讀 plan 檔**——subagent context 越乾淨越能聚焦

## 抓到的真實 bug 類型

跨多次 session 累積的觀察，依「哪個 reviewer 抓到」分類：

| Bug 類型 | 範例 | 哪個 reviewer 抓到 |
|---|---|---|
| **OOS scope creep** | Implementer 順手調整非該 task 範圍的欄位順序 | Spec reviewer |
| **系統性 style drift** | 日期類別 FQCN 連續多 task 用全限定名不 import | Code quality reviewer |
| **Placeholder collision** | Sequential 編號的 template token 容易撞使用者真實內容 | Code quality reviewer |
| **路徑邊界 case** | `str_starts_with($path, 'prefix')` 誤 match `/prefix123` | Code quality reviewer |
| **整合發現** | Admin panel 有獨立 middleware stack 不走預設 group | Implementer 自己 flagged DONE_WITH_CONCERNS |

## 抓不到的（必須自己防）

> 兩階段 review **抓不到** plan 本身的事實錯誤。

例：plan 寫某套件用 `propertyA` 查 model auto-log 紀錄，實際 column 名是 `propertyB`。spec reviewer 照 plan 驗、code reviewer 看實作合理性——兩者都不會質疑 plan 的事實正確性。

**只有 implementer 跑 TDD red-green 時自己撞到**（測試怎麼寫都 fail，逼著查套件原始碼），才會發現。

## 何時用 / 不用

**用：**
- Task 之間可獨立、有清楚 spec
- 希望 audit trail（每個 task 都有 implementer + 2 reviewer 紀錄）
- Codebase 已成熟、style 一致性敏感
- 預期會有 OOS scope creep 風險（implementer 「順手做點別的」）

**不用：**
- Tightly coupled tasks（需要跨 task 共用 context）
- Prototype 探索（spec 還不確定）
- 改動範圍極小（一行修正 + 一個 test，dispatch overhead > 實作 overhead）

## 成本估算

每個 task 至少 3 個 subagent invocation（implementer + 2 reviewer），有時加 fix subagent。約 inline execution 的 **3-5 倍** 模型成本，但 catch 率明顯高（一個連續 13 task 樣本中抓到 8 個非 trivial issue），且 fix 在 push 前完成，避免後續 debug + revert 的更高成本。

## 流程圖

```
plan file
   ↓
Controller 讀 plan、extract all tasks
   ↓
[per task loop]
   Controller dispatch Implementer (full task text + context)
   ↓
   Implementer: TDD red-green-refactor-commit
   ↓
   Controller dispatch Spec Reviewer (task requirements + commit SHA)
   ↓
   Spec ✅? → 否 → Implementer 修 → 再 Spec Review
        ↓ 是
   Controller dispatch Code Quality Reviewer (commit SHA + plan reference)
   ↓
   Approved? → 否 → Implementer 修 → 再 Code Review
        ↓ 是
   Mark task complete
   ↓
[all tasks done]
   ↓
Final Reviewer（整 branch ready to merge）
   ↓
Merge + Push
```

## 連結

- 上位範式：[[Agentic-AI-Workflow]]、[[Claude Code]]
- 對立 / 互補：[[Adversarial-Code-Review]]（review 在外、由獨立 AI 對抗式找 bug；subagent-driven 在內、由 controller 派 review）
- 反模式防護：[[AI-Quality-Collusion]]（AI 同時寫 code + test 的隱形共謀）
- 規格依賴：[[Specification-by-Example]]（plan / spec 的具體性決定 reviewer 能不能驗）
- 規則固化：[[Ratchet-Pattern]]（每次 reviewer 抓到的反模式應該編成永久規則）
