---
title: PGE 原則（Generator ≠ Evaluator）
type: concept
sources: ["zeuikli-claude-code-best-practices.md"]
created: 2026-05-20
updated: 2026-05-20
tags: [ai-quality, code-review, subagent, validation, anthropic-official]
confidence: 強
---

# PGE 原則（Generator ≠ Evaluator）

> 「**產生程式碼的模型不應是評估程式碼的模型。**」

由 [[src-zeuikli-claude-code-best-practices|zeuikli 報告]]整理為章 10 的核心原則——本知識庫多個既有反模式對策的**上位原則**。

## 定義

PGE 原則的精準表述：

| 角色 | 職責 | 邊界 |
|---|---|---|
| **Generator** | 產生程式碼 / 內容 / 文件 | 對自己的產出有「**正面偏差**」 |
| **Evaluator** | 評估產出是否合格 | 必須**獨立於 Generator** 才能客觀 |

當 Generator 同時當 Evaluator 時，產出「測試對齊實作而非對齊需求」的 [[AI-Quality-Collusion|AI 品質共謀]]——測試只是在驗證它自己的邏輯。

## 三層應用（驗證流程）

依 zeuikli 整理的官方版驗證流程：

```bash
# PGE 驗證流程
1. Claude 實作功能（Generator）
2. bash scripts/healthcheck.sh（External Evaluator）
3. 展示前 5 行 / 後 5 行輸出（禁止口頭聲稱「測試通過」）
4. 失敗時完整貼出錯誤，不省略
```

**External Evaluator 三層選擇**：

| 層 | Evaluator 性質 | 範例 |
|---|---|---|
| **層 1：機器** | 完全確定性、不依賴 LLM 判斷 | `npm test` / `tsc --noEmit` / `bash healthcheck.sh` / linter |
| **層 2：人類** | 主觀但具備領域 context | 「資深工程師會核准嗎」（[[Boris-Cherny]]）/ exploratory testing |
| **層 3：另一個 AI**（**最弱**）| 仍是 LLM，但 context 隔離 | [[Subagent-Driven-Development\|Spec reviewer subagent]] / [[Adversarial-Code-Review\|對抗式 review]] |

> 三層**疊加**最強，單用層 3 仍有 AI 共謀風險。

## 在本 wiki 既有概念中的上位定位

PGE 原則是多個既有反模式對策的**統一論述**：

| 既有概念 | PGE 在其中的角色 |
|---|---|
| [[AI-Quality-Collusion]] | 「同源理解」反模式——PGE 是該反模式的**結構性對策原則**：拆 Generator 與 Evaluator |
| [[Subagent-Driven-Development]] | 「兩階段 reviewer subagent」設計——具體實作 PGE，spec reviewer 與 implementer 隔離 context |
| [[Adversarial-Code-Review]] | 「對抗式 prompt」設計——是 PGE 中「層 3 AI evaluator」的**強化版**（加 focus prompt + 自訂角色） |
| [[Fields-Without-Enforcement-Anti-Pattern]] | 「schema 有欄位但邏輯沒檢查」——PGE 視角下：Generator 寫 schema、Evaluator 必須是獨立 service / regression test |
| [[CLAUDE-md]] Rule 9（Tests verify intent）| 「測試業務邏輯改變時會 fail」—— 具體版的 PGE 應用：tests 是獨立的 Evaluator，不能依賴 Generator 假設 |

## 與「Iron Law」型規則的關係

PGE 原則本身就是 [[CLAUDE-md|CLAUDE.md]] 的**飛行員 checklist** 級規則——可直接寫進專案 CLAUDE.md：

```markdown
## 驗證原則（PGE）
- 實作模型不能是評估模型
- 跑 healthcheck.sh，貼出實際輸出
- 禁止口頭聲稱「測試通過」
```

對應 [[Ratchet-Pattern]]：每次踩到 AI 共謀後，把這條 PGE 規則編碼進 CLAUDE.md 永久守住。

## 在各來源中的角色

- [[src-zeuikli-claude-code-best-practices]]：章 10「官方驗證心法與完成標準」首次明白命名為「PGE 原則」；引用 [[Boris-Cherny]] 完成驗證心法
- [[src-spt-ai-quality-collusion]]：先前 [[AI-Quality-Collusion]] 反模式的來源，描述了「需要結構性隔離 Generator 與 Evaluator」但未用 PGE 名詞
- [[src-mani-kingdom-phase-3-7-3-9-retro]]（已從 git 撤回）：個人實作累積的「reviewer subagent 與 implementer 分開」是 PGE 的個人版實作

## 信心評估

- **強**：原則本身——zeuikli 整理為章 10 核心，[[Boris-Cherny]] 完成驗證心法做為證據
- **強**：與多個既有反模式對策的上位關係——多個 wiki 概念可被歸納為 PGE 的具體應用
- **中**：「PGE」命名的官方性——zeuikli 整理用語，未必是 Anthropic 官方用詞；論述本身是官方的

## 相關概念

- [[AI-Quality-Collusion]] — PGE 主要對抗的反模式
- [[Subagent-Driven-Development]] — PGE 的具體實作模式
- [[Adversarial-Code-Review]] — PGE 中層 3 AI evaluator 的強化版
- [[Fields-Without-Enforcement-Anti-Pattern]] — PGE 視角下的 schema 反模式
- [[Ratchet-Pattern]] — PGE 寫進 CLAUDE.md 是 Ratchet 編碼的範例
- [[Context-Engineering]] — Generator 與 Evaluator 各自的 context 需要獨立組裝

## 相關實體

- [[Boris-Cherny]] — 完成驗證心法（「資深工程師會核准嗎」）的提出者
- [[Thariq-Shihipar]] — Cache 與 Context 工程的相關論述者

## 應用與案例

- 本知識庫 `.claude/CLAUDE.md` 中「raw/ 不可修改」「commit 前 grep 自查」等規則就是 PGE 原則在「個人實作」層的應用——人類是 Evaluator（grep 自查），AI 是 Generator
