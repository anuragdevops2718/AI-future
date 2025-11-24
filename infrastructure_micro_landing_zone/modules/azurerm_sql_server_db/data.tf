data "azurerm_key_vault" "demokv" {
    name = "devkvaifuture"
    resource_group_name = "devrgaifuture"
}

data "azurerm_key_vault_secret" "secret01" {
  name         = "devsecret01"
  key_vault_id = data.azurerm_key_vault.demokv.id
}

data "azurerm_key_vault_secret" "secret02" {
  name         = "devsecret02"
  key_vault_id = data.azurerm_key_vault.demokv.id
}
