```
Câu 9 (7đ):
Tạo Deployment backend với image hashicorp/http-echo, args ["-text=hello-backend"], 2 replicas, container port 5678. Expose Deployment này qua Service ClusterIP tên backend-svc port 80 -> targetPort 5678.

```

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: backend
  labels:
    app: backend
spec:
  replicas: 2
  selector:
    matchLabels:
      app: backend
  template:
    metadata:
      labels:
        app: backend
    spec:
      containers:
      - name: hashicorp-http-echo
        image: hashicorp/http-echo:latest
        ports:
        - containerPort: 5678
        args: ["-text=hello-backend"]

kubectl expose deployment backend --name=backend-svc --port=80 --target-port=5678

kubectl get svc backend-svc
kubectl get endpoints backend-svc
```