# Dependencies: <Tên domain>

## Dependency vào

| Bên gọi | Giao diện | Mục đích | Nguồn xác minh |
|---|---|---|---|
| <Service/repo> | <API/event/khác> | <Lý do gọi> | <Link hoặc đường dẫn code> |

## Dependency ra

| Thành phần được gọi | Giao diện | Dữ liệu/ý nghĩa | Timeout hoặc lỗi |
|---|---|---|---|
| <Domain/service> | <API/event/khác> | <Mô tả> | <Đã xác minh hoặc cần xác minh> |

## Lưu ý

- Không ghi secret hoặc thông tin xác thực.
- Ghi phiên bản/đường dẫn hợp đồng nếu có; không suy đoán từ tên endpoint.
