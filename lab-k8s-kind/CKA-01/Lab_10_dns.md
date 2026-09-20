###

```
<service-name>.<namespace>.svc.cluster.local
backend-svc.default.svc.cluster.local
     │          │       │       │
     │          │       │       └── cluster domain mặc định
     │          │       └────────── Service
     │          └────────────────── namespace
     └───────────────────────────── Service name

kubectl get svc
kubectl get svc -A


```