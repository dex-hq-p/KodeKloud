---
name: codebase-scanner
description: Khảo sát codebase có giới hạn để xác định luồng, file liên quan, test và dependency cho một task.
---

# Codebase Scanner

- Bắt đầu từ symbol, endpoint, package hoặc mô tả task cụ thể; dùng search hẹp trước.
- Theo luồng call/data cần thiết và đọc test liên quan.
- Báo file/symbol, quan hệ đã xác nhận và câu hỏi mở; không suy rộng từ tên file.
- Không biến khảo sát thông thường thành audit bảo mật hoặc quét toàn repo khi chưa được yêu cầu.
