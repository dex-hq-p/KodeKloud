init:
	@echo "Initializing Kubernetes cluster..."
	kind create cluster --name cka --config k8s-cluster-kind-config.yaml
	@echo "Kubernetes cluster initialized."

delete:
	@echo "Deleting Kubernetes cluster..."
	kind delete cluster --name cka
	@echo "Kubernetes cluster deleted."
	