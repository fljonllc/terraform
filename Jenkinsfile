pipeline {
    agent any
    stages {
        stage('Git Checkout') {
           steps{
               git branch: 'main', credentialsId: 'github-private-key', url: 'https://github.com/fljonllc/terraform.git'
            }
        }
        stage (“terraform init”) {
            steps {
                sh ("terraform init")
            }

        }

        stage (“terraform Action”) {
            steps {
                echo “Terraform action is –> ${action}”
                    sh ("terraform ${action} –auto-approve")

            }
        }
    }

}
