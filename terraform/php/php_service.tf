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
