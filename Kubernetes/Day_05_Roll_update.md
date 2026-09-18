```
Execute a rolling update for this application, integrating the nginx:1.17 image. The deployment is named nginx-deployment.
```

```
kubectl get deployment nginx-deployment -o jsonpath='{.spec.template.spec.containers[*].name}'

kubectl set image deployments nginx-deployment nginx-container=nginx:1.17
kubectl rollout status deployment/nginx-deployment

```