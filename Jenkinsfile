pipeline {
    agent any  
    stages {
        stage("Terraform Init") {
            steps {
                script {
                    // Changer de répertoire vers le répertoire contenant les fichiers Terraform
                    bat 'cd /D C:\\chemin\\vers\\votre\\dossier\\terraform'
                    // Initialisation de Terraform
                    bat 'terraform init'
                }
            }
        }
        stage("Terraform Plan") {
            steps {
                script {
                    // Changer de répertoire vers le répertoire contenant les fichiers Terraform
                    bat 'cd C:\xampp\htdocs\Gestion_Etudiant\terra'
                    // Planification des modifications Terraform
                    bat 'terraform plan'
                }
            }
        }
        stage("Terraform Apply") {
            steps {
                script {
                    // Changer de répertoire vers le répertoire contenant les fichiers Terraform
                    bat 'cd C:\xampp\htdocs\Gestion_Etudiant\terra'
                    // Application des modifications Terraform (déploiement)
                    bat 'terraform apply --auto-approve'
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
