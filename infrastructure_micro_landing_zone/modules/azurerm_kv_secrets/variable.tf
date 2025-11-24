variable "kvsec_config" {
  type = map(object({
    name         = string
    value        = optional(string)
    key_vault_id = string
    tags = optional(map(string))
  }))
}
