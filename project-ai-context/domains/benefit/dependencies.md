# Dependencies: Benefit

Các dependency dưới đây là định hướng theo thiết kế; chưa phải hợp đồng API đã xác nhận.

| Thành phần | Mục đích dự kiến | Trạng thái |
|---|---|---|
| Aggregation | Gọi Benefit để lấy dữ liệu/phúc lợi phục vụ frontend | Cần xác minh endpoint và schema |
| Wage | Trao đổi dữ liệu liên quan lương/phúc lợi nếu nghiệp vụ yêu cầu | Cần xác minh có dependency trực tiếp hay không |
| Authen | Xác thực/định danh hoặc lấy thông tin cần thiết | Cần xác minh cơ chế và ranh giới trách nhiệm |

Không lưu URL nội bộ nhạy cảm, token hoặc credential tại đây.
