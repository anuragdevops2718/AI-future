output "vault_uris" {
  value = { for k, v in azurerm_key_vault.demokeyvault : k => v.vault_uri }
}