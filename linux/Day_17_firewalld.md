###

```
The Nautilus system administrators team has rolled out a web UI application for their backup utility on the Nautilus application server 3 within the Stratos Datacenter. This application runs on port 3000and appropriate firewall rules must be configured to allow incoming traffic. To achieve this, firewalld needs to be installed and configured on the application server. To ensure proper functionality, the following requirements have been identified:



Install and enable the firewalld service.
Allow all incoming connections on port 3000/tcp.
Ensure the zone is set to public.
```

```
    2  sudo yum install -y firewalld
    3  sudo systemctl enable --now firewalld
    4  sudo systemctl status firewalld
    5  sudo firewall-cmd --set-default-zone=public
    6  sudo firewall-cmd --get-default-zone
    7  sudo firewall-cmd --permanent --zone=public --add-port=3000/tcp
    8  sudo firewall-cmd --reload
    9  sudo firewall-cmd --zone=public --list-ports
   10  sudo firewall-cmd --get-default-zone
   11  sudo firewall-cmd --zone=public --list-ports
   12  sudo systemctl is-enabled firewalld
   13  sudo systemctl is-active firewalld
```


```
# Linux Firewalld – Kiến thức cần nhớ

## 1. Firewall là gì?

Firewall kiểm soát traffic đi vào/ra server:

```text
Client → Firewall → Application
              ↓
          ALLOW / DROP
```

Ví dụ application chạy port `3000`:

```text
Client → TCP:3000 → Server
```

Nếu firewall allow `3000/tcp` thì connection có thể đi tới application. Nếu firewall block thì connection bị chặn.

---

## 2. firewalld là gì?

`firewalld` là firewall service thường gặp trên CentOS/RHEL/Rocky/AlmaLinux.

Kiểm tra service:

```bash
systemctl status firewalld
```

Chạy ngay:

```bash
systemctl start firewalld
```

Cho chạy tự động khi server reboot:

```bash
systemctl enable firewalld
```

Cả hai cùng lúc:

```bash
systemctl enable --now firewalld
```

Kiểm tra:

```bash
systemctl is-active firewalld
systemctl is-enabled firewalld
```

---

## 3. firewall-cmd

`firewall-cmd` là command dùng để quản lý `firewalld`.

Kiểm tra firewall:

```bash
firewall-cmd --state
```

Xem zone mặc định:

```bash
firewall-cmd --get-default-zone
```

Xem zone đang active:

```bash
firewall-cmd --get-active-zones
```

Xem toàn bộ rule của zone:

```bash
firewall-cmd --zone=public --list-all
```

---

## 4. Zone là gì?

`firewalld` chia rule thành các zone.

Một số zone:

```text
public
home
work
trusted
drop
block
```

`public` thường dùng cho network không được tin cậy, chẳng hạn traffic từ Internet.

Đặt zone mặc định:

```bash
firewall-cmd --set-default-zone=public
```

Kiểm tra:

```bash
firewall-cmd --get-default-zone
```

Quan trọng:

```text
public ≠ mở tất cả port
```

`public` chỉ là một zone chứa một bộ firewall rules. Port nào được phép phải được cấu hình.

---

## 5. Port và protocol

Khi thấy:

```text
3000/tcp
```

thì:

```text
3000 = port
tcp  = protocol
```

Một số port thường gặp:

```text
22/tcp    SSH
80/tcp    HTTP
443/tcp   HTTPS
3000/tcp  Web application
```

Nếu đề nói:

> Allow incoming connections on port 3000/tcp

thì hiểu là:

```text
INBOUND
TCP
PORT 3000
ALLOW
```

---

## 6. Mở port bằng firewalld

Lệnh thường dùng:

```bash
firewall-cmd --permanent --zone=public --add-port=3000/tcp
```

Ý nghĩa:

```text
--permanent
    → lưu cấu hình lâu dài

--zone=public
    → áp dụng rule cho zone public

--add-port=3000/tcp
    → cho phép TCP port 3000
```

Sau đó reload:

```bash
firewall-cmd --reload
```

---

## 7. Runtime và Permanent

`firewalld` có hai loại cấu hình:

```text
runtime
permanent
```

### Runtime

Áp dụng ngay:

```bash
firewall-cmd --zone=public --add-port=3000/tcp
```

Nhưng có thể mất sau reboot/reload tùy cách cấu hình.

### Permanent

Lưu cấu hình lâu dài:

```bash
firewall-cmd --permanent --zone=public --add-port=3000/tcp
```

Sau đó cần:

```bash
firewall-cmd --reload
```

Flow cần nhớ:

```text
--permanent
     ↓
lưu cấu hình
     ↓
--reload
     ↓
áp dụng cấu hình
```

---

## 8. Kiểm tra port

Xem các port được mở trong `public`:

```bash
firewall-cmd --zone=public --list-ports
```

Kết quả mong muốn:

```text
3000/tcp
```

Hoặc xem toàn bộ:

```bash
firewall-cmd --zone=public --list-all
```

---

## 9. Cài firewalld

CentOS/RHEL thường dùng:

```bash
yum install -y firewalld
```

hoặc:

```bash
dnf install -y firewalld
```

Kiểm tra package:

```bash
rpm -q firewalld
```

---

## 10. Liên hệ với AWS Security Group

Có thể hình dung:

```text
Internet
   ↓
AWS Security Group
   ↓
EC2
   ↓
firewalld
   ↓
Application
```

Security Group và firewalld đều có vai trò kiểm soát traffic, nhưng ở các tầng khác nhau.

Ví dụ:

```text
Security Group
TCP 3000 ALLOW
        ↓
      EC2
        ↓
firewalld
TCP 3000 ALLOW
        ↓
Application :3000
```

Traffic phải vượt qua cả hai.

---

# 11. Checklist cho bài lab

Đề yêu cầu:

1. Install và enable `firewalld`
2. Allow `3000/tcp`
3. Zone = `public`

Có thể làm:

```bash
yum install -y firewalld

systemctl enable --now firewalld

firewall-cmd --set-default-zone=public

firewall-cmd --permanent --zone=public --add-port=3000/tcp

firewall-cmd --reload
```

Kiểm tra:

```bash
systemctl is-active firewalld
systemctl is-enabled firewalld

firewall-cmd --get-default-zone

firewall-cmd --zone=public --list-ports
```

Kết quả cần có:

```text
firewalld → active
firewalld → enabled
zone      → public
port      → 3000/tcp
```

# 12. 6 thứ quan trọng nhất cần nhớ

```text
1. systemctl
2. firewalld
3. firewall-cmd
4. zone
5. port/protocol
6. --permanent → --reload
```

Đặc biệt nhớ:

```bash
firewall-cmd --permanent --zone=public --add-port=3000/tcp
firewall-cmd --reload
```

Đây là pattern rất hay gặp trong Linux administration labs.

```