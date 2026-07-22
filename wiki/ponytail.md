---
title: ponytail
type: entity
sources: ["claude-code-五個外掛完整安裝與實戰指南.md"]
created: 2026-07-22
updated: 2026-07-22
tags: [agent-skills, claude-code, plugins, yagni, 技術債, 工具]
confidence: 中
---

# ponytail

讓 coding agent 少寫程式碼的 [[Plugins-Claude-Code|Claude Code plugin]]，
透過 marketplace 安裝。授權 MIT。

官方： github.com/DietrichGebert/ponytail

## 人格設定

> 你知道那種人。長馬尾、橢圓框眼鏡、在公司待得比版控還久。你給他看五十行程式碼，
> 他看一眼，不說話，換成一行。

Claude 的毛病跟懶惰相反——**它蓋太多**。你要一個日期選擇器，它裝了 flatpickr、
寫了 wrapper 元件、加了樣式表，順便開一個時區的討論。能跑，但一百行做了一行的事。

## 懶惰階梯（Laziness Ladder）

寫任何程式碼之前，agent 從上往下走，**停在第一個成立的階**：

1. 這東西需要存在嗎？ → 不需要：跳過（YAGNI）
2. codebase 裡已經有了？ → 重用，別重寫
3. 標準函式庫做得到？ → 用標準函式庫
4. 原生平台功能做得到？ → 用原生（`<input type="date">`）
5. 已安裝的相依套件做得到？ → 用它，**絕不為幾行程式碼新增相依**
6. 一行寫得完？ → 一行
7. 都不行 → 才寫「剛好能動的最小量」

SKILL.md 明確定義：**階梯是反射，不是研究計畫。第一個能動的懶方案就是對的方案。**

## 安裝與模式

```bash
/plugin marketplace add DietrichGebert/ponytail
/plugin install ponytail@ponytail
```

需要 **node 在 PATH 上**（跑兩個 Node lifecycle hook）。Nix／nvm 使用者要確認
非互動 shell 的 PATH——node 找不到時 skill 還是會動，只是「每回合自動啟用」會**安靜失效**。

| 模式 | 行為 |
|---|---|
| lite | 照你要的做，但一句話點出更懶的替代方案，你自己決定 |
| full（預設） | 執行階梯。最短的 diff，最短的解釋 |
| ultra | YAGNI 極端派。丟出一行版本，同時質疑需求本身 |

```bash
/ponytail lite
/ponytail off
/ponytail-review   # 對一個 diff review，列出該刪的行
/ponytail-audit    # 掃整包，給「該刪／簡化／換標準庫」排序清單
/ponytail-debt     # 收集所有 ponytail: 註解，做成技術債帳本
```

## 技術債可見化

每走一個捷徑，ponytail 會留一個 `ponytail:` 註解，寫明**天花板與升級路徑**。
「以後再說」不會變成「永遠不說」，因為債是可見、可收割的（`/ponytail-debt`）。

這個設計比階梯本身更值得抄——**捷徑不是問題，捷徑沒有紀錄才是問題**。
對應 [[Ratchet-Pattern]]：把隱性決策編碼成可追蹤的東西。

## 已知的錯誤資訊

網路瘋傳「少寫 94% 程式碼」「省 42–75% 成本、快 3–6 倍」——**作者自己修正過**。

原始 benchmark 是單次 completion 比對，裸模型 baseline 會塞一堆散文，
落差有一部分是「**對話式 baseline 的假象**」。作者主張改用成本論述：

> agent 沒寫的每一行，就是沒人要 review、要測、要背風險的程式碼。

這是本 wiki 收錄的又一個「**工具作者主動修正自己被瘋傳的數字**」案例，
對照 [[src-x-taiyo-kimura-html2pptx-2026-06]] 的賣方自評（相反方向）。

## 什麼時候不要用

- **有正當抽象需求的專案**：circuit breaker、retry、backoff 不會因為「一行」而變好
- **簡潔型推理模型可能反效果**：階梯是審慎步驟，會先花 thinking token
- **要 Claude 建大型架構時**：這時需要它蓋，不是需要它懶

作者建議第 2 週導入，**先跑 lite 一週**觀察它點出的替代方案有多少是對的，再切 full。

## 與本知識庫的關聯

- [[Plugins-Claude-Code]] — 五個工具中唯一走 marketplace 安裝的真 plugin
- [[Ratchet-Pattern]] — `ponytail:` 註解 + debt 帳本＝把捷徑編碼成可追蹤紀錄
- [[Vibe-Coding]] / [[src-gask-ai-agent-vs-vibe-coding]] — 過度建構是 vibe coding 的典型症狀
- [[決策疲勞]] — 階梯把「要不要裝套件」從每次判斷變成預先規則（＝降決策手法）
- [[Subagent-Driven-Development]] — 同為 agent 行為約束層
- [[src-jason-claude-code-5-plugins-2026-07]] — 目前最完整的說明來源

## 與使用者既有原則的關係

使用者 `~/.claude/dev-principles.md` 與 CLAUDE.md 已有相近規則
（「只改被要求的範圍、不要順手重構」、page builder 導入判準「它省下什麼我原本一定要做的工」）。
**懶惰階梯是同一精神的自動化版**——差別在使用者的規則靠自己記得提醒 AI，
ponytail 把它變成每回合自動執行。是否值得再加一層工具，取決於現有規則實際上多常失守。
