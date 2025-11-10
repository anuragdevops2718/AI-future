resource "azurerm_key_vault" "demokeyvalut" {
  for_each = var.kv_config

  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  tenant_id                   = each.value.tenant_id
  sku_name                    = each.value.sku_name
  purge_protection_enabled    = each.value.purge_protection_enabled
  tags                        = each.value.tags

  dynamic "access_policy" {
    for_each = lookup(each.value, "access_policies", [])
    content {
      tenant_id = access_policy.value.tenant_id
      object_id = access_policy.value.object_id
      secret_permissions      = lookup(access_policy.value, "secret_permissions", [])
      key_permissions         = lookup(access_policy.value, "key_permissions", [])
      certificate_permissions = lookup(access_policy.value, "certificate_permissions", [])
    }
  }
}