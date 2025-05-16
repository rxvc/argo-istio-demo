#!/bin/bash

echo "Install istio ..."
kubectl apply -f istio/istio-base-application.yaml -n argocd
kubectl apply -f istio/istiod-application.yaml -n argocd 
kubectl apply -f istio/istio-ingress-gateway-application.yaml -n argocd  