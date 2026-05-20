---
title: Claude Design
type: entity
sources: ["(5) Will AI Kill SaaS系列：... - Yu-Chih Edward Hwang.md", "【直播筆記】用 Claude Design × Claude Code × Figma 重新定義設計工作流程 - AAPD 產品設計學院.md"]
created: 2026-04-28
updated: 2026-05-14
tags: [anthropic, ai-product, design-tool]
confidence: 強
---

# Claude Design

Anthropic 於 2026 年推出的 AI 原生設計產品，被視為對 [[Figma]] 的直接威脅。截至 2026-05-05 仍在 **Research Preview** 階段，只能在瀏覽器版用。

## 基本資訊

- **發布方**：Anthropic
- **發布時間**：約 2026 年 4 月（依 [[src-will-ai-kill-saas-design]] 撰文時間推算為「前幾天」）
- **核心定位**：把 UI 設計與前端開發融合，直接產出「活的、可點擊的 React 元件」
- **可用範圍**（2026-05-05 [[Simon-Lin|Simon]] 直播揭露）：瀏覽器版，桌面 App 尚未開放
- **產品兄弟**：Claude Code（編程 Agent）、[[Claude-Cowork|Claude Cowork]]（運營層 surface）、[[Managed-Agents|Claude Managed Agents]]（託管 agent 服務）
- **Claude 4 個產品 surfaces 對照**（[[src-anthropic-founders-playbook-2026|Founder's Playbook]] 列 3 個 + 本頁 Design 為第 4）：Chat / Cowork / Code + Design（Research Preview）

## 介面結構（依 [[src-aapd-claude-design-figma-workflow|Simon Demo]]）

介面分四個 tab：
- **Prototype**
- **Slide deck**
- **Template**
- 其他

**Design System 匯入來源**：GitHub repo、Figma 檔案、本地端程式碼、品牌資產。

**互動模式特點**：收到需求不會直接開工，**先丟結構化小問卷**釐清（品牌名稱、品牌調性、主色偏向、首頁區塊、商品互動、視覺創新程度等）。

> [[Simon-Lin|Simon]]：「Claude Design 等於是把『寫 Prompt』這件事介面化了，把抽象的需求拆解成選擇題，讓非技術背景的人也能產出結構化的指令。」

## Hand off to Claude Code

從產出第一版頁面後，點右上角 share → **「Hand off to Claude Code」** → 系統自動產生 prompt：「請看一下這份設計檔案、讀取 README，把它重建出來」。

可在以下環境執行：
- Claude Desktop App 直接貼上
- Cursor / VS Code / Google Antigravity 任何 IDE 的 terminal 呼叫 [[Claude Code]]

> [[Simon-Lin|Simon]]：「這個其實就是 Claude 生態系真正的價值所在，Claude Design 跟 Claude Code 之間有原生的銜接通道。」

## 在各來源中的角色

- [[src-will-ai-kill-saas-design]]：被點名為 Figma 殺手。作者描述其野心是「消滅傳統的 Handoff（交接）過程與靜態的中間產物」。
- [[src-aapd-claude-design-figma-workflow]]：[[Simon-Lin|Simon]] 第一手 Demo 揭露介面結構、Hand off 機制、與**四個現階段限制**。Simon 的定位結論：「適合 0 到 1 的前期探索與快速 Demo 概念，產品化要轉 [[Claude Code]]」。

## 現階段限制（2026-05-05 [[Simon-Lin|Simon]] Demo 觀察）

| 限制 | 影響 |
|---|---|
| 速度比預期慢，Token 消耗快 | Pro 版可能一兩趟就燒完 |
| 產出大量 hard-coded | 沒有 component 化、沒有變數系統，難擴展 |
| 無法直接輸出到 [[Figma]] | 要先到 [[Claude Code]] 才能透過 [[Figma]] [[MCP]] 串接 |
| 沒有版本控制 | 方向有錯要回上一版不太方便 |

## 試圖取代什麼

| 取代對象 | Claude Design / Code 的做法 |
|---------|----------------------------|
| **靜態設計稿** | 給概念 → 直接給活的、可點擊的 React 元件 |
| **過度詳細規格書** | Claude Code 具備 Agent 能力，可讀 codebase、理解終端目標；取代「PM 把大目標拆成無數小工單給工程師」 |

## 相關實體

- [[Figma]]：被視為直接競爭對手，但 [[Simon-Lin|Simon]] 的實作觀察是「雙向迭代」而非「取代」
- [[Adobe]]：間接受影響的設計工具廠
- [[Managed-Agents]]：Anthropic 同期推出的託管 agent 服務，共享 Agentic 技術架構
- [[NotebookLM]]：Google 對應產品線（不同方向）
- [[Simon-Lin]]：實作觀察者，提供第一手 Demo 限制清單

## 試圖取代什麼

| 取代對象 | Claude Design / Code 的做法 |
|---------|----------------------------|
| **靜態設計稿** | 給概念 → 直接給活的、可點擊的 React 元件 |
| **過度詳細規格書** | Claude Code 具備 Agent 能力，可讀 codebase、理解終端目標；取代「PM 把大目標拆成無數小工單給工程師」 |

## 相關實體

- [[Figma]]：被視為直接競爭對手
- [[Adobe]]：間接受影響的設計工具廠
- [[Managed-Agents]]：Anthropic 同期推出的託管 agent 服務，共享 Agentic 技術架構
- [[NotebookLM]]：Google 對應產品線（不同方向）

## 相關概念

- [[Agentic-AI-Workflow]]：Claude Design 是該範式的具體產品實踐
- [[Vibe-Coding]]：Claude Design 把 Vibe Coding 推向「設計也 vibe」的層次
- [[DESIGN-md]]：與 Claude Design 互補——DESIGN.md 提供品牌約束，Claude Design 負責即時生成
- [[Meta-Harness]]：Claude Design 可視為「對 UI 介面有意見、對實作無意見」的 meta-harness 應用
- [[Agent-Skills]]：Claude Design 的能力可包成 skill 由其他 agent 呼叫
- [[CLAUDE-md]]：[[Simon-Lin|Simon]] 強調 Hand off 前要先建好 CLAUDE.md 才能避免「跑版」
