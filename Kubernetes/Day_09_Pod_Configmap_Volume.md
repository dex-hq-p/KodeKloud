###

```
Create a pod called time-check in the devops namespace. The pod should contain a container named time-check, utilizing the busybox image with the latest tag (specify as busybox:latest).

Create a config map named time-config with the data TIME_FREQ=4 in the same namespace.

Configure the time-check container to execute the command: while true; do date; sleep $TIME_FREQ;done. Ensure the result is written /opt/itadmin/time/time-check.log. Also, add an environmental variable TIME_FREQ in the container, fetching its value from the config map TIME_FREQ key.

Create a volume log-volume and mount it at /opt/itadmin/time within the container.
```

```
kubectl create namespace devops

kubectl create configmap time-config --from-literal=TIME_FREQ=4 -n devops

apiVersion: v1
kind: Pod
metadata:
  name: time-check
  namespace: devops
spec:
  containers:
  - image: busybox:latest
    name: time-check
    command: 
      - sh
      - -c
      - while true; do date >> /opt/itadmin/time/time-check.log ; sleep $TIME_FREQ; done
    env:
      - name: TIME_FREQ
        valueFrom:
          configMapKeyRef:
            name: time-config
            key: TIME_FREQ

    volumeMounts:
    - mountPath: /opt/itadmin/time
      name: log-volume
  volumes:
  - name: log-volume
    emptyDir: {}

kubectl apply -f time-check.yaml 

```