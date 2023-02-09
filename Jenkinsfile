pipeline {
    agent any
    stages {
        stage('Git Checkout') {
           steps{
               withCredentials([<object of type com.cloudbees.jenkins.plugins.awscredentials.AmazonWebServicesCredentialsBinding>]) {
    // some block
}
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
