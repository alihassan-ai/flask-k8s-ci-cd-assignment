pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'flask-k8s-app:latest'
        K8S_NAMESPACE = 'default'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    echo 'Building Docker image...'
                    sh 'docker build -t ${DOCKER_IMAGE} .'
                    echo 'Docker image built successfully'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    echo 'Deploying to Kubernetes...'
                    sh 'kubectl apply -f kubernetes/deployment.yaml'
                    sh 'kubectl apply -f kubernetes/service.yaml'
                    echo 'Deployment applied successfully'
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                script {
                    echo 'Verifying deployment...'
                    sh 'kubectl rollout status deployment/flask-app-deployment'
                    sh 'kubectl get pods -l app=flask-app'
                    sh 'kubectl get services flask-app-service'
                    echo 'Deployment verification completed'
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Please check the logs.'
        }
    }
}
