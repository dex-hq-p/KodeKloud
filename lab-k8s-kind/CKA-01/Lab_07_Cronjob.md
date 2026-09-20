```
Câu 6 (7đ):
Tạo một CronJob tên log-cleaner chạy mỗi 2 phút, sử dụng image busybox, thực thi lệnh in ra "Cleaning logs..." rồi thoát. Đảm bảo giữ lại tối đa 3 job thành công gần nhất (successfulJobsHistoryLimit).
```

```
apiVersion: batch/v1
kind: CronJob
metadata:
  name: log-cleaner
spec:
  successfulJobsHistoryLimit: 3
  schedule: "*/2 * * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: busybox
            image: busybox:latest
            imagePullPolicy: IfNotPresent
            command:
            - /bin/sh
            - -c
            - echo Cleaning logs...
          restartPolicy: OnFailure


kubectl get cronjob log-cleaner
kubectl get jobs --watch
```