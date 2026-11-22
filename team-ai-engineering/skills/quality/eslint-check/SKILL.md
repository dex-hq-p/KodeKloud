---
name: eslint-check
description: Chạy ESLint cho các file frontend thay đổi khi workspace đã cấu hình.
---

# ESLint Check

- Xác định file thay đổi và package manager/config hiện có.
- Chạy lệnh ESLint mục tiêu trên các file `.tsx`/`.jsx` liên quan.
- Chỉ dùng `--fix` khi repository workflow cho phép; xem diff sau khi auto-fix.
- Nếu ESLint chưa cấu hình hoặc dependency thiếu, báo rõ thay vì cài thêm ngoài phạm vi.
