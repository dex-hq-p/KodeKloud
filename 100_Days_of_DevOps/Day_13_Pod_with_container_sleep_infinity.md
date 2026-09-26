
###

```
There is a pod named webserver, and the container within it is named httpd-container, its utilizing the httpd:latest image.

Additionally, there's a sidecar container named sidecar-container using the ubuntu:latest image.

Identify and address the issue to ensure the pod is in the running state and the application is accessible.
```

```
thor@jump-host ~$ cat webserver.yaml 
apiVersion: v1
kind: Pod
metadata:
  name: webserver
spec:
  containers:
  - image: nginx:latest
    name: nginx-container
  - image: ubuntu:latest
    name: sidecar-container
    command: 
      - sleep
      - infinity
  dnsPolicy: ClusterFirst
  restartPolicy: Always

kubectl label pods webserver app=web-app
```
