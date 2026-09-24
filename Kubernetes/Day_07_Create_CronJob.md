###

```
Create a cronjob named nautilus.


Set Its schedule to something like */8 * * * *. You can set any schedule for now.


Name the container cron-nautilus.


Utilize the nginx image with latest tag (specify as nginx:latest).


Execute the dummy command echo Welcome to xfusioncorp!.


Ensure the restart policy is OnFailure.

```

```
apiVersion: batch/v1
kind: CronJob
metadata:
  name: nautilus
spec:
  jobTemplate:
    metadata:
      name: nautilus
    spec:
      template:
        metadata: {}
        spec:
          containers:
          - image: nginx:latest
            name: cron-nautilus
            command: 
              - sh
              - -c 
              - | 
                echo Welcome to xfusioncorp!
            resources: {}
          restartPolicy: OnFailure

  schedule: '*/8 * * * *'
status: {}
```