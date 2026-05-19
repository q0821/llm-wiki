---
title: Asgard Skills 263 個 agent skills 開源推廣（@honglong0420 X 推文）
type: source
sources: ["honglong0420-asgard-x-thread.md", "原來是擅長等紅燈的朋友 (@honglong0420)\n272 個喜歡 · 1 則回覆.md"]
created: 2026-05-19
updated: 2026-05-19
tags: [agent-skills, asgard, methodology, taiwan-smb, dialectics, lean-startup, narrative]
confidence: 強
---

# Asgard Skills 263 個 agent skills 開源推廣（@honglong0420 X 推文）

**作者**：@honglong0420（暱稱「原來是擅長等紅燈的朋友」）
**發文平台**：X
**原始連結**：https://x.com/honglong0420/status/2054936486194422271?s=12
**發文日期**：2026-05（投遞時 272 likes / 1 reply）
**擷取方式**：使用者手動提供內文（X.com unauthenticated 擷取被 402 擋）
**性質**：[[Asgard-AI-Platform]] 內部人員親述視角，**補強** 2026-04 [[src-asgard-skills|GitHub repo 客觀整理]]

## 核心主張

- **「缺的不是 AI 知不知道，而是人不會記得主動把它叫出來」** —— Skill 化的根本價值論點
- 把方法論寫成 [[Agent-Skills|skill]] = **變成可工程化的東西**：可 reuse、可 rerun、可版本控制
- 整包 263 份、22 個分類、**MIT 開源**；涵蓋電商 / 行銷 / 財會 / 客服 / 人資 / 製造 / 法務 + 台灣專屬（勞健保 / 營業稅）
- **作者推薦四件套思維模型 skill**：辯證法 → 九宮格 → 精實創業 → 敘事，串成「決策路線完整路徑」

## 詳細摘要

### 一、為什麼 skill 化有價值（核心論點）

> 「辯證法、商業模式九宮格、精實創業、敘事這些方法論，前沿的 LLM 幾乎都內建了。**缺的不是 AI 知不知道，而是人不會記得主動把它叫出來。**會議開到一半、定價拍腦袋的當下，沒人會停下來說『等等，我們來論述一下正論反論合論』。」

這句話精準回答了 [[Agent-Skills]] 範式為什麼比 prompt 有效的根本問題——**LLM 知識不缺，啟動成本才是瓶頸**。Skill 化把「啟動」降到「按一個鍵」。

對應的工程化效益：

| 性質 | 普通 prompt | Skill 化 |
|---|---|---|
| 重複性 | 每次重寫 | 同 skill 每次叫出來跑一樣的步驟 |
| 輸出一致性 | 隨機飄移 | 輸出一樣的格式 |
| 可重用 | 個人收藏 | 跨 session / 跨人重用 |
| 版本控制 | 無 | Git 可追蹤 |
| 啟動成本 | 描述需求 + prompt 撰寫 | 按一個鍵 |

### 二、作者推薦四件套思維模型（決策完整路徑）

四支 skill 串連起來覆蓋「**從爭議路線 → 商業模型 → 驗證 → 說服**」的完整決策路徑：

#### ① `hum-dialectics`（辯證法）

- **使用情境**：團隊吵路線、老闆在兩個方向間搖擺時
- **操作**：叫 AI 跑一輪正反合
- **Iron Law**：**Synthesis ≠ Compromise**——各退一步不算解答，**重新 frame 問題才算**

#### ② `ops-business-model-canvas`（商業模式九宮格）

- **使用情境**：方向定了，要驗證商業可行性
- **操作**：逼 AI 把九格全填滿，檢查價值主張、客群、營收、成本之間的故事能不能兜起來
- **Iron Law**：**漏一格就是許願**

#### ③ `ux-lean-startup`（精實創業）

- **使用情境**：模式不能紙上談兵
- **操作**：列出風險最高的假設，做最小可行測試
- **Iron Law**：決定 pivot 還是 persevere，**直接逼你看數據**

#### ④ `hum-narrative`（敘事方法論）

- **使用情境**：前三步跑完後，還要在論述敘事上說服董事、員工、客戶、投資人
- **Iron Law**：**Every Story Needs Tension**——沒衝突的不是故事，是報告

### 三、四件套的真正價值

> 「這四支串起來，重點不是 AI 多懂方法論，而是**這套方法論終於可以按一個鍵就跑一遍**，不會因為你那天太忙或太自信偷懶略過。」

→ 把「對抗你的偷懶 / 過度自信」這件事**工程化**。對應 [[Ratchet-Pattern]]「規則只應防止實際遇過的失敗」——這次是針對「人類自己會偷懶的失敗模式」。

### 四、領域涵蓋範圍

| 類別 | 範圍 |
|---|---|
| 通用商業 | 電商、行銷、財會、客服、人資、製造、法務 |
| **台灣專屬** | **勞健保、營業稅**等台灣才需要處理的業務 |
| 思維模型 | `hum-`、`ops-` 等前綴下的方法論 skill |

> 既有 [[src-asgard-skills]] 整理為 22 個分類（推文中為 22，前次 wiki 記錄 21——可能後續新增）；本來源確認**台灣中小企業日常工作場景**是 Asgard Skills 的主打定位。

## 關鍵引用

> 「缺的不是 AI 知不知道，而是人不會記得主動把它叫出來。」

> 「把方法論寫成 skill，差別就在這裡：變成可以工程化的東西。」

> 「Synthesis ≠ Compromise，各退一步不算解答，重新 frame 問題才算。」（hum-dialectics）

> 「漏一格就是許願。」（ops-business-model-canvas）

> 「Every Story Needs Tension。沒衝突的不是故事，是報告。」（hum-narrative）

> 「重點不是 AI 多懂方法論，而是這套方法論終於可以按一個鍵就跑一遍，不會因為你那天太忙或太自信偷懶略過。」

## 信心評估

- **強**：四件套 skill 名稱、Iron Law、使用情境——作者親述
- **強**：「Skill 化的價值論點」（啟動成本是瓶頸）——清晰、可驗證的論述
- **中**：22 個分類（與 [[src-asgard-skills]] 記錄的 21 個略有出入）——可能 repo 持續新增；不嚴重的不一致
- **中**：「全部 MIT 開源」「263 份」與既有 wiki 記錄一致

### 2026-05-19 審計校正

[[src-asgard-skills-audit-2026-05-19|本地審計]]於 2026-05-19 git clone repo 實測：

| 推文當下（2026-05）| 審計（2026-05-19） | 解釋 |
|---|---|---|
| 263 份 skill | **301 個 SKILL.md** | Repo 持續成長 |
| 22 個分類 | **25 個前綴**（含 tools / eval / docs 工具目錄）| 同上 |
| 「主打台灣中小企業電商」 | **`tw-ecom-*` 38 個中 26 個是 `status: skeleton`** | 推文是願景，現況尚未完工 |
| Iron Law 設計慣例 | **301/301（100%）** ✅ | 含全大寫 `IRON LAW:` / 中文「鐵律」「核心法則」各種寫法 |
| MIT License | ✅ Copyright Asgard Inc. **肆佳科技股份有限公司** | 確認台灣公司 |

推文中提到的「四件套思維模型」(`hum-dialectics` / `ops-business-model-canvas` / `ux-lean-startup` / `hum-narrative`) **全部已完成且品質佳**（不在 skeleton 清單中）——作者推薦的具體 skill 是可立即使用的。

## 與 Wiki 的關聯

### 補強既有來源

- **[[src-asgard-skills]]**（2026-04，GitHub repo 客觀整理）↔ **本來源**（2026-05，作者親述視角）：兩個來源同一主題不同切角
- **[[Asgard-AI-Platform]]**：補作者 @honglong0420（內部人員）與平台定位（「台灣中小企業日常工作場景」）

### 影響的概念頁

- [[Agent-Skills]]：補「為什麼 skill 化有價值」核心論點（**啟動成本才是瓶頸，不是 LLM 知識**）
- [[Ratchet-Pattern]]：「對抗自己偷懶 / 過度自信」是 Ratchet 的另一個切角——前者防失敗、本來源防遺漏
- [[Prompt-Pack-Pattern]]：跟 Skill 對照組中的「人類控制節奏」一節再補一個動機（Skill 把啟動降到一鍵）

### 四件套對應的方法論概念（未獨立成頁，留待累積）

| Skill | 對應的經典方法論 | 是否值得未來獨立成 wiki 概念頁？ |
|---|---|---|
| hum-dialectics | 黑格爾辯證法 / 正反合 | 弱證據（單來源單句） |
| ops-business-model-canvas | Alex Osterwalder 商業模式九宮格 | 弱證據（單來源單句）|
| ux-lean-startup | Eric Ries 精實創業 | 弱證據（單來源單句）|
| hum-narrative | Robert McKee / Joseph Campbell 敘事學 | 弱證據（單來源單句）|

→ 暫不獨立。未來若有獨立來源討論（如書摘 / 教學文）再萃取。

## 未來可延伸

- 補抓 Asgard Skills GitHub repo 的台灣專屬 skill 清單（如 `tw-勞健保` `tw-營業稅`）
- 試跑四件套 skill 並記錄輸出 → 形成 case study
- 探討「按一鍵啟動方法論」這個論點是否能擴展到其他工程實踐（如 [[Subagent-Driven-Development]] 中的 spec reviewer 也是「按一鍵啟動 review」的同類）
