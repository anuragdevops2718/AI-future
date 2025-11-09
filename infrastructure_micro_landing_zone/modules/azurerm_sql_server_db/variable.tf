variable "sql_config" {
  description = "Configuration for SQL Server + DB"
  type = map(object({
    server_name            = string
    database_name          = string
    resource_group_name    = string
    location               = string
    administrator_login    = string
    administrator_password = string
    service_objective_name = string
    tags                   = map(string)
  }))
}