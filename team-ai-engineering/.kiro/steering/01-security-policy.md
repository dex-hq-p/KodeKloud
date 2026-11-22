# Security Policy

- Xác thực và phân quyền phải được kiểm tra phía server; không tin dữ liệu do client tự khai.
- Validate input, encode output và dùng truy vấn tham số hóa.
- Secret chỉ được cấp qua secret manager hoặc cơ chế an toàn của môi trường; không commit vào repo/MCP config.
- Làm sạch log trước khi đưa vào prompt hoặc note; không ghi credential, token đầy đủ, session ID hay PII nhạy cảm.
- Không thực thi lệnh phá hủy, production hoặc có tác động bên ngoài nếu chưa có phê duyệt cụ thể.
- Báo cáo lỗ hổng theo quy trình bảo mật riêng tư của tổ chức.
