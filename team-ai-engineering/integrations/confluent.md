# Confluent Integration

Đặt `CONFLUENT_MCP_URL` và `CONFLUENT_MCP_TOKEN` qua secret manager.

- Chỉ cấp quyền đọc schema/topic khi phân tích.
- Xác minh cluster, environment, topic owner và compatibility trước thay đổi.
- Không gửi message production trong môi trường phát triển nếu chưa được phê duyệt.
