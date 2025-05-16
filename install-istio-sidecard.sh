#!/bin/bash

echo "Install istio ..."
echo "Install istio base ..."
kubectl apply -f istio/sidecard/istio-base-application.yaml -n argocd
echo "Install istiod ..."
kubectl apply -f istio/sidecard/istiod-application.yaml -n argocd 
sleep 20
echo "Install metalib for kind loadbalancer"
bash kind/loadBalancer/install-metalib.sh
echo "Install istio ingressgateway ..."
kubectl apply -f istio/sidecard/istio-ingressgateway-application.yaml -n argocd  