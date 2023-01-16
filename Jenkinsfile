pipeline {
    agent any
    parameters {
  choice choices: ['apply', 'destroy'], description: 'Please let me know if you want to destroy or apply', name: 'action'
}

    stages {
        stage('Checkout') {
            steps {
              git 'https://github.com/vyjith/terraform-jenkins-test.git'
            }
        }
        
        stage ("terraform init") {
            steps {
                sh ('terraform init -reconfigure') 
            }
        }
        stage ("terraform plan") {
            steps {
                sh ('terraform plan') 
            }
        }
                
        stage ("terraform Action") {
            steps {
                echo "Terraform action is --> ${action}"
                sh ('terraform ${action} --auto-approve') 
           }
        }
    }
}
