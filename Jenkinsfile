pipeline {
    agent any
    environment {
        KUBECONFIG = "C:\\Users\\HP\\.kube\\config"
        TERRA_DIR = "C:\\xampp\\htdocs\\Gestion_Etudiant\\terra"
    }
    stages {
        stage('Initialization') {
            steps {
                script {
                    bat 'terraform --version'
                }
            }
        }
        
        stage("Terraform Init") {
            steps {
                script {
                    bat "cd %TERRA_DIR% && terraform init"
                }
            }
        }
        
        stage("Terraform Plan") {
            steps {
                script {
                    bat "cd %TERRA_DIR% && terraform plan"
                }
            }
        }
        
        stage("Terraform Apply") {
            steps {
                script {
                    bat "cd %TERRA_DIR% && terraform apply --auto-approve"
                }
            }
        }
    }
    post {
        always {
            script {
                bat "cd %TERRA_DIR% && terraform destroy --auto-approve"
            }
        }
        success {
            emailext (
                subject: "Notification de build Jenkins - Succès",
                body: "Le build de votre pipeline Jenkins s'est terminé avec succès.",
                to: "sambasy837@gmail.com"
            )
        }
        failure {
            emailext (
                subject: "Notification de build Jenkins - Échec",
                body: "Le build de votre pipeline Jenkins a échoué.",
                to: "sambasy837@email.com"
            )
        }
    }
}