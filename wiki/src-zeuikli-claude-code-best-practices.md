---
title: Claude Code 各面向最佳實踐完整研究報告（zeuikli / 2026-05-16）
type: source
sources: ["zeuikli-claude-code-best-practices.md"]
created: 2026-05-20
updated: 2026-05-20
tags: [claude-code, best-practices, pge-principle, context-engineering, integration-report, boris-cherny, thariq-shihipar]
confidence: 強
---

# Claude Code 各面向最佳實踐完整研究報告（zeuikli / 2026-05-16）

**作者 / 整理者**：GitHub `zeuikli`（個人 workspace repo）
**原文連結**：https://github.com/zeuikli/claude-code-workspace/blob/main/docs/2026-05-16-claude-code-best-practices.md
**整理日期**：2026-05-16
**引用範圍**：`research/best-practices/` 29 篇 + `research/claude-blog/` 52 篇 + Anthropic 核心人物（[[Boris-Cherny]] / [[Thariq-Shihipar]]）引言
**規模**：1254 行 / 10 章 + 2 附錄
**性質**：**第二手整合報告**——把 Anthropic 官方 + 社群實踐整合成單一參考文件

## 核心主張

- **「[[Context-Engineering|Context Engineering]] 是 Claude Code 真正的工程護城河，遠比 Prompt 撰寫技巧更重要。」**—— 整篇核心論點
- 跨 9 個面向系統梳理：CLAUDE.md / Hooks / Prompt Caching / Subagent / Skill / MCP / 安全 / Routines / 成本工程
- [[PGE-Principle|PGE 原則]]（Generator ≠ Evaluator）作為驗證心法上位原則
- Cache Hit Rate 應「**treated like uptime**」（[[Thariq-Shihipar]]）；節省 90% 成本（Sonnet 4.6 $3 → $0.30/MTok）
- Boris Cherny 完成驗證心法：「資深工程師會核准嗎？否 → 先修再報」

## 詳細摘要

### 章 1：CLAUDE.md 與記憶系統

**1.1 設計原則**：
- **最佳 60 行、≤200 行**（vs 本 wiki 先前紀錄「100 行以內」）
- 「超過 200 行後，模型對規則的遵從率從 **76% 跌至 52%**」—— 補 [[src-bnext-claude-md-12-rules|12 條規則]] 的 76% 數字為「上限值」
- 「每行都應通過：移除這行，Claude 會犯錯嗎？答案『否』→ 立即刪除」

**1.2 Path-Scoped Rules**（**新概念**）：按路徑觸發的規則。例如 `WordPress/` 下才載入 WP 相關規則。

**1.3 Auto Memory**（**新概念**）：Claude 的長期記憶機制——詳見 [[MEMORY-md]] 補強段。

**1.4 大型 Codebase 的三層 Context 架構**：層 1 系統 / 層 2 專案 / 層 3 任務。

### 章 2：Hooks 自動化架構

**Hooks 三層**：
- **PreToolUse**（防守型）：阻擋危險指令、過濾敏感資訊
- **PostToolUse**（自動化型）：自動 lint / format / 觸發後續流程
- **進階**：stop hooks 提議 CLAUDE.md 更新、start hooks 動態載入 context（與 [[src-claude-code-in-large-codebases|Anthropic 官方 blog]]一致）

### 章 3：Prompt Caching 與 Context 工程

#### 3.1 Cache 是生產系統核心指標

[[Thariq-Shihipar]]（Claude Code 核心團隊）：

> 「**Cache rules everything. We treat it like uptime. When it drops, we have an incident.**」

Cache Hit Rate 應列為與服務可用率同等重要的監控指標。命中率下降通常是三個原因：
1. System prompt 被動態修改
2. 工具定義在 session 中增刪
3. Mid-session 切換了模型

**成本對比**（Sonnet 4.6）：

| 操作 | 費率 |
|---|---|
| 一般輸入 token | $3 / MTok |
| Cache 寫入（1h TTL） | $6 / MTok |
| **Cache 命中** | **$0.30 / MTok（節省 90%）** |

#### 3.2 分層快取結構

```
層 1（最穩定，cache 效益最高）：System Prompt + Tools 定義
層 2（中度穩定）：專案檔案（CLAUDE.md、codebase 概述）
層 3（每 session 不同）：當次任務 context
層 4（每次請求不同）：對話訊息（Messages）
```

設 `cache_control: {"type": "ephemeral"}` 在**最穩定層**作 breakpoint。

#### 3.3 五個禁止操作（會破 cache）

詳見原文。

#### 3.4 [[Context-Engineering|Context Engineering]]：真正的護城河

「**在執行時組裝正確資訊並正確排序**」——Anthropic 官方近年的工程定位。

### 章 4：Subagent 委派策略

#### 4.1 委派決策核心心智模型
- 範圍清楚、可獨立驗證 → 委派
- 需要連續 context 推進 → 自己做

#### 4.2 拓撲規則 / 4.3 工具作用域隔離 / 4.4 平行化工作流
#### 4.5 Advisor 模式（**新概念**）：不寫程式碼，只給意見的 subagent

### 章 5：Skill 知識封裝

- **Description 的寫法：給模型看的，不是給人看的**
- **Progressive Disclosure**：避免 Skill 膨脹（呼應 [[src-claude-code-in-large-codebases|官方版]]）
- **自由度分層原則**：高自由度（探索）→ 低自由度（標準 SOP）
- **生命週期管理**：建立 / 評估 / 修訂 / 退役

### 章 6：MCP 整合與工具擴展

- **6.1 MCP 定位**：「USB-C for AI tools」
- **6.2 三種 Transport 模式**：stdio / HTTP / SSE
- **6.3 Scope 優先序**：local > project > user
- **6.4 Tool Search**（**新概念**）：按需載入工具 Schema，避免一次塞太多
- **6.5 MCP 輸出控制**：response truncation / structured output

### 章 7：安全部署與權限控制

- 7.1 多層防禦架構
- 7.2 Permission 系統（含 `.claude/settings.json`）
- 7.3 Sandboxing
- 7.4 憑證管理 Proxy Pattern

### 章 8：Routines 排程自動化（**新概念整章**）

- **8.1 Routine 是什麼**：Cron-like 排程任務
- **8.2 自動化配方**（[[Boris-Cherny]] 實戰）
- **8.3 常見自動化場景**：每日 standup、PR review、backlog 維護
- **8.4 使用限額**

### 章 9：成本工程與效能優化

#### 9.1 三層成本防線
#### 9.2 Effort Level 選擇（**新概念**）：low / medium / high reasoning
#### 9.3 CJK 內容特殊注意（**新**）：中日韓字元 token 成本
#### 9.4 量化成效案例

### 章 10：官方驗證心法與完成標準

#### 10.1 [[PGE-Principle|PGE 原則]]（Generator ≠ Evaluator）

> 「**產生程式碼的模型不應是評估程式碼的模型。**」

驗證流程：
1. Claude 實作功能（Generator）
2. `bash scripts/healthcheck.sh`（External Evaluator）
3. **展示前 5 行 / 後 5 行輸出**（禁止口頭聲稱「測試通過」）
4. 失敗時完整貼出錯誤，不省略

對應本 wiki [[Subagent-Driven-Development]] / [[AI-Quality-Collusion]] / [[Adversarial-Code-Review]] 的官方版上位原則。

#### 10.2 完成前自問清單（[[Boris-Cherny]]）

> 「**宣告完成前自問：資深工程師會核准這個嗎？否 → 先修再報。**」

「成功條件（開工前定義）」範例：
- `npm test` 全部通過（0 failures）
- TypeScript 無 type error
- API 端點回傳正確 HTTP status codes
- 效能：P95 < 200ms
- No secrets in git history

#### 10.3 Checkpoint 規範

每完成一個重要步驟輸出 1 句摘要：「Checkpoint：做了什麼 / 驗了什麼 / 剩什麼」。對應 [[src-bnext-claude-md-12-rules|12 條規則 Rule 10]]。

### 附錄 A / B

- A.1-A.5：CLAUDE.md / System Prompt / Subagent / Routine / Prompt Caching 可貼上範本
- B：快速決策參考表

## 關鍵引用

> 「**Cache rules everything. We treat it like uptime. When it drops, we have an incident.**」 — [[Thariq-Shihipar]]

> 「**宣告完成前自問：資深工程師會核准這個嗎？否 → 先修再報。**」 — [[Boris-Cherny]]

> 「**Context Engineering 是 Claude Code 真正的工程護城河，遠比 Prompt 撰寫技巧更重要。**」 — zeuikli 報告核心論點

> 「**產生程式碼的模型不應是評估程式碼的模型。**」 — PGE 原則

## 信心評估

- **強**：[[Boris-Cherny]] / [[Thariq-Shihipar]] 引言——Anthropic 核心人物可獨立驗證；Thariq 對應既有 [[src-claude-code-context-management]] 作者
- **強**：CLAUDE.md 60 行 / 200 行 / 52% 等具體數字——zeuikli 引用自 research 來源
- **中**：「9 個面向系統梳理」結構——是 zeuikli 個人歸納的整合框架，非 Anthropic 官方分類
- **中**：「research/best-practices/ 29 篇 + research/claude-blog/ 52 篇」——zeuikli 未列具體來源清單，需信任他的彙整工作
- **時效**：2026-05-16 當下快照

## 與 Wiki 的關聯

### 新建頁面

- [[PGE-Principle]]（concept）—— Generator ≠ Evaluator 上位原則
- [[Context-Engineering]]（concept）—— Anthropic 工程護城河論點
- [[Boris-Cherny]]（entity）—— Anthropic Claude Code 核心
- [[Thariq-Shihipar]]（entity）—— Anthropic Claude Code 核心 + 既有 [[src-claude-code-context-management]] 作者

### 更新既有頁面（12 個）

- [[Claude Code]]：補 Path-Scoped / Auto Memory / Routines / Effort Level 等新機制
- [[CLAUDE-md]]：補 60 行最佳 / 52% 遵從率數字 / Path-Scoped Rules
- [[Context-Rot]]：補 Thariq「Cache rules everything」+ 分層快取結構
- [[Subagent-Driven-Development]]：補 PGE 原則官方版上位
- [[AI-Quality-Collusion]]：補 PGE 原則作為對策
- [[Adversarial-Code-Review]]：同上
- [[Agent-Skills]]：補 Description 寫法 / 自由度分層原則
- [[MCP]]：補 Tool Search / Scope 優先序 / Transport 模式
- [[MEMORY-md]]：補 Auto Memory 機制
- [[Ratchet-Pattern]]：補 [[Boris-Cherny]] 完成驗證心法
- [[src-claude-code-context-management]]：補 Thariq 新引言 + 連結 entity 頁
- [[src-bnext-claude-md-12-rules]]：補 60 行 vs 200 行 vs 52% 遵從率對照

### 形成的對話組

- **本來源**（社群第二手整合）↔ **[[src-claude-code-in-large-codebases]]**（Anthropic 官方）：同主題兩種視角，本來源更詳盡含 81 篇引用，官方更權威但更精煉
- **本來源** ↔ **[[src-bnext-claude-md-12-rules]]**：CLAUDE.md 數字三組——12 條規則 76% 遵循度 / 本來源 200 行後跌 52% / 60 行最佳
- **本來源** ↔ **[[src-asgard-skills-audit-2026-05-19]]**：兩個第二手整合視角——zeuikli 偏觀念整合、Asgard audit 偏 repo 實測

### 未來可延伸

- 補抓 zeuikli 整篇 81 篇 reference 中與本 wiki 重疊度高的 5-10 篇
- Boris Cherny 公開講座 / 訪談（Routines 章節提到實戰）
- 「9 個面向系統梳理」可作為本 wiki Claude Code 主題的索引架構
- 附錄 A 範本可考慮放進 `.claude/snippets/` 之類可重用位置
