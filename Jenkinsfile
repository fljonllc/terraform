pipeline {
    agent any
    tools {
       terraform 'terraform'
    }
    stages {
        stage('Git Checkout') {
           steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github-private-key', url: 'git@github.com:fljonllc/terraform.git']])
            }
        }
        stage("Terraform Format Check") {
            steps{
                sh ('terraform fmt')
            }
        }
        stage("AWS Demo"){
            steps{
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'Jenkins-Aws-Cred',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']])
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
