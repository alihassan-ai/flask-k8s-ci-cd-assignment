# Flask K8s CI/CD Assignment - Submission Guide

**Team Members:**
- **Member A (Admin):** Saamer Abbas - 22i-0468
- **Member B (Developer):** Ali hassan - 22i-0541

**Repository URL:** https://github.com/alihassan-ai/flask-k8s-ci-cd-assignment

---

## Completed Tasks Summary

### ✅ Task 1: Initialization and Version Control Setup (15 Marks)

**Status:** COMPLETED

**What was done:**
1. Created public repository: `flask-k8s-ci-cd-assignment`
2. Created `main` and `develop` branches
3. Set up branch protection on main branch (requires 1 PR review)
4. Created "Project Completion" milestone (due: Nov 30, 2025)
5. Created 5 GitHub Issues for all tasks, assigned to Developer
6. Created all required files:
   - [app.py](app.py) - Flask application with health check
   - [requirements.txt](requirements.txt) - Python dependencies
   - [Dockerfile](Dockerfile) - Multi-stage Docker build
   - [kubernetes/deployment.yaml](kubernetes/deployment.yaml) - K8s Deployment
   - [kubernetes/service.yaml](kubernetes/service.yaml) - K8s Service
   - [Jenkinsfile](Jenkinsfile) - Jenkins pipeline
   - [.github/workflows/ci.yml](.github/workflows/ci.yml) - GitHub Actions
   - [README.md](README.md) - Complete documentation

**Required Screenshots:**
- [ ] GitHub repository showing main and develop branches
- [ ] Branch protection rule settings
- [ ] Milestone "Project Completion" with due date
- [ ] All 5 GitHub Issues
- [ ] File structure in repository

**How to capture:**
1. Go to: https://github.com/alihassan-ai/flask-k8s-ci-cd-assignment
2. Click "Insights" → "Network" to show branches
3. Go to "Settings" → "Branches" → "Branch protection rules"
4. Go to "Issues" → "Milestones"
5. Go to "Issues" tab to show all issues
6. Main page shows file structure

---

### ✅ Task 2: Implementing CI with GitHub Actions (20 Marks)

**Status:** COMPLETED

**What was done:**
1. Created GitHub Actions workflow (`.github/workflows/ci.yml`)
2. Workflow triggers on push to any branch
3. Runs flake8 linting with max-line-length=90
4. Runs pytest unit tests on `test_utils.py`
5. Builds Docker image
6. Created 2 additional issues:
   - Issue #6: Enhancement - Add health check monitoring dashboard
   - Issue #7: Improvement - Add integration tests for API endpoints

**Required Screenshots:**
- [ ] Pull Request from feature/initial-structure to develop
- [ ] GitHub Actions workflow run (green checkmark)
- [ ] Screenshot of 2 additional issues created

**How to verify:**
```bash
# The workflow should automatically run on any push
# View at: https://github.com/alihassan-ai/flask-k8s-ci-cd-assignment/actions
```

**Next Steps (Developer role):**
1. Create `feature/initial-structure` branch from develop
2. Make a small change (add a comment)
3. Push and create PR to develop
4. Wait for GitHub Actions to pass (green check)
5. Admin reviews and merges

---

### ✅ Task 3: Kubernetes Configuration and Minikube Setup (25 Marks)

**Status:** COMPLETED

**What was done:**
1. Installed Minikube (v1.37.0)
2. Started Minikube cluster with Docker driver
3. Enhanced Kubernetes manifests with:
   - Rolling update strategy (maxSurge:  1, maxUnavailable: 1)
   - 3 replicas for high availability
   - NodePort service (port 30080)
   - Resource limits (CPU: 200m, Memory: 256Mi)
   - Resource requests (CPU: 100m, Memory: 128Mi)
   - Liveness and Readiness probes
4. Built Docker image in Minikube
5. Deployed application to Kubernetes
6. Tested scaling (3 → 5 → 3 replicas)

**Required Screenshots:**
- [ ] minikube status output
- [ ] kubectl get pods,services,deployments
- [ ] Scaling test (kubectl scale output)
- [ ] Pull Request with Admin review comments

**How to capture screenshots:**
```bash
# Start minikube if not running
minikube start

# Show minikube status
minikube status

# Show all resources
kubectl get pods,services,deployments

# Show scaling
kubectl scale deployment flask-app-deployment --replicas=5
kubectl get pods -l app=flask-app

# Rollback test
kubectl rollout status deployment/flask-app-deployment
```

**Next Steps (Developer role):**
1. Create `feature/kubernetes-config` branch
2. Make enhancement to K8s manifests (already done, but commit with message)
3. Create PR to develop
4. Admin reviews with constructive comments
5. Admin merges PR

---

### ⚠️ Task 4: Configuring CD with Jenkins to Kubernetes (20 Marks)

**Status:** READY FOR SETUP

**What was done:**
1. Installed Jenkins LTS (v2.528.2)
2. Created Jenkinsfile with 3 stages:
   - Stage 1: Build Docker Image
   - Stage 2: Deploy to Kubernetes
   - Stage 3: Verify Deployment

**Jenkins Setup Instructions:**

```bash
# Start Jenkins
brew services start jenkins-lts

# Get initial password
cat ~/.jenkins/secrets/initialAdminPassword

# Access Jenkins at: http://localhost:8080
```

**Jenkins Configuration Steps:**

1. **Install Required Plugins:**
   - Git Plugin
   - Pipeline Plugin
   - Docker Pipeline Plugin
   - Kubernetes CLI Plugin

2. **Configure kubectl Access:**
   ```bash
   # Copy kubeconfig to Jenkins workspace
   cp ~/.kube/config ~/.jenkins/kubeconfig

   # Set permissions
   chmod 644 ~/.jenkins/kubeconfig
   ```

3. **Create Pipeline Job:**
   - New Item → Pipeline
   - Name: `flask-k8s-pipeline`
   - Pipeline Definition: Pipeline script from SCM
   - SCM: Git
   - Repository URL: `https://github.com/alihassan-ai/flask-k8s-ci-cd-assignment.git`
   - Branch: `*/main`
   - Script Path: `Jenkinsfile`

4. **Configure Kubernetes Credentials (if needed):**
   - Manage Jenkins → Credentials
   - Add kubeconfig file

5. **Run Pipeline:**
   - Click "Build Now"
   - View Console Output

**Required Screenshots:**
- [ ] Jenkins job configuration page
- [ ] Pipeline console output (all stages successful)
- [ ] kubectl get pods,services after Jenkins deployment
- [ ] kubectl rollout status output

**Next Steps (Developer role):**
1. Create `feature/jenkins-k8s-pipeline` branch
2. Make any needed adjustments to Jenkinsfile
3. Create PR to develop, Admin merges
4. Admin merges develop to main
5. Admin sets up Jenkins and runs pipeline

---

### ⚠️ Task 5: Final Integration and Documentation (20 Marks)

**Status:** DOCUMENTATION COMPLETED

**What was done:**
1. Created comprehensive README.md with:
   - Project overview and team members
   - Kubernetes features explained
   - Local development instructions
   - Kubernetes deployment guide
   - Jenkins pipeline instructions
   - Scaling and rollout testing
   - Complete troubleshooting guide

**Required Screenshots:**
- [ ] Main branch showing complete README.md
- [ ] Complete pipeline working (GitHub Actions + Jenkins + K8s)

**Next Steps (Developer role):**
1. Create `feature/final-touch` branch
2. Review and enhance README if needed
3. Create PR from feature/final-touch to main
4. Admin reviews and merges
5. Take final screenshots of complete pipeline

---

## Current System Status

### ✅ What's Running:
- [x] GitHub repository with all files
- [x] Main and develop branches configured
- [x] Branch protection enabled
- [x] Minikube cluster running
- [x] Flask application deployed to Kubernetes (3 pods)
- [x] Service exposed on NodePort 30080
- [x] Jenkins installed (ready to configure)

### 📝 What You Need to Do:

#### Immediate Actions:
1. **Take Screenshots for Tasks 1-3**
2. **Set up Jenkins Pipeline (Task 4)**
3. **Take Screenshots for Tasks 4-5**
4. **Create Final PDF Document**

---

## Quick Commands Reference

### Minikube:
```bash
minikube start                    # Start cluster
minikube status                   # Check status
minikube service flask-app-service  # Open service in browser
minikube dashboard                # Open K8s dashboard
```

### Kubernetes:
```bash
kubectl get all                   # Get all resources
kubectl get pods                  # List pods
kubectl describe pod <name>       # Pod details
kubectl logs <pod-name>           # View logs
kubectl scale deployment flask-app-deployment --replicas=5
kubectl rollout status deployment/flask-app-deployment
kubectl rollout undo deployment/flask-app-deployment
```

### Docker (in Minikube):
```bash
eval $(minikube docker-env)       # Use minikube Docker
docker images                     # List images
docker build -t flask-k8s-app:latest .
```

### Git:
```bash
git status                        # Check status
git checkout -b feature/branch-name
git add .
git commit -m "message"
git push origin branch-name
```

### Jenkins:
```bash
brew services start jenkins-lts   # Start Jenkins
brew services stop jenkins-lts    # Stop Jenkins
cat ~/.jenkins/secrets/initialAdminPassword  # Get password
```

---

## Final Submission Checklist

### PDF Document Must Include:

**Header:**
- [ ] Full names and student IDs of both members

**Task 1 Deliverables:**
- [ ] Screenshot: Main and develop branches
- [ ] Screenshot: Branch protection rule
- [ ] Screenshot: Pull request creation
- [ ] Screenshot: Milestone and issues
- [ ] Screenshot: File structure

**Task 2 Deliverables:**
- [ ] URL: Pull Request
- [ ] Screenshot: GitHub Actions successful run
- [ ] Screenshot: Additional issues created

**Task 3 Deliverables:**
- [ ] URL: Pull Request
- [ ] Screenshot: PR conversation with Admin review
- [ ] Screenshot: minikube status
- [ ] Screenshot: K8s resources (pods, services, deployments)

**Task 4 Deliverables:**
- [ ] Screenshot: Jenkins job configuration
- [ ] Screenshot: Pipeline console output
- [ ] Screenshot: K8s pods and services
- [ ] Screenshot: Rollout status

**Task 5 Deliverables:**
- [ ] URL: Main branch with README
- [ ] Screenshot: Complete pipeline (GA + Jenkins + K8s)

### Submission Files:
- [ ] PDF document with all deliverables
- [ ] Source code files (no cache/binaries)
- [ ] Proper folder naming: `22i-0468_SECTION_22i-0541_SECTION`
- [ ] Compressed as ZIP file

---

## Troubleshooting

### Issue: Minikube won't start
```bash
minikube delete
minikube start --driver=docker
```

### Issue: Pods not running
```bash
kubectl describe pod <pod-name>
kubectl logs <pod-name>
```

### Issue: Can't access application
```bash
# Use port forwarding instead
kubectl port-forward service/flask-app-service 5000:5000
# Then access: http://localhost:5000
```

### Issue: Jenkins can't access Kubernetes
```bash
# Ensure kubeconfig is accessible
cp ~/.kube/config ~/.jenkins/kubeconfig
# Update Jenkinsfile to use correct kubeconfig path
```

---

## Repository Structure

```
flask-k8s-ci-cd-assignment/
├── .github/
│   └── workflows/
│       └── ci.yml              # GitHub Actions CI workflow
├── kubernetes/
│   ├── deployment.yaml         # K8s Deployment
│   └── service.yaml            # K8s Service
├── app.py                      # Flask application
├── utils.py                    # Utility functions
├── test_utils.py               # Unit tests
├── requirements.txt            # Python dependencies
├── Dockerfile                  # Multi-stage build
├── Jenkinsfile                 # Jenkins pipeline
├── README.md                   # Complete documentation
├── .gitignore                  # Git ignore rules
└── ASSIGNMENT_SUBMISSION_GUIDE.md  # This file
```

---

## Contact & Support

- Repository: https://github.com/alihassan-ai/flask-k8s-ci-cd-assignment
- Issues: https://github.com/alihassan-ai/flask-k8s-ci-cd-assignment/issues

**Good luck with your assignment!**
