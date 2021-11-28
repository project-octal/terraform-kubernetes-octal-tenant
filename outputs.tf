output "name" {
  value = var.tenant_name
}

output "namespace" {
  value = kubernetes_namespace.tenant_namespace.metadata.0.name
}

output "labels" {
  value = local.labels
}