---
title: Fields Without Enforcement（欄位存在 ≠ enforcement 路徑會檢查）反模式
type: concept
sources: []
created: 2026-05-15
updated: 2026-05-15
tags: [anti-pattern, security, code-quality, codex-finding, owasp]
confidence: 強
---

# Fields Without Enforcement Anti-Pattern

> Schema / Form / UI 上加了「業務規則用」的欄位，**但 enforcement 路徑沒檢查它**。欄位看起來生效、實際邏輯卻照走。最容易在「欄位定義」與「使用邏輯」相隔多個檔時出現。

**來源**：個人實作累積（已去識別）。

## 本質

```
schema 有 X 欄位 + form 給 admin 設 X
                ↓ 卻不被
邏輯路徑 P 跑時只看 Y 不看 X
                ↓ 結果
admin 以為 X 生效，實際只有 Y 生效
```

兩件事**分離**就會踩：
1. **欄位的存在**（schema / migration / model `$fillable` / form UI）
2. **欄位的使用**（service / calculator / policy / view）

「分離」是必要的（關注點分離），但「沒接上」就是 bug。

## 三個範式案例

### 案例 A — 業務欄位齊全但 calculator 只看一個 flag

```php
// 某 Coupon model：欄位都在
protected $fillable = [
    'code', 'discount_type', 'discount_value',
    'valid_from', 'valid_until',         // ← 有
    'usage_limit', 'usage_count',         // ← 有
    'notes', 'is_active',
];

// PriceCalculator：只看 is_active
private function couponDiscount(?Coupon $coupon, int $subtotal): int
{
    if ($coupon === null || ! $coupon->is_active) {    // ← 只檢查這個
        return 0;
    }
    // 套用折扣 — valid_until 過期不檢查、usage_limit 滿不檢查
}
```

結果：admin 設了「優惠碼到某日過期」「限用 100 次」，**完全沒生效**。使用者拿過期碼還是有折扣。

修法：把資格檢查封裝在 model method，calculator 呼叫它：

```php
class Coupon extends Model
{
    public function isCurrentlyUsable(?Carbon $at = null): bool
    {
        if (! $this->is_active) return false;
        $at ??= Carbon::now();
        if ($this->valid_from && $at->lt($this->valid_from)) return false;
        if ($this->valid_until && $at->gt($this->valid_until)) return false;
        if ($this->usage_limit !== null && $this->usage_count >= $this->usage_limit) return false;
        return true;
    }
}

// Calculator
if ($coupon === null || ! $coupon->isCurrentlyUsable($at)) return 0;
```

### 案例 B — Migration default 配 policy = silent backdoor

```php
// migration
$table->string('role')->default('admin')->after('email');

// User::canAccessPanel()
return in_array($this->role, [UserRole::Admin, UserRole::Staff], strict: true);
```

各自合法、組合起來：**migration 跑完當下既有的 users 全部被 implicit backfill 成 Admin**——等同 admin panel 對所有先前 user 開放。

修法：security-relevant 欄位**一律 nullable + 由明確 seeder 寫值**。

```php
// migration
$table->string('role')->nullable()->after('email');

// AdminUserSeeder 顯式建立管理員（從 env 取，不靠 default）
```

### 案例 C — 批次操作狀態先寫、實際動作後寫

```php
// 反模式
$batch = BatchOperation::create([
    'recipient_count' => $count,
    'completed_at' => now(),   // ← 動作之前就先寫
]);

foreach ($items as $item) {
    try {
        Service::process($item);
    } catch (\Throwable $e) {
        // 寫 failed row，但 batch.completed_at 已經是「成功」
    }
}

Notification::make()->title("已完成 {$count} 筆")->success()->send();
```

操作者看到「已完成 N 筆 ✅」，實際可能 0 筆完成。**state mutation 與 actual work 順序錯了**。

修法：「嘗試 → 累計結果 → 寫狀態」

```php
$batch = BatchOperation::create([...]);  // 骨架先寫但不含 success 狀態

$success = $failed = $skipped = 0;
foreach ($items as $item) {
    if (! $item->ready_to_process) { $skipped++; continue; }
    try { Service::process($item); $success++; }
    catch (\Throwable $e) { $failed++; }
}

$batch->update([
    'success_count' => $success,
    'failed_count' => $failed,
    'skipped_count' => $skipped,
]);

// 依結果切換 notification severity
if ($success === 0 && ($failed > 0 || $skipped > 0)) {
    Notification::make()->title('全數未完成')->danger()->send();
} elseif ($failed > 0 || $skipped > 0) {
    Notification::make()->title('部分未完成')->warning()->send();
} else {
    Notification::make()->title("已完成 {$success} 筆")->success()->send();
}
```

## 為什麼難抓

| 觀察角度 | 看到的 | 看不到的 |
|---|---|---|
| 只讀 schema | 欄位完整、漂亮 | 沒有 enforcement |
| 只讀 model | 有 method、有 cast | 邏輯路徑漏檢查 |
| 只讀 service | 邏輯清楚 | 欄位被忽略 |
| 跑測試 | 既有 test 都過 | 沒測「欄位 + 邏輯交互」的測試 |
| Human review | 順著 diff 讀 | 跨檔組合性 bug |

→ 這正是 [[Adversarial-Code-Review]] 強的地方：不疲倦地交叉檢查欄位 vs 邏輯路徑。

## 防護三件套

1. **業務規則 enforcement 封裝在 model method 或 service**——不要散在 form / action / controller / view
2. **每條規則都有 regression 測試證明 enforcement 真的會檢查**——正例（生效）+ 反例（不該生效時真的沒生效）
3. **Security-relevant 欄位避免 non-null default**——nullable + 明確 setter > default value

## 對應 OWASP Top 10（2021）完整映射

| OWASP | Anthropic Inexperience 對應 | Fields-Without-Enforcement 範式 | 本 wiki 相關頁 |
|---|---|---|---|
| **A01 Broken Access Control** | Broken access controls | 案例 B：non-null default 升權 backdoor | [[Adversarial-Code-Review]] OWASP focus 必查項 |
| **A02 Cryptographic Failures** | （隱含）Exposed customer data | （本頁未直接涵蓋——加密處理算另一範式） | — |
| **A03 Injection** | Injection vulnerabilities | 案例 C 變種：audit log 紀錄被 inject | [[Hybrid-XSS-Defense]] |
| **A04 Insecure Design** | — | **核心命中**：enforcement 與欄位設計分離 | 本頁 |
| **A05 Security Misconfiguration** | — | 案例 A 變種：framework default 開太大 | [[Verify-Framework-Version-First]] |
| **A06 Vulnerable Components** | — | （本頁未直接涵蓋——依賴管理另一範式） | — |
| **A07 Identification & Auth Failures** | Weak authentication | （本頁未列，但同源） | — |
| **A08 Software & Data Integrity** | — | 案例 C 子集：state 紀錄 ≠ 實際結果 | — |
| **A09 Security Logging & Monitoring Failures** | Lack of audit trails | **案例 C 核心命中**：成功訊息與實際結果不符 | — |
| **A10 SSRF** | — | （本頁未直接涵蓋） | — |

→ 本反模式**主要命中 A04（核心）+ A01（案例 B）+ A09（案例 C）**，是「設計層級」的問題而非單純實作 bug。

## Anthropic 官方版根因命名：「Insecure by Inexperience」（[[src-anthropic-founders-playbook-2026]]）

Anthropic Founder's Playbook 章 4 把「欄位有 / enforcement 漏」這類**漏洞的根因**從技術面提升到創業情境面，官方命名為 **「Insecure by inexperience」**：

> 「Many AI-native founders are building applications without traditional engineering backgrounds, leaving them susceptible to security gaps a more experienced engineer wouldn't miss—**injection vulnerabilities, broken access controls, weak authentication, exposed customer data, and lack of audit trails**.」

Anthropic 列舉的 5 大 inexperience-driven 漏洞——本頁三範式都對應其中：

| Anthropic 列的 | 對應本頁範式 |
|---|---|
| Injection vulnerabilities | 案例 C 的審計 log 紀錄事實不符（log injection 變種） |
| **Broken access controls** | **案例 B 的 role default backdoor** |
| Weak authentication | （本頁未列，但同源） |
| Exposed customer data | （案例 B 升權即此） |
| **Lack of audit trails** | **案例 C 的 state 紀錄 ≠ 實際結果** |

→ 解法上，Anthropic 推薦把 [[Adversarial-Code-Review|Claude as structured devil's advocate]] 視為「**沒有資深 senior engineer reviewer 時的補位**」——這正是本頁「防護三件套」第 2 條（regression test + adversarial review）的官方背書。

## 連結

- 抓 bug 工具：[[Adversarial-Code-Review]]（最有效的探測手段）
- 防護機制：[[Subagent-Driven-Development]]（regression test in TDD 流程內建）
- 規則固化：[[Ratchet-Pattern]]（每次踩雷後編碼成永久 regression test）
- 創業情境根因：[[AI-Native-Startup]] / [[src-anthropic-founders-playbook-2026]] 的「Insecure by inexperience」官方命名
- 一句話總結：「明確 > 隱含」的具體展開
