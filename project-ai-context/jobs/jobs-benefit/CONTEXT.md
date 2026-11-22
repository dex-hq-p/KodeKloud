# Job Context: Jobs-Benefit

## 1. Vai trò

Chạy các công việc batch cho domain Benefit. Theo thiết kế, service này không expose API; xác minh điều đó với triển khai thực tế.

## 2. Jobs

| Job | Lịch được nêu trong thiết kế | Công việc |
|---|---|---|
| `ExpireCouponJob` | 00:00 hàng ngày | Quét coupon hết hạn |
| `MonthlyChildcareJob` | Ngày 1 hàng tháng | Tính hạn mức childcare |

Lịch, timezone, cơ chế kích hoạt và hành vi chạy lại cần được xác minh trong cấu hình/runtime.

## 3. Dependency và tài liệu bắt buộc đọc

- Database: thiết kế nêu dùng chung DB với Benefit; cần xác minh quyền sở hữu schema, credential và phạm vi truy cập thực tế.
- Đọc [Benefit domain rules](../../domains/benefit/domain-rules.md) trước khi sửa logic.
- Nếu task liên quan childcare, đọc [Childcare rules](../../domains/benefit/sub-benefits/childcare/rules.md).
- Nếu task liên quan coupon, đọc [Coupon rules](../../domains/benefit/sub-benefits/coupon/rules.md).
