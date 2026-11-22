# 03 — Approval Checkpoint

Gửi solution cho developer và chờ xác nhận rõ ràng gắn với Task ID. `/approve` chỉ xác nhận proposal hiện tại đã được nêu; không đồng nghĩa cho phép push, production operation hoặc thay đổi ngoài proposal.

- Nếu được duyệt: ghi nhận bằng `templates/approval-template.md`, rồi chuyển bước implement.
- Nếu bị từ chối/yêu cầu sửa: cập nhật proposal và chờ duyệt lại.
- Nếu chưa có phản hồi: dừng, không implement phần phụ thuộc approval.
