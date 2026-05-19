---
title: Andrej Karpathy
type: entity
sources: ["Claude + Obsidian 打造 AI 第二大腦，Karpathy 的知識管理 LLM Wiki 教學｜科技翰林院.md", "bnext-claude-md-12-rules.md"]
created: 2026-05-08
updated: 2026-05-19
tags: [人物, AI, OpenAI, Tesla, 教學, llm-wiki, claude-md]
confidence: 強
---

# Andrej Karpathy

AI 圈公認最具影響力的技術佈道者之一，2026-04 在 X 上發布的 LLM Wiki gist 直接催生了一波個人知識管理範式革新。

## 基本資訊

- **角色**：AI 研究者、教育者
- **經歷**：
  - 前 Tesla AI 總監（負責自動駕駛 Autopilot）
  - OpenAI 共同創辦成員
- **主要影響力**：YouTube 深度學習教學系列累積數千萬觀看
- **2026-04 代表貢獻**：[[LLM-Wiki]] gist
  - 連結：https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
  - 數據（截至 2026-04 中旬）：5,000+ stars、1,900 萬曝光

## 核心論點（LLM Wiki 相關）

LLM 最擅長的不是幫你思考，而是幫你做 **bookkeeping**——整理、歸檔、交叉引用的苦工。

人機分工：
- **人**：策展來源、引導分析、問好問題、思考意義
- **LLM**：其他所有事

詳細內容見 [[LLM-Wiki]] 概念頁與 [[src-techhanlin-llm-wiki-tutorial]] 來源頁。

## 為何爆紅

文章作者 [[科技翰林院|林思翰 Hans]] 觀察：Karpathy 的論點之所以引發共鳴，因為他**精準說出大家對 RAG 的不滿**——「每次都從零開始、沒有累積」——並提出可操作的替代方案。

不是抽象理論，而是「一邊開 LLM agent、一邊開 Obsidian」這種具體可複製的工作流。

## 影響範圍

- 推動 [[Obsidian]] + [[Claude Code]] 組合在中文圈擴散（[[HC-AI-說人話]]、[[科技翰林院]] 都在 2026-04 同期推出對應教學）
- 本知識庫 ([[LLM-Wiki]]) 即依據 Karpathy 原始概念設計

## 2026 初：AI 寫程式 3 缺失觀察（[[src-bnext-claude-md-12-rules|源頭]]）

Karpathy 在 2026 初指出 AI 寫程式碼的 3 個常見缺失，**催生了「CLAUDE.md 4 + 8 = 12 條規則」演化鏈**：

1. AI 遇不確定情境時不問，**自行假設並繼續執行** → 產出與需求不符
2. AI 傾向**用複雜架構解決簡單問題** → 多餘抽象層、不必要功能
3. AI 修改指定範圍時**順手「整理」周邊不相關 code、格式或註解** → 難追蹤副作用

演化鏈：
- **Karpathy 觀察 3 缺失** →
- **Forrest Chang 整理成 [[CLAUDE-md|CLAUDE.md]] 4 條規則**（GitHub 12 萬星）→
- **Mnimiy 擴充 8 條應對複雜 agent 場景**（30 codebase / 6 週盲測 41% → 11% → 3% 錯誤率）

Karpathy 在這條鏈上扮演**問題定義者**的角色——和先前的 [[LLM-Wiki]] gist 一樣，他擅長把工程社群感受到但講不清楚的痛點精準命名。

## 相關頁面

- [[LLM-Wiki]] — 他提出的核心方法論
- [[Memex]] — 他文中拉的歷史脈絡（Vannevar Bush 1945）
- [[CLAUDE-md]] — 由他的 AI 寫程式 3 缺失觀察催生的 12 條規則範本
- [[Ratchet-Pattern]] — 「規則只應防止實際遇過的失敗」原則的同源思路
- [[src-techhanlin-llm-wiki-tutorial]] / [[src-bnext-claude-md-12-rules]] — 主要來源
