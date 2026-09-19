
###
> There exists a deployment named nginx-deployment; initiate a rollback to the previous revision.

```
# Update
kubectl set image deployment/nginx-deployment nginx-container=nginx:alpine

# Xem status
kubectl rollout status deployment/nginx-deployment

# Xem history
kubectl rollout history deployment/nginx-deployment

# Rollback về revision trước
kubectl rollout undo deployment/nginx-deployment

# Rollback về revision cụ thể
kubectl rollout undo deployment/nginx-deployment --to-revision=1

# Pause rollout
kubectl rollout pause deployment/nginx-deployment

# Resume rollout
kubectl rollout resume deployment/nginx-deployment
```