pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out source code...'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t my-website:latest .'
            }
        }

        stage('Automated Test') {
            steps {
                echo 'Testing Docker image...'

                sh '''
                    docker rm -f my-website-test 2>/dev/null || true

                    docker run -d \
                        --name my-website-test \
                        -p 8081:80 \
                        my-website:latest

                    sleep 5

                    curl -f http://localhost:8081

                    echo "Website test passed."
                '''
            }
        }

        stage('Deploy to Test Environment') {
            steps {
                echo 'Deploying website to test container...'

                sh '''
                    docker rm -f my-website-test 2>/dev/null || true

                    docker run -d \
                        --name my-website-test \
                        -p 8081:80 \
                        my-website:latest

                    echo "Website deployed successfully."
                '''
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully.'
        }

        failure {
            echo 'Pipeline failed. Review the Jenkins Console Output for troubleshooting.'
        }

        always {
            echo 'Pipeline execution completed.'
        }
    }
}
