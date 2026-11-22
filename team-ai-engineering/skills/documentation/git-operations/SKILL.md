---
name: git-operations
description: Kiểm tra trạng thái Git và chuẩn bị commit/push; luôn yêu cầu remote, branch và quyền push rõ ràng.
---

# Git Operations

- Trước tiên kiểm tra status/diff; không xóa hoặc sửa thay đổi có sẵn ngoài task.
- Không commit/push theo mặc định. Hỏi quyền tạo commit riêng, đồng thời yêu cầu remote, branch và xác nhận `git push`.
- Chỉ hỗ trợ một lệnh `git push <remote> <branch>` sau approval; hook one-time sẽ xác thực đích.
- Không dùng force push, xóa branch/tag hoặc thay đổi history trừ khi người dùng yêu cầu cụ thể và xác nhận rủi ro.
- Ghi commit hash/remote/branch sau khi kiểm chứng; không lưu credential.
