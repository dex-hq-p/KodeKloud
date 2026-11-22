---
name: jira-fetch
description: Đọc và tóm tắt Jira issue khi người dùng cung cấp issue key và MCP Jira đã được cấu hình.
---

# Jira Fetch

- Xác nhận issue key; chỉ đọc issue được yêu cầu.
- Trích mục tiêu, acceptance criteria, trạng thái và liên kết liên quan; phân biệt mô tả với suy luận.
- Không sửa issue, bình luận hoặc chuyển trạng thái nếu chưa được yêu cầu rõ ràng.
- Không chép secret/PII vào note; nếu không có MCP, yêu cầu nội dung issue từ người dùng.
