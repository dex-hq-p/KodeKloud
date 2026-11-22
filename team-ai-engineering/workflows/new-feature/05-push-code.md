# 05 — Deliver and Push Code

1. Báo kết quả kiểm thử và diff.
2. Hỏi quyền tạo commit riêng, remote/branch cụ thể và quyền chạy `git push` theo `03-approval-and-push.md`.
3. Nếu thiếu bất kỳ approval/đích nào, không commit/push; không tạo local approval marker.
4. Nếu được phép commit, xem lại staged diff và chỉ commit phần đã duyệt.
5. Nếu được phép push, tạo marker one-time khớp remote/branch; chạy một lệnh `git push <remote> <branch>`.
6. Xác minh kết quả, ghi branch/commit thực tế vào `notes/<TASK-ID>/04-push-log.md`.
7. Nếu không push, để thay đổi ở local và thông báo các bước người dùng có thể tự thực hiện.
