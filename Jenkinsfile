pipeline {
    agent any   // Runs on any available agent

    stages {
        stage('Build') {
            steps {
                echo "Building the project..."
                sh """
                cd vpc
                terraform init
                """
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
