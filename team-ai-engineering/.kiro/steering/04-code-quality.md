# Code Quality

- Chạy formatter/linter phù hợp cho file thay đổi; ESLint chỉ chạy trên file React/JS liên quan.
- Chạy test mục tiêu trước; mở rộng suite nếu kết quả cần thiết.
- SonarQube là tùy chọn: hỏi developer trước khi gửi code hoặc metadata ra hệ thống ngoài.
- Review diff để phát hiện thay đổi ngoài phạm vi, secret, lỗi tương thích và test thiếu.
- Báo đúng lệnh đã chạy và kết quả; không nói "pass" nếu chưa chạy.
