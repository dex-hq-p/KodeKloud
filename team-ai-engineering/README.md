# Team AI Engineering

Bộ cấu hình và tài liệu dùng để chuẩn hóa cách một team AI hỗ trợ phát triển
Spring Boot, React, Kafka và các quy trình Jira/Bitbucket.

## Cấu trúc

- `.kiro/`: vai trò, steering rules và cấu hình MCP được Kiro tự động đọc.
- `skills/`: hướng dẫn thao tác theo từng chuyên môn.
- `workflows/`: chuỗi bước cho các loại công việc phổ biến.
- `integrations/`: hướng dẫn kết nối hệ thống ngoài.
- `hooks/`: trigger mẫu cho các bước tự động hóa.
- `docs/`: tài liệu dành cho thành viên team.
- `examples/`: ví dụ tối thiểu cho Spring Boot và React.

## Bắt đầu

1. Đọc [getting-started.md](docs/getting-started.md).
2. Tùy chỉnh các file trong `.kiro/` theo repository và môi trường của team.
3. Điền endpoint/auth reference trong `integrations/`; không commit secret.
4. Chạy workflow phù hợp trong `workflows/`.

Các file cấu hình chỉ chứa placeholder. Secret phải được cấp qua secret manager
hoặc biến môi trường của môi trường chạy.