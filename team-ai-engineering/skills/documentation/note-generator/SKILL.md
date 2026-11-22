---
name: note-generator
description: Tạo task note offline từ template khi tài liệu không được push hoặc cần audit trail cục bộ.
---

# Note Generator

- Xác nhận Task ID; dùng `templates/task-note-template.md`.
- Lưu artifact theo `notes/<TASK-ID>/`; tên file tuần tự như `01-analysis.md`, `02-solution.md`, `03-approval.md`, `04-push-log.md`.
- Chỉ ghi trạng thái, quyết định và thời gian thực tế; không bịa tên người duyệt hay kết quả.
- Notes bị Git ignore mặc định; không đưa secret, token, PII hoặc log chưa làm sạch vào đó.
