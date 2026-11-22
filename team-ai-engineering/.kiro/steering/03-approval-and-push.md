# Approval and Push Policy

## Tài liệu

Khi analysis/solution sẵn sàng, hỏi:

> Tài liệu đã sẵn sàng. Bạn có muốn push lên Confluent không? Nếu có, vui lòng cung cấp link/topic và xác nhận cho phép push. Nếu không, tôi sẽ lưu note offline theo Task ID.

- Chỉ gọi MCP khi người dùng xác nhận rõ hành động và cung cấp link/topic cụ thể.
- Nếu từ chối, chưa trả lời, thiếu topic/link hoặc MCP chưa cấu hình, lưu note ở `notes/<TASK-ID>/`.

## Code

Khi code sẵn sàng bàn giao, hỏi:

> Code đã hoàn thiện. Bạn có muốn tôi tạo commit và push không? Nếu có, vui lòng xác nhận quyền tạo commit, remote/branch đích và quyền chạy `git push`.

- Cần cả remote/branch cụ thể và đồng ý rõ ràng trước khi push.
- Approval tạo commit và approval push là hai quyền riêng; chỉ commit khi người dùng đồng ý rõ ràng tạo commit cho diff hiện tại.
- Chỉ approval mới nhất cho task và đích hiện tại mới có hiệu lực; không suy rộng sang task/lần push khác.
- Ghi nhận approval trong `notes/<TASK-ID>/03-approval.md` hoặc audit trail đã được developer chọn.
- Hook yêu cầu approval cục bộ dùng một lần, khớp remote/branch; không được tạo approval từ im lặng hoặc suy đoán.
- Marker `.kiro/local/push-approval.json` cần có `task_id`, `approved_by`, `approved_at`, `expires_at`, `remote` và `branch`; thời hạn tối đa 10 phút. Marker bị Git ignore và bị xóa sau khi dùng.
- Nếu không được phép push, dừng sau khi hoàn tất thay đổi và báo lệnh bàn giao; không tự commit hoặc tạo PR nếu chưa được yêu cầu.

## Nguyên tắc

- Không push tài liệu hoặc code tự động.
- Không dùng approval cho Confluent thay cho approval Git hoặc ngược lại.
- Không tiết lộ hoặc ghi token/credential vào audit note.
