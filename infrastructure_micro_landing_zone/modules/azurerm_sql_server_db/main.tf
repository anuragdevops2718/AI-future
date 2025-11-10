resource "azurerm_mssql_server" "this" {
  for_each = var.sql_config

  name                         = each.value.server_name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_password
  tags                         = each.value.tags
}

resource "azurerm_mssql_database" "that" {
name         = "example-db"
  server_id    = azurerm_mssql_server.this[each.key].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  tags = {
    foo = "bar"
  }
}
