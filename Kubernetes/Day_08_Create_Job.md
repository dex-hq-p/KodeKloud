###

```
Create a job named countdown-devops.

The spec template should be named countdown-devops (under metadata), and the container should be named container-countdown-devops

Utilize image ubuntu with latest tag (ensure to specify as ubuntu:latest), and set the restart policy to Never.

Execute the command sleep 5
```

```
apiVersion: batch/v1
kind: Job
metadata:
  name: countdown-devops
spec:
  template:
    metadata: 
      name: countdown-devops
    spec:
      containers:
      - image: ubuntu:latest
        name: container-countdown-devops
        resources: {}
        command:
          - sh
          - -c 
          - | 
            sleep 5
      restartPolicy: Never
status: {}
```