---
title: CLAUDE.md 12 條規則 — Forrest Chang 4 條 + Mnimiy 8 條擴充
type: source
sources: ["bnext-claude-md-12-rules.md"]
created: 2026-05-19
updated: 2026-05-19
tags: [claude-md, prompt-engineering, ratchet, production, blind-test, ai-coding]
confidence: 強
---

# CLAUDE.md 12 條規則 — Forrest Chang 4 條 + Mnimiy 8 條擴充

**bnext 文章作者**：蘇柔瑋
**原始實證**：Mnimiy（X @Mnilax / `https://x.com/Mnilax/status/2053116311132155938`）
**原始 4 條作者**：Forrest Chang（GitHub `CLAUDE.md` 12 萬星）
**發表日期**：2026-05-18
**原文連結**：https://www.bnext.com.tw/article/90965/claude.md-claude-code
**性質**：二次整理（bnext 整理 Mnimiy 的實證 + Forrest Chang 4 條規則 + [[Andrej-Karpathy]] 原始問題觀察）

## 核心主張

- [[Andrej-Karpathy]] 提出 AI 寫程式 3 缺失 → Forrest Chang 整理成 4 條 [[CLAUDE-md|CLAUDE.md]] 規則（GitHub 12 萬星，2026 成長最快開源專案之一）→ Mnimiy 補 8 條應對「複雜多步驟 agent」與「大型專案」漏洞 → 共 12 條 production 範本
- **30 codebase / 6 週盲測**：無規則 **41% 錯誤率** → 4 條 **11%** → 12 條 **3%**；指令遵循度 78% → 76%（幾乎無犧牲）
- **「規則只應防止你實際遇過的失敗」** —— 與本知識庫 [[Ratchet-Pattern]] 跨工程文化獨立得出同一原則
- **三大 prompt 反模式**（Mnimiy 實測）：抽象規則 > 具體範例、情緒喊話/角色扮演無用、依賴特定工具的死指令

## 詳細摘要

### 一、源頭：[[Andrej-Karpathy]] AI 寫程式 3 缺失（2026 初）

1. AI 遇不確定情境時不問，**自行假設並繼續執行** → 產出與需求不符
2. AI 傾向**用複雜架構解決簡單問題** → 多餘抽象層、不必要功能
3. AI 修改指定範圍時**順手「整理」周邊不相關 code、格式或註解** → 難追蹤副作用

### 二、Forrest Chang 原始 4 條（GitHub 12 萬星）

| # | 規則 | 對應 Karpathy 缺失 |
|---|---|---|
| 1 | **Think Before Coding** —— 寫前釐清假設、不清楚就停下發問 | 缺失 1 |
| 2 | **Simplicity First** —— 最少 code 解問題、拒過度工程 | 缺失 2 |
| 3 | **Surgical Changes** —— 只動需求相關範圍、不順手改別處 | 缺失 3 |
| 4 | **Goal-Driven Execution** —— 任務化為可驗證目標、多步驟建檢查點 | 所有 |

### 三、Mnimiy 發現原 4 條的 4 個漏洞

針對 2026 年「複雜多步驟 AI agent + 大型專案」場景：

1. **無法應付長時間多步驟任務**：缺 token 預算與進度檢查點 → AI 迷失方向、悄悄疊加錯誤
2. **多 codebase 風格混亂**：AI 「平均融合」相衝寫法 → 寫出更難 debug 的 code
3. **產生為通過而通過的無效測試**：AI 為交差寫淺層測試只為亮綠燈
4. **扼殺原型開發彈性**：「簡單至上」對快速搭建框架反而綁手綁腳

### 四、Mnimiy 新增 8 條（Rule 5-12）

| # | 規則 | 對應 wiki 概念 | 關鍵字 |
|---|---|---|---|
| 5 | **Use the model only for judgment calls** | （新）| classification / drafting / summarization 用 AI；routing / retries / deterministic transform 用 code |
| 6 | **Token budgets are not advisory** | [[Context-Rot]] 對抗工具 | Per-task 4,000 / Per-session 30,000；接近就 summarize 重啟 |
| 7 | **Surface conflicts, don't average them** | （新）| 相衝寫法選一（較新/較測試完整）、解釋為什麼、flag 另一個待清理 |
| 8 | **Read before you write** | [[Subagent-Driven-Development]] curated context | 寫 code 前讀 exports / immediate caller / shared utilities |
| 9 | **Tests verify intent, not just behavior** | **[[AI-Quality-Collusion]]** 直接對策 | 業務邏輯改變時測試會 fail = 有效；hardcoded id 的 assertion = 廢測試 |
| 10 | **Checkpoint after every significant step** | [[Subagent-Driven-Development]] spec reviewer | 每步回報「已完成 / 已驗證 / 剩餘」；無法描述當前狀態就 stop and restate |
| 11 | **Match conventions, even if you disagree** | （新）| Conformance > taste；不同意則 surface，不要 silently fork |
| 12 | **Fail loud** | [[Hybrid-XSS-Defense]] / [[Fields-Without-Enforcement-Anti-Pattern]] 同範式 | 「Migration completed」如果 silently skip 30 records 就是錯；surfacing uncertainty > hiding |

### 五、30 codebase / 6 週盲測結果

| 條件 | 錯誤率 | 指令遵循度 |
|---|---|---|
| 無規則 | **41%** | — |
| 4 條規則 | **11%** | 78% |
| 12 條規則 | **3%** | 76% |

**關鍵洞察**：規則從 4 條加到 12 條，遵循度只從 78% 降到 76%（幾乎無犧牲），卻換到 8% 額外錯誤率降幅。打破「規則越多越失控」迷思。

**外部補強**（[[src-zeuikli-claude-code-best-practices|zeuikli 2026-05]]）：「**超過 200 行後，模型對規則的遵從率從 76% 跌至 52%**」——把本表的「76% 上限」連到「200 行門檻」。意味著 12 條規則範本剛好在「不超 200 行」的安全區，再多就會跌。建議 CLAUDE.md **最佳 60 行、絕不超 200 行**。

### 六、三大 prompt 反模式（Mnimiy 實測）

#### 反模式 1：寫範例不如寫規則

- **3 個範例 ≈ 10 條抽象規則的 token 消耗**
- AI 對範例**過度擬合**，變得不知變通
- 應用：抽象規則 > 具體範例

對應 [[Prompt-Pack-Pattern]] 中「Visual Beats Library 是限制清單」的同源原則。

#### 反模式 2：情緒喊話與角色扮演是純雜訊

- 「請仔細思考」「你要表現得像個資深工程師」**遵循度暴跌至 30%**
- 無法被驗證的空泛指令 = 無效
- 應用：指令必須是具體的動作

#### 反模式 3：依賴特定工具的死指令

- 「永遠使用 ESLINT」是個陷阱 —— 專案沒安裝就**靜默失效**
- 應用：用不受工具限制的說法

### 七、Mnimiy 的克制原則（與 [[Ratchet-Pattern]] 同源）

> 「**一個針對你真實痛點量身打造的 6 條規則，絕對勝過一個塞滿了 6 條你永遠用不到的 12 條規則範本。**」

> 「**不要盲目套用這 12 條規則，每一條寫進去的規則都必須能回答一個問題：這能防止我實際遇過的什麼錯誤？**」

→ 跨工程文化獨立得出 [[Ratchet-Pattern]] 同一原則。

## 完整 12 條規則範本

範本可直接複製貼到專案 `CLAUDE.md`。詳見 `raw/bnext-claude-md-12-rules.md` 第 110-180 行。

## 關鍵引用

> 「規則 7：兩個相衝模式不要『平均』。Pick one. 『Average』 code that satisfies both rules is the worst code.」

> 「規則 8：『Looks orthogonal to me』 is the most dangerous phrase in this codebase.」

> 「規則 9：A test that can't fail when business logic changes is wrong.」

> 「規則 12：『Migration completed』 is wrong if 30 records were skipped silently.」

> 「一個針對你真實痛點量身打造的 6 條規則，絕對勝過一個塞滿了 6 條你永遠用不到的 12 條規則範本。」—— Mnimiy

## 信心評估

- **強**：12 條規則原文（bnext 完整列出英文原文範本）+ Forrest Chang GitHub 12 萬星數據 + Mnimiy 盲測 41%/11%/3% 數據
- **強**：與 [[Ratchet-Pattern]] 「規則只應防止實際遇過的失敗」原則同源
- **中**：Mnimiy 個人實測有效性 —— 30 codebase / 6 週為他單方面數據，未獨立驗證
- **中**：[[Andrej-Karpathy]] 「AI 寫程式 3 缺失」的原始出處 —— bnext 引用為「2026 年初」，未提供具體 source
- **時效**：2026-05-18 當下的數據快照；模型 / 工具進化後盲測數據可能變動

## 與 Wiki 的關聯

### 形成的對話組

- **本來源** ↔ **[[CLAUDE-md]]**：從「方法論說明」升級為「**含具體可貼上範本 + 實證效果數據**」的完整參考頁
- **本來源** ↔ **[[src-addy-osmani-harness-engineering]]** / **[[Ratchet-Pattern]]**：跨工程文化獨立得出**「規則只應防止實際遇過的失敗」**同一原則
- **本來源** ↔ **[[src-techhanlin-claude-code-8-settings]]** / **[[src-techhanlin-llm-wiki-tutorial]]**：CLAUDE.md 範式的中文圈整理鏈條從「8 個實戰設定」延伸到「12 條規則」
- **本來源** ↔ **[[src-cloudflare-ai-code-review]]**：[[AGENTS-md]] 審查者 vs CLAUDE.md 12 條規則—— production-grade 對照組
- **本來源 Rule 6** ↔ **[[Context-Rot]]**：Token budget 是該概念的個人版對抗工具
- **本來源 Rule 9** ↔ **[[AI-Quality-Collusion]]**：直接對應該反模式的對策
- **本來源 Rule 10** ↔ **[[Subagent-Driven-Development]]**：checkpoint 是 spec reviewer 工作流的個人簡化版

### 更新既有頁面

- [[CLAUDE-md]]：大幅擴充——12 條規則摘要表 + 盲測數據 + 三大反模式
- [[Ratchet-Pattern]]：補實證數據（41% → 3%）+ Mnimiy 同源原則
- [[Andrej-Karpathy]]：補 2026 初 AI 寫程式 3 缺失觀察
- [[Context-Rot]]：補 Rule 6（per-task 4,000 / per-session 30,000）個人版
- [[AI-Quality-Collusion]]：補 Rule 9（tests verify intent）直接對策
- [[Prompt-Pack-Pattern]]：補三大反模式警示（抽象規則優先 / 情緒喊話無用 / 工具死指令）

### 未來可延伸

- 補抓 Mnimiy 原 X 貼文（X.com unauthenticated 抓不到，需登入態手動貼上）
- 補抓 Forrest Chang GitHub CLAUDE.md 原 repo（公開、應可抓）
- Karpathy 2026 初提到 AI 寫程式 3 缺失的具體出處 / X 貼文
