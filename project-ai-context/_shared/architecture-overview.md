# Architecture Overview

## Mục đích

Mô tả luồng request tổng quan để định hướng việc đọc context. Sơ đồ dưới đây phản ánh mô hình mục tiêu trong tài liệu thiết kế; cần đối chiếu với triển khai thực tế trước khi dùng làm căn cứ thay đổi hệ thống.

## Luồng tổng quan

```text
Client / Frontend
       |
       v
     Nginx
       |
       v
    Gateway
       |
       v
 Aggregation (BFF)
       |
       +------> Benefit Domain
       +------> Wage Domain
       +------> Authen Domain
```

## Ranh giới trách nhiệm

- **Nginx/Gateway:** điểm vào hệ thống và định tuyến/xác thực theo cấu hình thực tế.
- **Aggregation:** tổng hợp phản hồi từ các domain và định dạng dữ liệu phù hợp cho frontend.
- **Domain:** sở hữu dữ liệu và quyết định nghiệp vụ của domain đó.
- **Jobs:** xử lý batch nền theo lịch; không mặc định expose API.

Tên thành phần, giao thức, sơ đồ triển khai và trách nhiệm bảo mật cụ thể cần được xác minh với repo triển khai tương ứng.
