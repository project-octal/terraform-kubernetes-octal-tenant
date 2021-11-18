
############
## Cluster Configuration
############

variable "argocd_namespace" {
  type        = string
  description = "The name of the ArgoCD namespace the tenants ArgoCD project will be deployed to"
  default = null
}

variable "oidc_groups_prefix" {
  type        = string
  description = "The prefix attached to OIDC groups bound to cluster roles. Needs to match the value given to the kube-api-server argument `--oidc-groups-prefix`"
  default     = "oidc:"
}

############
## Tenant Configuration
############

variable "tenant_name" {
    description = "The name of the tenant"
    type = string
}

variable "tenant_permissions" {
  description = "A map of named tenant groups and their permissions"
  type = map(object({
    oidc_groups = set(string)
    permissions = object({
      api_groups = list(string)
      resources = list(string)
      verbs = list(string)
    })
  }))
  default = {}
}

variable "labels" {
  type = map(any)
  description = ""
  default = {}
}