# Kafka Integration Skill

- Xác định schema, owner, compatibility mode, retention và partition key trước khi tạo topic.
- Consumer phải idempotent, commit offset sau xử lý thành công và có dead-letter strategy.
- Cấu hình timeout, retry/backoff, consumer group và concurrency theo workload.
- Không đưa PII hoặc secret vào message; log payload đã được redaction.
- Kiểm thử schema evolution, duplicate delivery và consumer restart.
