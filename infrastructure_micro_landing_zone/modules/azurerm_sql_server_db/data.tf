data "azurerm_key_vault" "azurekv" {
  name                = "devkev0711"
  resource_group_name = "demorg3110"
}

data "azurerm_key_vault_secret" "secret01" {
  name         = "sqlservername"
  key_vault_id = data.azurerm_key_vault.azurekv.id
}

data "azurerm_key_vault_secret" "secret02" {
  name         = "sqlserverpswd"
  key_vault_id = data.azurerm_key_vault.azurekv.id
}

