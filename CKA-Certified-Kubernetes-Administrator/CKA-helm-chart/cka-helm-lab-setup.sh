#!/usr/bin/env bash
set -euo pipefail

RELEASE="${RELEASE:-web-server}"
NAMESPACE="${NAMESPACE:-web}"
REPO_NAME="${REPO_NAME:-bitnami}"
REPO_URL="${REPO_URL:-https://charts.bitnami.com/bitnami}"
CHART="${CHART:-bitnami/nginx}"

echo "== Checking prerequisites =="
command -v kubectl >/dev/null || { echo "kubectl is not installed"; exit 1; }
command -v helm >/dev/null || { echo "helm is not installed"; exit 1; }

kubectl cluster-info
kubectl get nodes

echo
echo "== Adding/updating Helm repository =="
if helm repo list -o yaml 2>/dev/null | grep -q "name: ${REPO_NAME}$"; then
  echo "Repository ${REPO_NAME} already exists; skipping add."
else
  helm repo add "${REPO_NAME}" "${REPO_URL}"
fi
helm repo update

echo
echo "== Searching chart =="
helm search repo "${CHART}"

echo
echo "== Installing/upgrading release =="
helm upgrade --install "${RELEASE}" "${CHART}" \
  --namespace "${NAMESPACE}" \
  --create-namespace

echo
echo "== Release status =="
helm status "${RELEASE}" --namespace "${NAMESPACE}"
helm list --namespace "${NAMESPACE}"

echo
echo "== Kubernetes resources =="
kubectl get all --namespace "${NAMESPACE}"

echo
echo "Lab bootstrap completed."
echo "To inspect values: helm show values ${CHART}"
echo "To inspect history: helm history ${RELEASE} -n ${NAMESPACE}"
echo "To clean up:       helm uninstall ${RELEASE} -n ${NAMESPACE}"
