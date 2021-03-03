#!/bin/bash

set -e

./webhook-create-signed-cert.sh

kubectl get secret admission-webhook-example-certs

kubectl create -f rbac.yaml

kubectl create -f deployment.yaml

cat mutatingwebhook.yaml | ./webhook-patch-ca-bundle.sh > mutatingwebhook-ca-bundle.yaml

kubectl create -f mutatingwebhook-ca-bundle.yaml
