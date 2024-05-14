resource "kubernetes_deployment" "php_app" {
  metadata {
    name = "php-app"
    labels = {
      app = "php-app"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "php-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "php-app"
        }
      }

      spec {
        containers {
          image = "nom_de_votre_image_php:version"
          name  = "php-app"
          ports {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "php_service" {
  metadata {
    name = "php-service"
  }

  spec {
    selector = {
      app = "php-app"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
