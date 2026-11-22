# Context Loading

1. Xác định path thực tế của `project-ai-context` trong workspace.
2. Đọc `_shared/architecture-overview.md` nếu cần kiến trúc chung.
3. Đọc `CONTEXT.md` của domain/service/job liên quan.
4. Chỉ đọc tài liệu rules, dependency hoặc runbook của phạm vi task.
5. Nếu context thiếu/mâu thuẫn với code, ghi nhận và hỏi owner.

Không nạp toàn bộ kho context mặc định; không đưa secret hoặc PII vào output.
