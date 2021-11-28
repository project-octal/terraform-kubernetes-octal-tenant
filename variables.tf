
############
## Cluster Configuration
############

variable "argocd_namespace" {
  type        = string
  description = "The name of the ArgoCD namespace the tenants ArgoCD project will be deployed to"
  default     = null
}

variable "oidc_groups_prefix" {
  type        = string
  description = "The prefix attached to OIDC groups bound to cluster roles. Needs to match the value given to the kube-api-server argument `--oidc-groups-prefix`"
  default     = "oidc:"
}

variable "ingress_namespace" {
  type        = string
  description = "The name of the ingress namespace to allow traffic from"
  default     = null
}

############
## Tenant Configuration
############

variable "tenant_name" {
  description = "The name of the tenant"
  type        = string
}

variable "tenant_permissions" {
  description = "A map of named tenant groups and their permissions"
  type = map(object({
    oidc_groups = set(string)
    permissions = object({
      api_groups = list(string)
      resources  = list(string)
      verbs      = list(string)
    })
  }))
  default = {}
}

variable "egress_cidr_allow_list" {
  type        = list(string)
  description = "A list of CIDRs that this tenant should not be allowed to access"
  default     = ["0.0.0.0/0"]
}

variable "egress_cidr_block_list" {
  type        = list(string)
  description = "A list of CIDRs that this tenant should not be allowed to access"
  default     = []
}

variable "labels" {
  type        = map(any)
  description = ""
  default     = {}
}