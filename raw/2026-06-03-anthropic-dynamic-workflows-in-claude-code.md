# A harness for every task: dynamic workflows in Claude Code

**原始 URL**：https://claude.com/blog/a-harness-for-every-task-dynamic-workflows-in-claude-code
**作者**：Thariq Shihipar + Sid Bidasaria（Anthropic 技術員工）
**發佈日期**：2026-06-02
**閱讀時間**：5 分鐘
**抓取於**：2026-06-03
**來源類型**：Anthropic 官方 blog；強論點型；含三大失敗模式診斷框架 + 6 種設計模式 + 10 類使用案例

> 注意：以下為 WebFetch + AI 摘要結果，**非逐字原文**。重要論點可從原始 URL 查證。

---

## 1. 完整章節大綱

1. 引言與核心宣告
2. 範例提示詞（6 個實際用例）
3. Dynamic Workflows 運作原理
4. Dynamic vs Static Workflows 比較
5. Dynamic Workflows 的價值主張
6. 常見設計模式（6 種）
7. 詳細使用案例（10 類）
8. 何時**不**使用 Workflows
9. 建構 Dynamic Workflows 的最佳實踐
10. 未來展望

---

## 2. 核心論點：三大 agent 失敗模式

Anthropic 主張長期複雜任務在單一 context window 中容易出現三大失敗模式：

| 失敗模式 | 原文定義 |
|---|---|
| **Agentic laziness** | "Claude stops before finishing a particularly complex, multi-part task" |
| **Self-preferential bias** | "Claude's tendency to prefer its own results or findings" |
| **Goal drift** | "gradual loss of fidelity to the original objective across many turns" |

解法：**Dynamic Workflows 透過分離 subagents 與獨立 context windows 規避以上問題**。

---

## 3. Dynamic vs Static Workflows

| 特性 | Dynamic | Static |
|---|---|---|
| 構建時機 | 運行時（on-the-fly） | 預先定義 |
| 靈活性 | 任務特定化定製 | 通用邊界情況覆蓋 |
| 模型選擇 | 動態路由 | 固定 |
| Context window | 分離隔離 | 共享或序列化 |

定義：Dynamic Workflows = Claude Code **動態編寫並協調的多智能體編排系統**，基於 JavaScript 執行特定函數以生成和管理 subagents。

---

## 4. Workflow Tool 觸發方式與位置

### 觸發方式
- 直接詢問：「ask Claude to make one」
- 使用觸發詞：「`ultracode`」
- 與 `/goal` 和 `/loop` 結合（循環執行）

### 與其他組件的關係
- **vs Subagents**：Workflows 是協調多個 subagents 的容器
- **vs Skills**：Workflows 可通過 skill 保存和分發（放置在 `~/.claude/workflows`）
- **vs Harness**：Workflows **動態建構** harness，而非固定使用預設 harness

> "The default Claude Code harness is built for coding, it is also useful for many other types of tasks because, as it turns out, many tasks resemble coding tasks."

### 技術機制
- JavaScript script 含 subagent 生成 / 協調函數
- Token 預算設置：「set explicit token usage budgets」
- 模型選擇：「decide which models an agent uses」
- 工作樹隔離：「whether subagents are run in their own worktree」
- 標準 JavaScript 工具：JSON / Math / Array 等

文章未公開 `agent()`、`pipeline()`、`parallel()` 等具體 API 簽名，指向官方文檔：https://code.claude.com/docs/en/workflows

---

## 5. 六種設計模式

1. **Classify-and-Act** — 分類器決定任務類型，路由至不同 agents
2. **Fan-out-and-Synthesize** — 分解為多個小步驟 → 平行執行 → 合成結果（"useful for when there are a large number of smaller steps"）
3. **Adversarial Verification** — 每個 agent 的輸出由獨立驗證 agent 對抗驗證
4. **Generate-and-Filter** — 生成候選方案 → 按準則過濾 → 返回高質量結果
5. **Tournament** — N 個 agents 競爭同一任務 → 裁判 agent 進行配對比較
6. **Loop Until Done** — 未知工作量場景，按停止條件迴圈（而非固定次數）

---

## 6. 十類使用案例

1. **代碼遷移與重構** — 例：Bun 從 Zig 改寫為 Rust（使用 Workflows）
2. **深度研究** — `/deep-research` skill：並行網絡搜索 → 對抗驗證 → 引文綜合
3. **深度驗證** — 識別事實主張 → 逐一驗證 → 驗證驗證源質量
4. **排序與排名** — Tournament 或 pairwise comparison 模式（避免 context 爆炸）
5. **記憶與規則遵守** — 每規則一個驗證 agent；挖掘歷史會話找反覆錯誤 → 提煉規則
6. **根因調查** — 從不同證據（日誌、文件、數據）生成假說 → 驗證面板篩選
7. **大規模分類** — 支持隊列分類 + 去重 + 自動化修復 / 升級
8. **探索與品味** — 多方案探索 + 按品味準則評分
9. **評估（Evals）** — 輕量級評估：並行運行變體 → 比較 agents 評分
10. **模型與智能路由** — 分類器決定任務複雜度 → 路由至 Sonnet 或 Opus

---

## 7. 何時**不**使用 Workflows（反模式）

1. **過度使用**：
   - "Workflows are not needed for every task"
   - "most traditional coding tasks do not need a panel of 5 reviewers"

2. **成本考量**：
   - "dynamic workflows often use more tokens and are best suited for complex, high value tasks"
   - 建議設置 token 預算上限

3. **任務類型不匹配**：
   - 簡單單步任務不適合
   - 低價值、時間敏感的任務不適合

---

## 8. 範例提示詞（原文引用）

```
"This test fails maybe 1 in 50 runs. Set up a workflow to reproduce it.
Form competing theories about the race, and don't stop until one theory
survives the evidence."

"Use a workflow to rename our User model to Account everywhere."

"Go through my blog post draft and verify every technical claim against
the codebase using a workflow, I don't want to ship anything wrong."
```

---

## 9. 建構最佳實踐

### 提示詞技巧
- 使用詳細的設計模式描述
- 支持「快速 workflow」概念：「Workflows are not just for large tasks」
- 結合 `/goal` 和 `/loop` 實現循環執行

### Token 管理
```
"use 10k tokens" — 設置明確上限
```

### 保存與分發
- 按 `s` 保存到 `~/.claude/workflows`
- 通過 skill 分發：放入 skill 資料夾並在 `SKILL.MD` 中引用
- 將 workflows 視為「**範本而非逐字執行的腳本**」

---

## 10. 文末 Call-to-Action

> "I encourage you to think of them as a starting point to explore new ways
> to use Claude to help accomplish your tasks. There is still much to discover
> in how to use them best. Let me know what you find."

隱含建議：
1. **實驗性探索**：Workflows 仍在早期階段，鼓勵創意使用
2. **查閱文檔**：官方文檔 https://code.claude.com/docs/en/workflows
3. **成本評估**：對標任務價值決定是否使用

---

## 11. 相關資源

- 官方文檔：https://code.claude.com/docs/en/workflows
- 相關文章：
  - "Running an AI-native engineering org"（2026-06-03）
  - "How CodeRabbit used Claude to build an agent orchestration system"（2026-05-27）
