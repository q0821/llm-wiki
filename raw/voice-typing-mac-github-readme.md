<!--
source-url: https://github.com/penny1985/voice-typing-mac
title: 語音輸入 Voice Typing（penny1985/voice-typing-mac）
fetched: 2026-06-17
note: markdown.new API 超時，改用 GitHub API 抓 README + repo metadata
repo-meta:
  full_name: penny1985/voice-typing-mac
  desc: 完全本機運行的 macOS 語音轉文字小工具（Whisper）。按熱鍵說話自動貼上，支援台灣繁體、全形標點、自動分段、錄音波形。
  language: Python
  stars: 5
  license: None
  updated: 2026-06-17
-->

# 語音輸入 Voice Typing

一個**完全在你 Mac 本機運行**的語音轉文字小工具。按一下熱鍵說話，文字自動貼到游標所在的任何 App。全程不連網、不上雲端、不花一毛 API 錢。

> 像 Typeless，但開源、免費、隱私自己掌握。用 OpenAI 開源的 Whisper 模型，在 Apple Silicon 上即時轉錄。

## 它能做什麼

- **按鍵說話，自動貼上**：按一下右 ⌘ 開始、再按一下停止，文字直接出現在 LINE、Notion、Word、瀏覽器任何地方
- **完全本機、保護隱私**：聲音與逐字稿不離開你的電腦，歷史紀錄只存記憶體、關閉即清除
- **台灣繁體 + 全形標點**：自動簡轉繁、中文標點轉全形，英文 `3.14`、`v1.5` 不誤改
- **自動分段**：講話停頓較久自動換段落、短停頓補頓號
- **錄音波形指示器**：錄音時螢幕底部浮出即時音波，一眼知道正在收音
- **慣用語與修正規則**：把專有名詞加進去提升辨識；用「錯＝對」保證修掉常錯字（按右 ⌥ 快速加入）

## 安裝（需要 Apple Silicon 的 Mac）

需先有 Homebrew。然後：

```bash
git clone https://github.com/penny1985/voice-typing-mac.git
cd voice-typing-mac
bash install.sh
```

裝完到「應用程式」點兩下「語音輸入」即可。第一次會要求開「輔助使用」權限。

## 首次使用須知

第一次按熱鍵說話、放開後，工具會開始**下載約 1.5GB 的語音模型**（只有第一次需要）。這段期間選單列圖示顯示 ⬇️/⏳，**熱鍵故意沒反應**（不能邊下載邊錄音），網路慢可能等 10-20 分鐘，屬正常、不是當機。下載完成後每次轉錄幾秒內完成。

## 怎麼用

| 動作 | 操作 |
|---|---|
| 開始／停止錄音 | 按一下右 ⌘（Command） |
| 快速加詞／修正 | 按一下右 ⌥（Option） |
| 編輯慣用語、看最近紀錄、結束 | 點右上角選單列 🎤 |

## 客製

打開 `engine.py` 最上方「設定區」可改熱鍵、語言、分段停頓秒數、模型等。慣用語放 `慣用語.txt`、修正規則放 `修正規則.txt`（用「錯＝對」），存檔即時生效。

## 技術

Whisper（mlx-whisper，large-v3-turbo）負責辨識，opencc 簡轉繁，pynput 送出貼上，NSEvent 原生監看熱鍵，rumps 做選單列。全部本機、開源。

## 常見問題

- **看起來卡住、關不掉？** 最常見是第一次正在下載 1.5GB 模型。要關閉：選單列 🎤 →「結束」；或 `Command + Option + Esc` 強制結束「Python」。不需重開機。
- **按鍵沒反應？** 到「系統設定 → 隱私權與安全性 → 輔助使用」開啟。
- **轉成簡體字？** 偶爾的詞加進 `修正規則.txt`。
- **波形沒出現？** 確認麥克風權限與輸入裝置。

---

作者：陳沛孺（Penny）｜AI應用講師、閱讀塗鴉實驗室創辦人。個人實驗作品，免費分享。
