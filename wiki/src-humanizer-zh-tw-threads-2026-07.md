---
title: Humanizer-zh-TW 繁中去 AI 味 skill（凱文大叔 Threads）
type: source
sources: ["Threads 上的凱文大叔（@cai.chengkai）.md"]
created: 2026-07-22
updated: 2026-07-22
tags: [agent-skills, 繁中, 寫作, ai-slop, github, 備忘型]
confidence: 弱
---

# Humanizer-zh-TW 繁中去 AI 味 skill

來源：Threads @cai.chengkai（凱文大叔），2026-07。
專案： `kevintsai1202/Humanizer-zh-TW`

一則短貼文，內容是作者對自己專案星數的觀察：

> 我把去 AI 味的技能改寫成繁中版本竟然也有五百顆星
> 不過簡中版本（也是從英文版改寫）已經有 13.3K 星星
> 台灣真的很多人不會用 github.........

## 兩件事

### 1. 工具本身：Humanizer 的繁中改寫版

Humanizer 是一個移除文字中 AI 生成痕跡的 skill（原版為英文），這是繁體中文改寫版。
用途對照 [[impeccable]]：impeccable 抓的是**視覺**上的 AI 痕跡（漸層 hero、Inter 到底、
卡片包卡片），Humanizer 抓的是**文字**上的 AI 痕跡。兩者是同一個問題的兩個模態。

**與本人的相關性**：使用者已有 `~/.claude/writing-voice.md` 處理個人掛名內容的語感偏好，
以及 CLAUDE.md 中的台灣用語規則（伺服器非服務器、程式碼非代碼等）。Humanizer-zh-TW
是同一需求的**社群現成方案**，可對照自己那套規則是否有漏。

**採用前必查**：貼文未說明它去的是「哪種」AI 味——是句式（過度排比、萬能開場白）、
用詞（賦能、抓手）、還是結構（三點式總結）？繁中改寫版是否處理了**台灣 vs 中國用語**
這個對本人最關鍵的維度，貼文沒講。這是採用與否的決定性問題。

### 2. 作者的觀察：繁中 500 星 vs 簡中 13.3K 星

作者歸因為「台灣真的很多人不會用 github」。

**這個歸因未經驗證，且至少有三個競爭解釋**：

- **母體規模差異**：簡中使用者基數遠大於繁中，26 倍差距未必需要「不會用」來解釋
- **發布時間差**：貼文未說兩版本各發布多久，星數是累積量
- **推廣管道差異**：簡中圈有成熟的 GitHub 專案傳播生態（各類日報、聚合站）

原文是社群感嘆而非分析，本頁**並列標註**這些替代解釋，不採信單一歸因。

## 信心評估

- **弱**：單則社群貼文；星數為作者自述未獨立查證；「台灣人不會用 GitHub」為未經
  驗證的個人歸因；工具實際效果無任何第三方評測
- 定位為**工具備忘**：知道有這個東西存在，需要時再去看 repo，不作為採用依據

## 與本知識庫的關聯

- [[Agent-Skills]] — 又一個繁中在地化 skill 的實例
- [[impeccable]] — 視覺版的「去 AI 味」，本篇是文字版
- [[src-jason-claude-code-5-plugins-2026-07]] — 該文論點「AI 會往最安全的平均值靠攏」，
  是 Humanizer 這類工具存在的共同前提
- [[src-community-claude-skills-list]] / [[src-recommended-claude-code-skills]] — 同為 skill 發現管道
- [[src-asgard-skills]] — 另一組繁中 skill 集合（同樣有在地化議題）

## 未來追蹤候選

- 若實際試用 → 查證它是否處理台灣 vs 中國用語，並補一手評測
- 凱文大叔（@cai.chengkai）若再出現 → 建 entity
