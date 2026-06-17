---
title: 語音輸入 Voice Typing — 本機 Whisper 語音轉文字小工具（GitHub 2026-06）
type: source
sources: ["voice-typing-mac-github-readme.md"]
created: 2026-06-17
updated: 2026-06-17
tags: [stt, whisper, voice-typing, mac, apple-silicon, local-first, privacy, open-source, mlx, opencc, 繁體中文]
confidence: 強
---

# 語音輸入 Voice Typing（GitHub）

> 來源：https://github.com/penny1985/voice-typing-mac
> 作者 陳沛孺（Penny）｜AI 應用講師、閱讀塗鴉實驗室創辦人
> Python ｜ License 未標 ｜ 擷取時 5 stars ｜ 個人實驗作品、免費分享
> 擷取 2026-06-17（markdown.new API 超時，改用 GitHub API 抓 README + repo meta）

## 一句話定位

> **像 Typeless，但開源、免費、隱私自己掌握。** 完全在 Mac 本機運行的語音轉文字小工具——按熱鍵說話，文字自動貼到游標所在的任何 App，全程不連網、不上雲端、不花 API 錢。

定位差異：商業 STT 工具（[[Typeless]]、Plaud 等）多走雲端 API；本工具把同一體驗用**本機 Whisper** 重做，賣點是**隱私 + 零成本**而非辨識品質領先。

## 關鍵設計（原文重點）

- **觸發模型**：按一下右 ⌘ 開始 / 再按一下停止 → 文字自動貼到游標處（LINE、Notion、Word、瀏覽器皆可）。按右 ⌥ 快速加詞 / 加修正規則。
- **完全本機、保護隱私**：聲音與逐字稿不離開電腦；**歷史紀錄只存記憶體、關閉即清除**（不落地）。
- **台灣在地化**：自動簡轉繁（opencc）、中文標點轉全形；英文如 `3.14`、`v1.5` 不誤改。
- **自動分段**：長停頓自動換段落、短停頓補頓號。
- **錄音波形指示器**：螢幕底部即時音波，確認正在收音。
- **可調慣用語 / 修正規則**：專有名詞進 `慣用語.txt` 提升辨識；`修正規則.txt` 用「錯＝對」**保證**修掉常錯字（規則式後處理，存檔即時生效）。
- **客製入口**：`engine.py` 最上方「設定區」改熱鍵、語言、分段停頓秒數、模型。

## 技術棧

| 角色 | 元件 |
|---|---|
| 辨識 | **Whisper**（mlx-whisper，large-v3-turbo）— 走 Apple Silicon 的 MLX |
| 簡轉繁 | opencc |
| 送出貼上 | pynput |
| 熱鍵監看 | NSEvent（原生） |
| 選單列 | rumps |

全部本機、開源。需 Apple Silicon Mac + Homebrew，`bash install.sh` 安裝。

## ⚠️ 首次使用的關鍵 UX 陷阱

第一次按熱鍵後會**下載約 1.5GB 模型**（僅首次）。下載期間選單列圖示顯示 ⬇️/⏳，**熱鍵「故意」沒反應**（不能邊下載邊錄音），網路慢可能等 10-20 分鐘。

> README 特別寫了一段「給協助安裝的 AI 助理」的提示，要 AI 主動告知使用者這段沉默是正常的、不要重開機。這是把「LLM 會被叫來幫忙裝」當成設計前提的細節——值得注意的產品意識。

## 信心評估

- **強**：定位、功能、技術棧、安裝與 UX 流程 — 官方 README 一手。
- **未驗證**：辨識準確度、與 Typeless/雲端方案的實際差距、5 stars 表示尚屬早期個人專案，穩定度未知。

## 相關頁面

- [[comparison-stt-models-whisper-paraformer-sensevoice]] — Whisper vs Paraformer vs SenseVoice 選型比較（有人反映本工具用的 Whisper 中文較弱，研究替代模型的結論）
- [[src-muki-plaud-workshop-ai-codev-2026-06-04]] — 同樣涉及 STT，但情境相反：Plaud 是雲端轉錄、且有系統性 STT 錯誤（Claude→Cloud）需事後校正；本工具用規則式 `修正規則.txt` 做類似的後處理修正
- 工具定位類比：[[OpenCLI]] / [[mcp-cli]] — 同屬「把某能力做成本機開源工具」的開源實作精神（不同領域）
