pipeline {
    agent { label 'agent1' }

    parameters {
        choice(
            name: 'ACTION',
            choices: ['deploy', 'destroy'],
            description: 'Choose whether to deploy or destroy infrastructure'
        )
    }

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
            when {
                expression { params.ACTION == 'deploy' }
            }
            steps {
                echo "Deploying infrastructure..."
                sh '''
                  cd vpc
                  terraform apply -auto-approve
                '''
            }
        }

        stage('Destroy') {
            when {
                expression { params.ACTION == 'destroy' }
            }
            steps {
                echo "Destroying infrastructure..."
                sh '''
                  cd vpc
                  terraform destroy -auto-approve
                '''
            }
        }
    }
}
