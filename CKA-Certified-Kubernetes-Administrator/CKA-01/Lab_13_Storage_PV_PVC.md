

```
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: local-fast
provisioner: rancher.io/local-path
volumeBindingMode: WaitForFirstConsumer

apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: data-pvc
spec:
  storageClassName: local-fast
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi

apiVersion: v1
kind: Pod
metadata:
  name: pod
spec:
  volumes:
  - name: vol
    persistentVolumeClaim:
        claimName: data-pvc
  containers:
  - name: pv-recycler
    image: "registry.k8s.io/busybox"
    command: ["sleep", "3600"]
    volumeMounts:
    - name: vol
      mountPath: /data
```