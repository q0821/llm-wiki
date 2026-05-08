---
title: Memex
type: concept
sources: ["Claude + Obsidian 打造 AI 第二大腦，Karpathy 的知識管理 LLM Wiki 教學｜科技翰林院.md"]
created: 2026-05-08
updated: 2026-05-08
tags: [概念, 歷史, 知識管理, vannevar-bush, 第二大腦]
confidence: 中
---

# Memex

Vannevar Bush 於 **1945 年**提出的個人知識管理裝置概念，可視為 [[LLM-Wiki]] 與「第二大腦」概念的歷史先驅。

## 核心定義

**Memex = "Memory Extender"**：一個私人的、主動策展的知識庫，**文件之間的關聯跟文件本身一樣有價值**。

## 提出脈絡

- 出處：1945 年 Vannevar Bush 在 *The Atlantic* 發表的文章 "As We May Think"
- 時代背景：二戰末期，Bush 思考戰後的知識爆炸與個人如何駕馭資訊
- 設計概念：機械式、用微縮膠卷儲存、可建立**關聯軌跡（associative trails）**串連文件

## 為何重要：未解的核心問題

[[Andrej-Karpathy]] 在 [[LLM-Wiki]] gist 結尾拉出這條歷史軸的用意是：

> 「Bush 當年解決不了的問題是**誰來做維護**，現在 LLM 解決了。」

人類為什麼放棄維護 wiki？因為**維護成本的增長速度比價值快**：
- 連結需要手動補
- 矛盾需要手動標
- 索引需要手動更新
- 交叉引用一旦漏掉一次，就會持續腐爛

LLM 的特性恰好填補了這個缺口：
- **不會無聊**
- **不會忘記更新交叉引用**
- **一次能動 15 個檔案**

## 與 LLM Wiki 的對照

| 面向 | Memex (1945) | [[LLM-Wiki]] (2026) |
|---|---|---|
| 提出者 | Vannevar Bush | [[Andrej-Karpathy]] |
| 載體 | 機械裝置 + 微縮膠卷（概念） | [[Obsidian]] + [[Claude Code]] |
| 連結機制 | Associative trails | `[[wikilink]]` |
| 維護者 | 使用者本人（人工） | LLM 代為維護 |
| 落地可行性 | 受限於當時硬體，未真正實現 | 2026 起可規模化實踐 |

## 與「第二大腦」（Second Brain）的關係

Tiago Forte 推廣的「Building a Second Brain」（PARA 方法）也是 Memex 思想脈絡的延伸，但仍以**人類維護**為主。LLM Wiki 可視為「第二大腦」概念的下一個世代——**把 bookkeeping 工作交給 LLM**。

## 信心評估

- **強**：歷史事實（1945 年、"As We May Think"、Vannevar Bush）— 公認文獻
- **中**：「LLM Wiki 是 Memex 的可實現版本」此論述 — 來自 [[Andrej-Karpathy]] 原文與 [[科技翰林院]] 二手轉述，邏輯成立但屬於詮釋

## 相關頁面

- [[LLM-Wiki]] — 當代可實踐版本
- [[Andrej-Karpathy]] — 拉出此歷史脈絡的人
- [[src-techhanlin-llm-wiki-tutorial]] — 來源頁
