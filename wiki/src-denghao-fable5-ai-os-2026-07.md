---
title: 5 步驟建構 Fable 5 AI 個人作業系統 (OS)（等號 2026-07）
type: source
sources: ["5-fable-5-ai-os.md"]
created: 2026-07-16
updated: 2026-07-16
tags: [ai-os, jarvis, voice-control, stt, tts, faster-whisper, kokoro, obsidian, agent-skills, local-first, reskin, white-label, 論點型, 方法型]
confidence: 中
---

# 5 步驟建構 Fable 5 AI 個人作業系統 (OS)

> 來源：https://denghao.substack.com/p/5-fable-5-ai-os
> 作者 等號（denghao，Substack）｜發布 2026-07-04
> 擷取 2026-07-16（markdown.new API 限流，改用 WebFetch 抓全文）

## 一句話定位

> **把「打造一個語音驅動、本地優先、可換皮轉賣的個人 Jarvis」拆成 5 步驟的方法框架。** 大腦（技能架構）＋記憶（Obsidian）＋聲音（本地 STT/TTS）＋介面（HUD 儀表板）＋交付（打包換皮）。

定位差異：這不是「教你減少打字」，而是「教你從零 DIY 一整套 AI OS 產品」。語音只是五個零件之一，且是自建管線版本。第五步直接把終點設在「換皮賣給別的公司」——**這是一篇「做產品」路線的教學，不是「用工具」路線。**

## 五步驟架構（原文重點）

| 步驟 | 名稱 | 核心 | 關鍵工具 |
|---|---|---|---|
| 1 | 大腦 The Brain | 工作流拆成「分支 → 技能」，每技能一份 `SKILL.md`（Role/Inputs/Outputs/Tools） | 資料夾結構、`SKILL.md` |
| 2 | 記憶 The Memory | 純文字 Markdown 當長期記憶，AI 報告寫進 Obsidian Vault、強制打 `[[雙向連結]]` | [[Obsidian]] |
| 3 | 聲音 The Voice | 100% 本地語音：聽（STT）→ 意圖路由 → 說（TTS） | `faster-whisper`、意圖 Router、`Kokoro` |
| 4 | 介面 The Face | 技能／記憶／語音狀態整合進單一 HUD 儀表板（V.A.U.L.T.） | Streamlit／Gradio、FastAPI／Flask、WebSocket |
| 5 | 交付 The Handoff | `git init` + `.env.example` + `setup.sh` + CSS 變數抽到 `config.json` 換皮 | git、.env、setup 腳本、換皮 config |

### 三大自稱優勢

- 不綁定特定模型（以 Fable 5 為基礎但底層 LLM 可替換）
- 100% 語音全本地端運行（隱私、低延遲）
- 100% 可客製化（可為不同客戶分岔換皮）

### 第三步「聲音」細節（與使用者需求最相關）

- **聽**：`faster-whisper` 本機 STT，喚醒詞（"Hey Jarvis"）觸發錄音轉錄。
- **路由**：簡單指令（「關機」「現在幾點」）走 Regex → 本地腳本，不耗 AI 算力；複雜問題才丟 LLM。
- **說**：`Kokoro`（或 Edge-TTS／VITS）本機 TTS 回覆。

## 信心評估與內部矛盾

- **中**：框架清晰、工具都是真實存在的開源元件（faster-whisper／Kokoro／Streamlit／FastAPI），但為單一來源的**教學型論述**，無一手可重現示範，作者權威性未知。
- **「100% 本地」與架構打架（並列標註，不擅自取捨）**：
  - 系統大腦是 **Fable 5**（雲端模型），所以「思考」這層並非本地——「100% 本地」實際只對**語音 I/O**（STT/TTS）成立，不是端到端。
  - 第三步路由自己也說可用「輕量級 API」；第四步 HUD 要串 YouTube／Instagram API 更新 Metrics。這些都需連網。
  - 結論：準確說法是「**語音介面本地化**」，不是「整套系統本地化」。行銷語感 > 技術精確。
- **「換皮轉賣」偏理想化**：把自用腳本抽 CSS 變數到 `config.json` 就「瞬間轉成客戶品牌」——實務上客戶要的是功能與資料整合，換色換 Logo 只是最表層。這句話的產品化難度被大幅低估。

## 相關頁面

- [[src-voice-typing-mac-github-2026-06]] — **本篇第三步「聲音」的現成輕量替代**：按熱鍵說話→文字自動貼到任何 App、全本機。想「用語音減少打字」的人不必自建管線，這個直接裝就有。
- [[comparison-stt-models-whisper-paraformer-sensevoice]] — 若真的要自建 STT，選模型看這頁（Whisper 中文較弱，Paraformer／SenseVoice CER 更低）。
- [[Obsidian]] — 第二步的記憶載體，與本 wiki 的 [[LLM-Wiki]] 方法論同源。
- [[LLM-Wiki]] — 「純文字 Markdown 當 AI 長期記憶 + 雙向連結」這個第二步的做法，就是 Karpathy LLM Wiki 範式。
- [[HermesOS]] / [[Hermes-Agent]] — 同屬「個人／可轉賣 AI agent 系統」家族；HermesOS 是託管商品化路線，本篇是自建 DIY 路線。
- [[Agent-Skills]] — 第一步的 `SKILL.md`（Role/Inputs/Outputs/Tools）就是 Agent Skills 的手工版。

## 個人吸收（2026-07-16）

**使用者答案**
- Q1（重點）：用語音來控制跟回應，蠻有趣的（＝第三步 The Voice）
- Q2（場合）：想用在自己工作上——**因人因因素想降低打字量，語音操控可能能降低負擔**

**LLM 觀察（論點／場合錯位）**
- 場合是真實剛需（人因／當下的身體負擔），不是純收藏意圖——這點很好，值得認真對待。
- **但這是明確錯位，且方向對、手段嚴重超標**：使用者的需求是「今天就少打點字」，這篇的定位卻是「從零 DIY 一整套可轉賣的 AI OS」。語音在文章裡只是五個零件之一，而且是**自建管線**版本（faster-whisper + 意圖路由 + Kokoro + HUD）。用「打造產品」的力氣，去解一個「裝個 App 就好」的問題。
- **快路已經在你自己的 wiki 裡**：[[src-voice-typing-mac-github-2026-06]] 正是為「按熱鍵說話→貼到任何 App、全本機」做的；[[comparison-stt-models-whisper-paraformer-sensevoice]] 幫你選中文更準的模型。照這篇走等於繞遠路重造輪子。
- **taxonomy 候選（新類型）「手段過重錯位 / 自建 vs 現成」**：有別於過去的「尺度錯位」「階段窄化錯位」。這裡使用者被一個**重型自建方案**吸引（因為「語音控制蠻有趣」），但真實需求用**輕型現成工具**即滿足。照重方案走 → 掉進過度工程兔子洞，痛還沒解、先花幾週寫 code。愈是有真實痛點、愈容易被「酷炫自建」拐走，這個錯位危險性高。

**重組路徑建議**
- **立刻（解痛優先）**：先用現成的，零建置。
  - macOS 內建「語音控制 (Voice Control)」＝完全用語音操控電腦（點擊、捲動、開 App、聽寫），是無障礙功能，最貼近你說的「語音操控降低打字負擔」。
  - 只要語音打字：內建「聽寫 (Dictation)」或你 wiki 裡的 [[src-voice-typing-mac-github-2026-06]]，可貼進任何 App。
- **這篇對你唯一值得日後抽出的一塊**：第三步的「意圖路由器」概念（簡單指令走本機腳本、複雜問題才丟 LLM）。但那是「等你已經天天用語音、想進一步語音驅動工作流（開特定專案、跑特定指令）」的**第二階段**才需要，現在不是。
- **明確不要做**：第一／二／四／五步（技能架構、Obsidian 記憶庫、HUD 儀表板、換皮轉賣）都是「做一個 AI OS 產品」的路線，跟「減少打字」無關，別被整套框架綁架。

**Spaced retrieval 約定**：~2026-07-30（14 天後）。因使用者是「真實剛需 + 場合明確」，回測改**行動確認**：「你有沒有真的開始用語音輸入（macOS 語音控制／聽寫，或 voice-typing-mac）？打字的負擔有降下來嗎？如果還在糾結要不要照那篇自己建系統——回想這裡的結論：先用現成的，解痛第一。」
