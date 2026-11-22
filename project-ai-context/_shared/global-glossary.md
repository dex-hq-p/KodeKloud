# Global Glossary

| Thuật ngữ | Ý nghĩa |
|---|---|
| Tenant | Đơn vị/phạm vi dữ liệu được cô lập trong hệ thống. Cách xác định tenant cần theo hợp đồng của từng hệ thống. |
| Employee | Nhân viên được định danh trong hệ thống nhân sự. Nguồn định danh chuẩn cần được xác minh. |
| Domain | Thành phần sở hữu một nhóm dữ liệu và quy tắc nghiệp vụ. |
| Sub-domain | Phạm vi nghiệp vụ nhỏ hơn trong một domain, ví dụ Coupon hoặc Childcare trong Benefit. |
| Aggregation / BFF | Service điều phối dữ liệu từ nhiều domain để phục vụ frontend; không sở hữu quy tắc nghiệp vụ cốt lõi. |
| Job / Worker | Tiến trình nền thực hiện công việc theo lịch hoặc theo cơ chế kích hoạt đã cấu hình. |

## Quy tắc cập nhật

- Thống nhất cách dùng thuật ngữ xuyên repo; thêm nguồn hoặc định nghĩa chính thức khi có.
- Không coi ví dụ trong glossary là hợp đồng dữ liệu hay tên field API.
