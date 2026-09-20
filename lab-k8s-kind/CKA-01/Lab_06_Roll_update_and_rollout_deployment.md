
```
kubectl create deployment web-app --image=nginx:1.25 --replicas=3 
kubectl describe deployments.apps web-app
kubectl set image deployment web-app nginx=nginx:1.27
kubectl rollout status deployment web-app      
kubectl rollout undo deployment web-app        
kubectl rollout status deployment web-app  

kubectl get deployment web-app -o jsonpath='{.spec.template.spec.containers[0].image}'
kubectl rollout history deployment web-app
```