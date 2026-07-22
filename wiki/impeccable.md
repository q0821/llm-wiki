---
title: impeccable
type: entity
sources: ["claude-code-五個外掛完整安裝與實戰指南.md"]
created: 2026-07-22
updated: 2026-07-22
tags: [agent-skills, claude-code, ui-design, ai-slop, ci, 工具]
confidence: 中
---

# impeccable

抓出前端「AI 痕跡」的工具。形態是 **skill + CLI + hook**。
作者 Paul Bakaus（jQuery UI 作者、前 Google Developer Advocate）。

官方： github.com/pbakaus/impeccable ｜ impeccable.style

## 它解決的問題

> 「Claude 寫得出能跑的介面，但寫不出有意圖的介面。」

放著不管，AI 會往最安全的視覺平均值靠攏，產生一組可辨識的特徵：

- Inter 字體用到底
- 紫到藍的漸層 hero
- 卡片包卡片
- 彩色底放灰字
- 每個標題上面一個圓角 icon tile
- 彈跳動畫、所有東西置中

**這不是醜的問題，是識別度的問題**——使用者看得出來，只是講不出名字。
impeccable 的策略是給 AI 一套設計詞彙，讓它知道「**什麼不該做**」，
作者主張這比教它「該做什麼」有效得多。

## 安裝與使用

```bash
npx impeccable install     # 在專案根目錄，會偵測你的 AI 工具裝對應版本
/impeccable init           # 在 Claude Code 裡跑，產出 PRODUCT.md 與 DESIGN.md
```

`init` 會掃描 repo、合併 Tailwind theme、盤點元件。**跳過這步效果減半**——
後面所有指令都靠這兩份檔案。

主要指令（共 23 個）：

| 指令 | 做什麼 |
|---|---|
| `/impeccable audit` | 掃描 + 評分報告 |
| `/impeccable critique` | UX 檢視：層級、清晰度、情緒 |
| `/impeccable polish` | 上線前最後一遍（對齊、間距、細節） |
| `/impeccable distill` | 砍掉沒有存在價值的複雜度 |
| `/impeccable typeset` | 修字體、層級、尺寸 |
| `/impeccable arrange` | 修版面、間距、視覺節奏 |
| `/impeccable bolder` | 把太安全太無聊的設計放大 |
| `/impeccable quieter` | 把太吵的設計壓下來 |
| `/impeccable animate` | 加有目的的動態（不是裝飾性抖動） |
| `/impeccable harden` | 錯誤處理、i18n、邊界情況 |

### detect CLI：可接進 CI

```bash
npx impeccable detect src/        # 加 --json 給機器讀
```

**46 條確定性偵測規則**，純規則比對不呼叫模型。抓 AI slop 特徵（漸層文字、側邊條、
紫色系）、排版問題、WCAG 對比違規、版面反模式、動態問題。
乾淨回傳 `0`、抓到問題回傳 `2`，可直接接進 PR check 在 merge 前擋掉 AI slop。

## 已知的錯誤資訊

網路上很多文章寫「impeccable 偵測 **24** 個設計破綻」——那是舊版數字，
現在是 **46 條規則**。引用前先自己跑一次。

## 什麼時候不要用

- **它不生 UI**（不是 v0、不是 Stitch），只讓既有專案的 agent 輸出更好
- 規則有立場，做實驗性高創意的東西會綁手綁腳
- Live Mode 還在 beta
- detect CLI 需要 **Node 24+**
- 設計 pass 跑完**還是要跑 axe** 做無障礙測試

作者建議的導入時機是「第 3 週，且只有做前端才裝」（純後端專案裝了沒用）。

## 與本知識庫的關聯

- 使用者**本機已有** `impeccable` skill（見系統 skill 清單）
- [[DESIGN-md]] — impeccable 的 `init` 產出就是 DESIGN.md，與該 concept 同源
- [[src-apple-design-skill-emilkowalski-2026-07]] — **互補關係**：
  apple-design 是「注入正確做法」（給參數），impeccable 是「偵測既有問題」（46 條規則）。
  注入 vs 偵測是兩種策略，理想上並用
- [[src-humanizer-zh-tw-threads-2026-07]] — 文字版的「去 AI 味」，本頁是視覺版
- [[Claude-Design]] / [[src-aapd-claude-design-figma-workflow]] — AI 產 UI 的上游
- [[Adversarial-Code-Review]] — detect 接 PR check 是「機器擋門」的同類手法
- [[src-jason-claude-code-5-plugins-2026-07]] — 目前最完整的說明來源

## 對接案工作的可能用途（待驗證）

- 交付客戶前跑 `detect` 當自查關卡，對應使用者既有的「完工後自查 checklist」習慣
- 但注意：46 條規則有作者的設計立場，**複刻既有設計稿的案子可能誤報**
  （客戶原稿本來就長那樣）。這類案子適合用 `audit` 看報告、不適合接 CI 硬擋
