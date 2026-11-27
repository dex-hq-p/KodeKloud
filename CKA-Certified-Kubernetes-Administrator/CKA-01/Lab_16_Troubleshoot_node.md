###

```
Giả lập lỗi bằng cách dừng kubelet trên 1 worker node (dùng docker exec <container-worker> systemctl stop kubelet hoặc tương đương trong kind). Quan sát trạng thái node qua kubectl get nodes, phân tích log (journalctl -u kubelet bên trong container node), sau đó start lại kubelet và xác nhận node trở lại Ready.
Gợi ý bắt đầu:
bash
docker exec -it dex-cluster-worker2 systemctl stop kubelet
kubectl get nodes
```

```
kubectl describe nodes dex-cluster-worker2
tất cả 4 Condition (MemoryPressure, DiskPressure, PIDPressure, Ready) đều chuyển sang Unknown

docker exec -it dex-cluster-worker2 journalctl -u kubelet -n 30 --no-pager

==> xac nhan nguyen nhan do kubelet k start

docker exec -it dex-cluster-worker2 systemctl start kubelet
sleep 20
kubectl get nodes


```

