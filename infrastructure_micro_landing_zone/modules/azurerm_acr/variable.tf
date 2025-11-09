variable "acr_config" {
  description = "Configuration for ACR"
  type = map(object({
    name                     = string
    sku                      = string
    admin_enabled             = bool
    georeplication_locations  = optional(list(string))
    resource_group_name       = string
    location                  = string
    tags                      = map(string)
  }))
}
