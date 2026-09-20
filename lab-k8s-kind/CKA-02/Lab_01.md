
###
```
Câu 1 (8đ):
Tạo ClusterRole tên node-viewer cho phép get, list trên resource nodes và nodes/status (cluster-scoped, không namespace). Tạo ServiceAccount monitor-sa trong namespace monitoring (tự tạo namespace). Bind ClusterRole này với ServiceAccount qua ClusterRoleBinding. Sau đó dùng kubectl auth can-i xác nhận SA có quyền get nodes nhưng không có quyền delete nodes.

```

```
 1290  kubectl create clusterrole node-viewer --verb=get,list --resource=nodes,nodes/status
 1291  kubectl create ns monitoring
 1292  kubectl create sva monitor-sa -n monitoring 
 1293  kubectl create serviceaccount monitor-sa -n monitoring 
 1295  kubectl create clusterrolebinding crb-monitor-cr --clusterrole=node-viewer --serviceaccount=monitoring:monitor-sa 
 1298  kubectl auth can-i get nodes --as=system:serviceaccount:monitoring:monitor-sa
```