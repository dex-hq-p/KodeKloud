# Service Context: Aggregation (BFF)

## 1. Vai trò

Điều phối dữ liệu từ các domain (ví dụ Benefit, Wage, Authen) để trả về cho Frontend. Danh sách dependency và response thực tế cần xác minh trong code.

## 2. Ranh giới

- **Được phép:** gọi API domain, tổng hợp/merge dữ liệu, định dạng ngày tháng và tính tổng phục vụ hiển thị nếu không làm thay đổi ý nghĩa nghiệp vụ.
- **Không được phép:** tự triển khai quyết định nghiệp vụ cốt lõi. Ví dụ: không tự tính quy tắc tiền coupon; gọi domain Benefit làm chủ nghiệp vụ đó.

## 3. Tài liệu chi tiết

- Gọi API, timeout, retry và fallback: [orchestration-rules.md](./orchestration-rules.md).
- Gộp dữ liệu và format DTO: [aggregation-logic.md](./aggregation-logic.md).
