---
title: Will AI Kill SaaS（5）— Adobe/Figma 之死？Design to Code vs. Code to Design
type: source
sources: ["(5) Will AI Kill SaaS系列：... - Yu-Chih Edward Hwang.md"]
created: 2026-04-28
updated: 2026-04-28
tags: [vibe-coding, agentic-workflow, design-to-code, figma, adobe, claude-design]
confidence: 中
---

# Will AI Kill SaaS（5）— Adobe/Figma 之死？Design to Code vs. Code to Design

**作者**：[[Yu-Chih-Edward-Hwang|Yu-Chih Edward Hwang]]（Facebook 個人發文）
**日期**：2026-04-24
**原始連結**：https://www.facebook.com/fatality1117/posts/pfbid0ZSgVjwAvZbKBXAQ1GVTW5dUrov5X5UybqiUXec1eRdjSiuCbVMJBLG4tMMAucM6pl
**系列**：「Will AI Kill SaaS」第 5 篇
**配圖**：![[../raw/assets/figma-mcp-architecture-2026-04-24.png]]

## 核心主張

- 軟體開發路徑經歷四階段演化：傳統接力 → Vibe Coding → Contextual Coding → Agentic AI Workflow
- Agentic AI Workflow 的關鍵能力是「雙向流動」——[[Agentic-AI-Workflow#Design to Code（正推 / 由形入理）|Design to Code]]（由形入理）與 [[Agentic-AI-Workflow#Code to Design（逆推 / 由理生形）|Code to Design]]（由理生形）形成互相補充的 AI 訓練資料閉環
- 軟體開發 80% 是「翻譯」工作（想法 → 規格 → 程式碼），AI 將其邊際成本壓到趨近於零
- 人類核心價值收斂為三點：定義問題、設定邊界與架構約束、驗收結果
- [[Figma]] / [[Adobe]] 的護城河從「視覺化能力」轉為「美學共識錨點 + 像素級控制」
- [[Claude-Design]] 與 Claude Code 試圖消滅「靜態 handoff」與「過度詳細規格書」兩個傳統中間產物
- 教育綁定（Adobe / Figma 之於設計系，如 Excel 之於會計系）過去是護城河，但 AI 工具是 Bottom Up 推動，不需等教育循環

## 詳細摘要

### 一、四種開發路徑的演化

#### 1. 傳統路徑（The Relay Race）
- 模式：瀑布或敏捷的線性傳遞
- 特徵：高度依賴「中間產物」（PRD、Mockup、Code）作為溝通媒介
- 流程：老闆 Vision → PM PRD / User Story → Designer Mockup → Engineer Code → QA 驗收
- 痛點：降維傳達溝通成本極高；最快一個週期兩週，慢則數月

#### 2. [[Vibe-Coding|Vibe Coding（直覺式開發）]]
- 模式：Vision → AI → Code
- 特徵：繞過所有中間人，自然語言直接生成程式碼
- 缺陷：原型階段美好，但「沒有架構的 Vibe Coding 會迅速演變成技術債災難」

#### 3. Contextual Coding（脈絡化開發，Cursor / Copilot 類）
- 模式：(Vision + Context) → AI Assistant + Engineer → Code
- 特徵：AI 理解 codebase 全局脈絡；工程師仍是主導者，AI 是「強大的外骨骼」
- 差距：傳統「設計」與「規格」階段仍保留，AI 主要優化 Engineer 端生產力

#### 4. [[Agentic-AI-Workflow|Agentic AI Workflow（代理式工作流）]]
- 模式：從「線性接力」變成「同心圓迭代」（Concentric Iteration）
- 兩條並行路徑：
  - **Design to Code（正推 / 由形入理）**：Vision → AI Agent 同時生成規格、UI 元件、底層邏輯；人類扮演 Reviewer 與指揮家
  - **Code to Design（逆推 / 由理生形）**：以商業邏輯與資料結構驅動介面生成；資料模型變更時 AI 反向更新 UI 與設計文件
- 例：在 DB「會員資料」新增「VIP 忠誠度積分」欄位 → 傳統路徑要 PM 開票、Designer 重畫 Figma、前端切版；Agentic 路徑可由 AI Agent 自動推演
- 關鍵副作用：兩條路徑互相提供 AI 訓練資料（舊設計圖 + 程式碼餵 AI，AI 產出更貼合脈絡的程式碼，再回饋更新設計文件）

### 二、核心價值的抽離

> 「將『溝通與實作』的邊際成本無限趨近於零（or Token 費），讓『意圖（Intent）、品味（Taste）與架構（Architecture）』成為唯一有價值的東西。」

- 過去 80% 時間花在「翻譯」（想法 → 機器懂的語言 / 開發者懂的規格）
- AI 接管 80% 髒活後，人類核心價值收斂為三點：
  1. 定義問題（What to solve?）
  2. 設定邊界與架構約束（How to scale and secure?）
  3. 驗收結果（Is this what Customers want?）

### 三、Figma / Adobe 的護城河

**轉變前**：「將想像力具象化成視覺像素」的能力。

**AI 時代的核心價值**：
1. **美學共識與品牌靈魂的錨點（Source of Truth）**——AI 能生成幾百個介面，但要符合特定品牌的 Design System（字體、間距、情緒、微互動），需要高精確度控制中心
2. **精細的像素級控制（Pixel-perfect Control）**——AI 難以做到「把這個陰影往左下角移動 2px，並帶有冷色調的模糊」

**股價現況（作者觀察）**：
- Figma：上市 120 → 不到 20（不到一年）
- Adobe：去年 400 → 250 有找
- 兩者都積極推 AI 工具與整合，問題不在「不擁抱 AI」

### 四、Claude Code / Claude Design 的取代目標

野心明確：消滅傳統的「Handoff（交接）」與靜態中間產物。

- **取代靜態設計稿**：給概念 → 直接給「活的、可點擊的 React 元件」（[[Claude-Design]] 把 UI 設計與前端開發融合）
- **取代過度詳細的規格書**：Claude Code 具備 Agent 能力，可讀 codebase、理解終端目標；取代「PM 把大目標拆成無數小工單給工程師」

### 五、教育綁定的反思

- 過去 SaaS 在企業中是 Top Down 推動（如微軟 DOS / Word + 印表機取代打字機，Excel 綁定會計系，Adobe / Figma 綁定設計系）
- AI 工具反而是 Bottom Up（員工要偷懶）——不需等教育循環
- 預測：未來年輕人也許會問「什麼是 Excel？什麼又是 Photoshop？」
- 投資結論：作者**不會買 Figma 股票**

## 關鍵引用

> 「將『溝通與實作』的邊際成本無限趨近於零（or Token 費），讓『意圖（Intent）、品味（Taste）與架構（Architecture）』成為唯一有價值的東西。」

> 「沒有架構的 Vibe Coding 會迅速演變成一場災難（技術債）。」

> 「AI 很難做到『把這個陰影往左下角移動 2px，並帶有一點點冷色調的模糊』。當你需要極端精緻的客製化時，人類依然需要這類專業工具。」

> 「但也許未來的學生的確會問：『蛤？什麼是 Excel？什麼又是 Photoshop？』」

## 與 Wiki 的關聯

- 提出 [[Vibe-Coding]]、[[Agentic-AI-Workflow]] 兩個核心概念
- 介紹 [[Figma]]、[[Adobe]]、[[Claude-Design]] 三個關鍵實體
- 與 [[DESIGN-md]] 的相互呼應：DESIGN.md 是 Vibe Coding 在「品味與架構約束」面向的具體實踐——把品牌設計約束寫成 AI 可讀文件
- 與 [[Harness-Engineering]] 的對照：Harness Engineering 強調「約束 + 上下文 + 熵管理」，與本文「意圖、品味、架構」三角度可互補
- 與 [[Managed-Agents]] 的對照：本文 Agentic AI Workflow 在概念層次描述同心圓迭代，[[Managed-Agents]] 是 Anthropic 的具體技術實作
- 與 [[Agent-Skills]] 的關聯：Agent Skills 是讓 AI Agent 在 Vibe Coding / Agentic Workflow 流程中具備領域能力的擴充機制

**待辦（iCloud 解凍後再回頭補）**：
- 補 [[DESIGN-md]] 的「Figma MCP / Code to Design」橋接段落
- 補 [[Harness-Engineering]] 與 Agentic AI Workflow 的對照
- 補 [[Agent-Skills]] 的 Vibe Coding / Claude Design 交叉引用
