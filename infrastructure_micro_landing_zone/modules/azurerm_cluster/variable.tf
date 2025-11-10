variable "aks_config" {
  description = "Configuration for AKS Cluster(s)"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    dns_prefix          = string
    kubernetes_version  = string
    node_count          = number
    node_vm_size        = string
    ssh_public_key_path = string
    tags                = map(string)
  }))
}