
```

apiVersion: v1
kind: Pod
metadata:
  name: with-affinity
spec:
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: disktype
            operator: In
            values:
            - ssd
  containers:
  - name: nginx
    image: nginx:latest

kubectl label node dex-cluster-worker disktype=ssd

kubectl get nodes --show-label
```