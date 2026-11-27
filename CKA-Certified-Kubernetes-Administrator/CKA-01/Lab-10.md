

```
tranminhhieu@mac ~ % cat backend-svc.yaml 
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: backend-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  ingressClassName: nginx
  rules:
  - http:
      paths:
      - path: /backend
        pathType: Prefix
        backend:
          service:
            name: backend-svc
            port:
              number: 80
tranminhhieu@mac ~ % 

```