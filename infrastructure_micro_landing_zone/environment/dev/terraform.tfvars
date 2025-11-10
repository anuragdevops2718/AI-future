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
  dev = {
    name                = "aks-ai-dev"
    location            = "eastus"
    resource_group_name = "rg-ai-dev"
    dns_prefix          = "aksai"
    admin_username      = "azureuser"
    admin_password      = "StrongP@ssword123!"
    node_count          = 2
    vm_size             = "Standard_B2s"
    network_plugin      = "azure"
    load_balancer_sku   = "standard"
    tags = {
      env = "dev"
    }
  }

  prod = {
    name                = "aks-ai-prod"
    location            = "eastus"
    resource_group_name = "rg-ai-prod"
    dns_prefix          = "aksai-prod"
    admin_username      = "azureuser"
    admin_password      = "StrongP@ssword123!"
    node_count          = 3
    vm_size             = "Standard_B4ms"
    network_plugin      = "azure"
    load_balancer_sku   = "standard"
    tags = {
      env = "prod"
    }
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
    sku_name               = "S0"
    max_size_gb            = 2
    tags = { env = "dev" }
  }
}

