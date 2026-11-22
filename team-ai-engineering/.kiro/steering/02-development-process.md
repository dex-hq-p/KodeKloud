# Development Process

1. Đọc yêu cầu, xác nhận Task ID và phạm vi.
2. Đọc context liên quan và kiểm tra worktree trước khi sửa.
3. Phân tích nguyên nhân/đề xuất solution; dừng tại checkpoint approval trước khi implement khi workflow yêu cầu.
4. Thực hiện thay đổi nhỏ theo pattern hiện có; thêm test cho hành vi mới hoặc bug được sửa.
5. Chạy kiểm tra nhỏ nhất phù hợp và xem lại diff.
6. Báo rõ kết quả, rủi ro còn lại và các bước chưa chạy.
7. Bàn giao theo approval-and-push policy; không push tự động.
