variable "rg_config" {
  description = "Configuration for Resource Group"
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}