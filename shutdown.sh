#!/bin/bash

echo "Delete the kind cluster to clean up our machine..."
kind delete cluster -n argo-istio-demo