#!/bin/bash

echo "Install istio ..."
kubectl apply -f istio/sidecard/istio-base-application.yaml -n argocd
kubectl apply -f istio/sidecard/istiod-application.yaml -n argocd 
kubectl apply -f istio/sidecard/istio-ingressgateway-application.yaml -n argocd  