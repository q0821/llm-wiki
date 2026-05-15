<!--
source-url: https://akiraxclaw.com/blog/claude-app-flow-documentation-trick-2026
fetched: 2026-05-14
fetched-method: 使用者手動複製貼上（會員牆，markdown.new 與 WebFetch 均無法擷取）
related-raw: 讓 Claude 把你的 App 流程畫成一頁 HTML：開發者省下一半溝通成本的小技巧.md（投遞時只有 URL）
-->

這不是什麼大技術，但 Dave Jeffery 分享的這個用法值得記下來。

把它放進你和 Claude 的工作流裡，少掉的是那種「每次開新對話都要重新解釋系統」的摩擦感。

做法
讓 Claude 描述和記錄你 app 的主要流程，輸出成：

單一頁面 HTML：視覺化的流程圖，給人看的
JSON 資料檔：結構化的流程描述，給 AI 看的
這兩個輸出是同一份資訊的兩種呈現方式。HTML 讓你跟其他人溝通，JSON 讓你在處理後續任務時能直接帶進 context。

為什麼 JSON 版本有用
Dave Jeffery 在推文裡說的很清楚：「JSON 檔在處理新功能或 bug 修復時，能很有效地幫助 AI 理解流程。」

這個邏輯背後是一個 AI coding 工具常見的痛點：你開一個新的 Claude Code 對話，模型對你的系統一無所知，你要花大量時間解釋「這個 endpoint 是幹嘛的」、「這個 state 是從哪裡來的」。

如果你有一份 JSON 格式的 app flow 文件，直接把它帶進 context，AI 拿到的是結構化的系統地圖，而不是從你零散的描述裡拼湊理解。

怎麼操作
可以這樣 prompt：

請分析這個 codebase 的主要使用者流程，並：
1. 識別所有核心流程（用戶登入、購買流程、核心功能等）
2. 用文字描述每個流程的步驟和狀態轉換
3. 輸出成一個單一頁面 HTML，用視覺化方式呈現這些流程
4. 同時輸出一份 JSON 資料檔，用結構化格式描述同樣的流程

JSON 格式參考：
{
  "flows": [
    {
      "name": "用戶登入",
      "steps": [...],
      "states": [...],
      "transitions": [...]
    }
  ]
}
之後每次開新對話，把 JSON 檔的內容貼進 context 開頭，或者存成一份系統說明文件讓 Claude 自動讀取。

對哪種場景最有用
這個技巧在幾個情境特別有感：

多人協作專案：新成員加入時，HTML 版本是一份比 wiki 更容易理解的系統地圖。

長期維護的 codebase：你自己也會忘記三個月前寫的流程邏輯。JSON 文件等於是系統的「記憶外掛」。

頻繁使用 AI coding 工具：Claude Code、Cursor 等工具每次對話都是新的 context。有一份結構化的系統描述，比每次靠 AI 從零讀 code 快。

bug 追蹤：當你說「第 3 步應該跳到 B 頁面但跑到了 C」，AI 能對照流程圖準確定位問題在哪，而不是對著 stack trace 猜。

一個值得養成的習慣
這個技巧本質上是在幫 AI 建立對你系統的長期記憶，用你能控制的格式。

不是每個 feature 都需要做，但對系統核心流程——用戶認證、核心業務邏輯、狀態管理——維護一份這樣的文件，你和 AI 工具的協作效率都會提高。

做一次，往後省很多次「從頭解釋」的時間。
https://x.com/DaveJ/status/2053867258653339746?s=20
