resource "azurerm_resource_group" "demorg03" {
  for_each = var.rg_config
  name     = each.value.name
  location = each.value.location
  tags     = each.value.tags
}