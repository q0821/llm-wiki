---
title: Verify Framework Version First（新專案第一件事驗框架版本）
type: concept
sources: []
created: 2026-05-15
updated: 2026-05-15
tags: [practice, ratchet, ai-failure-mode, anti-pattern]
confidence: 強
---

# Verify Framework Version First

> 進入新 codebase 第一件事跑 `composer show <主框架>` / `npm ls <主框架>` / 對應 manifest，**用 lockfile 確認實際安裝版本**，不要靠記憶 / package.json 寫的 range / 對話歷史。

**來源**：個人實作累積（已去識別）。

## 為什麼是 ratchet 級別的規則

LLM（包含我自己）容易把「最近接觸過的版本」帶到新專案——尤其是大型框架（Laravel、Filament、React、Vue 等）改版頻繁的。版本標籤錯一次會擴散到：

- spec / plan 文件
- 開發 cheatsheet
- subagent dispatch prompt
- commit message
- code comment

**版本標籤錯誤的污染半徑**遠超「就改一個字」的工作量。

## 典型踩雷：Filament v4 vs v5

某次連續開發 session：composer.json 寫 `"filament/filament": "~5.0"`、composer.lock 實際 `v5.6.3`。

AI 從中段某個 phase 開始寫 spec / plan / cheatsheet / commit message 一律用「Filament v4」，連續多個 commit、約 50 次散佈在 7-8 個文件。

直到 session 結尾跑 `document-release` skill，被強迫對 `composer.lock` 才抓到。

行為層面 AI 寫的是對的——`assertHasFormErrors` vs `assertHasTableActionErrors` 確實是新版 vs 舊版 API 差異。**錯的只是版本標籤本身**，但污染整套文件。

## 為什麼會發生

LLM 對「Filament 是某個 Laravel admin panel」有印象但不清楚 minor version。當對話沒有強制檢查時，會：

1. 對話初期某個 prompt 提到「Filament」沒加版本
2. LLM 假設「Filament 4」（這是訓練資料中常見的版本）
3. 對話中後續所有產出都基於這個假設
4. 沒有任何回環機制糾正

對「ratchet pattern」的具體應用 → 第一次踩到後**永久編碼成規則**：「進新 codebase 第一件事跑 `composer show <主框架>`」。

## 操作步驟（不同語言對應）

| 技術棧 | 驗版本命令 |
|---|---|
| PHP / Composer | `composer show <package>` 或 `cat composer.lock \| jq '.packages[] \| select(.name=="<package>") \| .version'` |
| Node / npm | `npm ls <package> --depth=0` 或 `cat package-lock.json \| jq '.packages."node_modules/<package>".version'` |
| Node / pnpm | `pnpm list <package>` |
| Node / yarn | `yarn list --pattern <package>` |
| Python / pip | `pip show <package>` |
| Python / poetry | `poetry show <package>` |
| Ruby / Bundler | `bundle info <gem>` |
| Rust | `cargo tree --package <crate>` |
| Go | `go list -m <module>` |

## 寫進 CLAUDE.md / cheatsheet 開頭

```markdown
> 這個 repo 是某 Laravel 專案（Laravel 13 + Filament 5 + Pest 4 + DDEV）。
> 實際版本以 `composer.lock` 為準（撰寫時 Filament `v5.6.3`）。
```

`v5.6.3` 是寫文件當下的快照——之後升 minor 不用更新文件（依然「v5.x」），升 major 才回頭調整。

## 何時驗

| 場景 | 驗什麼 |
|---|---|
| 進新專案 | 主要框架 + ORM + UI framework |
| 換工作 / 接手別人案 | 全部 production dependency 的 major version |
| 升級套件後 | 該套件 + 直接相依的 |
| 寫 spec / plan 前 | 提到的所有框架版本 |
| 文件 sync（`document-release` 觸發） | 全部已記載版本對 lockfile |

## 連結

- [[Ratchet-Pattern]] — 踩雷後固化規則的範式，本頁是其具體應用之一
- [[CLAUDE-md]] — 框架版本宣告應該寫進 CLAUDE.md 開頭
- [[Adversarial-Code-Review]] — 部分 review 工具會檢查 lockfile（如 composer audit）
