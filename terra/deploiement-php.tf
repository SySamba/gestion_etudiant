resource "kubernetes_deployment" "php-deployment" {
  metadata {
    name = "php-deployment"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "php"
      }
    }

    template {
      metadata {
        labels = {
          app = "php"
        }
      }

      spec {
        container {
          name = "php"
          image = "papasy/projetphp1"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}