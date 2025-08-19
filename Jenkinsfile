pipeline {
    agent { label 'agent1' }

    stages {
        stage('Build') {
            steps {
                echo "Building the project..."
                sh '''
                  cd vpc
                  terraform init
                '''
            }
        }

        stage('Test') {
            steps {
                echo "Running tests..."
                sh '''
                  cd vpc
                  terraform validate
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying infrastructure..."
                sh '''
                  cd vpc
                  terraform apply -auto-approve
                '''
            }
        }
    }
}
