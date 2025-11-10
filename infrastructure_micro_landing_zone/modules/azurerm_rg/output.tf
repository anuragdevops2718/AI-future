output "rg_names" {
  value = [for k, v in azurerm_resource_group.thisdemorg03 : v.name]
}