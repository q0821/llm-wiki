---
title: SHOPLINE Payments
type: entity
category: payment-gateway / commerce-infra
sources: [src-yangsheep-wp-ai-meetup-2026-spring, src-shopline-payments-wp-meetup-2026-spring]
created: 2026-05-29
updated: 2026-05-29
tags: [payment, ecommerce, wordpress, taiwan, shopline]
confidence: 中
aliases: ["SHOPLINE Payments", "SHOPLINEPayments"]
---

# SHOPLINE Payments

[SHOPLINE](https://www.shoplinepayments.com) 集團旗下的金流服務品牌，主打**整合多種支付方式 + WordPress / WooCommerce 友善整合**的台灣中小電商解決方案。

## 在本知識庫的位置

第 2 次出現觸發 entity 建立（規則：「再出現 1 次即建」）：
- 第 1 次：[[src-yangsheep-wp-ai-meetup-2026-spring|歐陽嘉隆 WP AI 設計工作流]] 簡報的贊助商列表（slide 11）
- 第 2 次：[[src-shopline-payments-wp-meetup-2026-spring|Winston Wen 支付決勝]] 同場小聚 Winston Wen 的專題簡報

## 支援的支付方式

- 信用卡（Visa / Mastercard / JCB）
- 信用卡分期付款
- LINE Pay（行動支付）
- Apple Pay
- 街口支付
- ATM 轉帳
- zingala 銀角零卡（無卡分期）

## 商業定位

- **目標客群**：服務型創業者、課程經營者、高客單服務商戶（依其 BD pitch）
- **核心 selling point**：一站式整合 × 快速開通（不需逐家對接金流）+ WordPress 外掛免費下載
- **特約申請流程**：依[[src-yangsheep-wp-ai-meetup-2026-spring|歐陽嘉隆簡報]]評語，「流程順暢」

## 自家平台數據（待獨立驗證）

來自 [[src-shopline-payments-wp-meetup-2026-spring|Winston Wen 簡報]]，未經第三方驗證：
- 客單價 > 1 萬 TWD 訂單佔比：76.8%
- 分期交易佔總訂單量：42.81%
- 服務 / 系統 / 課程類商戶季增長率：+64%

**注意**：這些數據反映 SHOPLINE Payments 已開通分期商戶的子集，可能高估全市場「分期佔比」實際水準。引用時應註明「依 SHOPLINE 平台自家數據」。

## 接案決策參考

對 WordPress 接案者（如本知識庫使用者）的判準：

| 適合導入 SHOPLINE Payments | 不必導入 |
|--------|----------|
| 客戶服務客單價多在 5,000 以上 → 分期需求高 | 低客單價（< 1,000）電商，分期需求低 |
| 客戶目標族群混合（年輕 + 熟齡）→ 需多支付方式 | 單一族群、單一支付偏好 |
| 客戶想簡化「逐家金流對接」 | 已採用 Stripe / 藍新 / 綠界等其他金流且運作良好 |
| 客戶用 WordPress / WooCommerce | 純自建 / Headless 但無金流外掛需求 |

## 競品

下列均**未在本知識庫獨立建頁**（待累積 3+ 處對話時建 [[comparison-tw-payment-gateways]] 比較頁）：
- 藍新 NewebPay
- 綠界 ECPay
- 紅陽 ESUN ePay
- Stripe（跨境主流）
- TapPay
- O'Pay 歐付寶

## 信心評估

- **強**：產品實際存在 + 支援的支付方式 + WordPress 整合（公開可驗證）
- **中**：「快速開通」「流程順暢」評語——來自 [[src-yangsheep-wp-ai-meetup-2026-spring|歐陽嘉隆贊助商口碑]] + Winston Wen 自家 pitch，需實作驗證
- **弱**：手續費比較、撥款時間、爭議處理品質——未在現有來源中討論
- **未知**：與其他金流的對比優劣（待 [[comparison-tw-payment-gateways]] 建立時補完）

## 相關概念與來源

- [[src-shopline-payments-wp-meetup-2026-spring]] — 本品牌 BD 主題簡報，含 3 結帳殺手 framework
- [[src-yangsheep-wp-ai-meetup-2026-spring]] — 贊助商列表中的第 1 次提及
- [[WordPress-接案工作筆記]] — 接案者使用情境
- [[顧客終身價值]] — 分期 / 高客單與 CLV 的關聯
