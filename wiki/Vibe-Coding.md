---
title: Vibe Coding
type: concept
sources: ["(5) Will AI Kill SaaS系列：... - Yu-Chih Edward Hwang.md", "課後 Prompt & 資源懶人包：Codex × HyperFrames 30 秒 Demo 3615edfc91bd80d19acee2ae9f0c5547.md"]
created: 2026-04-28
updated: 2026-05-15
tags: [ai-coding, development-paradigm, video]
confidence: 中
---

# Vibe Coding

## 定義

Vibe Coding（直覺式開發）是一種以**自然語言直接驅動 LLM 生成程式碼**的開發模式，繞過 PM 規格書、設計稿、工程師編碼等所有「中間產物」。核心精神是「有靈感（Vibe），就直接讓 AI 把它變成程式碼」。

## 不同觀點

- [[src-will-ai-kill-saas-design]]（Yu-Chih Edward Hwang）：Vibe Coding 是 AI 開發路徑演化的第二階段（傳統接力之後），「爽快但缺乏工程嚴謹性與可維護性」。原型階段美好，專案變大則「迅速演變成技術債災難」。
- [[src-design-md-revolution]]（DESIGN.md 革命）：將 Vibe Coding 定位為「美中不足」的現狀——AI 能寫程式但無法保證 UI 風格一致性與品牌完整性。`DESIGN.md` 是補強 Vibe Coding 的關鍵約束機制。
- [[src-harness-engineering-openai]]（Harness Engineering）：未直接討論 Vibe Coding，但「沒有 harness 的 AI 編程」即為 Vibe Coding 的失控版本——強調必須加上「約束 + 上下文 + 熵管理」三根支柱才能規模化。

## 演化光譜中的位置

| 階段 | 模式 | 主導者 |
|------|------|--------|
| 1. 傳統接力 | Vision → PM → Designer → Engineer → QA | 人類分工接力 |
| 2. **Vibe Coding** | **Vision → AI → Code** | **AI（人類僅給 prompt）** |
| 3. Contextual Coding（Cursor / Copilot） | (Vision + Context) → AI Assistant + Engineer → Code | 工程師主導，AI 為外骨骼 |
| 4. [[Agentic-AI-Workflow]] | Vision ↔ AI Agents（同心圓迭代） | 人類為 Reviewer + 指揮家 |

## Agentic Technical Debt（Anthropic 官方版命名）

[[src-anthropic-founders-playbook-2026|Anthropic Founder's Playbook]] 章 4 把本頁所述「沒架構的 Vibe Coding 災難」官方版命名為 **「Agentic Technical Debt」**：

> 「Because AI essentially **removes every natural bottleneck** that once controlled what reaches production, **speed is guaranteed**. But when speed is the only variable that founders factor into their MVP build, they risk accruing technical debt they'll struggle to pay off.」

特性：
- AI 移除「**寫 code 的時間成本**」這個 natural bottleneck
- 累積比舊範式更快（因為產出速度太快）
- 沒有 specs/architecture/CLAUDE.md 時尤其嚴重——「each session re-derives foundational decisions from scratch」

對應 [[AI-Native-Startup]] 反模式列表。

## 缺陷與補強機制

**缺陷**：缺乏架構、規格、品牌約束 → 技術債、UI 風格不一致、難維護。

**主要補強路徑**：
- [[DESIGN-md]]：把品牌設計規範寫成 AI 可讀的純文字檔（getdesign.md 等），讓 Vibe Coding 產出符合風格
- [[Harness-Engineering]]：在 AI 周圍建立約束、上下文、熵管理三層機制
- [[Agent-Skills]]：把領域知識封裝成可複用的能力擴充
- [[Meta-Harness]]：為「尚未想出的程式」設計 agent 架構模式

## 相關概念

- [[Agentic-AI-Workflow]]：演化下一階段，補上人類審批與雙向流動
- [[DESIGN-md]]：Vibe Coding 的品牌與美學約束機制
- [[Harness-Engineering]]：Vibe Coding 的工程嚴謹補丁
- [[Managed-Agents]]：把 Vibe Coding 的「prompt → code」過程託管化
- [[Agent-Skills]]：擴充 Vibe Coding 在特定領域的能力
- [[Prompt-Pack-Pattern]]：把單一 prompt 拆成多段串接的 Vibe Coding 進階範式
- [[HyperFrames]]：影片領域 Vibe Coding 的代表工具

## 應用與案例

- **適合場景**：原型開發、概念驗證（POC）、個人小工具、Hackathon 作品
- **不適合場景**：企業級系統、長期維護專案、需嚴格品牌一致性的前端介面（除非搭配 [[DESIGN-md]] 等約束）

### 領域擴張：從 code 到影片

Vibe Coding 不限於程式碼。[[src-codex-hyperframes-prompt-pack]] 展示了**短影片 vibe coding**——用 [[OpenAI-Codex-CLI]] + [[HyperFrames]]，透過自然語言 prompt 驅動 LLM 產出影片 composition（HTML + CSS + GSAP timeline），最終 render 成 MP4。

「Vision → AI → 輸出」的鏈條依然成立，只是輸出從 code 換成影片。配套補強機制同樣適用：
- [[DESIGN-md]] 提供視覺約束（色票 / 字體 / 不可做事項）
- [[Prompt-Pack-Pattern]] 取代單一巨型 prompt，分階段控制節奏
- [[Specification-by-Example]] 的影片版（Visual Beats Library）凍結畫面節奏
