locals {
  oidc_groups_prefix = var.oidc_groups_prefix == null ? "oidc:" : var.oidc_groups_prefix
  
  labels = merge({
    "tenant" = var.tenant_name
  }, var.labels)
}