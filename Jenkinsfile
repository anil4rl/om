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
                sh """
                  cd vpc
                  terraform validate
                """}
        }

        stage('Destroy')
            steps {
                echo "Deploying application..."
                sh """
                  cd vpc
                  terraform destroy -auto-approve
                """
            }
        }
    }
}
