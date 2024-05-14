variable "mysql_root_password" {
  description = "Mot de passe root pour MySQL"
  type        = string
  default     = "MotDePasseSecret"
}

variable "mysql_database_name" {
  description = "Nom de la base de données MySQL"
  type        = string
  default     = "my_database"
}
