---
name: code-review-checklist
description: Review diff theo correctness, security, compatibility, test và phạm vi thay đổi.
---

# Code Review Checklist

- Logic, boundary, null/error handling và backward compatibility.
- Authorization, validation, secret/PII và truy vấn an toàn.
- Test đúng hành vi, edge case và failure mode.
- Migration/config/observability/rollback nếu có.
- Finding phải có bằng chứng, vị trí và tác động; không sửa code trong vai trò reviewer.
