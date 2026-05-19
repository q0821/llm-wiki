<!--
source-url: https://www.bnext.com.tw/article/90965/claude.md-claude-code
title: CLAUDE.md這樣寫才對！12條規則一次整理，讓Claude Code錯誤率從41%降至3%
author: 蘇柔瑋
published: 2026-05-18
fetched: 2026-05-19
fetched-method: WebFetch（fetch-url.sh 上次對 Cloudflare blog 超時 60 秒；跳過直接 WebFetch）
-->

# CLAUDE.md這樣寫才對！12條規則一次整理，讓Claude Code錯誤率從41%降至3%

**作者**：蘇柔瑋
**發表日期**：2026.05.18
**分類**：AI與大數據
**來源**：數位時代 BusinessNext

---

## 重點摘要

- 開發者將CLAUDE.md規則從4條擴充至12條，使Claude程式碼錯誤率從11%降至3%
- 新增8條規則主要解決複雜AI代理問題，涵蓋詞元預算管理、多步驟檢查點、程式碼衝突突顯等
- 實測未降低指令遵循度（從78%降至76%），反而有效彌補舊版規則在大型專案與長期任務的盲點

---

## 問題的起源：AI助理為什麼會出錯？

OpenAI共同創辦人卡帕西（Andrej Karpathy）於2026年初指出AI在編寫程式碼時的3個常見缺失：

1. "AI 遇到不確定的情境時，不會詢問使用者，而是自行假設並繼續執行"，導致產出與需求不符
2. AI傾向以複雜架構解決簡單問題，引入多餘抽象層與不必要功能
3. AI修改指定程式碼時，常順手「整理」周邊不相關程式碼、格式或註解，造成難以追蹤的副作用

---

## 一篇抱怨文，意外變成全球12萬人都在用的解法

軟體工程師Forrest Chang將卡帕西的問題整理成4條具體行為規則，發佈於GitHub的「CLAUDE.md」檔案。這份65行的檔案在GitHub上獲得超過12萬顆星，成為2026年成長最快的開源專案。

### 原始4條規則的核心要點

**規則1：寫程式前先思考** — 實作前務必釐清所有假設與模糊地帶，絕不盲目猜測；若有更簡單解法應主動提出，遇到不清楚處必須立刻停下來發問。

**規則2：簡單至上** — 只用最少程式碼解決當下問題，嚴格拒絕過度工程化、推測未來需求的功能或不必要抽象層。

**規則3：手術式修改** — 只精準更動與需求直接相關的範圍，絕對不去「順手改善」或重構旁邊未損壞的程式碼，只負責清理本次修改才變成無用的變數。

**規則4：目標導向執行** — 將任務轉化為「可被驗證的具體目標」，為多步驟任務建立帶有檢查點的計畫。

---

## 從4條擴增到12條：新的問題在哪裡？

資深AI工程師Mnimiy發現原始4條規則主要針對「單次對話中的寫程式錯誤」，但面對2026年複雜的多步驟AI代理協作與大型專案時，會暴露出4個關鍵漏洞：

1. **無法應付長時間運作的多步驟任務**：缺乏Token預算與進度檢查點，導致AI在長任務中容易迷失方向、悄悄把錯誤疊加
2. **在多程式碼庫中會引發風格混亂**：AI會試圖將相衝的寫法「平均融合」，反而寫出更難除錯的程式碼
3. **產生為通過而通過的無效測試**：AI為了交差，寫出毫無業務價值、只為亮綠燈的淺層測試
4. **扼殺原型開發的彈性**：「簡單至上」規則對快速搭建框架、探索方向的原型開發反而會綁手綁腳

---

## 新增的8條規則解決了什麼問題？

### 規則5：只讓AI做需要判斷力的事

```
Use Claude for: classification, drafting, summarization, extraction from unstructured text.
Do NOT use Claude for: routing, retries, status-code handling, deterministic transforms.
If a status code already answers the question, plain code answers the question.
```

### 規則6：強制設定詞元預算上限

```
Per-task budget: 4,000 tokens.
Per-session budget: 30,000 tokens.
If a task is approaching budget, summarize and start fresh. Do not push through.
Surfacing the breach > silently overrunning.
```

### 規則7：衝突要攤開講，禁止混合寫法

```
If two existing patterns in the codebase contradict, don't blend them.
Pick one (the more recent / more tested), explain why, and flag the other for cleanup.
"Average" code that satisfies both rules is the worst code.
```

### 規則8：寫程式前先讀懂周邊程式碼

```
Before adding code, read the file's exports, the immediate caller, and any obvious shared utilities.
If you don't understand why existing code is structured a way, ask before adding to it.
"Looks orthogonal to me" is the most dangerous phrase in this codebase.
```

### 規則9：測試要驗證為什麼，不只是有沒有

```
Every test must encode WHY the behavior matters, not just WHAT it does.
A test like expect(getUserName()).toBe('John') is worthless if the function takes a hardcoded ID.
If you can't write a test that would fail when business logic changes, the function is wrong.
```

### 規則10：多步驟任務每完成一步就要回報

```
After completing each step in a multi-step task: summarize what was done, what's verified, what's left.
Don't continue from a state you can't describe back to me.
If you lose track, stop and restate.
```

### 規則11：遵從現有慣例，不要偷偷引入新風格

```
If the codebase uses snake_case and you'd prefer camelCase: snake_case.
If the codebase uses class-based components and you'd prefer hooks: class-based.
Disagreement is a separate conversation. Inside the codebase, conformance > taste.
If you genuinely think the convention is harmful, surface it. Don't fork it silently.
```

### 規則12：主動揭露錯誤，禁止隱性失敗

```
If you can't be sure something worked, say so explicitly.
"Migration completed" is wrong if 30 records were skipped silently.
"Tests pass" is wrong if you skipped any.
"Feature works" is wrong if you didn't verify the edge case I asked about.
Default to surfacing uncertainty, not hiding it.
```

---

## 完整12條規則範本

```markdown
# CLAUDE.md — 12-rule template

These rules apply to every task in this project unless explicitly overridden.
Bias: caution over speed on non-trivial work. Use judgment on trivial tasks.

## Rule 1 — Think Before Coding
State assumptions explicitly. If uncertain, ask rather than guess.
Present multiple interpretations when ambiguity exists.
Push back when a simpler approach exists.
Stop when confused. Name what's unclear.

## Rule 2 — Simplicity First
Minimum code that solves the problem. Nothing speculative.
No features beyond what was asked. No abstractions for single-use code.
Test: would a senior engineer say this is overcomplicated? If yes, simplify.

## Rule 3 — Surgical Changes
Touch only what you must. Clean up only your own mess.
Don't "improve" adjacent code, comments, or formatting.
Don't refactor what isn't broken. Match existing style.

## Rule 4 — Goal-Driven Execution
Define success criteria. Loop until verified.
Don't follow steps. Define success and iterate.
Strong success criteria let you loop independently.

## Rule 5 — Use the model only for judgment calls
Use me for: classification, drafting, summarization, extraction.
Do NOT use me for: routing, retries, deterministic transforms.
If code can answer, code answers.

## Rule 6 — Token budgets are not advisory
Per-task: 4,000 tokens. Per-session: 30,000 tokens.
If approaching budget, summarize and start fresh.
Surface the breach. Do not silently overrun.

## Rule 7 — Surface conflicts, don't average them
If two patterns contradict, pick one (more recent / more tested).
Explain why. Flag the other for cleanup.
Don't blend conflicting patterns.

## Rule 8 — Read before you write
Before adding code, read exports, immediate callers, shared utilities.
"Looks orthogonal" is dangerous. If unsure why code is structured a way, ask.

## Rule 9 — Tests verify intent, not just behavior
Tests must encode WHY behavior matters, not just WHAT it does.
A test that can't fail when business logic changes is wrong.

## Rule 10 — Checkpoint after every significant step
Summarize what was done, what's verified, what's left.
Don't continue from a state you can't describe back.
If you lose track, stop and restate.

## Rule 11 — Match the codebase's conventions, even if you disagree
Conformance > taste inside the codebase.
If you genuinely think a convention is harmful, surface it. Don't fork silently.

## Rule 12 — Fail loud
"Completed" is wrong if anything was skipped silently.
"Tests pass" is wrong if any were skipped.
Default to surfacing uncertainty, not hiding it.
```

---

## 實測結果：3大亮點

### 亮點一：錯誤率呈現兩階段驟降

Mnimiy在30個不同的程式碼庫中進行為期6週的盲測：

- 沒有規則約束：AI處理任務的錯誤率高達41%
- 套用4條基礎規則後：錯誤率削弱至11%
- 套用完整12條規則後：錯誤率壓縮至3%

12條規則在測試中的整體合規率為76%，仍有約四分之一的情況下AI不會主動套用規則。

### 亮點二：破除「規則越多越失控」的遵循度迷思

實測發現將規則從4條擴充至12條後，AI的指令遵循度僅從78%微幅下滑至76%。

### 亮點三：注意力預算互不衝突

原有的4條規則處理基礎寫碼邏輯，新增的8條規則應對多步驟任務、預算控管與測試無效等進階痛點，兩者並不會在AI處理單一任務時互相爭奪注意力預算。

---

## 哪些「常見提示詞」其實是毒藥？

Mnimiy實測發現網路上流傳的許多寫code提示詞技巧，反而會破壞AI的表現：

**1. 寫範例不如寫規則** — 範例非常消耗上下文預算（3個範例的詞元消耗量相當於約10條抽象規則）。AI會對範例產生「過度擬合」，變得不知變通。應使用抽象規則，不要用具體範例。

**2. 情緒喊話與角色扮演是純雜訊** — 告訴AI「請仔細思考」、「你要表現得像個資深工程師」完全沒用。這類無法被驗證的空泛指令，會讓指令遵循度暴跌至30%。指令必須是具體的動作。

**3. 依賴特定工具的死指令** — 規定AI「永遠使用ESLINT程式碼檢查工具」是個陷阱，因為一旦專案沒安裝該工具，這條規則就會默默失效。應改用不受工具限制的說法。

Mnimiy強調，「一個針對你真實痛點量身打造的6條規則，絕對勝過一個塞滿了6條你永遠用不到的12條規則範本。」不要盲目套用這12條規則，每一條寫進去的規則都必須能回答一個問題：「這能防止我實際遇過的什麼錯誤？」

---

## 延伸閱讀

- AI用錯方式，就算10分鐘也會變笨！研究揭「只問提示、不要答案」一招保住思考力（bnext 90921）
- Claude Code快捷鍵+指令大全！13大類速查不用背（bnext 90925）

**資料來源**：Mnimiy X（https://x.com/Mnilax/status/2053116311132155938）
