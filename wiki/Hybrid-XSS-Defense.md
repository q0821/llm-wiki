---
title: Hybrid XSS Defense（雙層 stored XSS 防護）
type: concept
sources: []
created: 2026-05-15
updated: 2026-05-15
tags: [security, xss, owasp, defense-in-depth, html-purifier]
confidence: 強
---

# Hybrid XSS Defense

> 「escape at substitution」+「sanitize at storage」**雙層**防護。單層在「user 內容會被模板引擎替換進 admin-authored HTML」這類情境下不夠。

**來源**：個人實作累積（已去識別）。

## 適用情境

- Admin 用 RichEditor 寫 HTML body 存 DB（如 email template、公告內容）
- 寄信 / 渲染時透過模板引擎把 user-supplied 欄位替換進 body 的 `{{var}}` placeholder
- 渲染端用 `->html()` 或 `{!! !!}` 等「信任 HTML」的方式輸出

→ user 在自己的欄位輸入 `<script>` payload → 模板替換時注入 admin-authored body → admin session 內執行（OWASP A03 Injection）

## 單層為什麼不夠

| 方案 | 漏洞 |
|---|---|
| 只 escape variables at substitution | admin RichEditor 本身仍可直接寫 `<iframe>` / `<script>` 進 body（admin 也可能是被釣魚 / 帳號被盜的攻擊面） |
| 只 sanitize at storage | sanitizer 看到 `{{var_name}}` 不知道之後會被替換成什麼 → 不能事前擋 user 內容注入 |
| 只 escape on render（不存原始 HTML） | 失去「admin 用 RichEditor 編輯」的核心功能 |

## Hybrid 雙層

### 薄層：escape variables at substitution

```php
// app/Support/TemplateVariables.php
public static function resolveFor($entity): array
{
    return [
        // user-supplied → e() escape（Laravel htmlspecialchars wrapper）
        'user_name' => e((string) ($entity->user_name ?? '')),
        'event_title' => e((string) ($entity->event_title ?? '')),
        'sub_items' => $entity->subItems
            ->pluck('name')
            ->filter()
            ->map(fn ($n) => e($n))
            ->implode('、'),

        // server-generated → 不需 escape
        'event_date' => $entity->starts_at?->format('Y/m/d H:i') ?? '',
        'amount' => 'NT$' . number_format((int) ($entity->total_amount ?? 0)),
    ];
}
```

關鍵：明確區分 **user-supplied**（要 escape）與 **server-generated**（不需 escape，否則格式會被破壞）。

### 厚層：sanitize at storage

Model 加 Attribute cast，寫入 DB 前過 sanitizer（HTML Purifier whitelist 模式）。

```php
// app/Models/SomeModel.php
use Illuminate\Database\Eloquent\Casts\Attribute;
use App\Support\HtmlSanitizer;

protected function body(): Attribute
{
    return Attribute::make(
        set: fn (?string $value) => $value === null ? null : HtmlSanitizer::sanitize($value),
    );
}
```

```php
// app/Support/HtmlSanitizer.php（HTMLPurifier 設定）
$config->set('HTML.Allowed', 'p,br,strong,em,u,s,h1,h2,h3,h4,ul,ol,li,a[href|target|rel],blockquote,hr,p[style]');
$config->set('HTML.TargetBlank', true);
$config->set('URI.AllowedSchemes', ['http' => true, 'https' => true, 'mailto' => true]);
$config->set('CSS.AllowedProperties', ['color', 'font-size', 'font-weight', 'text-align']);
```

## 邊界 case：`{{var}}` placeholder 保護

HTMLPurifier 對 `<a href="{{admin_url}}">` 會把 `{{` URL-encode 成 `%7B%7B`，模板引擎找不到 key。

**解法**：sanitize 前先把 `{{var}}` 替換為 unique token，sanitize 後 strtr 還原。

```php
public static function sanitize(string $html): string
{
    if ($html === '') return '';

    // 用 uniqid 前綴避免跟使用者真實內容碰撞
    $tokenPrefix = '__HSV_' . uniqid('', true) . '_';
    $tokens = [];
    $counter = 0;

    $protectedHtml = preg_replace_callback('/\{\{[^}]+\}\}/', function ($m) use (&$tokens, &$counter, $tokenPrefix) {
        $key = $tokenPrefix . $counter++ . '__';
        $tokens[$key] = $m[0];
        return $key;
    }, $html);

    $sanitized = self::purifier()->purify($protectedHtml);

    return strtr($sanitized, $tokens);
}
```

**第一版踩坑**：用 `__TPLVAR{n}__` sequential key。code reviewer 抓到：admin 若手打字面 `__TPLVAR0__` 在 body 內（debug / 技術備忘），strtr 會誤替換成 `{{var}}` → DB 寫入內容靜默改變。`uniqid` 前綴使衝突機率近乎零。

## CSS allowlist 也是攻擊面

RichEditor 通常生 `<p style="color:#xxx;font-size:Npx;">` 這類 inline style。HTMLPurifier 預設只 strip 整個 style attribute。要保留就必須：

```php
// HTML.Allowed 加 [style]
$config->set('HTML.Allowed', '... p[style] ...');
// CSS.AllowedProperties 限白名單
$config->set('CSS.AllowedProperties', ['color', 'font-size', 'font-weight', 'text-align']);
```

**為什麼這 4 個屬性安全：**
- 都是視覺樣式，無法執行 JS
- HTMLPurifier 對未知 CSS value（如 IE legacy `expression()`）直接 drop
- `position`、`text-decoration` 等不在 allowlist → 整個 declaration 被丟掉

## Test 覆蓋必備

| 測試 | 防止什麼 |
|---|---|
| `<script>` in body → 被剝 | admin 自己 / 帳號被盜寫 script |
| `<img onerror>` in body → 被剝 | event handler 注入 |
| `<iframe>` in body → 被剝 | 點擊劫持 |
| `javascript:` in href → href 被拿掉 | URL scheme 攻擊 |
| `<script>` in user-supplied variable → escape 成 `&lt;script&gt;` | user 端 stored XSS |
| 允許的 RichEditor tag（p / strong / em / a / li）→ 保留 | sanitizer 不該 over-strip |
| user 內容含 `__TPLVAR0__` 字面 → 不被誤替換 | placeholder collision regression |
| CSS allowlist：`color:red` 保留、`position:fixed` 被 strip | CSS injection 邊界 |

## OWASP 對應

主修 **A03 Injection**（stored XSS）；副修 **A04 Insecure Design**（admin trust 邊界）。

## 連結

- 安全範式：OWASP Top 10 2021 / Defense in Depth 概念
- 反模式：[[Fields-Without-Enforcement-Anti-Pattern]]（CSS allowlist 沒設 = 「欄位開了但沒 enforce」的變種）
- 規則固化：[[Ratchet-Pattern]]（placeholder collision 應該編成 regression test 永久守住）
- 抓 bug 工具：[[Adversarial-Code-Review]]（OWASP focus 是抓 stored XSS 的常見起點）
