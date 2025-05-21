#!/bin/bash

#Configure the Kubernetes Gateway API CRDs on the cluster, we will need these to deploy components like the Waypoint proxy:
echo "installing Kubernetes Gateway CRDs"
kubectl get crd gateways.gateway.networking.k8s.io &> /dev/null || \
  { kubectl kustomize "github.com/kubernetes-sigs/gateway-api/config/crd?ref=v1.0.0" | kubectl apply -f -; }123