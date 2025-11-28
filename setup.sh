#!/bin/bash
set -e

echo "STEP 1: Build Docker Image"
eval $(minikube docker-env)
docker build -t secure-boot:latest .

echo "STEP 2: Run Terraform"
cd terraform
terraform init
terraform apply -auto-approve
cd ..

echo "STEP 3: Deploy using Helm"
helm upgrade --install secure-boot ./helm/secure-boot -n devops-challenge --create-namespace

echo "SETUP COMPLETE SUCCESSFUL"

