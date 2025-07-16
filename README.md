

# 3S DevOps Task

This repository contains a complete DevOps project designed as part of the 3S DevOps technical assessment. It showcases a fully containerized .NET Web API deployed using Kubernetes with a CI/CD pipeline implemented through Jenkins. The system is configured with monitoring, logging, and persistent storage.

---

## 🛠️ Project Structure

```
3S-Devops-Task/
│
├── src/                       # Source code for the .NET Web API
│   └── api/
│       └── server/            # .NET 9 Web API project
│
├── Dockerfile                 # Dockerfile to containerize the Web API
├── docker-compose.yml         # Optional local Docker setup
├── Jenkinsfile                # Jenkins pipeline for CI/CD
├── k8s/                       # Kubernetes manifests for deployment
│   ├── DB_statefulset.yaml
│   ├── DB_service.yaml
│   ├── secret.yaml
│   ├── Server.yaml
│   └── Server_service.yaml
└── README.md                  # Project documentation
```

---

## ✅ Features

* ✅ .NET 9 Web API application
* ✅ Dockerized application with Dockerfile
* ✅ Jenkins CI pipeline:

  * Code checkout
  * Docker image build & push

* ✅ PostgreSQL via Kubernetes StatefulSet
* ✅ Persistent Volume Claims for database
* ✅ Use Kubernetes Secret to keep sensitive data (e.g., db_password)
* ✅ Local development via Docker Compose (optional)

---

## 🚀 Getting Started

### Prerequisites

* Docker & Docker Compose
* Kubernetes (K3s or Minikube recommended)
* kubectl
* Jenkins
* Git

---

### 🧪 Local Development (Docker Compose) for Testing

```bash
docker-compose up --build
```

---

### ☸️ Kubernetes Deployment

1. **Set up K3s (or your preferred Kubernetes distribution)**
![K3S](Images/k3s.png)


2. **Apply manifests**

```bash
kubectl apply -f k8s/
```

3. **Check resources**

```bash
kubectl get all
```
![K3S](Images/k8s-resources.png)

---

### 🐳 Jenkins Pipeline

The Jenkins pipeline (in `Jenkinsfile`) handles:

* Building and tagging Docker images
* Pushing to Docker Hub

You’ll need to:

1. Set up a Jenkins with Docker access.
2. Store your Docker Hub credentials as Jenkins credentials.
3. Configure environment variables in Jenkins:

   * `DOCKER_IMAGE_NAME`
   * `DOCKER_IMAGE_TAG`

![gui of swagger](Images/jenkins_pipeline.png)

---

## 📦 Docker Image

* **Image Name**: `mina1402/3s-task`
![K3S](Images/dockerhub.png)



---

## 🔐 Secrets & Configurations

Sensitive data such as PostgreSQL passwords are stored securely using Kubernetes `Secrets`:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: postgres-secret
type: Opaque
data:
  POSTGRES_PASSWORD: base64_encoded_password
```

---

## TESTING
![check token](Images/k8s-resources.png)
![gui of swagger](Images/gui.png)


## 🙌 Author

**Mina Safwat**
[GitHub Profile](https://github.com/mina-safwat-1)

---
