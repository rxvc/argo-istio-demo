#!/bin/bash

ARGO_HELM_CHART_VERSION=8.0.2

#install argo cd helm chart
helm repo add argocd https://argoproj.github.io/argo-helm 
helm repo update
kubectl create namespace argocd
helm upgrade argocd argo-cd/argo-cd --install --namespace argocd --version $ARGO_HELM_CHART_VERSION

# check status
kubectl -n argocd rollout status deploy/argocd-applicationset-controller
kubectl -n argocd rollout status deploy/argocd-dex-server
kubectl -n argocd rollout status deploy/argocd-notifications-controller
kubectl -n argocd rollout status deploy/argocd-redis
kubectl -n argocd rollout status deploy/argocd-repo-server
kubectl -n argocd rollout status deploy/argocd-server

# set the pwd to argo-istio-demo
kubectl -n argocd patch secret argocd-secret \
  -p '{"stringData": {
    "admin.password": "$2a$12$vjycvaXorqhn9ltE9vHe/enze9nrLkLKN64vx0sYrhsYGOcDly0cK",
    "admin.passwordMtime": "'$(date +%FT%T%Z)'"
  }}'

# # install argo rollouts
# kubectl create namespace argo-rollouts
# kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml

# kubectl apply -f gateway-plugin.yml -n argo-rollouts
# kubectl rollout restart deployment -n argo-rollouts argo-rollouts

# kubectl apply -f argo-rbac.yaml