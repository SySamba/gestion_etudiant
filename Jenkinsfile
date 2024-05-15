pipeline {
    environment {
        KUBECONFIG = "C:\\Users\\HP\\.kube\config"
        TERRA_DIR = "C:\\xampp\\htdocs\\Gestion_Etudiant\\terra"
    }

    stages {
        stage ('initilization') {
            steps {
                script {
                    bat 'terraform --version'
                }
            }
        }

        stage("Terraform init") {
            steps {
                script {
                    bat "cd %TERRA_DIR% && terraform init"
                }
            }
        }

        stage("Terraform Plan") {
            steps {
                script {
                    bat "cd %TERRA_DIR && terraform plan"
                }
            }
        }

        stage("Terraform Apply") {
            steps {
                script {
                    bat "cd %TERRA_DIR && terraform apply --auto-approve"
                }
            }
        }
    }
    post {
        always {
            script {
                bat "cd %TERRA_DIR && terraform destroy --auto-approve"
            }
        }
        success {
            emailext (
                subject: "notifi succes jenkins",
                body : "le build de votre pipeline Jenkins passe avec succes",
                to :"sambasy837@gmail.com"
            )
        }
        failure {
            emailext (
                subject : "notifi echec jenkins",
                body : "echec",
                to :"sambasy837@gmail.com"
            )
        }
    }
}