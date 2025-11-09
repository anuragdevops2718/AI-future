resource "azurerm_sql_server" "this" {
  for_each = var.sql_config

  name                         = each.value.server_name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_password
  tags                         = each.value.tags
}

resource "azurerm_sql_database" "this" {
  for_each = var.sql_config

  name                = each.value.database_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  server_name         = azurerm_sql_server.this[each.key].name
  requested_service_objective_name = each.value.service_objective_name
}
