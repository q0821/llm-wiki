---
title: 科技翰林院 — Claude Code 終端機 8 個實戰設定全公開
type: source
sources: ["科技翰林院怎麼用 Claude Code 終端機？8 個實戰設定全公開.md"]
created: 2026-05-09
updated: 2026-05-09
tags: [claude-code, workflow, claude-md, skills, memory, token-management]
confidence: 強
---

# 科技翰林院 — Claude Code 8 個實戰設定全公開

**作者**：[[科技翰林院|AI 導演林思翰 Hans]]
**發表平台**：科技翰林院（techhanlin.tw）
**發表日期**：2026-04-25
**原始連結**：https://www.techhanlin.tw/claude-code-workflow-8-settings-guide/

## 核心主張

- Claude Code 真正的威力**不在對話本身，在那些可以自己調整的設定**
- 工作流程優化的核心：「**把你重複在做的事情，變成 AI 自動就會做的事情**」
- 跨 session 延續性靠兩條腿：**Memory 系統**（隱性學習）+ **Handoff 機制**（顯性接力）
- Token 管理是長期效率關鍵——重複的 Skill 與超長 CLAUDE.md 會吃掉 context window

## 8 個設定摘要

### 1. cmux（終端機多工）

- 終端機多工管理工具，同視窗多分頁、可 detach/attach、session 不因關視窗而消失
- 安裝：`brew install cmux`
- 用法：`Ctrl+B + C` 開新 session、`Ctrl+B + 數字` 切換
- 為每個 session 取有意義名稱（如 techhanlin / counsel / aiterms）

### 2. 直接拖放圖片進終端機

- Claude Code 是多模態：拖圖比打字描述快
- 高頻場景：UI debug、設計稿臨摹、錯誤訊息截圖診斷、競品畫面參考
- 注意：圖片佔 context window，不必要時不一直拖

### 3. CLAUDE.md（最重要的設定檔）

詳見獨立概念頁 [[CLAUDE-md]]。本文重點：

- 兩層分層：**全域** `~/.claude/CLAUDE.md` + **專案** 根目錄 CLAUDE.md
- 該寫 vs 不該寫的對照表（[[CLAUDE-md#該寫進 CLAUDE.md vs 不該寫進|詳見]]）
- 控制長度：超過 200 行就該精簡

### 4. 狀態列自訂

- 透過 `~/.claude/statusline.sh` + `settings.json` 的 `statusLine` 設定
- 顯示資訊：模型、專案 + git 分支、session 時間、context 剩餘、5 小時額度、7 天額度
- 顏色規則：>50% 無色、20-50% 黃、≤20% 紅
- 重點：不必自己寫腳本——把指令貼給 Claude Code 它會自動建腳本與設定

### 5. Skills 系統（[[Agent-Skills]]）

- 把整套工作流程寫成 Skill 檔案，`/skill-name` 觸發
- 比 Prompt 優勢：封裝完整流程、不用每次重新描述
- 作者實際在用的 Skills 命名範例（10 個常用）：

| Skill | 用途 | 觸發時機 |
|---|---|---|
| `/techhanlin-write` | 寫文章：讀 SOP → 寫內容 → 上傳 WP → 設 SEO | 寫新文章 |
| `/techhanlin-wp` | 純 WordPress 操作：改頁面、注入 CSS、清快取 | 不寫內容只改設定 |
| `/wp-seo-batch` | 批次 SEO 優化，每 5 篇自動驗證 | 大量修 SEO |
| `/css-fix` | CSS 修改流程：先診斷再動手 | 改樣式 |
| `/check` | Session 開始驗證環境和需求 | 每次新 session 開頭 |
| `/verify` | 修改後強制驗證 | 任何修改完成後 |
| `/deploy` | 部署到 production 並確認成功 | 上線時 |

> 觀察：`/check` 與 `/verify` 是「session 護欄」型 skill，與本知識庫的 `/llm-wiki ingest|query|lint` 同屬流程化封裝。

### 6. Memory 系統 + Handoff 機制

**Memory（隱性學習）**：
- 位置：`~/.claude/projects/`
- 類型：user / feedback / project / reference（與 Anthropic 內建 memory schema 一致）
- 觸發方式：糾正 AI 時自動存、或主動說「記住：...」
- 索引檔：`MEMORY.md`

**Handoff（顯性接力）**：
- 痛點：auto-compaction 會把 CLAUDE.md 規則壓掉，**作者實測壓縮後規則遵守率接近 0%**
- 解法：每個 session 結束前讓 AI 寫 `~/.claude/tasks/handoff.md`，下次新 session 開頭先讀
- 設定：在 CLAUDE.md 加兩條規則（「新對話開始先讀」+「結束前主動寫」）

> 與 [[src-claude-code-context-management]] 的「rewind / compact / subagent 策略」互補：rewind 是 session 內回滾、compact 是壓縮、subagent 是分支；handoff 則是 **session 之間的顯性接力**。

### 7. Token 管理（Skills 與 CLAUDE.md 體檢）

- 作者實測：4 個重複 Skill（同時存在 `~/.claude/skills/` 與 `~/.claude/commands/`）= **約 580 行 / 20,000 Token**
- 20,000 Token ≈ 5,000 字中文文章——每次新對話開頭都白費讀一次
- 常見浪費點：
  - CLAUDE.md > 200 行（該精簡）
  - Memory 檔案沒整理（過時的還在被載入）
  - Skill description 寫太長（會出現在每次指令列表中）
- 操作：直接讓 Claude Code 「掃所有 skill 列出位置/行數/摘要，比對重複」

### 8. 電腦級自動化

- 用例 1：掃描磁碟空間 → 用 `du` + `git log` 列專案大小、最後 commit、推送狀態 → 安全刪除流程（先檢查未推變更）
- 用例 2：GitHub repo 設停止更新 → `gh repo archive`
- 核心觀念：**Claude Code 能做的範圍 = 終端機能做的範圍**，遠不只「寫程式」

## 關鍵原文引用

> 「==從終端機管理、Skill 自訂指令系統、Memory 到 Token 管理，每一個設定都是讓 AI 從通用助手變成「你的專屬助手」的關鍵。==」

> 「==Claude Code 工作流程優化的核心概念就是一句話：把你重複在做的事情，變成 AI 自動就會做的事情。==」

> 「每次你發現自己在跟 AI 說一樣的話，那就是應該建一個 Skill 的時候。每次你發現 AI 又犯了同樣的錯，那就是應該寫一條 Memory 的時候。」

## 數據點（時間敏感）

- 作者宣稱用 Claude Code 一天省 **3-4 小時**
- 重複 Skill 浪費 **約 20,000 Token / 4 個重複 skills**
- Pro 方案額度：**5 小時** + **7 天** 兩個窗口
- auto-compaction 後 CLAUDE.md 規則遵守率「**接近 0%**」（作者實測）

## 與本知識庫既有頁面的關聯

- [[科技翰林院]] — 第二篇納入此 entity（與 [[src-techhanlin-llm-wiki-tutorial]] 構成「方法論 + 實戰」雙軸）
- [[CLAUDE-md]] — **新建概念頁**，承載 CLAUDE.md 設計原則（兩層分層、該寫/不該寫、長度控制）
- [[Agent-Skills]] — 補充「為什麼把 prompt 變成 Skill」的論點與作者實戰命名範例
- [[src-claude-code-context-management]] — Memory + Handoff 機制與既有的 rewind/compact/subagent 策略互補

## 信心評估

- **強**：8 個設定的具體步驟與工具名稱（cmux、statusline.sh、Memory schema 等）— 可立即驗證、操作步驟明確
- **強**：CLAUDE.md 設計原則（兩層分層、該寫/不該寫、長度控制）— 來自實戰且與 [[src-techhanlin-llm-wiki-tutorial|前一篇]]建議一致
- **中**：「auto-compaction 後規則遵守率接近 0%」— 作者個人實測，未提供測試方法細節，但與本知識庫既有 [[src-claude-code-context-management]] 的觀察方向一致

## 忽略區段

- 文末「推薦閱讀」與「參考資料」連結清單（屬導流）
- Pro 方案定價細節（時效短）
