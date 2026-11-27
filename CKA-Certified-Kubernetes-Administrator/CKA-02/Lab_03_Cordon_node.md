
```
Câu 3 (5đ):
Cấu hình một node worker để không nhận thêm Pod mới nhưng không làm gián đoạn các Pod đang chạy (không dùng taint). Sau đó revert lại.
Gợi ý: có một lệnh kubectl chuyên dụng cho chính xác hành vi này (khác với drain, vì drain sẽ đuổi cả Pod đang chạy).

```

```
tranminhhieu@mac ~ % kubectl cordon dex-cluster-worker2      
node/dex-cluster-worker2 cordoned
tranminhhieu@mac ~ % kubectl get nodes
NAME                        STATUS                     ROLES           AGE     VERSION
dex-cluster-control-plane   Ready                      control-plane   6h55m   v1.37.0
dex-cluster-worker          Ready                      <none>          6h54m   v1.37.0
dex-cluster-worker2         Ready,SchedulingDisabled   <none>          6h54m   v1.37.0

```