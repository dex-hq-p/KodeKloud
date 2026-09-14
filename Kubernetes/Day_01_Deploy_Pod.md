## 
> Create a pod named pod-httpd using the httpd image with the latest tag. Ensure to  specify the tag as httpd:latest.
Set the app label to httpd_app, and name the container as httpd-container.
Note: The kubectl utility on the jump-host has been configured to work with the Kubernetes cluster.

```
apiVersion: v1
kind: Pod
metadata:
  name: pod-httpd
  labels:
    app: httpd_app
spec:
  containers:
    - image: httpd:latest
      name: httpd-container
```

```
kubectl apply -f pod-httpd.yaml
```