---
title: calcom/cal.diy — Cal.com 100% MIT 開源社群版
type: source
source_url: https://github.com/calcom/cal.diy
sources: [calcomcal.diy Scheduling infrastructure for absolutely everyone..md]
fetched: 2026-05-26
created: 2026-05-26
updated: 2026-05-26
tags: [open-source, scheduling, calcom, community-edition, self-host, mit-license]
confidence: 強
---

# calcom/cal.diy

[Cal.com](https://cal.com) 的**社群驅動、100% MIT 授權**完全開源分支。把 Cal.com 主專案中的 enterprise / EE features（Teams、Organizations、Insights、Workflows、SSO/SAML 等）全部移除，留下純社群版自架方案。

## 與 Cal.com 主專案的差異

| 維度 | Cal.com（主專案） | **cal.diy** |
|------|----------------|------------|
| 授權 | Open Core（Open + EE 雙層） | 100% MIT，無 EE 雙層 |
| License key | 需 Cal.com 帳號或 license key | 不需要 |
| 託管選項 | hosted SaaS + self-host | **僅 self-host**（無 managed 版） |
| Enterprise features | 包含 | 全部移除 |
| 維護模式 | 公司主導 | 社群貢獻 |

## 適用範圍（README 明示）

> 「Use at your own risk. Cal.diy is the open source community edition of Cal.com and it is intended for users who want to self-host their own Cal.diy instance. It is **strictly recommended for personal, non-production use**.」

> 「For any commercial and enterprise-ready scheduling infrastructure, **use Cal.com, not Cal.diy**.」

定位非常清楚：個人/非生產用途，企業需求請回主專案。

## 技術堆疊

- [Next.js](https://nextjs.org/)
- [tRPC](https://trpc.io/)
- React
- [Tailwind CSS](https://tailwindcss.com/)
- [Prisma](https://prisma.io/)
- [Daily.co](https://daily.co/)

部署環境需求：Node.js >=18.x、PostgreSQL >=13.x、Yarn。`yarn dx` 一鍵啟動本地 Docker Postgres 含預設測試帳號。

## 與 wiki 既有對話組的對位

### 「商業 vs 開源」反向案例

cal.diy 是「**商業 SaaS 主動剝掉 enterprise 變回純開源**」的案例，剛好與本 wiki 既有的 [[HermesOS]] 路徑形成**反向對映**：

| 方向 | 起點 | 終點 | 案例 |
|------|------|------|------|
| ← 商業化 | 開源框架（[[Hermes-Agent]]） | managed cloud + 商業訂閱 | [[HermesOS]] |
| → 開源化 | 商業 SaaS（Cal.com） | 純 MIT 社群版 + 僅 self-host | **cal.diy** |

兩者是「open-source ↔ commercial」連續譜上的不同點。

### 對 [[src-design-md-revolution|DESIGN.md 革命]] 表格的補充

該 src 中 Cal.com 列在「Productivity & SaaS 7 個 DESIGN.md 來源」之一（與 Linear / Notion / Intercom / Zapier / Mintlify / Resend 並列）。Cal.com 本身是「品牌設計系統可作為 DESIGN.md 範例」的 7 家之一；cal.diy 則是 Cal.com 的開源分支。

## 信心評估

- **強**：repo 存在、授權、技術堆疊、社群版定位——是 first-party README
- **中**：實際使用者規模、社群活躍度——未進一步驗證
- **觀察**：「strictly personal, non-production use」的警語很罕見，代表 Cal.com 公司**主動把生產級流量導回付費版**，這是 open core 經營策略的明確訊號

## 相關來源

- [[src-design-md-revolution]] — Cal.com 作為 DESIGN.md 範例之一的脈絡

## 未來追蹤候選

- 若使用 cal.diy 自架，記錄實際體驗（performance、限制、社群支援等）
- 若 wiki 累積多個「商業 SaaS 開源社群版」案例（如 Linear 開源分支、Notion 替代品），可考慮建一個「open core 反向案例」綜整頁
