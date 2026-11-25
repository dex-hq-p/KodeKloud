init:
	@echo "Initializing Kubernetes cluster..."
	kind create cluster --name dex-cluster --config k8s-cluster-kind-config.yaml
	@echo "Kubernetes cluster initialized."

delete:
	@echo "Deleting Kubernetes cluster..."
	kind delete cluster --name dex-cluster
	@echo "Kubernetes cluster deleted."