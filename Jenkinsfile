pipeline {
    agent any

    environment {
        IMAGE_NAME = "sample-test-1-image"
        CONTAINER_NAME = "sample-test-1"
        HOST_PORT = "8085"
        CONTAINER_PORT = "80"
    }

    stages {

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop Old Container') {
            steps {
                echo "Stopping old container if exists..."
                sh 'docker stop $CONTAINER_NAME || true'
                sh 'docker rm $CONTAINER_NAME || true'
            }
        }

        stage('Run New Container') {
            steps {
                echo "Starting new container..."
                sh '''
                docker run -d \
                -p $HOST_PORT:$CONTAINER_PORT \
                --name $CONTAINER_NAME \
                $IMAGE_NAME
                '''
            }
        }
    }

    post {
        success {
            echo "Deployment Successful 🚀"
        }
        failure {
            echo "Deployment Failed ❌"
        }
    }
}


