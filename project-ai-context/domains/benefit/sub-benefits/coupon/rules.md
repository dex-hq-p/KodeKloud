# Rules: Coupon

## Quy tắc áp dụng

- Điều kiện áp dụng coupon cụ thể cần được xác minh từ code và đặc tả nghiệp vụ.
- Theo lưu ý trong thiết kế, cần kiểm tra kỹ quy ước dấu khi lưu số tiền: có thể có trường hợp DB lưu số âm. Không đảo dấu hoặc diễn giải giá trị nếu chưa kiểm tra schema, truy vấn và test hiện có.

## Trạng thái cần xác minh

- Entity/schema và quy ước dấu của từng trường tiền tệ.
- Điều kiện hợp lệ, giới hạn sử dụng và xử lý coupon hết hạn.
- Hợp đồng của API `/apply`.
