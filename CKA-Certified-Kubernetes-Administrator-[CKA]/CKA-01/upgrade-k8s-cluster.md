### control plan first 
# 1. Upgrade kubeadm
sudo apt-mark unhold kubeadm
sudo apt-get update && sudo apt-get install -y kubeadm='1.31.x-*'
sudo apt-mark hold kubeadm

# 2. Xem kế hoạch upgrade
sudo kubeadm upgrade plan

# 3. Apply upgrade (chỉ node đầu tiên dùng "apply")
sudo kubeadm upgrade apply v1.31.x

# 4. Drain node (chuẩn bị upgrade kubelet)
kubectl drain <node-name> --ignore-daemonsets

# 5. Upgrade kubelet + kubectl
sudo apt-mark unhold kubelet kubectl
sudo apt-get update && sudo apt-get install -y kubelet='1.31.x-*' kubectl='1.31.x-*'
sudo apt-mark hold kubelet kubectl

# 6. Restart kubelet
sudo systemctl daemon-reload
sudo systemctl restart kubelet

# 7. Uncordon node
kubectl uncordon <node-name>

### control plan n th 
sudo kubeadm upgrade node
# 4. Drain node (chuẩn bị upgrade kubelet)
kubectl drain <node-name> --ignore-daemonsets

# 5. Upgrade kubelet + kubectl
sudo apt-mark unhold kubelet kubectl
sudo apt-get update && sudo apt-get install -y kubelet='1.31.x-*' kubectl='1.31.x-*'
sudo apt-mark hold kubelet kubectl

# 6. Restart kubelet
sudo systemctl daemon-reload
sudo systemctl restart kubelet

# 7. Uncordon node
kubectl uncordon <node-name>


### Worker
# 1. Upgrade kubeadm (chỉ kubeadm, không cần kubectl)
sudo apt-mark unhold kubeadm
sudo apt-get update && sudo apt-get install -y kubeadm='1.31.x-*'
sudo apt-mark hold kubeadm

# 2. Upgrade node config
sudo kubeadm upgrade node

# 3. Drain node (chạy từ máy có quyền control-plane, không phải trên chính worker)
kubectl drain <node-name> --ignore-daemonsets

# 4. Upgrade kubelet (kubectl không bắt buộc trên worker)
sudo apt-mark unhold kubelet
sudo apt-get update && sudo apt-get install -y kubelet='1.31.x-*'
sudo apt-mark hold kubelet

# 5. Restart kubelet
sudo systemctl daemon-reload
sudo systemctl restart kubelet

# 6. Uncordon node
kubectl uncordon <node-name>