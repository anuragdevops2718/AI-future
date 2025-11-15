variable "mssql_config" {
  type = map(object({
    servername                          = string
    resource_group_name           = string
    location                      = string
    minimum_tls_Version           = optional(number, 1.2)
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
    read_scale     = optional(bool, false)
    sku_name       = optional(string, "S0")
  }))
}
