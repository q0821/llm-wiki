---
title: coralline — 仿 Powerlevel10k 的 Claude Code statusline（GitHub + 作者 Threads 2026-06）
type: source
sources: ["Nanako0129coralline 🪸 Powerlevel10k-inspired statusline for Claude Code — paste one prompt and your AI interviews you, then installs it.md", "Threads 上的 Nanako Tsai（@nyanako_0129）.md"]
created: 2026-06-18
updated: 2026-06-18
tags: [claude-code, statusline, powerlevel10k, terminal, nerd-fonts, shell, vibe-coding, ai-installer, 工具型]
confidence: 強（功能/規格 GitHub 一手）／中（作者動機 Threads 親述）
---

# coralline — Claude Code statusline

> 來源：
> - GitHub https://github.com/Nanako0129/coralline （Shell ｜ MIT ｜ 擷取時 345 stars ｜ 2026-06-12 建立）
> - 作者 Threads https://www.threads.com/@nyanako_0129/post/DZeoN7MERsp （Nanako Tsai @nyanako_0129）
> 擷取 2026-06-18（GitHub 經 API 抓 README + meta；Threads 經 WebFetch）

## 一句話定位

> 🪸 **A Powerlevel10k-inspired statusline for Claude Code** — 一支 `install.sh` 同時服務人類與 AI：自己跑，或叫 Claude 幫你跑並完成設定。

把 [[Claude Code]] 底部的狀態列從預設樣式換成仿 [Powerlevel10k](https://github.com/romkatv/powerlevel10k)（zsh 知名美化主題）的膠囊式多 segment 版面。

## 功能重點（GitHub README）

- **13 個 segment**：目錄、repo 名、git 狀態、當前 model、**reasoning effort（`ψ` low/med/high/xhigh/max）**、**context 視窗用量 + token 計數**、**5h / 7d rate-limit 量表 + 重置倒數**、本 session 增刪行數、**session 成本（USD）**、output style、session 時長、git stash 數、時鐘。
- **量表會變色**：綠 → 50% 轉黃 → 75% 轉紅（閾值可調）。
- **9 個內建主題**：claude-coral（預設）、catppuccin-mocha、nord、gruvbox-dark、tokyo-night、mono、dracula、lunar-pink、reverie。主題就是一個 `.conf` 檔，複製改色即可。
- **兩種樣式**：`pill`（powerline 膠囊）/ `lean`（無底色純彩字，p10k lean 風）。
- **響應式版面**：`VL_LAYOUT="auto"` 視窗變窄時自動換行（最多 `VL_MAX_LINES` 行）；寬度取自 Claude Code v2.1.153+ 注入的 `$COLUMNS`。
- **可匯入既有 p10k**：有 `~/.p10k.zsh` 可在安裝時帶入既有 style / 時間格式 / 主色。
- **需求**：`jq` + Nerd Font 終端機（無 Nerd Font 可設 `VL_ASCII=1` 走無字形渲染）。

## 亮點 pattern：AI installer（訪談式安裝）

同一支 `install.sh` 三種安裝路徑（Ask Claude 推薦 / 一行 curl / 手動），但最有特色的是**叫 AI 裝**：

> Paste this into Claude Code:
> `Please install coralline for me: fetch .../INSTALL.md and follow the playbook in it.`

Claude 讀 `INSTALL.md` playbook → 用 `--install-only` bootstrap runtime → **反過來訪談你**配色/版面偏好 → 寫 config → 驗證 → 提醒可重跑視覺 wizard。把「工具設定」設計成「AI 讀 playbook + 訪問使用者」的形態，是值得注意的 **agent-friendly 安裝設計**（對比一般 README 只給人看的安裝指令）。

## 作者動機（Threads 親述）

Nanako Tsai 開源發布時的說法：上班時間**盯 Claude Code 比盯終端機 prompt 還久**，希望這個介面也一樣賞心悅目；明確致敬 romkatv 的 Powerlevel10k「示範了終端機介面可以有多美」。

> 反映一種務實心態：既然每天大量時間泡在 Claude Code，投資視覺與可用性就划算。

## 信心評估

- **強**：功能、segment 清單、主題、安裝/設定方式 — GitHub README 一手。
- **中**：作者動機與發布脈絡 — Threads 親述（單一視角、宣傳場合）。
- **未驗證**：實際渲染效果、跨終端機相容度、345 stars 屬早期（2026-06 建立未滿一週），長期維護未知。

## 相關頁面

- [[Claude Code]] — 本工具的宿主；statusline 是其可自訂的介面元件之一
- [[src-techhanlin-claude-code-8-settings]] — 另一處提及 Claude Code statusline 設定的來源
