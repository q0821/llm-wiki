---
title: Higgsfield MCP
type: entity
sources: ["claude-code-五個外掛完整安裝與實戰指南.md"]
created: 2026-07-22
updated: 2026-07-22
tags: [mcp, 生成式影像, 影片生成, oauth, 工具]
confidence: 中
---

# Higgsfield MCP

一台 hosted [[MCP]] server，把 [[Claude Code]] 接上 **30+ 個圖片與影片生成模型**：
Soul、Cinema Studio、Flux、Seedream、Kling、Minimax Hailuo、Veo、Sora 等。

官方： higgsfield.ai/mcp ｜ Endpoint： https://mcp.higgsfield.ai/mcp

## 它解決的問題

最好的生圖模型每個禮拜都在換。以前用每一個都要管一組 API、一個帳號、一套 SDK，
結果大部分人挑一個用到底——**等於幾乎永遠沒在用最適合的工具**。
Higgsfield MCP 把這件事收攏成一個連線。

## 安裝

```bash
claude mcp add --transport http --scope user higgsfield https://mcp.higgsfield.ai/mcp
claude mcp list    # 驗證，或在 session 裡打 /mcp 看綠勾
```

- `--transport http`：這是 hosted HTTP server，**不是本機 stdio**
- `--scope user`：寫進 `~/.claude/mcp.json`，所有專案可用
  （只想在單一 repo 並 commit 給團隊就換 `--scope project`）
- 第一次呼叫工具時開瀏覽器跑 **OAuth**

**沒看到？** 完全關掉 Claude Code 再開——新的 MCP server 只在全新 session 才註冊。

claude.ai／桌面版：Settings → Connectors → Add Custom Connector → 貼上 endpoint → Connect。

## 已知的錯誤資訊（網路上最多人寫錯的地方）

**不需要 API key。** Higgsfield 在 **2026-04-30** 才推出官方 hosted MCP server，
在那之前的教學都教你貼 `HIGGSFIELD_API_KEY`，照著做會卡住。

```json
// 這是舊做法，現在不用了
{
  "mcpServers": {
    "higgsfield": {
      "command": "higgsfield-mcp",
      "env": { "HIGGSFIELD_API_KEY": "...", "HIGGSFIELD_SECRET": "..." }
    }
  }
}
```

這是 [[Verify-Framework-Version-First]] 的又一個實例：教學文的正確性有保存期限，
而搜尋結果不會告訴你哪篇過期了。

## 使用時要知道的事

- **它不會通知你**：生成跑在它的伺服器上，做完不會 ping。要明確叫 Claude
  「每 60–90 秒 poll 一次，把結果拉回來」，否則會無限等待或直接跳過
- **批次要分組**：一次丟 10 個，第四個之後會**安靜失敗**。三個一組送，然後 poll
- **任務是持久的**：session 斷掉沒關係，任務在伺服器端繼續跑，長影片可以放著
- **先估 credit**：200 張圖在 creator plan 沒問題；**200 支 Veo 影片會在一個下午
  燒掉一整個月**。開始前先叫 Claude 估
- **檢查品牌名拼字**：自動轉錄會把 Claude Code 寫成 Cloud Code、Seedance 寫成 C-Dance

## 什麼時候不要用

- 只需要一種模型時，直接用那家 API 更便宜
- 內容不吃視覺時——這是**內容生產工具、不是開發工具**，裝著只會多一層 context

## 與本知識庫的關聯

- [[MCP]] — hosted HTTP + OAuth 型 MCP server 的代表案例（對照本機 stdio 型）
- [[src-jason-claude-code-5-plugins-2026-07]] — 說明來源
- [[Verify-Framework-Version-First]] — 「教學文會過期」的實例
- 使用者本機已有 `gpt-image-bridge` skill（gpt-image-2 生圖，走 codex CLI），
  與本工具是競爭方案：Higgsfield 走「一個連線接多模型 + 訂閱 credit」，
  gpt-image-bridge 走「單一模型 + 既有帳號」

## 對本人的相關性評估

使用者的工作以接案網站、提案簡報為主，生圖需求集中在**簡報插圖與示意圖**，
量不大且已有 gpt-image-bridge 可用。作者自己也說「要做圖做片再裝」——
**目前屬於知道有這個東西即可，不急著裝**。

真正會改變判斷的情境：接到需要大量視覺素材的案子（形象網站、社群素材月結），
屆時「一個連線接 30+ 模型」的價值才成立。
