###
>


``` Current
# Fraud detection project dependencies
scikit-learn
mlflow>=3.0.0
pandas
numpy
```

```
uv pip compile requirements.in -o requirements.txt
```

---
apiVersion: v1
kind: Pod
metadata:
  name: httpd-pod
spec:
  containers:
  - name: httpd-container
    image: httpd:latest
    resources:
      requests:
        memory: "15Mi"
        cpu: "100m"
      limits:
        memory: "20Mi"
        cpu: "100m"
