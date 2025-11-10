variable "kv_config" {
  description = "Configuration for Key Vault(s)"
  type = map(object({
    name                     = string
    resource_group_name       = string
    location                 = string
    tenant_id                = string
    sku_name                 = string
    purge_protection_enabled = bool
    access_policies = optional(list(object({
      tenant_id               = string
      object_id               = string
      secret_permissions      = optional(list(string), [])
      key_permissions         = optional(list(string), [])
      certificate_permissions = optional(list(string), [])
    })), [])
    tags = map(string)
  }))
}