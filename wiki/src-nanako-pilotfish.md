---
title: pilotfish：Claude Code 多模型編排層（GitHub）
type: source
sources: ["Nanako0129pilotfish Multi-model orchestration layer for Claude Code.md", "Nanako0129pilotfish Multi-model orchestration layer for Claude Code — the frontier model plans, cheaper models execute, verification guards quality. One-prompt install..md"]
created: 2026-07-11
updated: 2026-08-08
tags: [claude-code, 多模型, orchestration, 降本, open-source, github]
confidence: 中
---

# pilotfish：Claude Code 多模型編排層

**作者**：Nanako0129
**平台**：GitHub（`Nanako0129/pilotfish`）
**授權**：MIT
**數據點（時間敏感）**：588 stars、40 forks、最新 v1.3.10（2026-08-08 查核；2026-07-11 首次記錄時為 319 stars／v1.1.2，成長近一倍）
**抓取於**：2026-07-11；2026-08-08 更新數據與新機制

一鍵裝進全域 `~/.claude/` 的 [[多模型角色編排]] 工具。名字取自「領航魚」，在大魚旁邊游、做例行雜活，好讓大的不必費神。

## 解決的問題

> Fable 5 消耗訂閱額度約為 Opus 的兩倍。而大多數 coding token 花在機械任務（搜尋、編輯、測試），這些便宜模型做得一樣好。pilotfish 把昂貴的前沿模型保留給規劃與 review，執行下放給便宜模型。

## 三層架構

1. **機器層**（`settings.json`）：主 session 設 `"best"` 別名 + fallback chain（`["opus","sonnet"]`）
2. **角色層**（八個 agent 檔）：每個角色用 frontmatter 綁定適當模型層級
3. **政策層**（[[CLAUDE-md|CLAUDE.md]]）：用**角色名**定義下放規則，**絕不寫模型名**

## 8 角色（原 6 角色已擴充，詳見 [[多模型角色編排]]）

- `scout`（Haiku）唯讀查找／`Explore`（Haiku）覆蓋內建 Explore agent，廣泛唯讀搜尋不繼承主模型
- `plan-verifier`（Opus，**新增角色**）核准前挑戰 Plan：回 `READY` 或結構化 `REVISE`
- `mech-executor`（Sonnet）機械式模式工作／`executor`（Opus）需判斷的實作
- `security-reviewer`（Opus，**新增角色**）核准前唯讀資安證據蒐集／`security-executor`（Opus）資安敏感實作
- `verifier`（Opus）fresh-context 對抗式 review

## 新機制：Interaction Shape 路由（2026-08-08 補）

在 Baton／直接派工之前，先選一種互動形狀：結果或驗收標準不清楚 → `co_discover`；方向明確但範圍大/高影響 → `explore_then_plan`；範圍明確且有界 → `execute`。**改變主 session 怎麼跟人協作，不繞過風險與 approval gate**。設計借鏡自 pilotfish-codex（miyago9267）的 adaptive intent routing。

## 生態系擴張（2026-08-08 補）

| Host / 場景 | 專案 |
|---|---|
| Claude Code 全域政策 | 本專案 |
| Claude Code + session-scoped GPT routing | remora |
| Grok Build | pilotfish-grok |
| Codex CLI | pilotfish-codex（miyago9267）|

## 關鍵設計原則

- 政策文字只提角色、不提模型；模型綁定集中一處，換模型只改該處（抗 deprecation → [[Ratchet-Pattern]]）
- **fresh-context 驗證勝過自我批評**（[[Adversarial-Code-Review]]）
- 安裝前先讀磁碟、顯示 approval-gate 計畫再改檔；冪等更新

## 安裝

單一提示詞裝進全域設定：讀 `install/AGENT-INSTALL.md` 照做。會先顯示核准計畫再改檔。

## 核心 benchmark

「Fable 5 orchestrator + Sonnet 5 workers = 96% 效能、46% 成本」（Anthropic）。

## 關聯

- [[多模型角色編排]]：本工具是此概念的打包實作（個人吸收段在該頁）
- [[src-zhongyea-orchestrator-cost]]：同一 benchmark 的手動教學版
- [[Harness-Engineering]]、[[Managed-Agents]]、[[Claude Code]]

## 信心評估

- **中**：README 敘述清楚、開源可查；但降本效益數字引用自 Anthropic benchmark，實際效果依工作負載而定，未獨立驗證
- 數據點（stars / 版本）時間敏感，會過時
