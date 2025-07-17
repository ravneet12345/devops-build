pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS_ID = 'docker' // Jenkins credentials ID
        DOCKERHUB_USERNAME = 'ravneeth123'
        IMAGE_NAME = 'react-ecommerce-app'
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'github', url: 'https://github.com/your-repo.git', branch: 'dev'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKERHUB_USERNAME/$IMAGE_NAME .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: "${DOCKERHUB_CREDENTIALS_ID}", usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh '''
                        echo "$PASSWORD" | docker login -u "$USERNAME" --password-stdin
                        docker push $USERNAME/$IMAGE_NAME
                    '''
                }
            }
        }

        stage('Cleanup') {
            steps {
                sh 'docker rmi $DOCKERHUB_USERNAME/$IMAGE_NAME || true'
            }
        }
    }
}
