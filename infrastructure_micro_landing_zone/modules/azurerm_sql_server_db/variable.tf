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