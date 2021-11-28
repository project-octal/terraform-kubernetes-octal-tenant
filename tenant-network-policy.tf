resource "kubernetes_network_policy" "tenant_network_policy" {
  metadata {
    name = "tenant-${var.tenant_name}-network-policy"
    namespace = kubernetes_namespace.tenant_namespace.metadata.0.name
    labels = local.labels
  }

  spec {

		# Selects the pods to which this NetworkPolicy object applies.
		pod_selector {
      match_labels = {
        tenant = var.tenant_name
      }
    }
    
		# List of rule types that the NetworkPolicy relates to.
		policy_types = [ "Ingress", "Egress" ]

		# List of ingress rules to be applied to the selected pods.
    ingress {
			
			# List of sources which should be able to access the pods selected for this rule.
			from {
        namespace_selector {
          match_labels = {
            name = var.ingress_namespace
          }
        }
      }
			
			# List of sources which should be able to access the pods selected for this rule.
		  from {
        namespace_selector {
          match_labels = {
            name = kubernetes_namespace.tenant_namespace.metadata.0.name
          }
        }
      }

			# List of ports which should be made accessible on the pods selected for this rule.
      ports {protocol = "TCP"}
			ports {protocol = "UDP"}
    }

		# List of egress rules to be applied to the selected pods.
    egress {

			# List of destinations for outgoing traffic of pods selected for this rule.
			to {
				dynamic "ip_block" {
					for_each = toset(var.egress_cidr_allow_list)
					content {
						cidr = ip_block.key
						except = var.egress_cidr_block_list
					}
				}
			}

			# List of destination ports for outgoing traffic.
			ports {protocol = "TCP"}
			ports {protocol = "UDP"}
    }
  }
}