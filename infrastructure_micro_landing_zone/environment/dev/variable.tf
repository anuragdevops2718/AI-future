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

variable "kv_config" {
  type = map(object({
    name                     = string
    resource_group_name       = string
    location                 = string
    tenant_id                = string
    sku_name                 = string
    purge_protection_enabled = bool
    access_policies          = optional(list(object({
      tenant_id               = string
      object_id               = string
      secret_permissions      = optional(list(string), [])
      key_permissions         = optional(list(string), [])
      certificate_permissions = optional(list(string), [])
    })), [])
    tags = map(string)
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
    collation              = optional(string, "SQL_Latin1_General_CP1_CI_AS")
    tags                   = optional(map(string), {})
  }))

}