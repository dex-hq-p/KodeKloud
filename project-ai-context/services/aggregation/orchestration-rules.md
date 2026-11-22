# Orchestration Rules: Aggregation

## Gọi dependency

- Thiết kế yêu cầu cân nhắc gọi các domain song song khi độc lập; xác minh luồng gọi và giới hạn tài nguyên trong code hiện hành trước khi thay đổi.
- Domain được nhắc đến: Benefit, Wage, Authen. Endpoint và schema chưa được ghi ở đây vì cần xác minh.

## Timeout, lỗi và fallback

- Timeout: cần xác minh theo cấu hình.
- Retry: cần xác minh theo client và loại thao tác; không retry thao tác không idempotent nếu chưa đánh giá tác động.
- Fallback: cần xác minh hành vi với từng dependency; không biến lỗi thành phản hồi thành công giả.

## Observability

- Duy trì trace/log để xác định dependency lỗi; không ghi token hoặc dữ liệu cá nhân nhạy cảm.
