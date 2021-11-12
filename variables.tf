variable "argocd_namespace" {
  type        = string
  description = ""
}

variable "deployment_cluster" {
  type        = string
  description = ""
  default     = "https://kubernetes.default.svc"
}