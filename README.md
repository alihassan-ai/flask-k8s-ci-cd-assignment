# Flask K8s CI/CD Assignment

**Course:** Cloud MLOps (BS AI)
**Assignment #3:** End-to-End CI/CD Pipeline for a Flask Application

## Team Members

- **Member A (Admin):** Saamer Abbas - 22i-0468
- **Member B (Developer):** Ali hassan - 22i-0541

## Project Overview

This project implements a complete Continuous Integration and Continuous
Delivery (CI/CD) pipeline for a simple Python Flask application using
Kubernetes orchestration. The pipeline demonstrates industry-standard
DevOps practices using Git, GitHub Actions, Jenkins, Docker, and Kubernetes.

## Kubernetes Features Used

### 1. Rolling Update Strategy
- **maxSurge:** 1 - Allows one additional pod above desired replicas
- **maxUnavailable:** 1 - Allows one pod to be unavailable during updates
- Ensures zero-downtime deployments

### 2. Horizontal Scaling
- Configured with 3 replicas for high availability
- Can be scaled using: `kubectl scale deployment flask-app-deployment
--replicas=N`

### 3. Load Balancing
- NodePort service type for external access
- Automatically distributes traffic across all healthy pods
- Port 30080 exposed for external access

### 4. Resource Management
- **Requests:** 100m CPU, 128Mi Memory
- **Limits:** 200m CPU, 256Mi Memory
- Ensures efficient resource utilization

### 5. Health Probes
- **Liveness Probe:** Restarts unhealthy containers
- **Readiness Probe:** Ensures traffic only to ready pods

## Prerequisites

- Docker Desktop or Docker Engine
- Minikube
- kubectl
- Jenkins
- Git
- Python 3.11+

## Local Development

### 1. Build and Run with Docker

```bash
# Build the Docker image
docker build -t flask-k8s-app:latest .

# Run the container
docker run -p 5000:5000 flask-k8s-app:latest

# Test the application
curl http://localhost:5000
```

### 2. Run Locally without Docker

```bash
# Install dependencies
pip install -r requirements.txt

# Run the Flask application
python app.py

# Application will be available at http://localhost:5000
```

### 3. Run Tests

```bash
# Install test dependencies
pip install -r requirements.txt

# Run flake8 linting
flake8 . --count --max-line-length=90 --statistics

# Run pytest unit tests
pytest test_utils.py -v
```

## Kubernetes Deployment

### 1. Start Minikube

```bash
# Start minikube cluster
minikube start

# Verify cluster is running
minikube status
```

### 2. Build Docker Image for Minikube

```bash
# Use minikube's Docker daemon
eval $(minikube docker-env)

# Build the image
docker build -t flask-k8s-app:latest .
```

### 3. Deploy to Kubernetes

```bash
# Apply Kubernetes manifests
kubectl apply -f kubernetes/deployment.yaml
kubectl apply -f kubernetes/service.yaml

# Verify deployment
kubectl get deployments
kubectl get pods
kubectl get services
```

### 4. Access the Application

```bash
# Get minikube IP
minikube ip

# Access the application
curl http://$(minikube ip):30080

# Or use minikube service
minikube service flask-app-service
```

### 5. Test Scaling

```bash
# Scale to 5 replicas
kubectl scale deployment flask-app-deployment --replicas=5

# Verify scaling
kubectl get pods -w
```

### 6. Test Rolling Updates

```bash
# Update the deployment (e.g., change image)
kubectl set image deployment/flask-app-deployment \
flask-app=flask-k8s-app:v2

# Watch the rollout
kubectl rollout status deployment/flask-app-deployment

# View rollout history
kubectl rollout history deployment/flask-app-deployment
```

### 7. Test Rollback

```bash
# Rollback to previous version
kubectl rollout undo deployment/flask-app-deployment

# Verify rollback
kubectl rollout status deployment/flask-app-deployment
```

## Jenkins Pipeline Deployment

### 1. Start Jenkins

```bash
# Start Jenkins service
brew services start jenkins-lts

# Jenkins will be available at http://localhost:8080
# Initial admin password location:
cat ~/.jenkins/secrets/initialAdminPassword
```

### 2. Configure Jenkins

1. Install required plugins:
   - Git Plugin
   - Pipeline Plugin
   - Docker Pipeline Plugin
   - Kubernetes CLI Plugin

2. Configure kubectl access:
   - Copy kubeconfig to Jenkins workspace
   - Set up Kubernetes credentials in Jenkins

3. Create Pipeline Job:
   - New Item → Pipeline
   - Configure SCM: Git repository URL
   - Script Path: Jenkinsfile

### 3. Deploy via Jenkins Pipeline

The Jenkins pipeline automatically:

1. **Build Stage:** Builds Docker image from Dockerfile
2. **Deploy Stage:** Applies Kubernetes manifests
3. **Verify Stage:** Checks rollout status and verifies pods/services

Trigger the pipeline:
- Manually through Jenkins UI
- Automatically via GitHub webhook on push to main branch

## CI/CD Pipeline Workflow

### GitHub Actions (Continuous Integration)

Triggers on push to any branch:

1. Sets up Python environment
2. Installs dependencies
3. Runs flake8 linting (max line length: 90 characters)
4. Runs pytest unit tests
5. Builds Docker image

### Jenkins (Continuous Delivery)

Triggers on merge to main branch:

1. Builds Docker image
2. Deploys to Kubernetes cluster
3. Verifies deployment status

## Project Structure

```
.
├── .github/
│   └── workflows/
│       └── ci.yml              # GitHub Actions CI workflow
├── kubernetes/
│   ├── deployment.yaml         # K8s Deployment manifest
│   └── service.yaml            # K8s Service manifest
├── app.py                      # Flask application
├── utils.py                    # Utility functions
├── test_utils.py               # Unit tests
├── requirements.txt            # Python dependencies
├── Dockerfile                  # Multi-stage Docker build
├── Jenkinsfile                 # Jenkins pipeline definition
├── .gitignore                  # Git ignore rules
└── README.md                   # This file
```

## Automated Rollouts, Scaling, and Load Balancing

### Automated Rollouts

The rolling update strategy ensures smooth deployments:

- New pods are created before old ones are terminated
- Maximum of 4 pods during update (3 + maxSurge 1)
- Minimum of 2 pods available (3 - maxUnavailable 1)
- Automatic rollback on failed health checks

### Scaling

Horizontal scaling is configured for high availability:

```bash
# Manual scaling
kubectl scale deployment flask-app-deployment --replicas=5

# Auto-scaling (optional - requires metrics server)
kubectl autoscale deployment flask-app-deployment \
--min=3 --max=10 --cpu-percent=80
```

### Load Balancing

The NodePort service provides load balancing:

- Traffic is distributed across all healthy pods
- Service maintains session affinity if needed
- Automatic failover to healthy pods
- External access via minikube IP and NodePort

## Troubleshooting

### Check Pod Status

```bash
kubectl get pods
kubectl describe pod <pod-name>
kubectl logs <pod-name>
```

### Check Deployment

```bash
kubectl get deployments
kubectl describe deployment flask-app-deployment
kubectl rollout status deployment/flask-app-deployment
```

### Check Service

```bash
kubectl get services
kubectl describe service flask-app-service
```

### Debug Minikube

```bash
minikube status
minikube logs
minikube ssh
```

## Cleanup

```bash
# Delete Kubernetes resources
kubectl delete -f kubernetes/

# Stop minikube
minikube stop

# Delete minikube cluster
minikube delete

# Stop Jenkins
brew services stop jenkins-lts
```

## Assignment Deliverables

This project fulfills all 5 tasks:

1. ✅ Version control setup with branch protection
2. ✅ GitHub Actions CI pipeline
3. ✅ Kubernetes configuration with Minikube
4. ✅ Jenkins CD pipeline
5. ✅ Complete documentation

## License

This project is created for educational purposes as part of the Cloud
MLOps course assignment.
