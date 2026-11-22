# Job Rules: Jobs-Benefit

## ExpireCouponJob

- Theo thiết kế, quét coupon hết hạn lúc 00:00 hàng ngày.
- Xác minh timezone, điều kiện xác định hết hạn, cập nhật trạng thái và hành vi chạy lại trước khi thay đổi.
- Đọc [Coupon rules](../../domains/benefit/sub-benefits/coupon/rules.md).

## MonthlyChildcareJob

- Theo thiết kế, chạy ngày 1 hàng tháng để tính hạn mức childcare.
- Xác minh timezone, kỳ tính, eligibility, cách tránh tính trùng và xử lý lỗi một phần.
- Đọc [Childcare rules](../../domains/benefit/sub-benefits/childcare/rules.md).

## Vận hành chung

- Xác minh idempotency, retry, logging và alerting từ code/cấu hình.
- Không chạy lại batch trên production hoặc thay đổi dữ liệu production khi chưa theo quy trình vận hành được phê duyệt.
