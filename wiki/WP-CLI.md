---
title: WP-CLI
type: entity
sources: [2026-04-23-接手專案檢查sop.md]
created: 2026-04-23
updated: 2026-04-23
tags: [WordPress, CLI, 運維工具]
confidence: 強
---

# WP-CLI

## 定義

WordPress 官方命令列工具，提供不經 wp-admin 後臺、直接以終端機操作 WordPress 的能力。

- 官方網站：https://wp-cli.org
- 指令前綴：`wp`

## 在 [[WordPress-接手檢查SOP]] 中的關鍵用途

### 1. 核心檔完整性驗證

```bash
wp core verify-checksums
```

下載 wordpress.org 該版本的官方 checksums，比對實際檔案。一個指令同時解決：

- 「多餘檔盤點」（`File should not exist`）
- 「核心檔被竄改」（`File doesn't verify against checksum`）

比手動 `find + grep` 白名單更可靠——不需維護版本差異的檔案清單。

### 2. 外掛完整性驗證

```bash
wp plugin verify-checksums --all
```

**限制**：只對 wordpress.org 官方目錄的免費外掛有效，商業外掛（XStore、Elementor Pro 等）會 skip。

### 3. 資料庫搜尋取代（處理 serialized data）

```bash
wp search-replace '舊網域' '新網域' --all-tables --dry-run
```

**為什麼不能用 SQL UPDATE**：WordPress 外掛大量使用 PHP serialize 存設定（`a:3:{s:4:"name";s:5:"value";...}`），字串長度寫在序列化資料的前綴中。直接 SQL UPDATE 會破壞長度標記，導致反序列化失敗。`wp search-replace` 能正確解析並更新 serialized data。

`--dry-run` 先預覽，確認後再真正執行。

## 使用限制

- 需要主機支援 SSH / CLI 執行環境（部分共享主機無提供）
- 純 FTP 接案時無法使用，需退回手動 `find` 等指令

## 相關頁面

- [[WordPress-接手檢查SOP]] — 主要應用場景
- [[src-wordpress-handover-sop]] — 使用實例
- [[src-openclaw-wordpress-rag]] — WordPress RAG 部署與資料搬遷可借助 WP-CLI
