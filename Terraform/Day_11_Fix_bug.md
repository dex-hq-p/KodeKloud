###

```
An application deployed on the Kubernetes cluster requires an update with new features developed by the Nautilus application development team. The existing setup includes a deployment named nginx-deployment and a service named nginx-service. Below are the necessary changes to be implemented without deleting the deployment and service:

1.) Modify the service nodeport from 30008 to 32165

2.) Change the replicas count from 1 to 5

3.) Update the image from nginx:1.19 to nginx:latest

Note: The kubectl utility on the jump-host has been configured to work with the Kubernetes cluster.
```

```
   1  kubectl get deployments.apps 
    2  kubectl get svc
    3  kubectl edit svc nginx-service 
    4  kubectl scale deployment nginx-deployment --replicas=5
    5  kubectl set image deployments nginx-deployment nginx=nginx:latest
    6  kubectl get deployments.apps 
    7  kubectl get deployments.apps -owide
    8  kubectl set image deployments nginx-deployment nginx-container=nginx:latest
```