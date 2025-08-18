pipeline {
    agent { label 'agent1' }   // ✔️ correct syntax

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
                sh 'echo "Simulating tests step"'
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying application..."
                sh 'echo "Simulating deployment step"'
            }
        }
    }
}
