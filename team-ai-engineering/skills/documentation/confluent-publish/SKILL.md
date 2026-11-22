---
name: confluent-publish
description: Chuẩn bị hoặc publish tài liệu lên Confluent sau khi người dùng xác nhận topic/link và quyền push.
---

# Confluent Publish

1. Hoàn thiện và review tài liệu trước khi publish.
2. Hỏi rõ người dùng có muốn push không; yêu cầu topic/link cụ thể và đồng ý rõ ràng.
3. Nếu thiếu đích, từ chối, hoặc MCP/credential chưa cấu hình, lưu task note offline.
4. Chỉ gửi payload đã được làm sạch; không publish secret, PII hay log thô.
5. Xác minh kết quả và ghi link/response thực tế. Không tuyên bố thành công nếu chưa xác nhận.
