###

```
Adjust the default runlevel on all App servers in Stratos Datacenter to enable GUI booting by default. It's imperative not to initiate a server reboot after completing this task.
```

```
sudo systemctl get-default
sudo systemctl set-default graphical.target


Target	Runlevel cũ	Ý nghĩa
multi-user.target	3	Chế độ dòng lệnh (CLI), nhiều user, không có GUI
graphical.target	5	Chế độ đồ họa (GUI) + multi-user
rescue.target	1	Single-user, chỉ root, dùng để sửa lỗi
reboot.target	6	Khởi động lại
poweroff.target	0	Tắt máy
```