```
Câu 4 (8đ):
Tạo Pod multi-container gồm 2 container:
writer: image busybox, mỗi 5 giây ghi timestamp hiện tại vào file /var/log/app.log (dùng vòng lặp shell).
reader: image busybox, liên tục tail -f /var/log/app.log.
Hai container phải chia sẻ chung file này qua emptyDir. Xác nhận bằng kubectl logs multi-container -c reader thấy log tăng dần theo thời gian.

```
```
apiVersion: v1
kind: Pod
metadata:
  name: multi-container
spec:
  containers:
    - image: busybox
      name: writer
      resources: {}
      command: 
        - sh
        - -c
        - | 
          while true;do
  	        date >> /var/log/app.log
  	        sleep 50
  	      done
      volumeMounts:
      - mountPath: /var/log
        name: share-log
    - image: busybox
      name: reader
      resources: {}
      command: 
        - sh
        - -c 
        - "tail -f /var/log/app.log"
      volumeMounts:
      - mountPath: /var/log
        name: share-log
  volumes:
  - name: share-log
    emptyDir: {} 


kubectl logs multi-container -c reader --follow




```
