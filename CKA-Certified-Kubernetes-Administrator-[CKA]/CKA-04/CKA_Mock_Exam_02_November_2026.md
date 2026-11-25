# CKA Mock Exam #02 -- November 2026

> **Đề thi thử thực hành CKA -- tự biên soạn, tham khảo curriculum CKA
> và các chia sẻ luyện thi cộng đồng.**
>
> Đây không phải đề thi chính thức hoặc đề thi bị rò rỉ của Linux
> Foundation.

## Thông tin kỳ thi

  Hạng mục                          Giá trị
  ---------------------- ------------------
  Thời gian                        120 phút
  Số tasks                               17
  Tổng điểm                             100
  Điểm đạt mục tiêu                  66/100
  Phiên bản tham chiếu     Kubernetes v1.37

### Quy định

-   Không có câu hỏi trắc nghiệm; toàn bộ yêu cầu đều thao tác trên
    terminal.
-   Không xóa hoặc recreate cluster trừ khi task yêu cầu.
-   Các resource được giả định đã tạo sẵn theo mô tả của từng bài.
-   Chấm điểm theo trạng thái cuối cùng của Kubernetes resources.
-   Một số task yêu cầu thành phần phụ trợ như CSI provisioner, Gateway
    API CRDs/controller, Metrics Server hoặc Helm chart có sẵn. Cần
    chuẩn bị lab tương ứng trước khi bắt đầu.

------------------------------------------------------------------------

# Domain 1 -- Cluster Architecture, Installation & Configuration

**25 điểm -- 4 tasks**

## Task 01 -- RBAC & ServiceAccount (6 điểm)

Namespace `finance` đã tồn tại.

Yêu cầu:

1.  Tạo ServiceAccount `finance-auditor`.
2.  Tạo ClusterRole `finance-reader`.
3.  Cho phép các quyền:
    -   `get`, `list`, `watch` đối với Pods, Services, ConfigMaps.
    -   `get`, `list` đối với Nodes.
4.  Bind ClusterRole cho ServiceAccount bằng ClusterRoleBinding.
5.  Không cấp quyền `create`, `update`, `patch`, `delete`.
6.  Verify quyền truy cập bằng `kubectl auth can-i`.

## Task 02 -- Kubeadm Cluster Lifecycle (7 điểm)

Cluster có một control plane và hai worker:

``` text
controlplane
worker-01
worker-02
```

Kubernetes hiện tại là `v1.36.x`.

Yêu cầu:

1.  Kiểm tra phiên bản hiện tại của các node.
2.  Upgrade control plane lên `v1.37.x`.
3.  Upgrade kubelet trên control plane.
4.  Drain `worker-01`.
5.  Upgrade kubelet trên `worker-01`.
6.  Đưa `worker-01` trở lại trạng thái Ready.
7.  Đảm bảo các workload được khôi phục.

**Ràng buộc:** Không upgrade `worker-02`.

## Task 03 -- Helm & CRD (6 điểm)

Một Helm chart đã được cung cấp tại:

``` text
/opt/charts/custom-monitor/
```

Yêu cầu:

1.  Kiểm tra chart metadata và values.
2.  Cài chart với release name `custom-monitor`.
3.  Namespace triển khai là `monitoring`.
4.  Override replica thành 2.
5.  Override image tag thành `2.4.0`.
6.  Kiểm tra CRD được cài đặt và các resource liên quan hoạt động.

## Task 04 -- Kustomize (6 điểm)

Thư mục source:

``` text
/opt/k8s/base/
```

Có Deployment `customer-api` và Service `customer-api`.

Yêu cầu: 

1.  Tạo overlay `staging`.
2.  Thay đổi replicas từ 2 thành 4.
3.  Thay đổi image từ `customer-api:v1` thành `customer-api:v2`.
4.  Thêm label `environment: staging` vào Deployment Pod template.
5.  Thêm ConfigMap `customer-config` với dữ liệu:

``` yaml
APP_ENV: staging
LOG_LEVEL: debug
```

6.  Deploy overlay lên namespace `staging`.

------------------------------------------------------------------------

# Domain 2 -- Workloads & Scheduling

**15 điểm -- 3 tasks**

## Task 05 -- StatefulSet & Headless Service (5 điểm)

Namespace `database` đã tồn tại.

Yêu cầu:

1.  Tạo Headless Service `redis-headless`.
2.  Tạo StatefulSet `redis`.
3.  Replicas: 3.
4.  Image: `redis:7.4`.
5.  Mỗi Pod sử dụng PVC dung lượng 1Gi.
6.  Tên Pod phải có dạng:

``` text
redis-0
redis-1
redis-2
```

7.  Verify DNS của từng Pod thông qua Headless Service.

## Task 06 -- Pod Scheduling (5 điểm)

Node `worker-02` có cấu hình:

``` yaml
labels:
  workload: batch
  disk: nvme

taints:
  dedicated=batch:NoSchedule
```

Yêu cầu:

1.  Tạo Pod `batch-worker`.
2.  Pod chỉ được schedule trên node có `workload=batch`.
3.  Phải có toleration cho taint `dedicated=batch:NoSchedule`.
4.  Pod sử dụng image `busybox:1.36`.
5.  Container chạy lệnh sleep trong 3600 giây.
6.  Verify Pod thực sự chạy trên `worker-02`.

## Task 07 -- HPA & Probes (5 điểm)

Deployment `catalog-api` trong namespace `production` đã tồn tại.

Yêu cầu:

1.  Cấu hình CPU request là `200m`.
2.  Cấu hình memory request là `256Mi`.
3.  Thêm readiness probe tại `/ready`, port `8080`.
4.  Thêm liveness probe tại `/health`, port `8080`.
5.  Tạo HPA:
    -   Min replicas: 2.
    -   Max replicas: 8.
    -   CPU utilization: 70%.
6.  Verify HPA có thể đọc được metrics.

------------------------------------------------------------------------

# Domain 3 -- Services & Networking

**20 điểm -- 4 tasks**

## Task 08 -- Service & EndpointSlice (5 điểm)

Namespace `store` có Deployment `product-api` với 3 replicas.

Thông tin:

``` text
Container port: 9090
Service name: product-service
Service port: 80
```

Yêu cầu:

1.  Tạo ClusterIP Service.
2.  Selector phải match đúng Pod.
3.  Service port 80 forward tới container port 9090.
4.  Đảm bảo EndpointSlice có đủ 3 endpoints.
5.  Test kết nối từ một Pod khác trong namespace.

## Task 09 -- NetworkPolicy (5 điểm)

Namespace `payment` có ba nhóm Pod:

``` text
app=frontend
app=payment
app=database
```

Yêu cầu:

1.  Frontend được phép gọi payment qua TCP `8080`.
2.  Payment được phép gọi database qua TCP `5432`.
3.  Database không nhận kết nối trực tiếp từ frontend.
4.  Payment không được nhận traffic từ namespace khác.
5.  Các ingress traffic không được cho phép phải bị chặn.

**Ràng buộc:** Không được sử dụng `hostNetwork`.

## Task 10 -- Gateway API (5 điểm)

Gateway API CRDs và controller đã được cài đặt.

Namespace `ecommerce` có:

``` text
Service: ecommerce-api
Port: 8080
```

Yêu cầu:

1.  Tạo Gateway `ecommerce-gateway`.
2.  Listener HTTP port `80`.
3.  Tạo HTTPRoute `ecommerce-route`.
4.  Hostname: `shop.example.com`.
5.  Request `/api` phải được forward tới `ecommerce-api:8080`.
6.  Verify Gateway và HTTPRoute có trạng thái Accepted và Programmed phù
    hợp.

## Task 11 -- CoreDNS Troubleshooting (5 điểm)

Pod trong namespace `frontend` không thể resolve:

``` text
payment-service.payment.svc.cluster.local
```

Yêu cầu:

1.  Kiểm tra cấu hình DNS của Pod.
2.  Kiểm tra CoreDNS Deployment và ConfigMap.
3.  Kiểm tra Service `kube-dns`.
4.  Xác định và sửa nguyên nhân.
5.  Verify DNS resolution từ Pod `frontend`.

------------------------------------------------------------------------

# Domain 4 -- Storage

**10 điểm -- 2 tasks**

## Task 12 -- Dynamic Provisioning (5 điểm)

StorageClass `fast-ssd` đã được cấu hình và CSI provisioner đang hoạt
động.

Yêu cầu:

1.  Tạo PVC `app-data`.
2.  StorageClass: `fast-ssd`.
3.  AccessMode: `ReadWriteOnce`.
4.  Storage request: `5Gi`.
5.  Tạo Pod `storage-client` mount PVC tại `/var/lib/app`.
6.  Ghi dữ liệu vào file `/var/lib/app/test.txt`.
7.  Xác minh dữ liệu được lưu trong volume.

## Task 13 -- PV Reclaim Policy (5 điểm)

PV `backup-pv` và PVC `backup-pvc` đã được tạo.

Yêu cầu:

1.  Kiểm tra trạng thái PV/PVC.
2.  Thay đổi reclaim policy của PV thành `Retain`.
3.  Xóa PVC.
4.  Xác nhận PV chuyển sang trạng thái `Released`.
5.  Không được làm mất dữ liệu trong volume.

------------------------------------------------------------------------

# Domain 5 -- Troubleshooting

**30 điểm -- 4 tasks**

## Task 14 -- Node Troubleshooting (8 điểm)

Node `worker-03` đang ở trạng thái `NotReady`.

Thông tin ban đầu:

``` text
Conditions:
  Ready: False

Kubelet:
  Unknown state
```

Yêu cầu:

1.  Xác định nguyên nhân.
2.  Kiểm tra kubelet service.
3.  Kiểm tra container runtime.
4.  Kiểm tra network connectivity tới API Server.
5.  Khắc phục lỗi.
6.  Đưa node về trạng thái Ready.

## Task 15 -- Static Pod & Control Plane (7 điểm)

Control plane gặp sự cố:

``` text
kube-apiserver: CrashLoopBackOff
```

Yêu cầu:

1.  Kiểm tra static Pod manifest.
2.  Kiểm tra container logs.
3.  Xác định lỗi cấu hình.
4.  Khắc phục manifest.
5.  Đảm bảo API Server hoạt động.
6.  Kiểm tra các thành phần control plane khác.

## Task 16 -- Application Troubleshooting (8 điểm)

Deployment `report-api` trong namespace `reporting` có 3 replicas nhưng
chỉ có 1 Pod Running.

Các Pod còn lại đang Pending.

Yêu cầu:

1.  Kiểm tra Pod Events.
2.  Kiểm tra node resources.
3.  Kiểm tra resource requests và limits.
4.  Kiểm tra ResourceQuota và LimitRange nếu có.
5.  Xác định nguyên nhân.
6.  Khắc phục để đủ 3 replicas Running.

## Task 17 -- Service & Application Connectivity (7 điểm)

Pod `frontend` không thể truy cập Service `backend-api`.

Thông tin:

``` text
Namespace: production
Service: backend-api
Type: ClusterIP
Port: 80
TargetPort: 8080
```

Yêu cầu:

1.  Kiểm tra Service selector.
2.  Kiểm tra Pod labels.
3.  Kiểm tra EndpointSlice.
4.  Kiểm tra application container port.
5.  Kiểm tra NetworkPolicy.
6.  Khắc phục lỗi.
7.  Verify kết nối HTTP từ frontend tới backend.

------------------------------------------------------------------------

# Tổng hợp điểm và thời gian

  Domain                   Số câu      Điểm      Thời gian
  ---------------------- -------- --------- --------------
  Cluster Architecture          4        25        25 phút
  Workloads                     3        15        18 phút
  Networking                    4        20        25 phút
  Storage                       2        10        12 phút
  Troubleshooting               4        30        35 phút
  Kiểm tra                     --        --         5 phút
  **Tổng**                 **17**   **100**   **120 phút**

# Checklist trước khi thi

-   [ ] Đã chuẩn bị kubeadm cluster và đủ node theo yêu cầu.
-   [ ] Đã kiểm tra quyền truy cập control plane và worker.
-   [ ] Đã chuẩn bị Helm chart tại `/opt/charts/custom-monitor/`.
-   [ ] Đã chuẩn bị source Kustomize tại `/opt/k8s/base/`.
-   [ ] Đã cài Gateway API CRDs và Gateway Controller.
-   [ ] Đã cài CSI provisioner và StorageClass `fast-ssd`.
-   [ ] Metrics Server hoạt động.
-   [ ] Đã kiểm tra công cụ `kubectl`, `helm`, `kubeadm`, `etcdctl`.
-   [ ] Đã bật đồng hồ đếm ngược 120 phút.

# Phiếu tự chấm điểm

  Domain                     Điểm tối đa   Điểm đạt được
  ------------------------ ------------- ---------------
  Cluster Architecture                25 
  Workloads & Scheduling              15 
  Services & Networking               20 
  Storage                             10 
  Troubleshooting                     30 
  **Tổng**                       **100** 

**Đánh giá mục tiêu:** từ 66/100 trở lên là đạt ngưỡng pass mô phỏng.

------------------------------------------------------------------------

## Nguồn tham khảo

-   [Linux Foundation -- Certified Kubernetes Administrator
    (CKA)](https://training.linuxfoundation.org/certification/certified-kubernetes-administrator-cka/)
-   [Kubernetes -- CKA Curriculum](https://github.com/cncf/curriculum)
-   [Kubernetes Documentation](https://kubernetes.io/docs/)
-   [DevOps VietNam](https://devopsedu.vn/) -- tham khảo chia sẻ và tài
    liệu luyện tập cộng đồng.

**Lưu ý:** Đề này là bộ mock exam do biên soạn, không phải đề chính
thức. Các task mô phỏng chủ đề và dạng thao tác thực hành; không đảm bảo
trùng câu hỏi hoặc tỷ lệ xuất hiện trong kỳ thi thật.
