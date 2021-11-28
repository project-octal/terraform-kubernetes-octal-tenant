resource "kubernetes_namespace" "tenant_namespace" {
  metadata {
    name   = "tenant-${var.tenant_name}"
    labels = local.labels
  }
}