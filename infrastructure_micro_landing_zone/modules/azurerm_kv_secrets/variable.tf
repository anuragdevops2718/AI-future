variable "kvsec_config" {
  type = map(object({
    name         = string
    value        = optional(string)
    tags = optional(map(string))
  }))
}
