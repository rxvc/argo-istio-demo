#!/bin/bash

echo "Create the kind cluster..."
kind create cluster --name argo-istio-demo --config=cluster.yaml