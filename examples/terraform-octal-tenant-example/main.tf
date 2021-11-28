module "test_tenant" {
  source      = "../../"
  tenant_name = var.tenant_name
}

resource "kubernetes_pod" "test" {
  metadata {
    name      = "terraform-example"
    namespace = module.test_tenant.namespace
  }
  spec {
    container {
      image = "nginx:1.7.9"
      name  = "example"
      env {
        name  = "environment"
        value = "test"
      }
      port {
        container_port = 8080
      }
      resources {
        requests = {
          cpu    = "100m"
          memory = "128Mi"
        }
        limits = {
          cpu    = "200m"
          memory = "256Mi"
        }
      }
      liveness_probe {
        http_get {
          path = "/nginx_status"
          port = 80
          http_header {
            name  = "X-Custom-Header"
            value = "Awesome"
          }
        }
        initial_delay_seconds = 3
        period_seconds        = 3
      }
    }
  }
}