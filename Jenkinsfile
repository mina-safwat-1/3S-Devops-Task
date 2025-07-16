pipeline {
    agent any

    environment {
        // Set the name of the Docker image
        DOCKER_IMAGE_NAME = 'mina1402/3s-task'
        // Use the Jenkins build number as the image tag.
        DOCKER_IMAGE_TAG = "${BUILD_NUMBER}"   
        }

    stages {
        stage('Checkout') {
            steps {
                // Get the latest code from the source control of Github repository.
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using the Dockerfile in the current directory
                    sh "docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} ."
                }
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS')]) {
                    // Log in to DockerHub using stored credentials securely
                    sh "echo $DOCKERHUB_PASS | docker login -u $DOCKERHUB_USER --password-stdin"
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    // Push the built Docker image to DockerHub
                    sh "docker push ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                }
            }
        }
    }

    post {
        always {
            // Always log out from DockerHub to clear credentials from memory after the pipeline runs
            sh "docker logout"
        }
    }
}
