pipeline {
    agent any

    environment {
        AWS_REGION = "us-west-1"
    }

    stages {
        stage("Checkout") {
            steps {
                checkout scm
            }
        }
        
        stage("Terraform Init") {
            steps {
                sh 'terraform init'
            }
        }
         stage("Terraform Plan") {
            steps {
                sh 'terraform plan'
            }
        }

         stage("Terraform Apply") {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
