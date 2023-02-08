pipeline {
    agent any
    tools {
       terraform 'terraform'
    }
    stages {
        stage('Git Checkout') {
           steps{
               checkout([$class: ‘GitSCM’, branches: [[name: ‘*/main’]], extensions: [], userRemoteConfigs: [[url: ‘https://github.com/fljonllc/terraform.git‘]]])
            }
        }
        stage("Terraform Format Check") {
            steps{
                sh ('terraform fmt')
            }
        }
        stage("Terraform Init") {
            steps{
                sh ('terraform init')
            }
        }
        
        stage('Terraform Plan') {
            steps{
                sh ('terraform plan')
            }
        }
        stage('Terraform Apply') {
            steps{
                sh ('terraform apply --auto-approve')
            }
        }
    }

    
}
