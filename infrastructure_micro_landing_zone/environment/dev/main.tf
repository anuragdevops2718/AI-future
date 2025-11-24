# Data for tenant_id (used in Key Vault)
data "azurerm_client_config" "current" {}

module "rg" {
  source     = "../../modules/azurerm_rg"
  rg_config  = var.rg_config
}

module "acr" {
    depends_on = [ module.rg ]
  source      = "../../modules/azurerm_acr"
  acr_config  = var.acr_config
}

module "aks" {
    depends_on = [ module.rg ]
  source      = "../../modules/azurerm_cluster"
  aks_config  = var.aks_config
}

module "kv" {
 depends_on = [ module.rg ]
 source = "../../modules/azurerm_key_vault"
 kv_config = var.kv_config
}

module "kvsec" {
  depends_on = [ module.kv ]
  source = "../../modules/azurerm_kv_secrets"
  kvsec_config = var.kvsec_config
}

module "sql" {
  depends_on = [ module.kvsec, module.aks ]
  source      = "../../modules/azurerm_sql_server_db"
  mssql_config  = var.mssql_config
}
