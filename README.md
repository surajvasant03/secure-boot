# Secure-Boot – DevOps Engineering Challenge
This project shows how to deploy a FastAPI application using Docker, Kubernetes (Minikube), Helm, and Terraform with basic security best practices.

## Tech Stack
FastAPI (Python), Docker, Kubernetes (Minikube), Helm, Terraform, Bash Script

## Project Structure
.
├── app/
│   └── main.py  
├── requirements.txt  
├── Dockerfile  
├── helm/
│   └── secure-boot/
│       ├── Chart.yaml  
│       ├── values.yaml  
│       └── templates/
│           ├── deployment.yaml  
│           └── service.yaml  
├── terraform/
│   └── main.tf  
└── setup.sh  

---

## API Endpoint
GET /
Response:
{ "message": "Hello, Candidate", "version": "1.0.0" }

## How to Run the Project

Start Minikube  
minikube start  

Build Docker Image  
eval $(minikube docker-env)  
docker build -t secure-boot:latest .  

Run Terraform  
cd terraform  
terraform init  
terraform apply -auto-approve  
cd ..  

Deploy using Helm  
helm upgrade --install secure-boot ./helm/secure-boot -n devops-challenge --create-namespace  

Access the App  
minikube service secure-boot -n devops-challenge  

## Key Features

- Non-root container  
- Application runs on Port 80  
- Kubernetes deployment using Helm  
- Infrastructure using Terraform  
- Automated setup using Bash script  


