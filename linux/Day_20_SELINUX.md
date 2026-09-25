###

```
Cách hoạt động
Linux bình thường chỉ có 1 lớp bảo vệ: quyền file (permission) — ai được đọc/ghi/thực thi.

SELinux thêm lớp thứ 2: MAC (Mandatory Access Control).

Mỗi process (tiến trình) và mỗi file đều có label (nhãn) bảo mật.

Khi process muốn truy cập file → SELinux kiểm tra nhãn process vs nhãn file.

Nếu không khớp → chặn ngay, dù quyền file bình thường cho phép.

Ví dụ dễ hiểu
Bạn là nhân viên (process) trong tòa nhà (server):

Quyền file = thẻ ra vào phòng kế toán → bạn có thẻ → được vào.

SELinux = bảo vệ kiểm tra bạn có thuộc phòng kế toán không → không thuộc → chặn.

→ SELinux khắt khe hơn quyền file thông thường.

sestatus
# Xem toàn bộ trạng thái SELinux: status, mode, policy, config file
# (chỉ để tham khảo, không dùng để quyết định task pass/fail)

getenforce
# Xem nhanh chế độ hiện tại: Enforcing / Permissive / Disabled
# (runtime status — có thể khác với file config)

sudo yum install -y selinux-policy selinux-policy-targeted policycoreutils
# Cài 3 package SELinux chính:
#   - selinux-policy          : policy cơ bản
#   - selinux-policy-targeted : policy dạng targeted (mặc định RHEL)
#   - policycoreutils         : công cụ quản lý SELinux
# -y = tự động trả lời "yes" cho mọi prompt


rpm -qa | grep selinux
# Liệt kê tất cả package đã cài có chứa "selinux"
# → xác nhận các package SELinux đã có mặt

rpm -qa | grep selinux-policy
# Chỉ lọc các package selinux-policy
# → phải thấy selinux-policy và selinux-policy-targeted

sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config
# sed = stream editor, dùng để tìm và thay thế text
# -i = sửa trực tiếp trên file (in-place)
# s/^SELINUX=.*/SELINUX=disabled/ = thay dòng bắt đầu bằng "SELINUX=" 
#   bằng "SELINUX=disabled"
# ^ = đầu dòng (tránh match các dòng comment có dấu #)
# .* = mọi ký tự còn lại


grep SELINUX= /etc/selinux/config
# Kiểm tra lại file config
# → dòng KHÔNG có dấu # phải là: SELINUX=disabled ✅


```