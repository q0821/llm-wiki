---
title: Cloudflare 大規模協同運作 AI 程式碼審查
type: source
sources: ["cloudflare-ai-code-review.md"]
created: 2026-05-18
updated: 2026-05-18
tags: [ai-code-review, opencode, subagent, circuit-breaker, agents-md, cloudflare, production]
confidence: 強
---

# Cloudflare 大規模協同運作 AI 程式碼審查

**作者**：Ryan Skidmore（[[Cloudflare]]）
**發表日期**：2026-04-20（Agents Week）
**原始連結**：https://blog.cloudflare.com/zh-tw/ai-code-review/
**擷取方式**：WebFetch（`fetch-url.sh` 因 markdown.new API 超時 60 秒失敗）

## 核心主張

- 用 **[[OpenCode]]** 為底層、CI 原生的 AI code review 系統；協調最多 7 個專精 subagent（安全 / 效能 / 程式碼品質 / 文件 / 發布管理 / 工程合規 / AGENTS.md 維護）
- 不依賴單一模型——以**斷路器 + 故障回退鏈**（`opus-4-7 → opus-4-6`）容錯，所有執行中 CI 在 5 秒內熱切換
- **Risk Tier 分配**：依 diff 大小與性質分 Trivial / Lite / Full 三層，分別派 2 / 4 / 7+ 個 subagent，協調者模型也跟著降級（Opus → Sonnet）
- **多 subagent 並行的 token 經濟學**：共用脈絡檔 `shared-mr-context.txt` 寫進磁碟、子審查者讀檔而非各自 prompt 嵌入，避免 token 增加 7×
- 30 天 production 數據：**131,246 次審查 / 48,095 MR / 5,169 repo / 中位數每次審查 $0.98 / 85.7% cache hit / 1,200 億 tokens**
- 系統明確承認**取代不了人工 code review**——架構意識、跨系統影響、細微並行錯誤是 AI 審查者的固有盲區

## 詳細摘要

### 一、整體架構：外掛程式模型

採用可組合 [[OpenCode]] 外掛架構，每個外掛實作 `ReviewPlugin` 介面三個生命週期：
- **Bootstrap**（並行、非致命）
- **Configure**（依序、致命）
- **postConfigure**（非同步）

外掛可註冊智慧體、新增 AI 提供者、設定 env、插入 prompt 片段、調整智慧體權限。

七個外掛清單：
| 外掛 | 職責 |
|---|---|
| `@opencode-reviewer/gitlab` | GitLab VCS、MR 資料、[[MCP]] 評論伺服器 |
| `@opencode-reviewer/cloudflare` | AI Gateway、模型層級、故障回退鏈 |
| `@opencode-reviewer/codex` | 內部合規檢查（與 [[OpenAI-Codex-CLI]] 整合） |
| `@opencode-reviewer/braintrust` | 分散式追蹤與可觀測性 |
| `@opencode-reviewer/agents-md` | 確認 [[AGENTS-md|AGENTS.md]] 為最新 |
| `@opencode-reviewer/reviewer-config` | 遠端模型覆寫設定 |
| `@opencode-reviewer/telemetry` | 審查追蹤 |

### 二、為什麼選 OpenCode

- 內部廣泛使用、開源
- Cloudflare 已提交 **45+ pull requests**
- **伺服器優先架構**：程式化 session 建立、SDK prompt 傳送

兩層協調：
1. **協調者處理序**：`Bun.spawn` 啟動 OpenCode 子處理序，prompt 透過 `stdin`，輸出 JSONL 寫 stdout
2. **審查外掛**：`spawn_reviewers` tool，協調者 LLM 判斷後透過 OpenCode SDK 啟動子 session

每子審查者在獨立 OpenCode session、能讀檔 / grep / 搜尋 codebase、以結構化 XML 回傳發現。

### 三、專精 subagent 而非單一大 prompt

7 個專精審查者各有限定範圍的提示詞，**「告訴 LLM 應該忽略什麼」是 prompt engineering 的真正價值**。

安全審查者 prompt 範例：
- What to Flag：injection / auth bypass / hardcoded secret / 不安全加密 / 缺少 input validation
- What NOT to Flag：理論性風險 / 深度防禦建議 / 未變更代碼問題 / 「考慮用 library X」式建議

審查者以 XML 產生發現，附三級嚴重性：
- `critical`：服務中斷或可被利用
- `warning`：可測量回退或具體風險
- `suggestion`：值得考慮的改進

### 四、模型分層（2026-05 快照）

| 層級 | 模型 | 用途 |
|---|---|---|
| 頂級 | Claude Opus 4.7、GPT-5.4 | 專留給審查協調者 |
| 標準 | Claude Sonnet 4.6、GPT-5.3 Codex | 子審查者主力 |
| 輕量 | **Kimi K2.5** | 文字密集任務（文件、發布、AGENTS.md） |

執行期可透過 `reviewer-config` Cloudflare Worker 動態覆寫。

### 五、提示詞注入防範

協調者 prompt 透過 XML 拼接 MR 中繼資料、評論、先前發現、diff 路徑、自訂指示。**完全濾除使用者控制的邊界標籤**：

```javascript
const PROMPT_BOUNDARY_TAGS = [
  "mr_input", "mr_body", "mr_comments", "mr_details",
  "changed_files", "existing_inline_findings",
  "previous_review", "custom_review_instructions",
  "agents_md_template_instructions",
];
```

### 六、共用脈絡節省 token

不在 prompt 嵌入完整 diff——各檔案 patch 寫入 `diff_directory` 並傳路徑；子審查者只讀與其領域相關的 patch。

提取 `shared-mr-context.txt` 寫磁碟，**避免 token 成本增加 7 倍**——對應 [[Context-Rot]] 的 tool-call offloading 招式。

### 七、協調者裁決：去重 + 重分類 + 合理性篩選

整體核准決策表：

| 條件 | 決策 | GitLab 動作 |
|---|---|---|
| 全 LGTM 或僅無關緊要建議 | approved | POST /approve |
| 只有「建議」等級 | approved_with_comments | POST /approve |
| 一些警告、無生產風險 | approved_with_comments | POST /approve |
| 多警告暗示風險模式 | minor_issues | POST /unapprove |
| 任何嚴重項目或生產安全風險 | significant_concerns | requested_changes |

**緊急出口**：人工審查者留 `break glass` 評論時系統強制核准（30 天 288 次 / 0.6%）。

### 八、Risk Tier Architecture

依 diff 大小分三層，模型也跟著降級：

| 層級 | 變更行數 | 檔案 | Agents | 平均成本 |
|---|---|---|---|---|
| Trivial | ≤10 | ≤20 | 2（協調者 + 1 通用） | $0.20 |
| Lite | ≤100 | ≤20 | 4 | $0.67 |
| Full | >100 或 >50 檔 | 任何 | 7+ | $1.68 |

Trivial 層**也把協調者從 Opus 降為 Sonnet**；安全敏感檔案（`auth/` / `crypto/`）永遠觸發 Full。

詳見 [[Adversarial-Code-Review#Risk Tier 分配（Cloudflare production）]]。

### 九、Diff 篩選去雜訊

```javascript
const NOISE_FILE_PATTERNS = [
  "bun.lock", "package-lock.json", "yarn.lock", "pnpm-lock.yaml",
  "Cargo.lock", "go.sum", "poetry.lock", "Pipfile.lock", "flake.lock",
];
const NOISE_EXTENSIONS = [".min.js", ".min.css", ".bundle.js", ".map"];
```

掃 `// @generated` / `/* eslint-disable */` 排除自動產生檔；**資料庫遷移腳本明確排除**（需要人工審）。

### 十、Circuit Breaker for AI（Netflix Hystrix 啟發）

每個模型層級獨立健康狀態追蹤。斷路器「開啟」時沿故障回退鏈尋替代：

```javascript
const DEFAULT_FAILBACK_CHAIN = {
  "opus-4-7":   "opus-4-6",
  "opus-4-6":   null,
  "sonnet-4-6": "sonnet-4-5",
  "sonnet-4-5": null,
};
```

兩分鐘冷卻後允許一個探測請求。詳見 [[Harness-Engineering#Circuit Breaker for AI]]。

錯誤分類 `shouldFailback` 布林：只有可重試 API 錯誤觸發故障回退；ProviderAuthError / ContextOverflowError / MessageAbortedError 不會。

協調者層也有獨立故障回退——掃描 stderr「overloaded」「503」模式偵測，熱交換 `opencode.json` 中的協調者模型。

### 十一、控制平面：Workers KV + Cloudflare Worker

CI 任務從 Workers KV 擷取模型路由設定。**Provider 停用開關可在 5 秒內全 CI 繞過**。

`TrackerClient` fire-and-forget 追蹤工作 + token + Prometheus 指標——永不阻塞 CI（2 秒 timeout、>50 待處理時修剪）。

### 十二、增量重新審查（不從頭開始）

開發人員推新 commit 時，協調者收上次審查 + 內嵌 DiffNote 評論清單 + 解決狀態。規則：
- 已修正發現 → 省略，MCP 自動解決執行緒
- 未修正發現 → 即使未變更也重新發布
- 使用者已解決 → 除非實質變糟否則尊重
- 使用者回覆「won't fix」/「acknowledged」→ 視為已解決
- 「I disagree」→ 協調者決定解決或辯駁

系統內建彩蛋：審查者也處理每個 MR 的輕鬆問題，保持簡短溫暖回覆。

### 十三、AGENTS.md 審查者

專門評估 MR 是否該更新 [[AGENTS-md|AGENTS.md]]：

| 變更性質 | 建議 |
|---|---|
| **高實質**（套件管理器/測試框架/建置工具變更、目錄重構、env 新增、CI/CD 變更）| 強烈建議更新 |
| **中等實質**（主要依賴升級、新 linting 規則、API 客戶端變更、狀態管理）| 值得考慮 |
| **低實質**（bug 修復、既有模式新增功能、CSS 變更）| 無需更新 |

對既有 AGENTS.md 反模式扣分：通用填充內容、超過 200 行、無命令的工具名稱。

**「簡潔、實用、包含命令與邊界的 AGENTS.md 永遠勝過冗長版本」**——對應本知識庫 [[CLAUDE-md|CLAUDE.md]]「100 行以內」「飛行員 checklist 不是冗長風格指南」共識。

### 十四、團隊使用方式

封裝成內部 GitLab CI 元件：

```yaml
include:
  - component: $CI_SERVER_FQDN/ci/ai/opencode@~latest
```

也支援**本地執行**：`@opencode-reviewer/local` 在 OpenCode TUI 提供 `/fullreview` 命令，從工作目錄產 diff、執行同樣的 risk tier + subagent 協調。

### 十五、Production 數據（前 30 天，2026-03-10 至 2026-04-09）

**規模**：131,246 次審查 / 48,095 MR / 5,169 repo / 平均每 MR 2.7 次審查 / 中位數 3 分 39 秒

**成本**：
| 百分位 | 每次審查成本 |
|---|---|
| 中位數 | $0.98 |
| P90 | $2.36 |
| P95 | $2.93 |
| P99 | $4.45 |

**Token**：1,200 億 / 快取命中 85.7% / 估計節省五位數美元

**發現分佈**（159,103 項，平均每次審查 1.2 項）：
| 審查者 | critical | warning | suggestion |
|---|---|---|---|
| 程式碼品質 | 6,460 | 29,974 | 38,464 |
| 文件 | 155 | 9,438 | 16,839 |
| 效能 | 65 | 5,032 | 9,518 |
| 安全性 | 484 | 5,685 | 5,816 |
| Codex（合規） | 224 | 4,411 | 5,019 |
| AGENTS.md | 18 | 2,675 | 4,185 |
| 發布 | 19 | 321 | 405 |

`break glass` 緊急覆寫：288 次 / 0.6%。

### 十六、坦誠面對的限制

AI 審查者**取代不了人工** code review：
1. **架構意識**：可看 diff 與周圍 code，但不掌握系統為何被設計成這形態
2. **跨系統影響**：可標記 API 合約變更，但驗證不了所有 downstream consumer 是否更新
3. **細微並行錯誤**：依賴特定時序的 race condition 難從靜態 diff 捕捉
4. **大型重構成本暴增**：500 檔重構 × 7 並行高階模型費用不菲——協調者 prompt 超過脈絡視窗 50% 時警告

## 關鍵引用

> 「告訴 LLM 應該忽略什麼是提示詞工程的真正價值所在。」

> 「藉由共用脈絡節省 token——避免 token 成本增加七倍。」

> 「斷路器『開啟』時，兩分鐘冷卻期後允許一個探測請求通過。」

> 「簡潔、實用、包含命令與邊界的 AGENTS.md 永遠勝過冗長版本。」

> 「該系統無法取代人工程式碼審查，至少以目前的模型還不行。」

## 信心評估

- **強**：架構元件、Risk Tier 配置、Circuit Breaker 機制、production 數據（131K reviews / $0.98 中位數）——Cloudflare 官方工程部落格第一手揭露，含具體 code snippet 與 KV 設定
- **強**：與 [[Adversarial-Code-Review]] / [[Subagent-Driven-Development]] / [[Harness-Engineering]] 的對應——多概念交叉印證
- **中**：具體模型版本（Opus 4.7 / Sonnet 4.6 / GPT-5.4 / GPT-5.3 Codex / Kimi K2.5）——2026-05 當下快照，後續會變動
- **時效**：30 天數據涵蓋 2026-03-10 至 2026-04-09，每年 Cloudflare 應會發後續更新

## 與 Wiki 的關聯

### 形成的對話組

- **本來源**（Cloudflare production）↔ **[[Subagent-Driven-Development]] / [[Adversarial-Code-Review]]**（個人實作累積，已去識別）：兩個視角——前者 130K 級實證、後者個人實作；數量級不同但 pattern 同源
- **本來源** ↔ **[[src-addy-osmani-harness-engineering]]**（Addy Osmani Harness 七元件）：本系統是七元件的 production-grade 標本
- **本來源** ↔ **[[src-hermes-agent-99-cases]]**（Hermes 99 案例）：兩個 agent 框架的**企業 vs SMB** 對照
- **本來源** ↔ **[[src-techhanlin-claude-code-8-settings]]**（科技翰林院 Claude Code 設定）：AGENTS.md 範式擴張到 OpenCode

### 新建頁面

- [[OpenCode]]（entity）——本知識庫 agentic CLI 地圖的缺角
- [[AGENTS-md]]（concept）——與 [[CLAUDE-md]] 形成完整對照組

### 更新既有頁面

- [[Cloudflare]]：擴張面向（從「部署平台」到「AI 工程公司」）
- [[Adversarial-Code-Review]]：補 Risk Tier Architecture + production 案例
- [[Subagent-Driven-Development]]：補 Multi-Agent Production 細節（spawn_reviewers / 共用脈絡 / 提示詞注入防範）
- [[Harness-Engineering]]：補 Circuit Breaker for AI + production-grade 數據
- [[CLAUDE-md]]：補 AGENTS.md 完整對照
- [[Claude Code]] / [[OpenAI-Codex-CLI]] / [[Hermes-Agent]]：對照表加 OpenCode
- [[Context-Rot]]：共用脈絡檔 + 50% 警告是該概念的工程處理範例
- [[MCP]]：補「MCP 評論伺服器」與 GitLab 整合

### 未來可延伸

- Cloudflare 內部 AI 工程堆棧（文中連結 `internal-ai-engineering-stack`）可獨立 ingest
- Agents Week 期間 Cloudflare 發布的其他文章
- OpenCode 官方文件 / GitHub repo 可獨立 ingest 補強 [[OpenCode]] entity 頁
- Netflix Hystrix 原始論述 → 「Circuit Breaker 從微服務延伸到 AI」可獨立成 synthesis 頁
