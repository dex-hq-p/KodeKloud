
```
Câu 17 (10đ) — Debug Service không kết nối được:
Tạo Service với selector sai (không khớp với label của Pod đang chạy) để mô phỏng lỗi thật gặp trong CKA. Dùng kubectl get endpoints, kubectl describe svc để phát hiện vấn đề selector không match, rồi sửa lại đúng.
Gợi ý: bạn có thể dùng lại Deployment backend (label app=backend) đã có sẵn, tạo 1 Service mới với selector cố tình sai (ví dụ app=backendd hoặc app=frontend), rồi debug và sửa.
Bạn thử làm rồi gửi YAML/lệnh + output cho mình nhé.

```

```
### kiem tra label deployment 
kubectl describe deployment backend ==> app=backend

### kiem tra caaus hinh service
kubectl describe svc backend-svc
=> check app xem dung k? neu k thi sua
### kiem tra ingress 
=> check xem tro dung svc , port hay chua
```