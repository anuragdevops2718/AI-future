output "acr_login_servers" {
  value = { for k, v in azurerm_container_registry.demoacr : k => v.login_server }
}