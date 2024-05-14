pipeline {
    agent any  
    stages {
        stage("Terraform Init") {
            steps {
                script {
                    // Initialisation de Terraform
                    sh 'terraform init'
                }
            }
        }
        stage("Terraform Plan") {
            steps {
                script {
                    // Planification des modifications Terraform
                    sh 'terraform plan'
                }
            }
        }
        stage("Terraform Apply") {
            steps {
                script {
                    // Application des modifications Terraform (déploiement)
                    sh 'terraform apply --auto-approve'
                }
            }
        }
    }
    post {
        success {
            emailext (
                subject: "Notification de build Jenkins - Succès",
                body: "Le build de votre pipeline Jenkins s'est terminé avec succès.",
                to: "sambasy837@gmail.com",
            )
        }
        failure {
            emailext (
                subject: "Notification de build Jenkins - Échec",
                body: "Le build de votre pipeline Jenkins a échoué.",
                to: "sambasy837@email.com",
            )
        }
    }
}
