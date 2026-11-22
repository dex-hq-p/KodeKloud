# Team AI Engineering

Bộ cấu hình dùng chung để các agent hỗ trợ phân tích, thiết kế, phát triển, kiểm thử và bàn giao phần mềm theo AIDLC. Cấu hình trong repo là khung dùng chung; thông tin nhạy cảm và cấu hình riêng môi trường phải được cấp bên ngoài repo.

## Bắt đầu

1. Đọc [tổng quan thiết kế](./docs/project-design-overview.md).
2. Chọn agent và workflow phù hợp với task.
3. Cấu hình MCP theo hướng dẫn tại [integrations/](./integrations/) và giữ secret bên ngoài repo.
4. Cung cấp Task ID. Nếu không push tài liệu, lưu kết quả cục bộ trong `notes/<TASK-ID>/`.
5. Chỉ push tài liệu/code sau khi người dùng xác nhận rõ đích đến và quyền thực hiện.

## Thành phần

- `.kiro/agents/`: vai trò và phạm vi của từng agent.
- `.kiro/steering/`: chính sách dùng chung và quy trình bắt buộc.
- `.kiro/hooks/`: ESLint sau khi sửa file và cổng kiểm tra push.
- `workflows/`: các giai đoạn AIDLC và checkpoint.
- `skills/`: hướng dẫn chuyên môn có thể tái sử dụng.
- `templates/`: mẫu analysis, solution, approval, task note và bug report.
- `profiles/`: cấu hình mở rộng theo team.
- `notes/`: ghi chú offline, bị Git ignore mặc định.

## Phiên bản

Phiên bản hiện tại: xem [VERSION](./VERSION) và [CHANGELOG.md](./CHANGELOG.md).

## An toàn

- Không commit secret, token, dữ liệu cá nhân hoặc log chưa được làm sạch.
- Không tự ý push. Quy định chi tiết tại [03-approval-and-push.md](./.kiro/steering/03-approval-and-push.md).
- Hook push là một lớp bảo vệ bổ sung; vẫn cần review lệnh và xác nhận tương tác của người dùng.
