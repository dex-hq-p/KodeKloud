# Security Headers

## Header được nhắc đến trong thiết kế

| Header | Mục đích dự kiến | Điều cần xác minh |
|---|---|---|
| `X-User-Id` | Định danh người dùng đã được xác thực | Thành phần nào tạo header, cách xác thực nguồn gửi và định dạng giá trị |
| `X-Tenant-Id` | Chọn tenant/phạm vi dữ liệu | Nguồn tenant tin cậy, quyền truy cập chéo tenant và cách xử lý giá trị thiếu |

## Nguyên tắc an toàn

- Không tin header định danh do client gửi trực tiếp. Chỉ chấp nhận giá trị được xác thực hoặc ghi đè tại biên tin cậy theo cấu hình hệ thống.
- Không dùng các header này thay cho xác thực hoặc phân quyền.
- Kiểm tra quyền truy cập tenant ở mọi đường truy cập dữ liệu liên quan; không chỉ dựa vào việc đã có `X-Tenant-Id`.
- Không ghi token, thông tin xác thực hoặc dữ liệu cá nhân nhạy cảm vào log/context.
- Xác minh danh sách header, quy tắc truyền tiếp và cơ chế chống giả mạo tại Gateway trước khi triển khai thay đổi.
