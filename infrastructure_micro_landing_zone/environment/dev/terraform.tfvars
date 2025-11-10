rg_config = {
  rg1 = {
    name     = "rg-ai-dev"
    location = "eastus"
    tags     = { env = "dev", owner = "anurag" }
  }
}

acr_config = {
  acr1 = {
    name                = "acraidev"
    sku                 = "Standard"
    admin_enabled       = false
    resource_group_name = "rg-ai-dev"
    location            = "eastus"
    tags                = { env = "dev" }
  }
}

aks_config = {
  cluster1 = {
    name                = "aks-ai-dev"
    resource_group_name = "rg-ai-dev"
    location            = "eastus"
    dns_prefix          = "aidns"
    kubernetes_version  = "1.29.0"
    node_count          = 2
    node_vm_size        = "Standard_DS2_v2"
    ssh_public_key_path = "~/.ssh/id_rsa.pub"
    tags                = { env = "dev" }
  }
}

kv_config = {
  kv1 = {
    name                     = "kv-ai-dev"
    resource_group_name       = "rg-ai-dev"
    location                 = "eastus"
    sku_name                 = "standard"
    purge_protection_enabled = false
    access_policies          = []
    tags = { env = "dev" }
  }
}

sql_config = {
  sql1 = {
    server_name            = "sqlai-dev"
    database_name          = "aidevdb"
    resource_group_name    = "rg-ai-dev"
    location               = "eastus"
    administrator_login    = "sqladmin"
    administrator_password = "StrongP@ssword123!"
    service_objective_name = "S0"
    tags = { env = "dev" }
  }
}
