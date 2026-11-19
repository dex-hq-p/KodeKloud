# Jira Integration

Đặt `JIRA_MCP_URL` và `JIRA_MCP_TOKEN` qua secret manager hoặc environment.

- Endpoint mẫu: `https://jira.example.com`
- Scope tối thiểu: đọc issue/project; cấp quyền ghi riêng khi thật sự cần.
- Không đưa token vào file, shell history, log hoặc ticket comment.
- Kiểm tra project key, issue type và workflow state trước khi tự động cập nhật.
