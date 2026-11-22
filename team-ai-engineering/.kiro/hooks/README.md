# Hook Notes

- `after-file-edit.json` dùng hook `PostFileSave` để nhắc agent chạy ESLint cho file React vừa lưu. Cần xác minh matcher và package script tại workspace tiêu thụ.
- `before-git-push.json` dùng `PreToolUse` và command hook; exit code `2` chặn lệnh khi không có approval one-time khớp remote/branch.
- Approval marker là local state tại `.kiro/local/push-approval.json`, bị Git ignore và được hook xóa khi dùng. Marker cần `task_id`, `approved_by`, `approved_at`, `expires_at`, `remote`, `branch`; thời hạn tối đa 10 phút. Chỉ tạo sau xác nhận rõ ràng của developer cho đúng task/đích.
- Hook là guardrail; vẫn phải giữ permission prompt, branch protection và review phía server.
