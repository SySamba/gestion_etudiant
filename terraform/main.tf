provider "kubernetes" {
  config_context_cluster = "minikube"
}

module "php" {
  source = "./php"
}

module "mysql" {
  source = "./mysql"
}
