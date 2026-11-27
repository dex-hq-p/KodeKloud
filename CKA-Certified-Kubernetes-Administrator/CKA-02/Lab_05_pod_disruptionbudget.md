###

```
Tạo Deployment api với image nginx, 4 replicas. Cấu hình PodDisruptionBudget tên api-pdb đảm bảo tối thiểu 3 Pod luôn sẵn sàng trong lúc voluntary disruption (minAvailable: 3). Sau đó thử kubectl drain node đang chạy phần lớn Pod của Deployment này và quan sát hành vi (PDB có chặn drain không nếu vi phạm điều kiện).
```

```
 1345  kubectl create deployment api --image=nginx:latest --replicas=4 
 1346  kubectl create poddisruptionbudget api-pdb --selector=app=api --min-available=3
 1347  kubectl get deployments.apps
 1348  kubectl delete deployments.apps backend
 1349  kubectl get deployments.apps
 1350  kubectl get pods -owide
 1351  kubectl drain dex-cluster-worker
 1352  kubectl drain dex-cluster-worker --ignore-daemonsets
 1353  kubectl get pods
 1354  kubectl get nodes
 1355  kubectl uncordon dex-cluster-worker
 1356  kubectl get nodes

```