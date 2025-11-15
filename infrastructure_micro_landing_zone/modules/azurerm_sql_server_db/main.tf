resource "azurerm_mssql_server" "demosqlserver" {
  for_each = var.mssql_config
  name = each.value.servername
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  version = "12.0"
  administrator_login = data.azurerm_key_vault_secret.secret01.value
  administrator_login_password = data.azurerm_key_vault_secret.secret02.value
  dynamic "azuread_administrator" {
    for_each = each.value.azuread_administrator != null ? each.value.azuread_administrator : {}
    content {
      login_username = azuread_administrator.value.login_username
      object_id =azuread_administrator.value.object_id
      tenant_id = azuread_administrator.value.tenant_id
    }
  }
  tags = each.value.tags
}

resource "azurerm_mssql_database" "demosqldb" {
  for_each = var.mssql_config
  name          = each.value.dbname
  server_id      = azurerm_mssql_server.demosqlserver[each.key].id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = each.value.license_type
  max_size_gb    = each.value.max_size_gb
  read_scale     = each.value.read_scale
  sku_name       = each.value.sku_name
  tags = each.value.tags
}