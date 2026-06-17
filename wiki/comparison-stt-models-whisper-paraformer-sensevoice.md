---
title: STT 模型比較 — Whisper vs Paraformer vs SenseVoice（本機中文語音輸入）
type: comparison
sources: ["voice-typing-mac-github-readme.md", "web-research-2026-06"]
created: 2026-06-18
updated: 2026-06-18
tags: [stt, whisper, paraformer, sensevoice, funasr, sherpa-onnx, 繁體中文, mac, apple-silicon, local-first, asr, cer-benchmark]
confidence: 強（方向）／中（確切 CER 數字）
---

# STT 模型比較：Whisper vs Paraformer vs SenseVoice

> 起因：[[src-voice-typing-mac-github-2026-06]] 用 Whisper 本機跑中文語音輸入，有人反映 Whisper 中文品質不佳，建議改用 FunASR / Paraformer / SenseVoice。本頁釐清三者關係並比較，扣住「Mac 本機 + 台灣繁體 + press-to-talk 聽寫」的實際情境。

## 先修正框架：這不是三選一

`FunASR / Paraformer / SenseVoice` 不是三個平行競品，而是不同層級：

- **FunASR** = 阿里達摩院（ModelScope）的語音辨識**工具箱／執行框架**（runtime）。本身不是模型，是「跑模型的引擎」，且**三個模型它都能跑（含 Whisper）**。
- **Paraformer** = 跑在 FunASR 上的旗艦**模型**（2022，非自回歸 NAR，60k 小時中文訓練）。
- **SenseVoice** = 跑在 FunASR 上的較新**模型**（2024，FunAudioLLM 系列，NAR，400k 小時、50+ 語）。

→ 正確比較是 **「Whisper vs Paraformer vs SenseVoice」三個模型**；FunASR 只是 Mac 上把後兩者跑起來的其中一種方式。

## 中文準確度：Whisper 確實明顯落後

AISHELL-1（中文標準 benchmark）字元錯誤率 CER，越低越好：

| 模型 | AISHELL-1 CER | 相對 |
|------|--------------|------|
| Whisper large-v3 | 5.14% | 基準 |
| SenseVoice-Small | 2.96% | ≈ Whisper 的 6 成錯誤 |
| Paraformer-Large (220M) | 1.68% | ≈ Whisper 的 1/3 錯誤 |

中文場景 Whisper 錯字約為 Paraformer 的 2～3 倍。**方向被多來源佐證（FunAudioLLM 論文、FunASR README）；確切數字隨資料集/口音/版本浮動**。另：Whisper 有約 1% 片段「幻覺」（生出沒講過的文字），NAR 模型幾乎無此問題。

## 三模型逐項對照

| 面向 | Whisper | Paraformer-Large | SenseVoice-Small |
|------|---------|------------------|-------------------|
| 出身 | OpenAI | 達摩院 | 達摩院 FunAudioLLM |
| 架構 | 自回歸 AR | 非自回歸 NAR | 非自回歸 NAR |
| 中文準確度 | 普通 (5.14%) | **最佳 (1.68%)** | 很好 (2.96%) |
| 語言 | 99 語 | 主打中＋英 | 50+ 語（中英日韓粵） |
| 速度 | 基準 | 快 9× | **快 13～15×**（CPU 17× 即時） |
| 資源 | 大 (5-6GB) | 中 | **極小 (<1GB)** |
| 真串流 | ❌ | ✅ 2-pass | ❌ 一次性離線 |
| 特色 | 多語成熟 | 中文最準、可串流 | 多語 + 情緒辨識 + 音訊事件偵測 |

選擇要點：
- **中文要最準** → Paraformer-Large（語言偏中英）
- **又快又輕又多語** → SenseVoice-Small（中英日韓粵，CPU 上飛快）
- **要邊講邊出字（真串流）** → 只有 Paraformer/FunASR；Whisper 與 SenseVoice 都是錄完再轉

## ⚠️ Mac 本機可行性（決定可不可行的關鍵）

[[src-voice-typing-mac-github-2026-06]] 跑的是 **mlx-whisper**（Apple Silicon MLX 優化，快又省電）。但：

- **Paraformer / SenseVoice 目前沒有原生 MLX 版本。** mlx-audio issue #761（2026-06-01 請求加入）**已關閉、未實作**。→ 不能把 engine.py 的 mlx-whisper 直接換成 SenseVoice。
- Mac 本機真正可行的路徑：
  1. **sherpa-onnx**（k2-fsa）✅ 推薦 — 有預打包的 SenseVoice / Paraformer ONNX 模型，**macOS 用 CPU 就能跑、100% 離線**。NAR 小模型 CPU 速度本來就快（17× 即時），不需 GPU。最成熟本機路徑。
  2. **funasr Python 套件** CPU 跑 — 可行但相依重、整合麻煩。

## 兩個易忽略的點

1. **繁體中文不是差異點**：三者（含 Whisper）都用簡體普通話訓練、原生輸出偏簡體。voice-typing-mac 現在靠 **opencc 簡轉繁** 補上——換模型也要保留 opencc 這層，所以繁體需求對三者平手。
2. **press-to-talk 情境偏好 SenseVoice**：voice-typing-mac 是「按鍵→講一段→放開→轉錄貼上」，本來就是錄完整段再轉，用不到真串流。故 Paraformer 的串流優勢用不上；SenseVoice 又快又輕又多語、剛好對應「一次性離線轉錄」，功能上最貼。

## 結論建議（扣 voice-typing-mac 情境）

| 優先 | 選哪個 | 怎麼跑 |
|------|--------|--------|
| 平衡、又快又輕、偶爾英日 | **SenseVoice-Small** | sherpa-onnx (CPU) |
| 幾乎只講中文、要最高準度 | **Paraformer-Large** | sherpa-onnx (CPU) |
| 懶得改、現狀堪用 | 留 Whisper（已是 mlx-whisper） | — |

**務實提醒**：換模型不是改設定那麼簡單——engine.py 是針對 mlx-whisper API 寫的，改用 SenseVoice 要把辨識層重接到 sherpa-onnx（音訊格式、VAD、輸出後處理都要對接）。最低成本驗證：先用 sherpa-onnx 的 SenseVoice 範例丟幾段自己的實際語音測 CER，有感再動手改。

## 待決策（spaced retrieval）

尚未實測，先存基準。**下次回看時自問**：有實際拿 sherpa-onnx + SenseVoice 跑過自己的語音嗎？錯字真的比 Whisper 少到值得重接 engine.py 嗎？若朋友再丟新模型（如 FireRedASR、Qwen3-ASR），回到本頁的 CER 表 + Mac 本機可行性兩個軸去評，不要只看 benchmark 數字。

## 相關頁面

- [[src-voice-typing-mac-github-2026-06]] — 本比較的起點（Whisper 本機聽寫工具）
- [[src-muki-plaud-workshop-ai-codev-2026-06-04]] — STT 後處理校正的另一情境（雲端轉錄的系統性錯誤）

## 信心評估

- **強**：FunASR/Paraformer/SenseVoice 的層級關係、Whisper 中文較弱的方向、Mac 無原生 MLX、sherpa-onnx 為可行本機路徑。
- **中**：確切 CER 數字（多來自單一深度比較文，benchmark 隨條件浮動）。
- **未驗證**：使用者自己語音的實測 CER、重接 engine.py 的實際工時。
