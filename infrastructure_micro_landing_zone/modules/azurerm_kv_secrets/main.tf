resource "azurerm_key_vault_secret" "demo_secrets" {
  for_each     = var.kvsec_config
  name         = each.value.name
  value        = each.value.value
  key_vault_id = data.azurerm_key_vault.demokv.id
  tags         = each.value.tags
}
