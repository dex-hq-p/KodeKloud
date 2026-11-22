---
name: sql-optimization
description: Đề xuất tối ưu SQL có căn cứ từ engine, schema, query plan và workload.
---

# SQL Optimization

- Không đổi kết quả query; xem xét null, duplicate, ordering, transaction và isolation semantics.
- Đề xuất index/query rewrite kèm storage/write cost và migration impact.
- Yêu cầu plan/benchmark an toàn để xác minh; không chạy trên production.
