variable "aks_config" {
   type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = string
    admin_username      = string
    node_count          = optional(number, 1)
    vm_size             = optional(string, "Standard_B2s")
    os_disk_size_gb     = optional(number, 30)
    enable_auto_scaling = optional(bool, false)
    identity_type       = optional(string, "SystemAssigned")
    network_plugin      = optional(string, "azure")
    load_balancer_sku   = optional(string, "standard")
    node_pool_name      = optional(string, "systempool")
    tags                = optional(map(string), {})
  }))
}
