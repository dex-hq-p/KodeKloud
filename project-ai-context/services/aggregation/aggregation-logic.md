# Aggregation Logic: Aggregation

## Nguồn dữ liệu

| Domain | Vai trò dự kiến | Trạng thái |
|---|---|---|
| Benefit | Dữ liệu phúc lợi | Endpoint/schema cần xác minh |
| Wage | Dữ liệu lương | Endpoint/schema cần xác minh |
| Authen | Thông tin định danh/xác thực theo contract | Trách nhiệm và schema cần xác minh |

## Quy tắc tổng hợp

- Có thể merge/format dữ liệu cho nhu cầu trình bày theo contract của frontend.
- Tổng tiền hiển thị chỉ được tính từ dữ liệu và quy tắc đã được domain xác định; không tái hiện quy tắc nghiệp vụ cốt lõi tại BFF.
- Schema DTO, xử lý field thiếu và định dạng ngày cần được đối chiếu với code/test hiện hành.
