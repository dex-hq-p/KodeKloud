# Code Review Skill

## Checklist

1. Requirement và acceptance criteria có được đáp ứng không?
2. Có regression, breaking change hoặc race condition không?
3. Validation, authentication, authorization và error handling đúng chưa?
4. Có lộ secret/PII hoặc injection risk không?
5. Transaction, migration, retry, timeout và idempotency có phù hợp không?
6. API/event contract và compatibility đã được kiểm tra chưa?
7. Test có bao phủ behavior mới và failure path không?
8. Logging, metrics, tracing và vận hành có đủ không?
9. Hiệu năng và resource usage có hợp lý không?
10. Tài liệu, config và rollback plan đã cập nhật chưa?

Phân loại finding: **blocker**, **major**, **minor**, **nit**. Mỗi finding cần
file/vị trí, tác động, bằng chứng và đề xuất sửa.
