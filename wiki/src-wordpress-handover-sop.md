---
title: WordPress 接案交接：如何檢查「前人的遺產」
type: source
author: Jackie Yeh
sources: [2026-04-23-接手專案檢查sop.md]
created: 2026-04-23
updated: 2026-04-23
tags: [WordPress, 接案, 資安, WP-CLI, 交接檢查, 原創經驗]
confidence: 強
---

# WordPress 接案交接：如何檢查「前人的遺產」

> 原創經驗文，作者 Jackie Yeh｜記錄日期：2026-04-23
> 源於接手某 WordPress 網站遇到多項詭異狀況後整理的檢查 SOP

## 背景觸發

接手網站時觀察到的五個異常訊號：

1. 形象官網卻裝著 **WooCommerce + XStore 電商主題**
2. 外掛總數近 **60 個**，功能重複（光是追蹤碼嵌入就有 4 個外掛）
3. 主機等級夠但後臺操作**卡頓**
4. 編輯文章儲存後內容**自動還原**
5. 媒體庫上傳檔案跑去**前年的資料夾**

檔案系統檢查發現三個「歷史文物」：
- LINE Bot 範例外掛 `config.ini` 內含**真實 Channel Access Token 與 Secret**
- 網站根目錄有測試簡訊發送 php，內含**第三方簡訊平台真實帳密**
- `wp-content/uploads/wph/environment.php` 把**別家網域的伺服器絕對路徑**寫死在 JSON 裡

→ 判定為「前人的遺產」：接案工程師複製舊專案交件後未清理的殘留（詳 [[WordPress-接手檢查SOP#「前人的遺產」]]）。

## 核心概念：前人的遺產

接案工程師為省時間，把舊專案當基底複製，改主題換內容就交件。未清乾淨的項目：

- 舊客戶的 API 帳密、Token、Secret
- 舊客戶的伺服器絕對路徑、網域名稱
- 測試用腳本（根目錄 `.php` 測試檔最常見）
- 多餘外掛（舊案裝來解需求，新案不需要）
- 資料庫舊資料殘留

### 對新業主的四類風險

| 風險類型 | 具體表現 |
|---------|---------|
| 效能負債 | 無用外掛仍在載入、跑排程、佔記憶體 |
| 相容性衝突 | 功能重複的外掛互相干擾（編輯自動還原很可能就是這類） |
| 資安風險 | 承接別家帳密，網站變成洩密管道 |
| 道德尷尬 | 撿到別家憑證要怎麼處理？ |

## 六步檢查 SOP

詳細流程收錄於概念頁 [[WordPress-接手檢查SOP]]，此處僅列摘要：

### Step 1：WP-CLI 驗證核心檔完整性

```bash
wp core verify-checksums
wp plugin verify-checksums --all
```

[[WP-CLI]] 會下載 wordpress.org 官方 checksums 比對。三種異常訊息：
- `File doesn't verify` → 核心檔被改，**高度警戒**（疑似 malware）
- `File should not exist` → 多餘檔（前人遺產常犯區）
- `File is missing` → 核心檔遺失

**一個指令同時覆蓋「多餘檔盤點」與「核心檔被竄改」兩件事**，比手動 `find + grep` 白名單更可靠。

無 WP-CLI 時退回：

```bash
find . -maxdepth 1 -type f -name "*.php"
```

WordPress 根目錄正常只有 17 個官方 PHP 檔。多的逐個檢查。

### Step 2：檢查 `uploads/` 內有無 PHP 檔（最重要）

```bash
find wp-content/uploads -type f \
  \( -name "*.php" -o -name "*.phtml" -o -name "*.phar" \
     -o -name "*.pht" -o -name "*.php5" -o -name "*.php7" \) 2>/dev/null
```

`uploads/` 是圖片目錄，出現 `.php` 要不是外掛自動建的防目錄列表空檔，就是**可疑檔案**。

| 內容樣態 | 判斷 |
|---------|------|
| 只有 `<?php` 或 `die();` 一行 | 外掛防列表空檔，**正常** |
| 可讀 JSON 設定、環境變數 | 前案設定殘留，**可疑** |
| eval / 亂碼 / base64 字串 | **立即隔離，八成是後門** |

### Step 3：自訂區域搜尋硬編碼帳密

```bash
grep -rniE "(password|passwd|api_key|api-key|apikey|secret|access_token|auth_token|bearer)\s*[:=]\s*['\"][^'\"]{6,}['\"]" \
  . --include="*.php" --include="*.ini" --include="*.conf" --include="*.env" \
  --exclude-dir=wp-admin --exclude-dir=wp-includes \
  --exclude-dir=node_modules --exclude-dir=vendor \
  2>/dev/null | head -80
```

合法外掛中這些字串多出現在函數定義、變數名、i18n 字串（如 `__('password')`），要打開看 context。重點找 `password = 'xxxxxxxx'` 的**字面指派**。

### Step 4：翻出殘留的原始伺服器路徑

```bash
grep -rn "/var/www/\|/home/[a-z]" wp-content/ \
  --include="*.php" --include="*.json" --include="*.ini" --include="*.log" \
  2>/dev/null | head -20
```

這是**決定性證據**。找到「不是當前網域」的路徑基本確定有前人遺產。

### Step 5：資料庫殘留

```sql
SELECT option_name, LEFT(option_value, 100) FROM wp_options
  WHERE option_value LIKE '%[可疑網域]%' LIMIT 20;
SELECT ID, post_title FROM wp_posts
  WHERE post_content LIKE '%[可疑網域]%' LIMIT 20;
```

**serialized data**（WordPress 外掛常用存設定）純 SQL 搜得到但不能直接 UPDATE，要用：

```bash
wp search-replace '舊網域' '新網域' --all-tables --dry-run
```

確認後去掉 `--dry-run`。

### Step 6：盤點外掛數量與功能重疊

```bash
ls wp-content/plugins/ | wc -l
```

重點不是數量，是**功能重疊**——追蹤碼、備份、SEO、快取類有沒有裝超過一個。另注意**偽裝外掛**：有時惡意程式偽裝外掛然後寫入 DB、從外掛列表隱藏自己。

## 可疑檔案處理原則

按風險由低到高：

| 等級 | 類型 | 處理 |
|------|------|------|
| 1 | 已知外掛/主題自動生成（例 `cleantalk_fw_files_for_blog_1/index.php`、`wpvividbackups/.htaccess`） | 留著，刪了也會再生 |
| 2 | 前人遺產但無功能關聯（測試簡訊 php、獨立 LINE Bot 範例） | 直接刪 |
| 3 | 前人遺產但不確定主題/外掛是否依賴（例 `uploads/wph/environment.php`） | 先備份再刪，觀察幾天 |
| 4 | 看起來像後門 | **立即隔離、告知業主、考慮主機層級清毒** |

後門判斷特徵：`eval`、`assert`、`$_GET`/`$_POST` 直接執行、`base64_decode` 執行字串、obfuscated code、檔案時間戳與周邊差異極大。

## 倫理篇：撿到別家帳密怎麼辦

本次檢查中撿到別家 LINE Token、簡訊 API 帳密。處理原則：

- **不利用**：不測試還能不能用、不記錄到長期筆記、不在公開場合展示內容
- **不傳播**：對話結束就刪除，不留在交付文件
- **視關係決定是否通知**：
  - 新業主**認識**前一家客戶 → 請新業主去通知
  - 新業主**不認識**（本案屬此） → 無從通知，結案
  - 不要自己跨級去找不認識的公司，既無法證明善意、也可能造成法律糾紛

> 真正該負責的是當初做複製的工程師。撿到的人沒有義務替對方擦屁股，但有義務不讓它擴散。

## 給前手工程師的自我檢查清單

複製舊專案交付前至少檢查一次：

- [ ] 網站根目錄有沒有其他非 WP 核心 PHP 檔？
- [ ] `wp-content/uploads/` 內有沒有 `.php`？
- [ ] 所有設定檔（`*.ini`、`*.env`、`*.json`）內 Token / 帳密是否清空或換成新業主的？
- [ ] 資料庫 options 表是否已用 WP-CLI `search-replace` 過舊網域？
- [ ] 是否刪除了與新業主無關的多餘外掛？
- [ ] log 檔、cache 是否已清空？
- [ ] 主題的 cache 目錄（例 `uploads/[主題名]/`、`uploads/wph/`）是否已清除？

七點做到位，就不會把自己搞成「洩密中介」。

## 關鍵引用

> 我把這種狀況叫做「前人的遺產」。

> `wp core verify-checksums` 一個指令就同時覆蓋了「多餘檔盤點」與「核心檔被竄改」兩件事，比 find + grep 的手動白名單更可靠。

> 真正該負責的是當初做複製的工程師。撿到的人沒有義務替對方擦屁股，但有義務不讓它擴散。

## 與 Wiki 的關聯

- 產出新概念頁 [[WordPress-接手檢查SOP]]（含「前人的遺產」段落）
- 產出新實體頁 [[WP-CLI]]
- 與 [[src-photography-studio-proposal]]（胖哥攝影工作室）同屬 WordPress 接案脈絡
- 與 [[src-openclaw-wordpress-rag]] 共享 WordPress 實作背景，但主題不同（資安檢查 vs RAG 系統整合）
- 納入 [[WordPress-接案工作筆記]] 作為階段 2（接手時）的核心材料
