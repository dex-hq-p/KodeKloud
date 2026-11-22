---
name: sonarqube-run
description: Chạy hoặc hướng dẫn SonarQube sau khi developer đồng ý gửi code/metadata tới hệ thống.
---

# SonarQube Run

- Hỏi developer trước khi chạy scan hoặc gửi code/metadata ra ngoài.
- Xác nhận project key, server/config và scope đã được cung cấp an toàn.
- Không lưu token trong repo hoặc command history.
- Báo kết quả scan thực tế; nếu tool/config chưa có, không giả lập kết quả.
