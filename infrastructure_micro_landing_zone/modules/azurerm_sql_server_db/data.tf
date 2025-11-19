data "azurerm_key_vault" "azurekv" {
  name                = "devkev1911"
  resource_group_name = "demorg1911"
}

data "azurerm_key_vault_secret" "secret01" {
  name         = "sqlservername"
  key_vault_id = data.azurerm_key_vault.azurekv.id
}

data "azurerm_key_vault_secret" "secret02" {
  name         = "sqlserverpswd"
  key_vault_id = data.azurerm_key_vault.azurekv.id
}

