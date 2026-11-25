```
Tạo Pod tên resource-pod với image nginx, request cpu: 100m, memory: 128Mi và limit cpu: 250m, memory: 256Mi. Sau đó tạo thêm 1 Pod tên priority-pod sử dụng PriorityClass có giá trị 1000000 (tự tạo PriorityClass tên high-priority trước).
```

```
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: resource-pod
  name: resource-pod
spec:
  containers:
  - image: nginx:latest
    name: resource-pod
    resources:
      requests:
        memory: "128Mi"
        cpu: "100m"
      limits:
        memory: "256Mi"
        cpu: "250m"
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}

kubectl create priorityclass high-priority --value=1000000

apiVersion: v1
kind: Pod
metadata:
  name: priority-pod
spec:
  containers:
  - name: nginx
    image: nginx
    imagePullPolicy: IfNotPresent
  priorityClassName: high-priority

```

```
kubectl apply -f resource-pod.yaml
kubectl get pod resource-pod -o jsonpath='{.spec.containers[0].resources}'
echo

kubectl apply -f priority-pod.yaml
kubectl get pod priority-pod -o jsonpath='{.spec.priorityClassName}{"\n"}{.spec.priority}'
```
