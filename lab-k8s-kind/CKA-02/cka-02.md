# Đề thi thực hành CKA — Nâng cao (Lab trên kind cluster)

> Đề này khó hơn đề trước: nhiều bước lồng nhau, ít gợi ý cụ thể hơn, thiên về troubleshooting và các tình huống dễ gây lỗi ẩn (giống thi thật). Một số câu yêu cầu bạn tự đọc doc/describe để tìm thông tin, không có sẵn field name trong đề.

Tổng: 15 câu.

---

## Phần 1: Cluster Architecture & RBAC nâng cao (20%)

**Câu 1 (8đ):**
Tạo ClusterRole tên `node-viewer` cho phép `get`, `list` trên resource `nodes` và `nodes/status` (cluster-scoped, không namespace). Tạo ServiceAccount `monitor-sa` trong namespace `monitoring` (tự tạo namespace). Bind ClusterRole này với ServiceAccount qua **ClusterRoleBinding**. Sau đó dùng `kubectl auth can-i` xác nhận SA có quyền `get nodes` nhưng **không có** quyền `delete nodes`.

**Câu 2 (7đ):**
Cluster có sẵn 1 Pod tĩnh (static pod) `kube-apiserver` chạy trên control-plane. Hãy:
- Tìm đường dẫn thư mục static pod manifest trên node control-plane.
- Copy file `etcd.yaml` ra `/tmp/etcd-backup.yaml` (không phải xóa, chỉ backup).
- Sửa tạm thời annotation `test: hello` vào metadata của static pod `etcd` bằng cách edit trực tiếp file manifest, quan sát pod tự khởi động lại (không dùng `kubectl edit`, vì static pod không cho edit qua API).

**Câu 3 (5đ):**
Cấu hình một node worker để **không nhận thêm Pod mới** nhưng **không** làm gián đoạn các Pod đang chạy (không dùng taint). Sau đó revert lại.

---

## Phần 2: Workloads & Scheduling nâng cao (20%)

**Câu 4 (8đ):**
Tạo Pod `multi-container` gồm 2 container:
- `writer`: image `busybox`, mỗi 5 giây ghi timestamp hiện tại vào file `/var/log/app.log` (dùng vòng lặp shell).
- `reader`: image `busybox`, liên tục `tail -f /var/log/app.log`.

Hai container phải chia sẻ chung file này qua `emptyDir`. Xác nhận bằng `kubectl logs multi-container -c reader` thấy log tăng dần theo thời gian.

**Câu 5 (7đ):**
Tạo Deployment `api` với image `nginx`, 4 replicas. Cấu hình **PodDisruptionBudget** tên `api-pdb` đảm bảo tối thiểu 3 Pod luôn sẵn sàng trong lúc voluntary disruption (`minAvailable: 3`). Sau đó thử `kubectl drain` node đang chạy phần lớn Pod của Deployment này và quan sát hành vi (PDB có chặn drain không nếu vi phạm điều kiện).

**Câu 6 (5đ):**
Tạo một Pod dùng `initContainers`: init container tên `init-check` chạy `busybox`, chờ (`sleep 10`) rồi in ra `"init done"`; container chính chỉ khởi động sau khi init container hoàn tất. Xác nhận thứ tự này qua `kubectl describe pod`.

---

## Phần 3: Services & Networking nâng cao (20%)

**Câu 7 (8đ):**
Tạo 2 Deployment `frontend` và `backend-v2` (tùy chọn image, chỉ cần chạy được). Tạo NetworkPolicy cho phép `frontend` gọi được `backend-v2` nhưng **chặn toàn bộ egress khác** từ `frontend` (kể cả DNS) — sau đó phát hiện vấn đề (DNS bị chặn khiến resolve service name thất bại), và sửa lại để cho phép egress tới port 53 (DNS) tới namespace `kube-system`.

**Câu 8 (7đ):**
Tạo Service kiểu `Headless` (`clusterIP: None`) cho một Deployment 3 replicas. Từ 1 Pod tạm, dùng `nslookup` hoặc `dig` để xác nhận DNS trả về **nhiều IP** (1 cho mỗi Pod) thay vì 1 ClusterIP duy nhất.

**Câu 9 (5đ):**
Một Service đang có `type: LoadBalancer` nhưng cluster kind không có cloud provider nên `EXTERNAL-IP` mãi ở trạng thái `<pending>`. Hãy đổi Service này sang `NodePort`, xác định port được cấp phát tự động, và test truy cập từ trong 1 node bằng `curl localhost:<nodePort>`.

---

## Phần 4: Storage nâng cao (15%)

**Câu 10 (8đ):**
Tạo một **PersistentVolume tĩnh** (static provisioning, không qua StorageClass) tên `manual-pv` dùng `hostPath` `/mnt/data`, dung lượng `2Gi`, `accessModes: ReadWriteOnce`. Tạo PVC `manual-pvc` yêu cầu `1Gi` và xác nhận nó bind đúng vào `manual-pv` (không tạo PV mới qua provisioner).

**Câu 11 (7đ):**
Một Pod đang dùng PVC nhưng bị lỗi `Pending` do PVC không thể bind. Debug nguyên nhân (gợi ý: kiểm tra `accessModes`, `storageClassName`, dung lượng yêu cầu so với PV có sẵn) và sửa lại.

> Tự tạo tình huống lỗi: tạo PVC yêu cầu `accessModes: ReadWriteMany` trong khi PV chỉ hỗ trợ `ReadWriteOnce`, quan sát lỗi, rồi sửa.

---

## Phần 5: Troubleshooting nâng cao (25%)

**Câu 12 (8đ) — CrashLoopBackOff do lỗi cấu hình:**
Tạo Pod dùng image `redis`, nhưng cấu hình sai `command` khiến container khởi động rồi thoát ngay (ví dụ `command: ["redis-server", "--badflag"]`). Debug bằng `kubectl logs --previous`, tìm nguyên nhân chính xác, sửa lại đúng.

**Câu 13 (8đ) — Debug DNS trong cluster:**
Giả lập lỗi bằng cách scale CoreDNS Deployment xuống `0` replicas (`kubectl scale deployment coredns -n kube-system --replicas=0`). Quan sát Pod khác không resolve được service name. Debug bằng `kubectl get pods -n kube-system`, `kubectl logs`, xác nhận nguyên nhân, rồi scale lại về replicas ban đầu.

**Câu 14 (9đ) — Debug ResourceQuota chặn deployment:**
Tạo ResourceQuota trong namespace `cka-exam` giới hạn tổng `requests.cpu: 200m`. Sau đó thử tạo Deployment với 3 Pod mỗi Pod request `cpu: 100m` (tổng 300m — vượt quota). Quan sát Pod nào bị từ chối, dùng `kubectl describe` và `kubectl get events` để xác nhận lỗi do ResourceQuota, sau đó sửa lại (giảm replicas hoặc tăng quota) để toàn bộ Pod chạy được.

**Câu 15 (10đ) — Debug tổng hợp (multi-layer):**
Một Deployment `shop-api` (tự tạo, 2 replicas, image `nginx`) expose qua Service `shop-svc` (ClusterIP) và Ingress `shop-ingress`. Cố tình gây ra **đồng thời 2 lỗi**:
1. Service selector sai.
2. Container port khai báo sai so với port nginx thực sự lắng nghe (80).

Yêu cầu tìm và sửa **cả 2 lỗi** cùng lúc, xác nhận truy cập thành công end-to-end từ Ingress → Service → Pod.

---

## Ghi chú khi lab bằng kind

- **Static pod manifest** nằm ở `/etc/kubernetes/manifests/` trên node control-plane (`docker exec -it <control-plane-container> bash`).
- **PodDisruptionBudget + drain**: với cluster nhỏ (2-3 worker), để test đúng hành vi PDB chặn drain, hãy đảm bảo phần lớn Pod của Deployment đang nằm trên cùng 1 node trước khi drain.
- **NetworkPolicy nâng cao (Câu 7)** cần Calico (kindnet không enforce) — nếu muốn test hành vi thật, tạo cluster mới với `disableDefaultCNI: true` + cài Calico.
- **LoadBalancer → NodePort (Câu 9)**: kind không có cloud-controller-manager nên `LoadBalancer` sẽ luôn `<pending>` EXTERNAL-IP, đây là hành vi đúng, không phải lỗi.
- **ResourceQuota (Câu 14)**: nhớ quota tính theo `requests`, không phải `limits`, trừ khi bạn khai rõ cả hai trong `spec.hard`.

Chúc bạn lab vui vẻ! Báo mình khi bạn sẵn sàng làm câu đầu tiên, mình sẽ hỏi từng câu như đề trước.
