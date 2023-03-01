pipeline {
    agent any

    environment {
        AWS_REGION = "us-west-1"
    }
    
    withCredentials([[
    $class: 'AmazonWebServicesCredentialsBinding',
    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
    credentialsId: 'Jenkins-Aws-Cred'
    ]]) {
    // your Terraform code that uses the AWS provider
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
