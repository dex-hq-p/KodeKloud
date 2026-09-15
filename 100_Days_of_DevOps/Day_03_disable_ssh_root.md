###
> Your task is to disable direct SSH root login on all app servers within the Stratos Datacenter.

```
sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sshd -t
sudo systemctl restart sshd
```
```

^    #\?    PermitRootLogin    .*
│      │           │             │
│      │           │             └─ phần còn lại của dòng
│      │           └─ tìm chữ PermitRootLogin
│      └─ dấu # có thể có hoặc không
└─ bắt đầu dòng
```