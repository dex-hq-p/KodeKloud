# Approval Protocol

## Checkpoints

| Checkpoint | Bằng chứng cần có | Khi chưa được duyệt |
|---|---|---|
| Solution | Developer xác nhận rõ proposal/pattern cho Task ID | Không implement phần phụ thuộc quyết định đó |
| Push tài liệu | Đồng ý rõ ràng + link/topic Confluent cụ thể | Lưu note offline |
| Push code | Đồng ý rõ ràng + remote/branch cụ thể | Không tạo marker, không chạy push |
| Production/external change | Phạm vi, tác động và approval riêng | Dừng và yêu cầu người vận hành |

Approval không suy rộng giữa task, hệ thống, artifact hay lần push. Ghi đúng nội dung người dùng xác nhận; không bịa danh tính hoặc thời gian.
