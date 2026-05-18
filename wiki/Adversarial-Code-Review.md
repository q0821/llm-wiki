---
title: Adversarial Code Review（對抗式 AI code review）
type: concept
sources: ["cloudflare-ai-code-review.md"]
created: 2026-05-15
updated: 2026-05-18
tags: [code-review, security, codex, ai-quality, owasp, anti-pattern, cloudflare, production]
confidence: 強
---

# Adversarial Code Review

> 給 AI 一個明確「對抗式」prompt：「**找出真正的問題、不要只給好話**」「以對抗式角度找 bug」「以資深 X 架構師角度全面審查」。比一般 PR review 更會抓出**跨檔組合的隱形 bug**。

**來源**：個人實作累積（已去識別）。

## 與一般 code review 的差異

| 維度 | 一般 review | Adversarial review |
|---|---|---|
| 視角 | 順著 diff 讀、check 是否符合 spec | 主動找漏洞、不假設作者意圖 |
| 範圍 | 通常 PR diff（單一 feature） | 可指定全 codebase diff（`--scope branch --base <初始 commit>`） |
| 焦點 | style / naming / test 覆蓋 | 跨檔交互、邊界、安全 |
| Prompt 寫法 | 「review 這個 PR」 | 「對抗式找出真正的問題」「以 X 角度全面審查」 |
| 抓 bug 類型 | happy path 漏洞、style 不一致 | silent backdoor、欄位無 enforcement、狀態紀錄不可信 |

## 工具實作（2026-05 現況）

- **Codex CLI**（OpenAI）：`codex review` / `codex adversarial-review`
- **`/codex:review` 不接受 focus text**——只審 working tree 或 branch diff。要傳自訂指令（如「以 OWASP Top 10 為審查框架」）必須用 `/codex:adversarial-review`
- **想審「整個 codebase 架構」** → `git rev-list --max-parents=0 HEAD` 取初始 commit、用 `--scope branch --base <初始 commit>` 讓整個 codebase 變成一個大 diff

## 實戰 finding 類型

跨多次案例累積觀察，對抗式 review 比一般 review 多抓到的典型 issue：

### 第 1 類：跨檔組合 bug（無 focus、全 codebase scan）

| Severity | 範式 finding | 為什麼 human review 看不見 |
|---|---|---|
| **critical** | Migration 設高權限預設值 配 model policy 接受該預設 = 既有 record 自動升權 | 要同時看 migration / model / policy provider 三檔並組合推斷 |
| **high** | 業務欄位齊全但 enforcement service 只檢查其中一個 | 欄位定義與 enforcement 邏輯相隔多個檔，跨檔距離越遠越難看到 |
| **high** | UI 看似可用（route 開著）但 form 必填欄位全 disabled = 按下儲存 DB 炸 | UI 表面合理，跑下去才壞 |
| **medium** | 「先寫成功 → 再嘗試動作」狀態紀錄與實際結果不符 | 要同時思考時序 + 失敗路徑 |

### 第 2 類：OWASP Top 10 focus（加 focus prompt）

| OWASP | 範式 finding |
|---|---|
| **A03 Injection（stored XSS）** | `->html()` 渲染 + user-supplied 欄位透過模板注入 admin 視窗 → admin session XSS |
| **A01 Broken Access Control** | 某 admin-only resource 無 canAccess gate = 較低權限角色可看到敏感資訊 |
| **A05 Security Misconfiguration** | 無 CSP / X-Frame-Options / Permissions-Policy = clickjacking + XSS blast radius 放大 |

## 「人 review 看不見、對抗式 AI 才看得見」的 pattern

對抗式 AI review 強的是：
1. **跨檔組合 bug**——A 檔合法 + B 檔合法，組合起來才是漏洞
2. **狀態紀錄不可信**——「先寫成功 → 嘗試動作」這類時序問題，human reader 順著 happy path 讀不到
3. **欄位 vs enforcement 落差**——schema 有但邏輯沒用，跨檔距離越遠越容易被人類 reviewer 漏掉
4. **silent backdoor**——non-null default + downstream policy 配對，需要安全心智 + 多檔串接思考

human review 強的是：
1. **業務語意對不對**——AI 不知道領域術語在特定產品語境下的含義
2. **UI / UX 是否合理**——AI 看不到 actual rendering
3. **長期維護負擔**——AI 不知道團隊未來要怎麼擴充

## Prompt 工程實踐

範例：寫得有效的 adversarial review prompt

> 「請以資深 Laravel + Filament 架構師角度，全面審查整個專案的程式碼品質與架構設計。重點：1) Resource 的設計是否合理、有無重複；2) Eloquent Model 關聯與業務邏輯封裝；3) 安全性（MFA、權限、SQL injection、Mass assignment）；4) 測試覆蓋率與測試品質；5) 設定檔、env、migration 的正確性；6) Activity log 與審計軌跡；7) 效能隱患（N+1、indexing）；8) 是否符合框架慣例。**請對抗式找出真正的問題，不要只給好話。**」

關鍵元素：
1. **明確身份**（資深 X 架構師）
2. **列舉 8-10 個檢視維度**（不要只說「找 bug」）
3. **明確要求對抗角度**——加「不要只給好話」「找出真正的問題」是 prompt-level 的關鍵
4. **指定 review 範圍**（全 codebase via `--scope branch --base <初始 commit>` / OWASP focus / 特定子系統）

## 何時跑

| 時機 | Focus |
|---|---|
| 完成一個 feature phase | 該 feature 的 diff（spec 一致性） |
| 上線前 baseline | 全 codebase + OWASP focus |
| 重大架構改動後 | 全 codebase + 改動相關面向 |
| 客戶或同事「感覺哪裡怪」 | 全 codebase + 對方描述的方向 |

## 何時**不**跑

- diff 太小（一行修正）
- prototype 階段（review 的 baseline 還沒定）
- spec 還沒定型（會抓出一堆「spec 沒寫」誤判）

## Risk Tier 分配（[[Cloudflare]] production）

[[src-cloudflare-ai-code-review|Cloudflare production 案例]]提供具體的「**diff 規模分層投入 reviewer**」做法。依 diff 大小分三層：

| 層級 | 變更行數 | 檔案 | Agents | 平均成本 |
|---|---|---|---|---|
| **Trivial** | ≤10 | ≤20 | 2（協調者 + 1 通用）| $0.20 |
| **Lite** | ≤100 | ≤20 | 4 | $0.67 |
| **Full** | >100 或 >50 檔 | 任何 | 7+ | $1.68 |

```javascript
function assessRiskTier(diffEntries) {
  const totalLines = diffEntries.reduce((sum, e) => sum + e.addedLines + e.removedLines, 0);
  const fileCount = diffEntries.length;
  const hasSecurityFiles = diffEntries.some(e => isSecuritySensitiveFile(e.newPath));

  if (fileCount > 50 || hasSecurityFiles) return "full";
  if (totalLines <= 10 && fileCount <= 20)  return "trivial";
  if (totalLines <= 100 && fileCount <= 20) return "lite";
  return "full";
}
```

- 安全敏感檔案（`auth/` / `crypto/`）永遠觸發 Full
- Trivial 層**連協調者模型也降級**（Opus → Sonnet）

> 個人實作版可以簡化為「diff > N 行 → 跑 OWASP focus」，跟 Cloudflare 同源但規模降一級。

## Production 數據（[[src-cloudflare-ai-code-review|Cloudflare 30 天]]）

- **131,246 次審查** / 48,095 MR / 5,169 個 repo
- 159,103 項發現（平均每次審查 1.2 項）
- 中位數成本 **$0.98 / 審查**
- 「break glass」緊急覆寫 288 次（0.6%）—— 人工 reviewer 強制核准的 escape hatch

各 reviewer 的 finding 分佈：
| 審查者 | critical | warning | suggestion |
|---|---|---|---|
| 程式碼品質 | 6,460 | 29,974 | 38,464 |
| 安全性 | 484 | 5,685 | 5,816 |
| Codex 合規 | 224 | 4,411 | 5,019 |
| 文件 | 155 | 9,438 | 16,839 |
| 效能 | 65 | 5,032 | 9,518 |
| AGENTS.md | 18 | 2,675 | 4,185 |
| 發布 | 19 | 321 | 405 |

## Cloudflare 的 prompt 設計實例

安全審查者的 prompt 明確規定 **What to Flag** vs **What NOT to Flag**：

```
## What to Flag
- Injection vulnerabilities (SQL, XSS, command, path traversal)
- Authentication/authorisation bypasses
- Hardcoded secrets, credentials, API keys
- Insecure cryptographic usage
- Missing input validation at trust boundaries

## What NOT to Flag
- Theoretical risks with unlikely preconditions
- Defense-in-depth suggestions when primary defenses adequate
- Issues in unchanged code that MR doesn't affect
- "Consider using library X" style suggestions
```

> 「**告訴 LLM 應該忽略什麼是 prompt engineering 的真正價值所在。**」——對應 [[Prompt-Pack-Pattern]]「限制清單比正向描述更有效」的同源原則。

## 連結

- 互補：[[Subagent-Driven-Development]]（內部多 subagent review；adversarial 是外部對抗式 review）
- 對立反模式：[[AI-Quality-Collusion]]（AI 同時生 code + test 的共謀，需要 adversarial 跳出來打）
- 規則固化：[[Ratchet-Pattern]]（adversarial 抓到的反模式應該編碼成永久規則）
- 安全框架：OWASP Top 10 是常用 focus；STRIDE / threat modeling 是進階變種
- Production 對照：[[src-cloudflare-ai-code-review]]（131K reviews / $0.98 中位數 / 7 subagent）
- 工具底層：[[OpenCode]]（Cloudflare 系統選用的 agentic CLI）+ [[OpenAI-Codex-CLI]]（`codex adversarial-review` 命令）
