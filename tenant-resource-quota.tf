resource "kubernetes_resource_quota" "tenant_resource_quota" {
  metadata {
    name      = "tenant-${var.tenant_name}-network-policy"
    namespace = kubernetes_namespace.tenant_namespace.metadata.0.name
    labels    = local.labels
  }
  spec {
    hard = {
      cpu    = "1000",
      memory = "200Gi",
      pods   = "10",
    }
  }
}