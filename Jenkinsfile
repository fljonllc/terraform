pipeline {
    agent any
    
    environment {
        AWS_REGION = "us-west-1"
    }
    stages{
        stage("AWS Credentials"){
            steps{
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'Jenkins-Aws-Cred',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']])
                {
                // your Terraform code that uses the AWS provider
               }
            }
        }
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
