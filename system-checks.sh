#!/bin/bash

echo "Running user inside container:"
kubectl exec -n devops-challenge deploy/secure-boot -- id

echo "Port binding check:"
kubectl exec -n devops-challenge deploy/secure-boot -- netstat -tulnp

echo "Port forwarding service to localhost..."
kubectl port-forward svc/secure-boot 8080:80 -n devops-challenge &

sleep 5

echo "Testing API:"
curl http://localhost:8080

