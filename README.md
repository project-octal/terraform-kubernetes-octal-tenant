![Project Octal: Tenant](docs/images/project-octal-tenant.svg "Project Octal Tenant")
---

[![Terraform Lint](https://github.com/project-octal/terraform-kubernetes-octal-tenant/actions/workflows/terraform-checks.yml/badge.svg?branch=main)](https://github.com/project-octal/terraform-kubernetes-octal-tenant/actions/workflows/terraform-checks.yml)
[![Tenant CI](https://github.com/project-octal/terraform-kubernetes-octal-tenant/actions/workflows/octal-tenant-test.yml/badge.svg?branch=main)](https://github.com/project-octal/terraform-kubernetes-octal-tenant/actions/workflows/octal-tenant-test.yml)

Project Octal Tenant is a module designed to simplify Kubernetes multitenancy configuration and management.

### TODO:
- Update the Terraform version to 1.0+
- Finish the module

### Example
```hcl-terraform
module "argocd" {
  source = "git::https://github.com/project-octal/terraform-kubernetes-octal-tenant.git"
  # Stuff goes here...
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->