#!/bin/bash

sleep 10
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.12/config/manifests/metallb-native.yaml
sleep 20
kubectl apply -f kind/loadBalancer/metallb-config.yaml