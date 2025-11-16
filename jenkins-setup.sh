#!/bin/bash

# Jenkins Setup Script for Flask K8s CI/CD Assignment
# Authors: Saamer Abbas (22i-0468), Ali hassan (22i-0541)

echo "========================================="
echo "Flask K8s CI/CD - Jenkins Setup Script"
echo "========================================="
echo ""

# Check if Jenkins is installed
if ! command -v jenkins-lts &> /dev/null; then
    echo "❌ Jenkins not found. Installing..."
    brew install jenkins-lts
fi

# Start Jenkins
echo "Starting Jenkins..."
brew services start jenkins-lts

# Wait for Jenkins to start
echo "Waiting for Jenkins to start (this may take a minute)..."
sleep 30

# Get initial password
if [ -f ~/.jenkins/secrets/initialAdminPassword ]; then
    echo ""
    echo "✅ Jenkins is starting!"
    echo ""
    echo "========================================="
    echo "Jenkins Initial Setup Information"
    echo "========================================="
    echo "URL: http://localhost:8080"
    echo ""
    echo "Initial Admin Password:"
    cat ~/.jenkins/secrets/initialAdminPassword
    echo ""
    echo "========================================="
    echo ""
    echo "Next Steps:"
    echo "1. Open http://localhost:8080 in your browser"
    echo "2. Paste the password above"
    echo "3. Install suggested plugins"
    echo "4. Create admin user"
    echo "5. Install additional plugins:"
    echo "   - Docker Pipeline"
    echo "   - Kubernetes CLI"
    echo "6. Create new Pipeline job:"
    echo "   - Name: flask-k8s-pipeline"
    echo "   - Type: Pipeline"
    echo "   - Definition: Pipeline script from SCM"
    echo "   - SCM: Git"
    echo "   - Repository: https://github.com/alihassan-ai/flask-k8s-ci-cd-assignment.git"
    echo "   - Branch: */main"
    echo "   - Script Path: Jenkinsfile"
    echo ""
    echo "========================================="
else
    echo "⏳ Jenkins is still starting..."
    echo "Please wait a moment and check:"
    echo "cat ~/.jenkins/secrets/initialAdminPassword"
fi

echo ""
echo "To stop Jenkins later:"
echo "brew services stop jenkins-lts"
echo ""
