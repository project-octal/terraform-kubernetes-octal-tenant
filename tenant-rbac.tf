resource "kubernetes_role" "tenant_role" {
  for_each = var.tenant_permissions

  metadata {
    name = "tenant-${var.tenant_name}-${each.key}"
    namespace = kubernetes_namespace.tenant_namespace.metadata.0.name
    labels = local.labels
  }

  dynamic "rule" {
    for_each = each.value.permissions
    content {
      api_groups     = rule.api_groups
      resources      = rule.resources
      resource_names = rule.resource_names
      verbs          = rule.verbs
    }
  }
}

resource "kubernetes_role_binding" "tenant_role_binding" {
  for_each = var.tenant_permissions

  metadata {
    name = "tenant-${var.tenant_name}-${each.key}"
    namespace = kubernetes_namespace.tenant_namespace.metadata[0].name
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.tenant_role[each.key].metadata[0].name
  }
  
  dynamic "subject" {
    for_each = each.value.oidc_groups

    content {
      kind      = "Group"
      name      = "${var.oidc_groups_prefix}${subject.value}"
      api_group = "rbac.authorization.k8s.io"
    }
  }
}