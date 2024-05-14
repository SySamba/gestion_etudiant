resource "kubernetes_deployment" "mysql_db" {
  metadata {
    name = "mysql-db"
    labels = {
      app = "mysql-db"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "mysql-db"
      }
    }

    template {
      metadata {
        labels = {
          app = "mysql-db"
        }
      }

      spec {
        containers {
          image = "mysql:latest"
          name  = "mysql"
          env {
            name  = "MYSQL_ROOT_PASSWORD"
            value = var.mysql_root_password
          }
          ports {
            container_port = 3306
          }
        }
      }
    }
  }
}
