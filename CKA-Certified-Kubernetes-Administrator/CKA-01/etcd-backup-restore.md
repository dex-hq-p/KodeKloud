# Quy trình Backup & Restore etcd (kubeadm / kind)

> Áp dụng cho cluster kubeadm-based, bao gồm cả cluster tạo bằng `kind`.
> Thực hiện toàn bộ bên trong container/node control-plane.

---

## PHẦN 1: BACKUP

### Bước 1 — Vào container control-plane (riêng với kind)
```bash
docker exec -it dex-cluster-control-plane bash
```

### Bước 2 — Đọc manifest để lấy thông tin etcd
```bash
cat /etc/kubernetes/manifests/etcd.yaml
```
Ghi lại các giá trị sau (dùng cho cả backup và restore):

| Thông tin | Vị trí trong manifest |
|---|---|
| Client URL | `--listen-client-urls` (vd: `https://127.0.0.1:2379`) |
| CA cert | `--trusted-ca-file` |
| Client cert | `--cert-file` |
| Client key | `--key-file` |
| Tên member | `--name` |
| Peer URL | `--initial-advertise-peer-urls` |
| Data dir | `--data-dir` (thường `/var/lib/etcd`) |

### Bước 3 — Cài etcdctl (nếu chưa có)
```bash
apt update && apt install -y etcd-client
```

### Bước 4 — Chạy snapshot save
```bash
ETCDCTL_API=3 etcdctl snapshot save /tmp/etcd-backup.db \
  --endpoints=https://127.0.0.1:2379 \
  --cacert=/etc/kubernetes/pki/etcd/ca.crt \
  --cert=/etc/kubernetes/pki/etcd/server.crt \
  --key=/etc/kubernetes/pki/etcd/server.key
```

### Bước 5 — Xác nhận backup hợp lệ
```bash
ETCDCTL_API=3 etcdctl --write-out=table snapshot status /tmp/etcd-backup.db
```

---

## PHẦN 2: RESTORE

### Bước 1 — Dừng kube-apiserver
```bash
mv /etc/kubernetes/manifests/kube-apiserver.yaml /tmp/
```
kubelet sẽ tự dừng pod apiserver khi static pod manifest biến mất khỏi thư mục theo dõi.

### Bước 2 — Restore snapshot ra thư mục MỚI
> Không đè lên data-dir cũ — luôn restore ra thư mục mới để có thể rollback nếu lỗi.

```bash
ETCDCTL_API=3 etcdctl snapshot restore /tmp/etcd-backup.db \
  --data-dir=/var/lib/etcd-restored \
  --name=<TÊN_MEMBER> \
  --initial-cluster=<TÊN_MEMBER>=<PEER_URL> \
  --initial-cluster-token=etcd-cluster-1 \
  --initial-advertise-peer-urls=<PEER_URL>
```
Thay `<TÊN_MEMBER>` và `<PEER_URL>` bằng giá trị thật đọc được ở Bước 2 phần Backup.

### Bước 3 — Sửa etcd.yaml trỏ sang data-dir mới
```bash
vi /etc/kubernetes/manifests/etcd.yaml
```
Tìm `volumes:` → `hostPath:` có `path: /var/lib/etcd`, sửa thành:
```yaml
path: /var/lib/etcd-restored
```

### Bước 4 — Khởi động lại kube-apiserver
```bash
mv /tmp/kube-apiserver.yaml /etc/kubernetes/manifests/
```

### Bước 5 — Theo dõi pod etcd và apiserver khởi động lại
```bash
watch crictl ps
```
Chờ đến khi etcd và apiserver ở trạng thái `Running`, không crash loop.

### Bước 6 — Xác nhận cluster hoạt động bình thường
```bash
kubectl get nodes
kubectl get pods -A
```

---

## Lưu ý quan trọng khi thi CKA thật

- Luôn **backup trước khi restore** để đề phòng restore sai.
- Luôn restore vào **data-dir mới**, không ghi đè trực tiếp lên data-dir cũ.
- Đọc manifest để lấy giá trị chính xác (`--name`, `--initial-cluster`, `--initial-advertise-peer-urls`) thay vì gõ tay theo trí nhớ — thời gian thi khá gấp nên đây là bước dễ mất điểm nhất nếu làm sai.
- Nếu cluster etcd chỉ có 1 member (như control-plane đơn của kind), việc dùng giá trị mặc định của `etcdctl` (`localhost`, `http`) *có thể* chạy được, nhưng **không khớp** với static pod manifest thật (dùng IP + `https`) → dễ gây crash loop khi kubelet khởi động lại etcd. Luôn dùng giá trị thật từ manifest để an toàn.


```
# Restore etcd from snapshot /tmp/etcd-backup.db

1. Stop kube-apiserver:
mv /etc/kubernetes/manifests/kube-apiserver.yaml /tmp/

2. Restore snapshot to new data-dir:
ETCDCTL_API=3 etcdctl snapshot restore /tmp/etcd-backup.db \
  --data-dir=/var/lib/etcd-restored \
  --name=<etcd-member-name> \
  --initial-cluster=<name>=<peer-url> \
  --initial-cluster-token=etcd-cluster-1 \
  --initial-advertise-peer-urls=<peer-url>

3. Update /etc/kubernetes/manifests/etcd.yaml:
   volumes.hostPath.path -> /var/lib/etcd-restored

4. Restart kube-apiserver:
mv /tmp/kube-apiserver.yaml /etc/kubernetes/manifests/

5. Verify:
crictl ps
kubectl get nodes

```