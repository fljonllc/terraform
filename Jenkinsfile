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

        stage("Configure AWS credentials") {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                ]]) {
                    sh 'echo AWS credentials configured'
                }
            }
        }

        stage("Deploy Terraform") {
            steps {
                sh 'terraform init -input=false'
                sh "terraform plan -input=false -var 'aws_region=${AWS_REGION}'"
                sh 'terraform apply -input=false -auto-approve'
            }
        }
    }
}
