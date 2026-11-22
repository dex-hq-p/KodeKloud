# Domain Context: Benefit

## 1. Tổng quan

Cung cấp các gói phúc lợi cho nhân viên. Trong mô hình thiết kế, request đến từ Aggregation. Cần xác minh luồng và hợp đồng thực tế trong các repo triển khai.

## 2. Sub-benefits

- [Coupon](./sub-benefits/coupon/CONTEXT.md): mã giảm giá/voucher.
- [Birth](./sub-benefits/birth/CONTEXT.md): hỗ trợ sinh con.
- [Family-event](./sub-benefits/family-event/CONTEXT.md): hỗ trợ kết hôn, tang chế.
- [Childcare](./sub-benefits/childcare/CONTEXT.md): hỗ trợ gửi trẻ.

## 3. Luật chung

- Theo thiết kế được cung cấp: nhân viên thử việc (probation) không được hưởng benefit.
- Chi tiết: [domain-rules.md](./domain-rules.md).

## 4. Dependencies

- Xem [dependencies.md](./dependencies.md); các hợp đồng cụ thể cần được xác minh với code/API hiện hành.
