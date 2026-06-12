---
title: html2pptx skill 評價推文 — Taiyo (@taiyo_ai_gakuse)（X 2026-06-10）
type: source
sources: ["x-taiyo-kimura-html2pptx-skill.md"]
created: 2026-06-13
updated: 2026-06-13
tags: [agent-skills, pptx, 簡報, claude-code, html2pptx, genspark, source-bias]
confidence: 弱
---

# Taiyo (@taiyo_ai_gakuse) html2pptx 評價推文（X）

> 來源：https://x.com/taiyo_ai_gakuse/status/2064578992548540650
> 發文 2026-06-10 下午 1:22 ｜ 擷取時 1.6 萬次查看、43 轉推、65 喜歡
> 原文日文，內容取自 X 內建繁中翻譯（經 Claude in Chrome 擷取；markdown.new 與 WebFetch 均被 X 擋）

主條目見實體頁 [[html2pptx]]。本頁保留推文原始主張與利益衝突分析。

## 推文主張（3 條）

1. Claude Code 的**內建 pptx skill 轉換範圍較窄**
2. [[html2pptx]] skill 能把 HTML「そのまま」（原樣）轉換成 PPTX，**大幅減少限制**
3. 「個人基準測試中，**超越了 Genspark**」

引用推文（同作者，2026-06-10）補充：

> Claude Code 的 Fable 5 一次就生成出來的投影片。做出來的設計美到完全不像 AI 做的。實際的成果物（HTML、Design.md、PPTX 檔案）會貼在回覆裡。

## ⚠️ 利益衝突：賣方自評自家產品

查證後確認：**@taiyo_ai_gakuse 本人就是 html2pptx 的開發者**——

- 2026-04 [親自發布 html2pptx CLI](https://x.com/taiyo_ai_gakuse/status/2044161522297893164)（`npm install -g html2pptx-cli`）
- 多則推文以開發者身分宣傳 html2pptx.app 的 API & MCP 公開、Discord 社群、ARR 進展
- 背景：日本「AI Agent 作る大学生」，獨立開發 kirigami.app（自述 $60K ARR），經營百人社群 AI PLAY GUILD
- html2pptx.app 官網 GitHub 連結指向 `nanameru`（repo 含 Majin-Slide-MCP 等投影片工具，推測為同一人，未直接確認）
- 識別注意：taiyokimura.com 的當代藝術家「木村太陽」是**同名不同人**，勿混淆

因此「超越 Genspark」「內建 pptx skill 範圍窄」皆為**賣方敘事**，無第三方 benchmark 佐證。對應 [[src-nvidia-gtc-taipei-2026-jensen-keynote]] 確立、[[src-google-ai-search-optimization-guide-2026-05]] 細分的「Source Bias 錯位——賣方敘事型」。

## 信心評估

- **中**：工具存在性、四種形態（REST API / Skill / MCP / CLI）、價格方案——官網一手資訊
- **弱**：「超越 Genspark」benchmark——賣方自評、未公開方法與樣本
- **弱**：「內建 pptx skill 轉換範圍窄」——賣方比較性主張，未實測（不過引用推文承諾的成果物 HTML / Design.md / PPTX 在回覆中可部分驗證）

## 相關頁面

- [[html2pptx]] — 實體主條目
- [[Agent-Skills]] — Claude Code skill 生態，本工具以 skill 形態之一進入清單
- [[Claude Code]] — 宿主環境；內建 pptx skill 為被比較對象
- [[MCP]] — html2pptx 的整合形態之一
- [[DESIGN-md]] — 引用推文的成果物含 Design.md，與該設計規範模式呼應
