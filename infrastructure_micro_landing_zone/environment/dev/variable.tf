variable "rg_config" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}

variable "acr_config" {
  type = map(object({
    name                     = string
    sku                      = string
    admin_enabled            = bool
    georeplication_locations = optional(list(string), [])
    resource_group_name      = string
    location                 = string
    tags                     = map(string)
  }))
}

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


variable "mssql_config" {
  type = map(object({
    servername                    = string
    resource_group_name           = string
    location                      = string
    minimum_tls_version           = optional(number, 1.2)
    public_network_access_enabled = optional(bool, true)
    administrator_login           = optional(string)
    administrator_login_password  = optional(string)
    azuread_administrator = optional(map(object({
      login_username = string
      object_id      = string
      tenant_id      = string
    })))
    tags           = optional(map(string), {})
    dbname         = string
    license_type   = optional(string, "LicenseIncluded")
    max_size_gb    = optional(number, 250)
    read_scale     = optional(bool, true)
    sku_name       = optional(string, "S0")
  }))
}
