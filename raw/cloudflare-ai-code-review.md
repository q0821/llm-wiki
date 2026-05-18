<!--
source-url: https://blog.cloudflare.com/zh-tw/ai-code-review/
title: 大規模協同運作 AI 程式碼審查
author: Ryan Skidmore
published: 2026-04-20
fetched: 2026-05-18
fetched-method: WebFetch（fetch-url.sh 超時，markdown.new API 卡住 60 秒未完成）
-->

# 大規模協同運作 AI 程式碼審查

**作者：** Ryan Skidmore
**發表日期：** 2026-04-20
**閱讀時間：** 19 分鐘

---

## 概述

Cloudflare 開發了一套基於 OpenCode 的 CI 原生 AI 程式碼審查系統。該系統不依賴單一模型，而是協調最多七位專精於不同領域的 AI 審查者（涵蓋安全性、效能、程式碼品質、文件、發布管理及工程合規性）。該系統已在數萬個合併請求上執行，能夠以高準確率標記真實錯誤並阻止嚴重問題合併。

---

## 架構：外掛程式設計的極致延伸

系統採用可組合的外掛程式架構，確保對版本控制系統、AI 提供者和內部標準的支援具有靈活性。每個外掛程式實作包含三個生命週期階段的 `ReviewPlugin` 介面：

- **Bootstrap 掛勾**：並行執行且非致命性
- **Configure 掛勾**：依序執行且致命性
- **postConfigure**：處理非同步工作

`ConfigureContext` 為外掛程式提供受控介面以影響審查過程，它們可以註冊智慧體、新增 AI 提供者、設定環境變數、插入提示詞片段並調整智慧體權限。

### 使用的外掛程式

| 外掛程式 | 職責 |
|---------|------|
| @opencode-reviewer/gitlab | GitLab VCS 提供者、MR 資料、MCP 評論伺服器 |
| @opencode-reviewer/cloudflare | AI Gateway 設定、模型層級、故障回退鏈 |
| @opencode-reviewer/codex | 內部合規檢查 |
| @opencode-reviewer/braintrust | 分散式追蹤與可觀測性 |
| @opencode-reviewer/agents-md | 確認 AGENTS.md 為最新 |
| @opencode-reviewer/reviewer-config | 遠端模型覆寫設定 |
| @opencode-reviewer/telemetry | 審查追蹤 |

---

## 底層如何使用 OpenCode

選擇 OpenCode 的原因：

- 內部廣泛使用
- 開放原始碼（Cloudflare 已提交 45+ pull requests）
- 優秀的開源 SDK
- **關鍵優勢**：伺服器優先架構，允許程式化會話建立和 SDK 提示詞傳送

### 協調流程的兩個層級

**協調者處理序：** 使用 `Bun.spawn` 將 OpenCode 作為子處理序啟動。提示詞透過 `stdin` 傳遞（避免 `ARG_MAX` 限制）。輸出以 JSONL 事件形式寫入 `stdout`。

```javascript
const proc = Bun.spawn(
  ["bun", opencodeScript, "--print-logs", "--log-level", logLevel, "--format", "json", "--agent", "review_coordinator", "run"],
  {
    stdin: Buffer.from(prompt),
    env: {
      ...sanitizeEnvForChildProcess(process.env),
      OPENCODE_CONFIG: process.env.OPENCODE_CONFIG_PATH ?? "",
      BUN_JSC_gcMaxHeapSize: "2684354560", // 2.5 GB heap cap
    },
    stdout: "pipe",
    stderr: "pipe",
  }
);
```

**審查外掛程式：** 執行時外掛程式提供 `spawn_reviewers` 工具。協調者 LLM 判斷審查時機時，透過 OpenCode SDK 客戶端啟動子審查者工作階段：

```javascript
const createResult = await this.client.session.create({
  body: { parentID: input.parentSessionID },
  query: { directory: dir },
});

this.client.session.promptAsync({
  path: { id: task.sessionID },
  body: {
    parts: [{ type: "text", text: promptText }],
    agent: input.agent,
    model: { providerID, modelID },
  },
});
```

每個子審查者在專屬 OpenCode 工作階段中執行，可自由讀取來源檔案、執行 grep 或搜尋程式碼庫，完成時以結構化 XML 格式回傳發現。

### JSONL（JSON Lines）的使用

JSONL 是一種文字格式，每一行都是有效、自成一體的 JSON 物件。相比標準 JSON 陣列，無需剖析整個文件即可讀取第一個項目，避免載入大量資料至記憶體緩衝。

### 串流處理管線

系統即時處理協調者的輸出，每隔 100 行或 50 毫秒緩衝並刷新一次。監看特定觸發條件，如從 `step_finish` 事件抽出詞元使用量追蹤成本，利用 `error` 事件啟動重試邏輯。

檢測輸出截斷：如果 `step_finish` 事件帶著 `reason: "length"`，表示模型達到 `max_tokens` 限制，自動重試。

**心跳記錄**：每 30 秒印出「模型正在思考……（自上次輸出已過 N 秒）」，解決使用者誤認為工作卡住的問題。

---

## 使用專精的智慧體，而非一個大型提示詞

系統將審查拆分給多個領域專精的智慧體，每個都有嚴格限定範圍的提示詞。

例如，安全審查者的指示明確規定應標記的內容：

```
## What to Flag
- Injection vulnerabilities (SQL, XSS, command, path traversal)
- Authentication/authorisation bypasses in changed code
- Hardcoded secrets, credentials, or API keys
- Insecure cryptographic usage
- Missing input validation on untrusted data at trust boundaries

## What NOT to Flag
- Theoretical risks that require unlikely preconditions
- Defense-in-depth suggestions when primary defenses are adequate
- Issues in unchanged code that this MR doesn't affect
- "Consider using library X" style suggestions
```

告訴 LLM 應該**忽略什麼**是提示詞工程的真正價值所在。

每個審查者以結構化 XML 格式產生發現，附帶嚴重性分級：
- `critical`：導致服務中斷或可被利用
- `warning`：可測量的回退或具體風險
- `suggestion`：值得考慮的改進

### 使用的模型

根據智慧體工作的複雜性指派模型：

- **頂級模型**（Claude Opus 4.7、GPT-5.4）：專門保留給審查協調者
- **標準級模型**（Claude Sonnet 4.6、GPT-5.3 Codex）：子審查者的主力模型
- **Kimi K2.5**：輕量級、文字密集的任務（文件、發布、AGENTS.md）

這些分配在執行期間可透過 `reviewer-config` Cloudflare Worker 動態覆寫。

### 提示詞注入防範

智慧體的提示詞在執行時透過拼接特定於該智慧體的 Markdown 檔案與共用檔案 `REVIEWER_SHARED.md` 組裝。協調者的輸入提示詞則透過以結構化 XML 形式拼接 MR 中繼資料、評論、先前發現、diff 路徑和自訂指示組裝。

完全濾除使用者控制的邊界標籤：

```javascript
const PROMPT_BOUNDARY_TAGS = [
  "mr_input", "mr_body", "mr_comments", "mr_details",
  "changed_files", "existing_inline_findings", "previous_review",
  "custom_review_instructions", "agents_md_template_instructions",
];

const BOUNDARY_TAG_PATTERN = new RegExp(
  `</?(?:${PROMPT_BOUNDARY_TAGS.join("|")})[^>]*>`,
  "gi"
);
```

### 藉由共用脈絡節省詞元

系統不在提示詞中嵌入完整的程式碼差異，而是將各檔案修補檔案寫入 `diff_directory` 並傳遞路徑。子審查者只讀取與其領域相關的修補檔案。

提取共用脈絡檔案 (`shared-mr-context.txt`) 並寫入磁碟。子審查者讀取此檔案，而非在各自的提示詞中重複完整 MR 脈絡，避免詞元成本增加七倍。

---

## 協調者協助維持重點聚焦

啟動所有子審查者後，協調者進行裁決性處理整合結果：

1. **去重複**：同一問題若被多個審查者標記，只保留一次
2. **重新分類**：將問題移至最適合的類別
3. **合理性篩選**：濾除推測性問題、吹毛求疵的意見、誤判及與團隊慣例相矛盾的發現

整體核准決定遵循嚴格準則：

| 條件 | 決策 | GitLab 動作 |
|-----|------|-----------|
| 全部 LGTM 或僅有無關緊要的建議 | approved | POST /approve |
| 只有「建議」等級項目 | approved_with_comments | POST /approve |
| 有一些警告，但沒有生產環境風險 | approved_with_comments | POST /approve |
| 多個警告暗示存在風險模式 | minor_issues | POST /unapprove |
| 有任何嚴重項目或生產安全性風險 | significant_concerns | /submit_review requested_changes |

傾向明確偏向核准：原本乾淨的 MR 中若只有一個警告，仍以 `approved_with_comments` 通過。

**緊急出口**：人工審查者留下 `break glass` 評論時，系統強制核准，無論 AI 發現什麼問題。遙測會追蹤此覆寫指令。

---

## 風險層級：無需派出精英團隊審查一個拼字錯誤修正

系統根據 diff 大小和性質將合併請求分類到三個風險層級：

```javascript
function assessRiskTier(diffEntries: DiffEntry[]) {
  const totalLines = diffEntries.reduce(
    (sum, e) => sum + e.addedLines + e.removedLines, 0
  );
  const fileCount = diffEntries.length;
  const hasSecurityFiles = diffEntries.some(
    e => isSecuritySensitiveFile(e.newPath)
  );

  if (fileCount > 50 || hasSecurityFiles) return "full";
  if (totalLines <= 10 && fileCount <= 20)  return "trivial";
  if (totalLines <= 100 && fileCount <= 20) return "lite";
  return "full";
}
```

安全敏感檔案（`auth/`、`crypto/` 等）永遠觸發完整審查。

每個層級對應不同的智慧體：

| 層級 | 變更行數 | 檔案 | 代理程式 | 執行項目 |
|-----|--------|------|--------|--------|
| Trivial | ≤10 | ≤20 | 2 | 協調者 + 一個通用程式碼審查者 |
| Lite | ≤100 | ≤20 | 4 | 協調者 + 程式碼品質 + 文件 + 更多 |
| 全面 | >100 或 >50 | 任何 | 7+ | 所有專精領域 |

Trivial 層級也將協調者的模型從 Opus 降級為 Sonnet。

---

## Diff 篩選：去除雜訊

在智慧體看到程式碼前，diff 先經過篩選管道，去除雜訊：

```javascript
const NOISE_FILE_PATTERNS = [
  "bun.lock", "package-lock.json", "yarn.lock", "pnpm-lock.yaml",
  "Cargo.lock", "go.sum", "poetry.lock", "Pipfile.lock", "flake.lock",
];

const NOISE_EXTENSIONS = [".min.js", ".min.css", ".bundle.js", ".map"];
```

掃描檔案前幾行尋找 `// @generated` 或 `/* eslint-disable */` 等標記以濾除自動產生的檔案。資料庫遷移指令碼明確排除此規則（需要人工審查）。

---

## spawn_reviewers 工具：並行協調

`spawn_reviewers` 工具管理最多七個並行審查者工作階段的生命週期，配有斷路器、故障回退鏈、每個任務逾時設定及重試邏輯。

確定 LLM 工作階段何時「完成」很棘手。主要依賴 OpenCode 的 `session.idle` 事件，備份使用每三秒檢查執行中任務狀態的輪詢迴圈。若工作階段在無輸出情況下執行 60 秒，提前終止並標記為錯誤。

逾時設定分三個層級：

1. **每個任務**：5 分鐘（程式碼品質審查則 10 分鐘）
2. **整體**：25 分鐘（所有剩餘工作階段中止）
3. **重試預算**：至少 2 分鐘（不足則不重試）

---

## 韌性：斷路器與故障回退鏈

執行七個並行 AI 模型呼叫意味著會遇到限速和提供者中斷。系統實作靈感來自 Netflix Hystrix 的斷路器模式，針對 AI 模型呼叫調整。每個模型層級都有獨立的健康狀態追蹤。

當某個模型的斷路器「開啟」時，系統沿「故障回退鏈」尋找處於健康狀態的替代模型：

```javascript
const DEFAULT_FAILBACK_CHAIN = {
  "opus-4-7":   "opus-4-6",    // Fall back to previous generation
  "opus-4-6":   null,          // End of chain
  "sonnet-4-6": "sonnet-4-5",
  "sonnet-4-5": null,
};
```

每個模型系列獨立。斷路器「開啟」時，兩分鐘冷卻期後允許一個探測請求通過。

### 錯誤分類

當子審查者工作階段失敗時，系統判斷應該觸發模型備援還是這是無法解決的問題。錯誤分類器將 OpenCode 的錯誤類型對應到 `shouldFailback` 布林值：

```javascript
switch (err.name) {
  case "APIError":
    return { shouldFailback: Boolean(data.isRetryable), ... };
  case "ProviderAuthError":
    return { shouldFailback: false, ... };
  case "ContextOverflowError":
    return { shouldFailback: false, ... };
  case "MessageAbortedError":
    return { shouldFailback: false, ... };
}
```

只有可重試的 API 錯誤才會觸發故障回退。驗證錯誤、脈絡溢出、中止和結構化輸出錯誤則不會。

### 協調者層級的故障回退

協調者本身也可能失敗。協調層有獨立的故障回退機制：若 OpenCode 子處理序因可重試的錯誤失敗，透過掃描 `stderr` 中的「overloaded」或「503」等模式偵測，它會熱交換 `opencode.json` 設定檔中的協調者模型並重試。

---

## 控制平面：用於設定與遙測的 Workers

CI 任務從由 Workers KV 支援的 Cloudflare Worker 擷取模型路由設定，無需等待值班工程師改程式碼。

回應包含每個審查者的模型指派及 providers 區塊。當某個提供者被停用時，外掛程式會在選擇主要模型前濾除該提供者的所有模型：

```javascript
function filterModelsByProviders(models, providers) {
  return models.filter((m) => {
    const provider = extractProviderFromModel(m.model);
    if (!provider) return true;       // Unknown provider → keep
    const config = providers[provider];
    if (!config) return true;         // Not in config → keep
    return config.enabled;            // Disabled → filter out
  });
}
```

可在 KV 中切換開關停用整個提供者，所有執行中 CI 任務在五秒內繞過它。

使用「發送後即忘」的 `TrackerClient` 與獨立 Cloudflare Worker 通訊追蹤工作開始、完成、發現結果、詞元使用量和 Prometheus 指標。該用戶端永遠不會封鎖 CI 管線，使用 2 秒 `AbortSignal.timeout`，超過 50 個待處理請求時修剪。

---

## 重新審查：無需從頭開始

開發人員推送新提交到已審查過的 MR 時，系統執行增量式重新審查，協調者了解先前發現。收到上次審查評論的完整文字及先前發布的內嵌 DiffNote 評論清單及其解決狀態。

重新審查的規則：

- **已修正的發現**：省略，MCP 伺服器自動解決對應執行緒
- **未修正的發現**：即使未變更也重新發布
- **使用者已解決的發現**：除非問題實質變糟，否則尊重
- **使用者回覆**：「won't fix」或「acknowledged」視為已解決；「I disagree」時，協調者決定是解決還是辯駁

系統內建彩蛋確保審查者也處理每個合併請求的輕鬆問題，保持簡短、溫暖的回覆。

---

## 保持 AI 脈絡的新鮮度：AGENTS.md 審查者

AI 編碼智慧體高度依賴 `AGENTS.md` 檔案理解專案慣例。專門的審查者評估 MR 的重大程度，在開發人員做重大架構變更卻未更新 AI 指示時提出警告。

變更分為三個層級：

- **高實質變更**（強烈建議更新）：套件管理器變更、測試框架變更、建置工具變更、主要目錄重構、新增環境變數、CI/CD 工作流程變更
- **中等實質變更**（值得考慮更新）：主要相依套件版本升級、新 linting 規則、API 客戶端變更、狀態管理變更
- **低實質變更**（無需更新）：錯誤修復、基於既有模式新增功能、次要相依套件更新、CSS 變更

還對現有 AGENTS.md 檔案中的反模式扣分：通用填充內容、超過 200 行導致脈絡膨脹、沒有可執行命令的工具名稱。簡潔、實用、包含命令與邊界的 AGENTS.md 永遠勝過冗長版本。

---

## 我們的團隊如何使用它

系統以完整封裝的內部 GitLab CI 元件形式提供。團隊只需將其加入 `.gitlab-ci.yml`：

```yaml
include:
  - component: $CI_SERVER_FQDN/ci/ai/opencode@~latest
```

該元件負責拉取 Docker 映像、設定 Vault 機密、執行審查及發佈評論。團隊可在存放庫根目錄放置包含專案特定指示的 `AGENTS.md` 檔案自訂行為，或提供 AGENTS.md 範本的 URL。

整個系統也支援本地執行。`@opencode-reviewer/local` 外掛程式在 OpenCode 的 TUI 中提供 `/fullreview` 命令，從工作目錄樹產生 diff、執行相同的風險評估與智慧體協調，將結果內嵌發佈。使用完全相同的智慧體和提示詞，在筆記型電腦上執行而非 CI 環境。

---

## 數據：前 30 天的表現

2026 年 3 月 10 日至 4 月 9 日，涵蓋 5169 個存放庫：

### 概覽

- **審查執行數**：131,246 次
- **受影響的合併請求**：48,095 個
- **平均每個 MR 審查次數**：2.7 次
- **審查時間中位數**：3 分 39 秒
- **「break glass」緊急覆寫次數**：288 次（佔 0.6%）

**成本指標**：

| 百分位 | 每次審查成本 | 審查持續時間 |
|-------|----------|----------|
| 中位數 | 0.98 美元 | 3 分 39 秒 |
| P90 | 2.36 美元 | 6 分 27 秒 |
| P95 | 2.93 美元 | 7 分 29 秒 |
| P99 | 4.45 美元 | 10 分 21 秒 |

### 發現概況

**總發現數**：159,103 項
**平均每次審查發現**：約 1.2 項

發現細分按審查者：

| 審查者 | 嚴重 | 警告 | 建議 | 總計 |
|-------|------|------|------|------|
| 程式碼品質 | 6,460 | 29,974 | 38,464 | 74,898 |
| 文件 | 155 | 9,438 | 16,839 | 26,432 |
| 效能 | 65 | 5,032 | 9,518 | 14,615 |
| 安全性 | 484 | 5,685 | 5,816 | 11,985 |
| Codex（合規性） | 224 | 4,411 | 5,019 | 9,654 |
| AGENTS.md | 18 | 2,675 | 4,185 | 6,878 |
| 發布 | 19 | 321 | 405 | 745 |

### 詞元使用

- **總詞元**：約 1,200 億
- **快取命中率**：85.7%
- **估計節省金額**：五位數

依風險層級劃分的成本：

| 層級 | 評論 | 平均成本 | 中位數 | P95 | P99 |
|-----|------|--------|-------|-----|-----|
| Trivial | 24,529 | 0.20 美元 | 0.17 美元 | 0.39 美元 | 0.74 美元 |
| Lite | 27,558 | 0.67 美元 | 0.61 美元 | 1.15 美元 | 1.95 美元 |
| 全面 | 78,611 | 1.68 美元 | 1.47 美元 | 3.35 美元 | 5.05 美元 |

---

## 坦誠面對的限制

該系統無法取代人工程式碼審查，至少以目前的模型還不行。AI 審查者常在以下方面遇到困難：

- **架構意識**：可看到 diff 和周圍程式碼，但無法掌握完整脈絡——系統為何被設計成特定形態，或變更是否推動架構朝正確方向演進
- **跨系統影響**：API 合約變更可能破壞下游消費者。可標記合約變更，但無法驗證所有消費者是否已更新
- **細微的並行錯誤**：依賴特定時序或順序的競爭條件很難從靜態 diff 捕捉。可發現缺少鎖，但無法找出所有可能造成死鎖的方式
- **成本隨差異大小而增減**：500 個檔案的重量級重構加七個並行高階模型呼叫費用不菲。協調者的提示詞超過預估脈絡視窗 50% 時發出警告

---

## 我們才剛剛開始

關於 Cloudflare 如何運用 AI 技術，請閱讀內部 AI 工程堆棧。查看 Agents Week 期間發布的所有內容。

**文章標籤**：Agents Week、代理程式、AI、開發人員平台、開發人員、LLM、AI Gateway
