# Jira Integration

- Cấu hình MCP Jira trong môi trường Kiro được quản trị; `.kiro/settings/mcp.json` chỉ chứa cấu hình không bí mật.
- Dùng issue key do developer cung cấp và chỉ đọc đúng phạm vi được yêu cầu.
- Không commit API token, cookie hoặc endpoint nội bộ nhạy cảm.
- Tạo/sửa/comment issue cần yêu cầu rõ và xác nhận riêng.
