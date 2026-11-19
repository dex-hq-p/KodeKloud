# Security Policy

- Xác thực và phân quyền phải được kiểm tra ở server; không tin dữ liệu từ client.
- Validate input, encode output và dùng parameterized query.
- Secret chỉ đi qua secret manager hoặc environment injection.
- Log không được chứa password, token, session id đầy đủ hoặc PII nhạy cảm.
- Dependency và image phải được scan; xử lý finding theo mức độ rủi ro.
- Báo cáo lỗ hổng riêng tư theo quy trình security incident của tổ chức.
