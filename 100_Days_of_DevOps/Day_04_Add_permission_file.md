###
> Your task is to grant executable permissions to the /tmp/xfusioncorp.sh script on App Server 2. Additionally, ensure that all users have the capability to execute it.

```
-   rwx   r-x   r--
│    │     │     │
│    │     │     └── Others
│    │     └──────── Group
│    └────────────── Owner
└─────────────────── File type

| Ký hiệu | Quyền   | File         | Directory                 |
| ------- | ------- | ------------ | ------------------------- |
| `r`     | Read    | Đọc nội dung | Xem danh sách file        |
| `w`     | Write   | Sửa nội dung | Tạo/xóa/đổi tên file      |
| `x`     | Execute | Chạy file    | Đi vào/traverse directory |


u = user/owner
g = group
o = others
a = all

Owner   Group   Others
rwx     r-x     r--

| Permission | Giá trị |
| ---------- | ------: |
| `---`      |       0 |
| `--x`      |       1 |
| `-w-`      |       2 |
| `-wx`      |       3 |
| `r--`      |       4 |
| `r-x`      |       5 |
| `rw-`      |       6 |
| `rwx`      |       7 |

rwx = 4 + 2 + 1 = 7
r-x = 4 + 0 + 1 = 5
r-- = 4 + 0 + 0 = 4

sudo chmod a+rx /tmp/xfusioncorp.sh

```