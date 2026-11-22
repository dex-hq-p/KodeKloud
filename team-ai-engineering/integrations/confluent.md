# Confluent Integration

- Cấu hình endpoint/credential bằng secret manager hoặc profile môi trường, không commit vào repo.
- Trước khi publish, hỏi developer xác nhận và cung cấp topic/link cụ thể.
- Preview/review payload; loại bỏ secret, PII và log thô.
- Ghi nhận kết quả/link thực tế; nếu không publish, lưu note offline.
