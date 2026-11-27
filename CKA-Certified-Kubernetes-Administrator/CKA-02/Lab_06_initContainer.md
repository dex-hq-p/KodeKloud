###
```
Câu 6 (5đ):
Tạo một Pod dùng initContainers: init container tên init-check chạy busybox, chờ (sleep 10) rồi in ra "init done"; container chính chỉ khởi động sau khi init container hoàn tất. Xác nhận thứ tự này qua kubectl describe pod.

```


```
apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
spec:
  containers:
  - name: myapp-container
    image: busybox:1.28
    command:
      - sh
      - -c
      - |
        sleep 3600
  initContainers:
  - name: init-check
    image: busybox:1.28
    command: 
      - sh
      - -c
      - |
        sleep 10
        echo init done

```