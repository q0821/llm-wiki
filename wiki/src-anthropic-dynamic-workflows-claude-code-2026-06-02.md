---
title: A harness for every task — Dynamic Workflows in Claude Code（Anthropic 官方 2026-06-02）
type: source
sources: ["2026-06-03-anthropic-dynamic-workflows-in-claude-code.md"]
created: 2026-06-03
updated: 2026-06-03
tags: [anthropic, claude-code, harness-engineering, workflow, subagent, agent-failure-modes, dynamic-workflow, thariq-shihipar, sid-bidasaria]
confidence: 強
aliases: ["Dynamic Workflows blog", "Anthropic Workflow tool blog", "A harness for every task"]
---

# A harness for every task: Dynamic Workflows in Claude Code（Anthropic 官方 2026-06-02）

**來源**：Anthropic 官方 blog
**原始連結**：https://claude.com/blog/a-harness-for-every-task-dynamic-workflows-in-claude-code
**作者**：[[Thariq-Shihipar]] + Sid Bidasaria（Anthropic 技術員工）
**發佈日期**：2026-06-02（本知識庫於 2026-06-03 ingest）
**抓取於**：2026-06-03
**來源類型**：強論點型 + 廠商官方來源（含三大失敗模式診斷框架 + 6 種設計模式 + 10 類使用案例 + 明確「何時不要用」清單）

> 本來源與既有 [[Harness-Engineering]] / [[Agentic-AI-Workflow]] / [[Subagent-Driven-Development]] / [[Adversarial-Code-Review]] / [[PGE-Principle]] / [[Context-Rot]] / [[Thariq-Shihipar]] 等多個既有頁形成大範圍**對話組擴展**。Anthropic 官方論述持續累積，本篇是 [[src-claude-code-context-management]] 同作者 [[Thariq-Shihipar]] 在 dynamic workflow 主題上的續論。

## 為什麼這份文件值得獨立成頁

Anthropic 在這篇 blog 提供了三個過去本知識庫沒有的明確框架：

1. **三大 agent 失敗模式 vocabulary**（Agentic laziness / Self-preferential bias / Goal drift）—— 第一次以三個 named 並列概念出現，過去散見於 [[Context-Rot]] / [[AI-Quality-Collusion]] 等頁但無統一命名
2. **六種 dynamic workflow 設計模式**（Classify-and-Act / Fan-out-and-Synthesize / Adversarial Verification / Generate-and-Filter / Tournament / Loop Until Done）—— 對 [[Subagent-Driven-Development]] 兩階段審查的官方擴展版
3. **十類使用案例的 ROI 判斷框架**（含明確「何時不要用」）—— 對 [[PGE-Principle]] 的官方落地清單

## 三大 agent 失敗模式（Anthropic 官方分類）

Anthropic 主張長期複雜任務在單一 context window 中容易出現三大失敗模式：

| 失敗模式 | 原文定義 | 對位的既有概念 |
|---|---|---|
| **Agentic laziness** | "Claude stops before finishing a particularly complex, multi-part task" | 對應 [[Vibe-Coding\|Vibe-Coding 過早停止]] + [[Context-Rot]] 中段失憶後跳結尾現象 |
| **Self-preferential bias** | "Claude's tendency to prefer its own results or findings" | 對應 [[AI-Quality-Collusion]] 中「Code 與 Test 同源共謀」的根因 + [[PGE-Principle]] Generator ≠ Evaluator 要解決的偏好閉環 |
| **Goal drift** | "gradual loss of fidelity to the original objective across many turns" | 對應 [[Context-Rot]] 長 context 中目標稀釋 + [[CLAUDE-md\|CLAUDE.md]] 規則被 dilute 的現象 |

### 為什麼三大模式 vocabulary 重要

過去這 3 個現象**散見於多個 anti-pattern 頁但無統一命名**。Anthropic 第一次把它們**並列**為「為什麼需要分離 context windows」的根本動機。命名統一後：
- 診斷 agent 不好的原因可以**直接歸類**
- 客戶 / 朋友抱怨「AI 不好用」時可以**指出具體哪一類**而非含糊「不夠聰明」
- 對接 [[Ratchet-Pattern]] 對症下藥（不同失敗模式對應不同 ratchet 規則）

**Concept 升級候選**：「Agent Failure Modes (3)」或「Three Agent Failure Modes」單獨成 concept 頁的條件——再出現 1 次（其他來源或本知識庫實戰確認）。

## Dynamic vs Static Workflows

| 特性 | Dynamic | Static |
|---|---|---|
| 構建時機 | 運行時（on-the-fly） | 預先定義 |
| 靈活性 | 任務特定化定製 | 通用邊界情況覆蓋 |
| 模型選擇 | 動態路由 | 固定 |
| Context window | 分離隔離 | 共享或序列化 |

定義：**Dynamic Workflows = Claude Code 動態編寫並協調的多智能體編排系統**，基於 JavaScript 執行特定函數以生成和管理 subagents。

### 對 [[Harness-Engineering]] 的延伸

> "The default Claude Code harness is built for coding, it is also useful for many other types of tasks because, as it turns out, many tasks resemble coding tasks."

關鍵句：**default Claude Code harness 是給 coding 的，但 dynamic workflows 讓你針對特定任務動態建構 harness**。這擴充了 [[Harness-Engineering]] 既有的「framework 是固定的」假設 —— harness 本身可以是 first-class 動態建構物。

## Workflow Tool 觸發方式與位置

### 觸發
- 直接詢問：「ask Claude to make one」
- 觸發詞：「`ultracode`」
- 與 `/goal` 和 `/loop` 結合（循環執行）

### 與其他組件的關係
| 對位 | 關係 |
|---|---|
| vs Subagents | Workflows 是協調多個 subagents 的**容器** |
| vs Skills | Workflows 可通過 skill 保存和分發（放置在 `~/.claude/workflows`）|
| vs Harness | Workflows **動態建構** harness，而非固定使用預設 harness |
| vs Plan / Goal / Loop | Workflows 是 implementation 層；Plan / Goal 是 orchestration 層 |

### 技術機制
- JavaScript script 含 subagent 生成 / 協調函數
- Token 預算設置（"set explicit token usage budgets"）
- 模型選擇（"decide which models an agent uses"）
- 工作樹隔離（"whether subagents are run in their own worktree"）
- 標準 JavaScript 工具：JSON / Math / Array 等

**官方 API 文件**：https://code.claude.com/docs/en/workflows（本 blog 未公開 `agent()` / `pipeline()` / `parallel()` 等 API 簽名，僅給概念說明）

## 六種設計模式

| 模式 | 機制 | 對位的既有概念 |
|---|---|---|
| **Classify-and-Act** | 分類器決定任務類型 → 路由至不同 agents | 對位 [[Harness-Engineering#模型故障回退鏈\|Cloudflare 模型故障回退鏈]]——後者是品質降級，前者是 capability 路由 |
| **Fan-out-and-Synthesize** | 分解為多步驟 → 平行執行 → 合成結果 | 對位 [[Subagent-Driven-Development]] 多 subagent + meta-agent 合成 |
| **Adversarial Verification** | 每個 agent 的輸出由獨立驗證 agent 對抗驗證 | **直接對應** [[Adversarial-Code-Review]] + [[PGE-Principle]]——Workflows 是這兩個概念的多 agent 落地實作 |
| **Generate-and-Filter** | 生成候選方案 → 按準則過濾 → 返回高質量結果 | 對位 LLM "best-of-N" sampling 但加結構化過濾 |
| **Tournament** | N 個 agents 競爭同一任務 → 裁判 agent 配對比較 | 排序 / 排名任務避免 context 爆炸的方法；本知識庫**新增 concept candidate** |
| **Loop Until Done** | 未知工作量場景按停止條件迴圈 | 對位 [[Vibe-Coding]] 但加結構化停止條件 |

### 設計模式的可遷移性

這 6 種模式**不是 Workflow tool 專屬**——可在任何 agentic 環境用（[[OpenAI-Codex-CLI]] / [[OpenCode]] 等）—— 但 Anthropic 用 dynamic workflow 把它們落地成可執行 JS 模板。**vocabulary 是中立的，實作是平台特定的**。

## 十類使用案例

1. **代碼遷移與重構** — 例：[[Bun]] 從 Zig 改寫為 Rust（使用 Workflows）—— 是 dogfood 的最強證據之一
2. **深度研究** — `/deep-research` skill：並行網絡搜索 → 對抗驗證 → 引文綜合
3. **深度驗證** — 識別事實主張 → 逐一驗證 → 驗證驗證源質量
4. **排序與排名** — Tournament 或 pairwise comparison 模式（避免 context 爆炸）
5. **記憶與規則遵守** — 每規則一個驗證 agent；挖掘歷史會話找反覆錯誤 → 提煉為規則（**直接對位** [[Ratchet-Pattern]]）
6. **根因調查** — 從不同證據（日誌、文件、數據）生成假說 → 驗證面板篩選
7. **大規模分類** — 支持隊列分類 + 去重 + 自動化修復 / 升級
8. **探索與品味** — 多方案探索 + 按品味準則評分
9. **評估（Evals）** — 輕量級評估：並行運行變體 → 比較 agents 評分
10. **模型與智能路由** — 分類器決定任務複雜度 → 路由至 Sonnet 或 Opus

### Bun (Zig → Rust) 案例的特殊性

[[Bun]] 是 JavaScript runtime（Zig 寫成的 Node.js 替代品），Anthropic 點名「Bun rewrite from Zig to Rust 用了 Workflows」是**最強的 dogfood 信號**。如果這個案例是真的（待第三方驗證），代表 Workflows 已在數百萬行程式的真實遷移專案產生 ROI，不是 toy example。**待追蹤**：第三方對此案例的獨立驗證 / Bun 團隊的公開分享。

## 何時**不**使用 Workflows（反模式）

1. **過度使用**：
   - "Workflows are not needed for every task"
   - "most traditional coding tasks do not need a panel of 5 reviewers"

2. **成本考量**：
   - "dynamic workflows often use more tokens and are best suited for complex, high value tasks"

3. **任務類型不匹配**：
   - 簡單單步任務不適合
   - 低價值、時間敏感的任務不適合

> 對位 [[Vibe-Coding]] 過度抽象批判 + [[AI-Native-Startup#4-個-AI-時代反模式|Anthropic Agentic Technical Debt 反模式]]——dynamic workflows 是有效工具但不是萬靈丹，反過度使用本身是 Anthropic 自家強調的紀律。

## 範例提示詞（原文引用）

```
"This test fails maybe 1 in 50 runs. Set up a workflow to reproduce it.
Form competing theories about the race, and don't stop until one theory
survives the evidence."
```
→ 對位「systematic debugging」（本知識庫目前無獨立 concept 頁；若後續多次出現可建）

```
"Use a workflow to rename our User model to Account everywhere."
```
→ 對位 [[Fields-Without-Enforcement-Anti-Pattern]] 預防——大規模 rename 跨 file 一致性

```
"Go through my blog post draft and verify every technical claim against
the codebase using a workflow, I don't want to ship anything wrong."
```
→ **本知識庫直接可用場景**：對於 wiki 頁面累積一段時間後，跑「verify 所有技術 claim 仍與最新 code 對應」的 workflow

## 對話組（與既有頁面延伸）

| 既有頁 | 對話面向 |
|---|---|
| [[Harness-Engineering]] | Workflows 是 harness engineering 的**動態化升級**——從 fixed harness 到 dynamic harness construction |
| [[Subagent-Driven-Development]] | Workflows 是 SDD 的官方擴展實作——SDD 是「兩階段審查」，Workflows 是 6 種編排模式都涵蓋 |
| [[Adversarial-Code-Review]] | Adversarial Verification 模式是 ACR 的多 agent 標準化版 |
| [[PGE-Principle]] | Generator ≠ Evaluator 在 Workflows 變成可執行 JS 結構，不再只是 principle |
| [[Context-Rot]] | 三大失敗模式都是 Context Rot 的具體變體分類；Workflows 用「分離 context windows」對抗 |
| [[AI-Quality-Collusion]] | Self-preferential bias 是 AI Quality Collusion 的單 agent 版根因 |
| [[Agentic-AI-Workflow]] | 從同心圓迭代擴展到 dynamic 編排，是 framework 演化的下一步 |
| [[Claude Code]] | 新 first-party feature 加入 Claude Code |
| [[Thariq-Shihipar]] | 本篇作者，[[src-claude-code-context-management]] 同作者；累積 Anthropic 內 dynamic workflow 主導者形象 |
| [[Anthropic]] | 廠商 entity 補上 dynamic workflow 章節 |
| [[Agent-Skills]] | Workflows 可以打包成 skill 透過 SKILL.md 分發 |
| [[OpenAI-Codex-CLI]] | Codex 也有 subagent / pipeline 機制但無 first-party 「dynamic workflow」對應物——這是 Anthropic 領先的軸 |
| [[CLAUDE-md\|CLAUDE.md]] | 規則遵守使用案例直接連結 CLAUDE.md ratchet 機制 |
| [[Ratchet-Pattern]] | 「挖掘歷史會話找反覆錯誤 → 提煉為規則」是 Ratchet 的官方 Workflows 落地 |
| [[src-anthropic-founders-playbook-2026]] | 「AI-Native」框架的工程層 next step |

## 未來追蹤候選 entity / concept

| 候選 | 等級 | 建立 trigger |
|---|---|---|
| **Sid Bidasaria** entity | 中 | 本篇是首次出現；再出現 1 次即建（Thariq 模式）|
| **Bun** entity | 中 | JavaScript runtime + Zig → Rust rewrite 案例；獨立技術主題；再出現 1 次即建 |
| **Agent Failure Modes (3)** concept | 高 | 三大模式 vocabulary 第一次成 named cluster；再出現 1 次即建 |
| **Dynamic Workflow** concept | 高 | 本篇是首次系統化定義；如 1-2 週內被本知識庫實戰引用 → 建 |
| **Workflow Design Patterns** concept | 中 | 6 種模式 cluster；可考慮獨立成頁或附在 [[Subagent-Driven-Development]] |
| **Tournament Pattern** concept | 低 | 6 種模式之一，本知識庫過去未出現；單獨建頁太早 |
| **Goal Drift / Self-preferential bias / Agentic Laziness** 各別 concept | 低 | 三者作為 cluster 較有意義，單獨建會過細 |

## 信心評估

- **強**：6 種設計模式 / 10 類使用案例 / 三大失敗模式 vocabulary — Anthropic 官方原文
- **強**：「dynamic vs static workflow」對比 — 結構性差別清楚
- **強**：作者背景 — [[Thariq-Shihipar]] 是 Claude Code 領域已建立 entity 的核心成員
- **中**：「dynamic workflows 真的對應到 use case 都有 ROI」— Anthropic dogfood + 自家 deep-research skill 為證，但缺乏第三方對照
- **中**：Bun (Zig → Rust) 案例 — 待第三方確認
- **中**：「ultracode 觸發詞」— 本 blog 提及但無細節說明；對齊系統提示 Workflow tool spec 應該正確但需實測
- **時效**：發佈 2026-06-02，本知識庫 06-03 ingest 仍新鮮；Workflows 是 active development 主題，半年內可能規範 / API 重大演進

## 相關概念與來源

- [[Harness-Engineering]] — 本來源是這個概念的**動態化擴展**
- [[Subagent-Driven-Development]] — 兩階段審查 → 6 種編排模式的擴展路徑
- [[Adversarial-Code-Review]] — Adversarial Verification 模式 = ACR 的多 agent 標準化
- [[PGE-Principle]] — Generator ≠ Evaluator 的可執行落地
- [[Context-Rot]] — 三大失敗模式分類
- [[AI-Quality-Collusion]] — Self-preferential bias 的單 agent 根因
- [[Agentic-AI-Workflow]] — 同心圓 → dynamic 編排的演化
- [[Thariq-Shihipar]] — 本篇作者；累積 dynamic workflow 主題權威
- [[Anthropic]] — 廠商 entity
- [[Claude Code]] — 載體
- [[Agent-Skills]] — 分發機制
- [[Ratchet-Pattern]] — Use case 5「記憶與規則遵守」直接對應
- [[CLAUDE-md\|CLAUDE.md]] — 規則遵守的具體載體
- [[Vibe-Coding]] — Agentic Laziness 的反例
- [[OpenAI-Codex-CLI]] — 對標廠商比較
- [[src-claude-code-context-management]] — 同作者 [[Thariq-Shihipar]] 的前一篇
- [[src-zeuikli-claude-code-best-practices]] — 第三方對 Claude Code 工程實踐的整合報告

---

## 個人吸收（第 7 次 / spaced retrieval 預定 2026-06-17）

### Quiz 答案

**Q1（intent）：你想拿走什麼？（4 個全選）**
- 3 大 agent 失敗模式 診斷框架
- 6 種設計模式
- 10 類使用案例 ROI 判斷
- Workflow tool 本身怎麼用

**Q2（application）：用在什麼場合？（4 個全選）**
- 自家 Claude Code 實作寫 dynamic workflow
- 診斷自己 / 客戶專案裡 agent 狀況不好的原因
- 增進 [[Harness-Engineering]] / [[Agentic-AI-Workflow]] 累積認知
- 對抑 / 對比 [[OpenAI-Codex-CLI|Codex]] / OpenAI 陣營的實作思路

### LLM 觀察：4×4 矩陣對位分析

主要對位**強對位**，但矩陣中有 **4 個 dead cell** 需標記：

| Intent ↓ \ Application → | 自寫 workflow | 診斷 agent | 增進認知 | 對抑 Codex |
|---|---|---|---|---|
| **3 大失敗模式** | ✅ | ✅✅ **完美對位** | ✅ | ✅（vocabulary 中立可遷移）|
| **6 種設計模式** | ✅✅ **完美對位** | ✅ | ✅ | ⚠️ **微錯位**：Anthropic 自家分類，講 Codex 會有框架強加風險 |
| **10 類案例 ROI** | ✅ | ⚠️ **較弱對位**：use case ≠ diagnostic | ✅ | ⚠️ **微錯位**：Anthropic 自家 dogfood，Codex 有自己的成功案例 |
| **Workflow tool API** | ✅✅ **完美對位** | ❌ **較大錯位**：API 細節對診斷無幫助 | ✅ | ⚠️ **微錯位**：Claude Code 專屬，Codex 無對應物 |

### 新對位類型：「全選 quiz 的矩陣未對位錯位」（第 7 次發現）

延續前 6 次累積出的 3 大類錯位（拿錯工具 / 場合 > 工具 / Source bias，後者含賣方敘事 / 平台守門人 2 亞型），本次浮現**新類型**：

**矩陣未對位錯位（Matrix Mismatch）**

| 軸 | 描述 |
|---|---|
| **觸發條件** | 當 intent 與 application 都「全選」（N×M 矩陣，N≥3 且 M≥3）|
| **機制** | 使用者內心是「這篇對我全方位有用」，但實際使用時只有對角線 cell 真的會啟動，其他 cell 是 dead cell |
| **危險性** | 中——比單點對位錯位**更隱蔽**，因為「全選」表面上看起來完美 |
| **診斷問題** | 「**如果我下週只能用其中 1 個 intent × 1 個 application 組合，會選哪一個？剩下的 cell 真的會啟動嗎？**」|
| **對應對策** | 在吸收段強制做 4×4 / N×M 矩陣化拆解，標出 dead cell，避免使用者誤以為「全部都會用上」|

### 完整對位 taxonomy（7 次後 → 4 大類）

| 序 | 來源 | 大類 | 亞型 |
|---|------|------|------|
| 1 | 曹興誠 RCA | 拿錯工具 | — |
| 2 | 雷小蒙週報 | 場合 > 工具 | — |
| 3 | 歐陽嘉隆 WP 工作流 | 場合 > 工具 | — |
| 4 | SHOPLINE Payments | 場合 > 工具 | — |
| 5 | NVIDIA GTC keynote | Source bias 錯位 | 賣方敘事型 |
| 6 | Google AI 搜尋指南 | Source bias 錯位 | 平台守門人型 |
| 7 | **Anthropic Dynamic Workflows** | **矩陣未對位錯位（新）** | — |

注意：本次也是 Source bias 平台廠商來源，但 bias 性質與 Google 不同——Anthropic 是「**開放型平台守門人**」（讓你用更多 = 平台得益），不是「壓制型平台守門人」（叫你不要做某事 = 平台得益）。Source bias 平台守門人型可能要再細分為**壓制型 vs 開放型**，但本次只是浮現尚未到要修 taxonomy 的證據量，**待第 3 次平台守門人型出現再判斷**。

### 重組路徑建議

1. **3 大失敗模式 + 任務診斷**：未來在客戶 / 朋友抱怨「AI 不好用」時，**強制用三分類**先問：是 laziness（沒做完）/ self-preferential（自己 review 自己錯過）/ goal drift（飄出目標）？再對症
2. **6 種設計模式 + 自家 Claude Code**：用 [[src-anthropic-dynamic-workflows-claude-code-2026-06-02#六種設計模式|本頁 6 種模式表]] 當 cheat sheet，下次 Claude Code 任務超過 30 分鐘 / 跨多 file / 需 review 時，**先問自己「應該用 dynamic workflow 嗎？哪一種模式對位？」**
3. **「ultracode」實驗**：本知識庫的 lint / 對話組補回填工作很適合用 `ultracode` 觸發 + Fan-out-and-Synthesize（多 src 頁並行檢查互引）+ Adversarial Verification（檢查我自己寫的對位是否真實）
4. **dead cell 警示記憶法**：之後遇到「全選」型 quiz 答案時，**立刻把矩陣畫出來標 dead cell**，不要讓「全方位有用」的感覺掩蓋實際用不到的 cell

### Spaced retrieval 約定（~2026-06-17）

回測題：
1. 不看本頁，3 大失敗模式名稱可以背出來嗎？對應哪 3 個既有 wiki 概念？
2. 6 種設計模式，你**實際在 Claude Code 任務中用過幾種**？哪一種最有 ROI？
3. 「dead cell」這個觀念你還記得嗎？最近做的 task 有沒有「intent 全選但實際只用對角線」的情況？
4. 你最後幫客戶 / 自家寫過 dynamic workflow 嗎？理由？

### 對應 [[Ratchet-Pattern]]

第 7 次吸收檢核促成的擴充：
- **錯位 taxonomy 從 3 大類 → 4 大類**（加入「矩陣未對位錯位」）
- **新 heuristic**：「如果只能用其中 1 個 intent × 1 個 application 組合，會選哪一個？剩下 cell 真的會啟動嗎？」
- **內建檢核機制**：未來碰到 N≥3, M≥3 的 quiz「全選」答案，主動畫矩陣標 dead cell，不讓「全方位有用」的感覺掩蓋實際使用模式
- **Source bias 平台守門人型可能要再細分**（壓制型 vs 開放型）：本次尚未到要修 taxonomy 的證據量，待第 3 次平台守門人型出現再判斷
