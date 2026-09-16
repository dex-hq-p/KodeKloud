###
> Create a namespace named dev and deploy a POD within it. Name the pod dev-nginx-pod and use the nginx image with the latest tag. Ensure to specify the tag as nginx:latest.

```
thor@jump-host ~$ kubectl create namespace dev
namespace/dev created
thor@jump-host ~$ kubectl run dev-nginx-pod  --image=nginx:latest 
pod/dev-nginx-pod created
thor@jump-host ~$ kubectl get pods
NAME            READY   STATUS    RESTARTS   AGE
dev-nginx-pod   1/1     Running   0          9s
```
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.31.6/manifests/operator-crds.yaml
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.31.7/manifests/operator-crds.yaml
