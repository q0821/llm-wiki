---
title: 社群推薦的 7 個常用 Claude Skills（清單）
type: source
sources: ["別人常用的skill.md"]
created: 2026-07-11
updated: 2026-07-11
tags: [claude-skills, 清單型, 工具, agent-skills]
confidence: 弱
---

# 社群推薦的 7 個常用 Claude Skills

一則社群分享（無署名 / 無原始連結，inbox 投遞的純文字），列舉分享者常用的 [[Agent-Skills|Claude Skills]]。**清單型來源**，用途是「用到時可 query 有哪些選項」，不逐一深入。

## 清單

| Skill | 一句話用途 |
|---|---|
| **caveman** | 讓 Claude 回覆只留重點、砍廢話，省 token（長對話成本直接砍一截） |
| **graphify** | 把整包專案（程式碼、SQL、文件）變成可查詢知識圖譜，問「這段邏輯在哪、誰呼叫誰」秒答 |
| **codeburn** | 儀表板，看 AI 把 token 與花費燒在哪，不再黑箱 |
| **claude video** | 讓 Claude「看懂影片」——自動抓影格 + 轉語音，再回答影片內容 |
| **open design** | 本地開源版設計工作室，用自己的設計系統讓 AI 生網頁/簡報/圖片原型，風格一致 |
| **browser-harness** | 讓 AI 更穩地用 Playwright 自動操作網頁，擋掉自動化常踩的雷 |
| **gsap** | 教 AI 正確寫 GSAP 網頁動畫，不亂兜 |

## 與本知識庫的關聯

- [[Agent-Skills]] — 這些都是 skill 生態的實例；本頁作為「社群在用什麼 skill」的參考清單
- **graphify** — 使用者本機已裝有同名 skill（`~/.claude/skills/graphify/`），概念是「任何輸入轉知識圖譜」，與本知識庫的 [[LLM-Wiki]] 精神相近（結構化 + 可查詢）。**2026-07-22 已建 [[graphify]] entity 頁**（含安裝細節、PreToolUse hook 機制與「什麼時候不要用」），本頁的一行描述由該頁取代
- **open design** — 對照 2026-07 新增的 [[impeccable]]（AI 前端品質）與
  [[src-apple-design-skill-emilkowalski-2026-07|apple-design]]（互動規範），三者同屬「約束 AI 視覺輸出」的 skill 群
- **browser-harness** — 對照使用者已用的 Playwright / [[BrowseForge]] 自動化路線
- **codeburn** — 對照 [[src-coralline-statusline-2026-06|coralline statusline]] 的 cost/token segment（都在解「token 花費黑箱」問題）

## 信心評估

- **弱**：無署名、無連結、無法驗證各 skill 的實際出處與品質；純為「有人推薦」的清單。各項若要納入實際工作流，需個別查證來源與維護狀態。

## 備註

清單型來源依 CLAUDE.md 規範**不加個人吸收段**。若日後實際採用某個 skill，再單獨為它建 entity 頁並補脈絡。
