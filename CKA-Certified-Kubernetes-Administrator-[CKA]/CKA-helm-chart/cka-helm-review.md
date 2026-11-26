# CKA Helm & Helm Chart — Ôn tập và thực hành

> Mục tiêu: ôn các thao tác Helm thường gặp trong bài thi CKA.  
> Lab giả định: đã có Kubernetes cluster hoạt động và `kubectl` truy cập được cluster.

## 0. Chuẩn bị môi trường

Kiểm tra:

```bash
kubectl cluster-info
kubectl get nodes
helm version
```

Nếu chưa có Helm, cài theo hướng dẫn chính thức: <https://helm.sh/docs/intro/install/>

Thêm và cập nhật Bitnami repository:

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm repo list
helm search repo bitnami/nginx
```

> Lưu ý: CKA kiểm tra khả năng thao tác Kubernetes. Helm có thể xuất hiện trong môi trường/task cụ thể, nhưng không nên giả định mọi đề thi đều có câu Helm.

## 1. Kiến thức cốt lõi

### 1.1. Phân biệt Chart, Release, Repository

- **Chart**: gói template và metadata dùng để tạo Kubernetes resources.
- **Release**: một lần cài đặt cụ thể của chart trong cluster. Một chart có thể được cài nhiều lần thành nhiều release.
- **Repository**: nơi lưu trữ và phân phối các chart.

Ví dụ:

```bash
helm install web-a bitnami/nginx
helm install web-b bitnami/nginx
```

Hai lệnh trên tạo hai release khác nhau từ cùng một chart (nếu namespace và tên release hợp lệ).

### 1.2. Các lệnh cần nhớ

| Lệnh | Công dụng |
|---|---|
| `helm repo add NAME URL` | Thêm chart repository |
| `helm repo update` | Cập nhật cache repository |
| `helm repo list` | Liệt kê repository |
| `helm search repo KEYWORD` | Tìm chart trong repository đã thêm |
| `helm show values CHART` | Xem values mặc định |
| `helm show chart CHART` | Xem metadata chart |
| `helm install RELEASE CHART` | Cài release |
| `helm upgrade RELEASE CHART` | Upgrade release đã tồn tại |
| `helm upgrade --install RELEASE CHART` | Upgrade nếu có, cài mới nếu chưa có |
| `helm list -A` | Liệt kê release mọi namespace |
| `helm status RELEASE -n NS` | Xem trạng thái release |
| `helm history RELEASE -n NS` | Xem lịch sử revision |
| `helm rollback RELEASE REVISION -n NS` | Rollback về revision |
| `helm get values RELEASE -n NS` | Xem values đã cấu hình |
| `helm get manifest RELEASE -n NS` | Xem manifest đã lưu cho release |
| `helm template RELEASE CHART` | Render manifest tại local, không cài |
| `helm uninstall RELEASE -n NS` | Gỡ release |
| `helm lint PATH` | Kiểm tra cấu trúc/chart |

### 1.3. Override values

Dùng file values:

```bash
helm upgrade --install web-server bitnami/nginx \
  --namespace web --create-namespace \
  --values values.yaml
```

Override trực tiếp:

```bash
helm upgrade --install web-server bitnami/nginx \
  -n web --create-namespace \
  --set replicaCount=3 \
  --set service.type=NodePort
```

Thứ tự ưu tiên thông thường: chart defaults → file `-f/--values` (file sau ghi đè file trước) → `--set` (ghi đè giá trị tương ứng).

### 1.4. Revision và rollback

Mỗi lần install/upgrade tạo revision mới. Kiểm tra và rollback:

```bash
helm history web-server -n web
helm rollback web-server 1 -n web
helm status web-server -n web
```

Nếu không truyền revision, Helm rollback về revision trước đó gần nhất.

## 2. Câu hỏi kiểm tra kiến thức

Hãy tự trả lời trước khi xem đáp án ở cuối file.

1. Helm Chart, Helm Release và Helm Repository khác nhau như thế nào?
2. Lệnh nào tìm chart nginx trong các repository đã thêm?
3. Lệnh nào thêm Bitnami repository?
4. `helm install` khác `helm upgrade` thế nào? Khi nào dùng `helm upgrade --install`?
5. Dùng file `values.yaml` khi cài chart bằng cách nào?
6. Override `replicaCount=5` mà không sửa file values bằng cách nào?
7. Phân biệt `helm list`, `helm list -A`, `helm status`, `helm history` và `helm get values`.
8. Release bị lỗi sau upgrade. Làm sao rollback về revision trước?
9. Lệnh nào xem manifest Helm lưu cho release?
10. Có thể cài cùng một chart nhiều lần trên một cluster không? Điều kiện quan trọng nào cần chú ý?

## 3. Bài tập thực hành

### Bài 01 — Add repo và install chart

Yêu cầu:

1. Thêm Bitnami repository và cập nhật repo [https://charts.bitnami.com/bitnami]
2. Tìm chart nginx.
3. Cài release tên `web-server` vào namespace `web`.
4. Nếu namespace chưa tồn tại, tự tạo namespace.
5. Kiểm tra release và Kubernetes resources.

Gợi ý lệnh:

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm search repo bitnami/nginx
helm install web-server bitnami/nginx -n web --create-namespace
helm list -n web
helm status web-server -n web
kubectl get all -n web
```

### Bài 02 — Override values

Yêu cầu:

1. Xem values mặc định của chart.
2. Upgrade/install release `web-server`.
3. Đặt `replicaCount=3`.
4. Đặt `service.type=NodePort`.
5. Không chỉnh sửa chart gốc.

Gợi ý:

```bash
helm show values bitnami/nginx
helm upgrade --install web-server bitnami/nginx \
  -n web --create-namespace \
  --set replicaCount=3 \
  --set service.type=NodePort
```

**Chú ý:** tên key và khả năng cấu hình phụ thuộc phiên bản chart. Hãy kiểm tra `helm show values` thay vì đoán key.

### Bài 03 — History và rollback

Yêu cầu:

1. Xem lịch sử release.
2. Rollback về revision 1.
3. Kiểm tra trạng thái sau rollback.

```bash
helm history web-server -n web
helm rollback web-server 1 -n web
helm history web-server -n web
helm status web-server -n web
```

### Bài 04 — Sửa lỗi namespace

Lệnh sau thất bại:

```bash
helm install web-server bitnami/nginx -n web
```

Lỗi:

```text
Error: INSTALLATION FAILED: namespaces "web" not found
```

Sửa bằng một lệnh Helm:

```bash
helm install web-server bitnami/nginx -n web --create-namespace
```

### Bài 05 — Render manifest mà không deploy

Yêu cầu: render chart ra YAML để kiểm tra, không tạo resource trong cluster.

```bash
helm template web-server bitnami/nginx -n web
```

Có thể ghi ra file:

```bash
helm template web-server bitnami/nginx -n web > rendered.yaml
```

## 4. Đáp án nhanh

1. Chart là gói định nghĩa/template; Release là một lần cài chart; Repository là nơi phân phối chart.
2. `helm search repo nginx`
3. `helm repo add bitnami https://charts.bitnami.com/bitnami`
4. `install` tạo release mới; `upgrade` cập nhật release đã có; `upgrade --install` xử lý cả hai trường hợp.
5. `helm install RELEASE CHART -f values.yaml`
6. `helm install ... --set replicaCount=5` hoặc khi release đã có: `helm upgrade ... --set replicaCount=5`.
7. `list` liệt kê release trong namespace hiện tại; `list -A` tất cả namespace; `status` xem trạng thái; `history` xem revision; `get values` xem values.
8. `helm rollback RELEASE REVISION -n NAMESPACE`.
9. `helm get manifest RELEASE -n NAMESPACE`.
10. Có. Mỗi lần cài cần tên release khác nhau trong cùng namespace; cần lưu ý resource name, namespace và xung đột tài nguyên do chart tạo ra.

## 5. Checklist trước khi thi

- [ ] Biết thêm và cập nhật Helm repository.
- [ ] Biết tìm chart và xem values mặc định.
- [ ] Biết install chart vào namespace chỉ định.
- [ ] Nhớ `--create-namespace`.
- [ ] Biết dùng `-f` và `--set`.
- [ ] Biết `helm list -A`, `status`, `history`.
- [ ] Biết rollback về revision cụ thể.
- [ ] Phân biệt `helm template` (render local) và `helm install` (cài vào cluster).
- [ ] Biết kiểm tra kết quả bằng `kubectl get`.

## 6. Dọn lab

```bash
helm uninstall web-server -n web
kubectl delete namespace web
```

Chỉ chạy lệnh dọn lab nếu namespace `web` được tạo riêng cho bài thực hành và không chứa workload cần giữ.
