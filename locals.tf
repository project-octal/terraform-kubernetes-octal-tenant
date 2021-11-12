locals {
  oidc_groups_prefix = var.oidc_groups_prefix == null ? "oidc:" : var.oidc_groups_prefix
}