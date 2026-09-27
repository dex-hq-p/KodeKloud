
###
```
A ReplicaSet named nginx-replicaset is already running in the cluster.

The pods managed by the ReplicaSet use the following labels:
Assign labels app as nginx_app, and type as front-end.

Create a NodePort Service named nginx-service to expose the application.

Set the NodePort to 30080.

Expose port 80 of the application
```

```
kubectl expose replicaset nginx-replicaset --type=NodePort --target-port=80 --port=80 --name=nginx-service

kubectl edit svc nginx-service 
:%s/old/30080/g

kubectl get svc nginx-service 
```