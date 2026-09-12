pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-website:latest .'
            }
        }

        stage('Test Container') {
            steps {
                sh '''
                    docker rm -f my-website-test 2>/dev/null || true
                    docker run -d --name my-website-test -p 8081:80 my-website:latest
                    sleep 5
                    curl -f http://localhost:8081
                '''
            }
        }

        stage('Cleanup') {
            steps {
                sh 'docker rm -f my-website-test 2>/dev/null || true'
            }
        }
    }
}
