# Bitbucket Integration

Đặt `BITBUCKET_MCP_URL` và `BITBUCKET_MCP_TOKEN` qua secret manager.

- Giới hạn token theo repository và thao tác cần thiết.
- Không tự merge hoặc push nếu chưa có policy/approval tương ứng.
- Liên kết PR với Jira issue và yêu cầu build status xanh trước review.
