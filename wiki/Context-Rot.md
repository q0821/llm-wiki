---
title: Context Rot（上下文衰損）
type: concept
sources: ["未命名.md", "Claude Code 上下文管理攻略.md", "bnext-claude-md-12-rules.md"]
created: 2026-05-14
updated: 2026-05-19
tags: [context-engineering, llm, agent, performance, harness]
confidence: 強
---

# Context Rot（上下文衰損）

模型的 context window 越塞越滿時，**推理品質會下降**——注意力被分散到更多 token、舊的不相關內容干擾當前任務。這是 AI agent 工程的關鍵限制，由 [[Addy-Osmani]] 命名為「Context Rot」，本知識庫 [[src-claude-code-context-management]] 譯為「上下文衰損」。

## 定義

兩個獨立來源的同源描述：

| 來源 | 表述 |
|---|---|
| [[src-addy-osmani-harness-engineering]]（Addy Osmani）| 「模型有一個現實限制：context window 越塞越滿，推理品質通常會變差。」 |
| [[src-claude-code-context-management]] | 「上下文越長，模型效能越下降。注意力被分散到更多 token，舊的不相關內容干擾當前任務。」 |

關鍵理解：**「context 容量大」≠「應該塞滿」**。擁有 100 萬 token 的上下文不代表越多越好——context rot 才是影響輸出品質的真正變數。

## 對抗三招（[[Addy-Osmani]] 視角）

| 招式 | 做法 | 比喻 |
|---|---|---|
| **Compaction（壓縮）** | 把舊對話/中間過程整理成摘要 | 開會中先整理會議紀錄，不要把逐字稿攤桌上 |
| **Tool-call offloading（工具輸出卸載）** | 大型輸出（2000 行 log）存檔案系統，只保留必要的開頭、結尾、重點 | 完整資料放資料夾，桌面只留摘要 |
| **Progressive disclosure（漸進式揭露）** | 工具/指令/文件在任務真的需要時才載入 | 教新人不要第一天塞完整本手冊 |

## Claude Code 的對應五招（[[src-claude-code-context-management]] 視角）

每個回覆都是「分支點」，遇到 context rot 風險時有五種選擇：

| 選項 | 說明 | 適用情境 |
|---|---|---|
| **Continue** | 繼續在同一 session | 任務連貫、上下文仍乾淨 |
| **/rewind**（雙擊 Esc）| 跳回之前某則訊息重新 prompt | 方向走偏、想換路線 |
| **/clear** | 自己寫交接摘要後全新開始 | 任務轉換、上下文雜亂 |
| **/compact** | 讓 Claude 自動壓縮歷史 | 任務中途、不想中斷 |
| **Subagents** | 派子代理處理，只回傳結果 | 中間產出龐大但結果才重要 |

## 兩個視角的對應

| Addy 三招 | Claude Code 五招 |
|---|---|
| Compaction | /compact、/clear（手動版）|
| Tool-call offloading | Subagents（最有效的卸載模式）|
| Progressive disclosure | （無直接對應；偏 harness 層而非互動層） |
| —— | /rewind（用回溯取代修正——Claude Code 特有）|

Claude Code 的 **/rewind** 多出一個「**時間維度**」的招式——不是只有「現在如何省 context」，而是「跨越時間，重新選擇之前的某個分支點」。

## 關鍵原則：主動 vs 被動觸發

[[src-claude-code-context-management]] 中提到的關鍵：

> 「自動壓縮在上下文衰損最嚴重時觸發（模型最不聰明的時刻）。模型無法預測下一步時，會丟掉你之後需要的資訊。」

**解法**：主動提早觸發 /compact，並帶指令說明方向。

這個原則對應到 [[Ratchet-Pattern]] 的「不要等出事才補救，但要從觀察到的失敗賺來規則」——預判 context rot 並主動處理，比被動接受 auto-compaction 結果好。

## 與 [[MEMORY-md|MEMORY.md]] 的關係

MEMORY.md 是「跨 session 長期記憶」，與 Context Rot（單 session 內的容量壓力）是**正交的兩個維度**：

- **單 session 內**：對抗 context rot 用 compaction / offloading / progressive disclosure
- **跨 session 之間**：用 MEMORY.md / Handoff 機制保留長期狀態

兩者搭配：session 內透過 compaction 處理當下、session 結束前透過 handoff 寫進 MEMORY.md 或 `handoff.md`、下次 session 啟動時注入相關記憶。

## 與 [[Harness-Engineering]] 七元件的對應

Context Rot 主要由七元件中的 **Hooks / Middleware** 元件處理（autocompact 是 middleware 形式），而 **Filesystem / Sandbox** 元件提供 tool-call offloading 的目的地（檔案系統）。

對應 [[Addy-Osmani]] 的觀察：

> 「檔案系統讓 agent **卸載暫時不需要塞進 context 的資訊**，並支援多 agent 協作。」

Filesystem 不只是儲存，也是 context rot 的解藥。

## Long-Horizon Execution 的關聯

[[src-addy-osmani-harness-engineering]] 的 Long-Horizon Execution 三招（Loop / Planning / Split），其中 **Split**（產出與評估拆給不同 agent）和 **Subagents** 同源——都是把單一 agent 的 context 壓力**分散到多個小 context**。

> 同一個 agent 既當考生又當考官，會有正面偏差；同一個 agent 既要做事又要記住所有歷史，context rot 必定發生。

## Anthropic 官方版確認：Progressive Disclosure（[[src-claude-code-in-large-codebases|2026-05-14 官方 blog]]）

Anthropic 把 [[Agent-Skills]] 列為 Harness 7 個 extension points 之一，明白標示**progressive disclosure** 是其核心設計原則：

> 「**Skills Keep the Right Expertise Available On-Demand**: Specialized workflows load when needed through **progressive disclosure**, preventing all expertise from competing for context space in every session.」

也就是說，[[Addy-Osmani]] 提出的「對抗 Context Rot 三招」第三招 progressive disclosure，**Anthropic 官方在 Claude Code 產品層直接內建**——不只是個 best practice 建議，是產品內建的擴展機制。

同篇文章對 [[Subagent-Driven-Development|Subagents]] 的設計也呼應 context rot 對抗：

> 「Subagents Split Exploration from Editing: Isolated Claude instances with **separate context windows** that take tasks and **return final results to the parent agent**.」

Subagent 只傳「final results」回父 agent —— 對應 tool-call offloading 招式的產品內建版。

## 個人版對抗工具：[[CLAUDE-md|CLAUDE.md]] 12 條規則中的 Rule 6

[[src-bnext-claude-md-12-rules|Mnimiy]] 把 token budget 直接寫進 CLAUDE.md 規則：

```
Per-task budget: 4,000 tokens.
Per-session budget: 30,000 tokens.
If a task is approaching budget, summarize and start fresh. Do not push through.
Surfacing the breach > silently overrunning.
```

關鍵設計：
- **量化具體**：4,000 / 30,000 是具體數字不是模糊「不要太長」
- **預警 > 突破**：「surface the breach」對應 Cloudflare 「協調者 prompt 超過 50% 警告」同源
- **主動觸發 compaction**：「summarize and start fresh」對應 [[src-claude-code-context-management]]「主動提早觸發 /compact」

這是 context rot 從「工程實作」（Cloudflare 共用脈絡檔）到「個人規範」（CLAUDE.md 規則）的兩種對抗形式——後者更輕量但需要 agent 自覺遵守。

## Cache as Uptime（[[Thariq-Shihipar]]）

[[src-zeuikli-claude-code-best-practices]] 章 3.1 引用 [[Thariq-Shihipar]]：

> 「**Cache rules everything. We treat it like uptime. When it drops, we have an incident.**」

Cache Hit Rate 監控指標化——命中率下降時立即排查根因（通常是三個原因：system prompt 動態修改 / 工具定義增刪 / mid-session 切換模型）。

成本對比（Sonnet 4.6）：一般輸入 $3/MTok → cache 命中 **$0.30/MTok（節省 90%）**。詳分層快取結構見 [[Context-Engineering#分層快取結構]]。

## Production 案例：[[Cloudflare]] AI Code Review 的工程處理

[[src-cloudflare-ai-code-review]] 對 context rot 採取**三層防護**：

| 招式 | 具體做法 |
|---|---|
| **Tool-call offloading** | 不在 prompt 嵌入完整 diff，將各檔案 patch 寫入 `diff_directory` 並傳路徑；子 reviewer 只讀與其領域相關的 patch |
| **共用脈絡檔** | 提取 `shared-mr-context.txt` 寫磁碟，子 reviewer 讀檔而非各自 prompt 嵌入——**避免 token 成本增加 7 倍** |
| **預估警告** | 協調者的提示詞超過預估脈絡視窗 **50% 時自動警告** |

這幾招把「七個 subagent 並行」這種理論上會 7×token 的設計，壓回近乎 1×（透過共用脈絡檔），加上 **85.7% cache hit rate** 進一步降成本。

---

> 「藉由共用脈絡節省 token——避免 token 成本增加七倍。」 — [[Cloudflare]] AI code review 系統

## 信心評估

- **強**：核心定義與三招對抗策略 — 兩個獨立來源（Addy Osmani / Claude Code 上下文管理）同源描述
- **強**：Claude Code 五招的具體做法 — 來自 [[src-claude-code-context-management]] 第一手實戰
- **中**：「自動壓縮在最不聰明時刻觸發」— 作者觀察，邏輯合理但未見實測數據

## 相關概念

- [[Harness-Engineering]] — Context Rot 是 harness 設計要解決的核心問題之一
- [[MEMORY-md]] — 跨 session 維度的對應對策
- [[CLAUDE-md]] — auto-compaction 會壓掉 CLAUDE.md 規則，是 Context Rot 的副作用
- [[Self-Improving-Agent]] — Skill Factory 累積 SKILL.md 是 progressive disclosure 的具體實踐
- [[Addy-Osmani]] — 命名與三招整理者
- [[src-addy-osmani-harness-engineering]] / [[src-claude-code-context-management]] — 主要來源
