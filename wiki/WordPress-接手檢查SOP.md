---
title: WordPress 接手檢查 SOP
type: concept
sources: [2026-04-23-接手專案檢查sop.md]
created: 2026-04-23
updated: 2026-04-23
tags: [WordPress, 接案, 資安, SOP, WP-CLI, 交接檢查]
confidence: 強
---

# WordPress 接手檢查 SOP

## 定義

接手他人移交的 WordPress 網站時，用來識別「前人的遺產」——舊客戶殘留帳密、絕對路徑、測試檔、多餘外掛、資料庫殘留——的六步驟檢查流程。

### 「前人的遺產」

接案工程師為省時間，把舊專案當基底複製後改主題換內容交件。沒清乾淨的殘留統稱為「前人的遺產」。常見項目：

- 舊客戶 API 帳密 / Token / Secret
- 舊客戶伺服器絕對路徑、網域名稱
- 測試用腳本（根目錄 `.php` 測試檔）
- 多餘外掛（舊案用過、新案不需）
- 資料庫舊資料（options 表、post content、serialized data）

## 為什麼需要 SOP

四種典型徵兆指向「前人的遺產」：

- 形象官網裝了電商主題這種「不匹配」現象
- 功能重複的外掛群（追蹤碼、備份、SEO 各裝多個）
- 後臺異常卡頓、編輯儲存後自動還原
- 媒體庫上傳跑去錯的年份資料夾（說明 uploads 路徑被改過）

對新業主造成四類風險：

| 風險類型 | 具體表現 |
|---------|---------|
| 效能負債 | 無用外掛載入、跑排程、佔記憶體 |
| 相容性衝突 | 重複功能外掛互相干擾 |
| 資安風險 | 承接別家帳密，網站變成洩密管道 |
| 道德尷尬 | 撿到別家憑證，處理兩難 |

## 六步檢查流程

### Step 1：WP-CLI 驗證核心檔完整性

```bash
wp core verify-checksums
wp plugin verify-checksums --all
```

[[WP-CLI]] 下載 wordpress.org 官方 checksums 比對實際檔案，三種異常：

| 訊息 | 意義 | 處理 |
|------|------|------|
| `File doesn't verify against checksum` | 核心檔被改 | 高度警戒，疑似 malware 植入 |
| `File should not exist` | 多餘檔 | 前人遺產常犯區 |
| `File is missing` | 核心檔遺失 | 極少見，通常表示有人手動刪過 |

**關鍵優勢**：一個指令同時覆蓋「多餘檔盤點」與「核心檔竄改」兩件事，比手動 `find + grep` 白名單更可靠。

退回方案（只有 FTP 時）：

```bash
find . -maxdepth 1 -type f -name "*.php"
```

WordPress 根目錄正常只有 17 個 PHP：`index.php`、`xmlrpc.php`、`wp-activate.php`、`wp-blog-header.php`、`wp-comments-post.php`、`wp-config.php`、`wp-config-sample.php`、`wp-cron.php`、`wp-links-opml.php`、`wp-load.php`、`wp-login.php`、`wp-mail.php`、`wp-settings.php`、`wp-signup.php`、`wp-trackback.php`。多的逐個檢查。

### Step 2：檢查 `uploads/` 內有無 PHP 檔（最重要）

```bash
find wp-content/uploads -type f \
  \( -name "*.php" -o -name "*.phtml" -o -name "*.phar" \
     -o -name "*.pht" -o -name "*.php5" -o -name "*.php7" \) 2>/dev/null
```

`uploads/` 原則上只該有圖片。出現 `.php` 打開看：

| 樣態 | 判斷 |
|------|------|
| 幾 bytes、只有 `<?php` 或 `die();` | 外掛防目錄列表空檔，**正常** |
| 可讀 JSON 設定、環境變數 | 前案設定殘留，**可疑** |
| eval / 亂碼 / base64 字串 | **立即隔離，八成是後門** |

### Step 3：搜尋硬編碼帳密

```bash
grep -rniE "(password|passwd|api_key|api-key|apikey|secret|access_token|auth_token|bearer)\s*[:=]\s*['\"][^'\"]{6,}['\"]" \
  . --include="*.php" --include="*.ini" --include="*.conf" --include="*.env" \
  --exclude-dir=wp-admin --exclude-dir=wp-includes \
  --exclude-dir=node_modules --exclude-dir=vendor \
  2>/dev/null | head -80
```

合法外掛中這些字串多出現在函數定義、變數名、i18n 字串（`__('password')`），需要看 context。重點找 `password = 'xxxxxxxx'` 的**字面指派**。

### Step 4：翻出殘留的原始伺服器路徑

```bash
grep -rn "/var/www/\|/home/[a-z]" wp-content/ \
  --include="*.php" --include="*.json" --include="*.ini" --include="*.log" \
  2>/dev/null | head -20
```

**決定性證據**——找到「非當前網域」的絕對路徑，基本確認前人遺產存在。

### Step 5：資料庫殘留

```sql
-- options 表中是否有別家網域殘留
SELECT option_name, LEFT(option_value, 100) FROM wp_options
  WHERE option_value LIKE '%[可疑網域]%' LIMIT 20;

-- post content 中是否有別家絕對連結
SELECT ID, post_title FROM wp_posts
  WHERE post_content LIKE '%[可疑網域]%' LIMIT 20;
```

**serialized data 警告**：WordPress 外掛大量用 PHP serialize 存設定，純 SQL 找得到但**不能用 SQL UPDATE 直接改**（會破壞序列化長度標記）。必須用 [[WP-CLI]]：

```bash
wp search-replace '舊網域' '新網域' --all-tables --dry-run
```

確認結果合理再去掉 `--dry-run`。

### Step 6：盤點外掛數量與功能重疊

```bash
ls wp-content/plugins/ | wc -l
```

數量多不是問題，**功能重疊**才是。檢查重點：

- 追蹤碼嵌入、備份、SEO、快取類是否裝超過一個
- 主題帶的自家外掛（例 XStore）是否真的需要
- 停用一個月沒人抱怨的外掛通常可以移除
- **偽裝外掛**：惡意程式偽裝成外掛、寫入 DB、從外掛列表隱藏自己

## 處理原則（四級分類）

| 等級 | 類型 | 例子 | 處理 |
|------|------|------|------|
| 1 | 已知自動生成 | `cleantalk_fw_files_for_blog_1/index.php`、`wpvividbackups/.htaccess` | 留著，刪了也會再生 |
| 2 | 前人遺產但無功能關聯 | 測試簡訊 php、獨立 LINE Bot 範例資料夾 | 直接刪 |
| 3 | 前人遺產但不確定主題/外掛依賴 | `uploads/wph/environment.php`（可能是主題 cache） | 先備份再刪，觀察幾天 |
| 4 | 看起來像後門 | 見下方特徵 | 立即隔離、告知業主、考慮主機層級清毒 |

**後門判斷特徵**：

- 使用 `eval`、`assert`、`$_GET` / `$_POST` 直接執行
- `base64_decode` 執行字串
- obfuscated code（刻意混淆）
- 檔案時間戳與周邊檔案差異極大

## 倫理：撿到別家帳密

核心三原則：

1. **不利用**：不測試可用性、不記錄到長期筆記、不在公開場合展示
2. **不傳播**：對話結束就刪除，不留在交付文件
3. **視認識程度決定通知**：
   - 新業主**認識**前客戶 → 請新業主去通知
   - 新業主**不認識** → 無從通知，結案
   - **不要自己跨級去找不認識的公司**（既無法證明善意，也可能造成法律糾紛）

真正該負責的是當初做複製的工程師。撿到的人沒義務擦屁股，但有義務不讓它擴散。

## 給前手工程師的自檢清單

複製舊專案後交付前：

- [ ] 網站根目錄有沒有其他非 WP 核心 PHP 檔
- [ ] `wp-content/uploads/` 內有沒有 `.php`
- [ ] 所有設定檔（`*.ini`、`*.env`、`*.json`）內 Token / 帳密是否清空或換成新業主的
- [ ] 資料庫 options 表是否已 `wp search-replace` 過舊網域
- [ ] 是否刪除了與新業主無關的多餘外掛
- [ ] log 檔、cache 是否已清空
- [ ] 主題 cache 目錄（`uploads/[主題名]/`、`uploads/wph/`）是否已清除

## 相關頁面

- [[src-wordpress-handover-sop]] — 原始經驗來源
- [[WP-CLI]] — SOP 關鍵工具
- [[src-photography-studio-proposal]] — 另一個 WordPress 接案，可作為交接檢查的應用情境
- [[胖哥攝影工作室]] — WordPress 客戶 entity，若接手維護可套用此 SOP
- [[src-openclaw-wordpress-rag]] — WordPress 實作脈絡（主題不同但技術背景相關）
