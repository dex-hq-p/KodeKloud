
```
apiVersion: v1
kind: Pod
metadata:
  name: empty-dir-pod
spec:
  containers:
    - name: hardened-app
      image: alpine:latest
      command: ["sh", "-c", "echo hello > /tmp/test.txt; sleep 1000"]
      volumeMounts:
        - name: temp-storage
          mountPath: /tmp
  volumes:
    - name: temp-storage
      emptyDir: {}

kubectl exec -it empty-dir-pod -- sh

tranminhhieu@mac lab-k8s-kind % kubectl exec empty-dir-pod -- cat /tmp/test.txt
hello
```