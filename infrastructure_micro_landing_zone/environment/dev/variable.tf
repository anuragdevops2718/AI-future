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
    admin_enabled             = bool
    georeplication_locations  = optional(list(string), [])
    resource_group_name       = string
    location                  = string
    tags                      = map(string)
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


variable "sql_config" {
type = map(object({
    server_name            = string
    database_name          = string
    resource_group_name    = string
    location               = string
    administrator_login    = string
    administrator_password = string
    sku_name               = optional(string, "S0")
    max_size_gb            = optional(number, 2)
    license_type           = optional(string, "LicenseIncluded")
    service_objective_name = optional(string, "S0")
    collation              = optional(string, "SQL_Latin1_General_CP1_CI_AS")
    tags                   = optional(map(string), {})
  }))

}