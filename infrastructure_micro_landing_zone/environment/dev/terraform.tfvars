rg_config = {
  rg1 = {
    name     = "devrgai11"
    location = "southbrazil"
    tags     = { env = "dev", owner = "anurag" }
  }
}

acr_config = {
  acr1 = {
    name                = "devacrai11"
    sku                 = "Standard"
    admin_enabled       = false
    resource_group_name = "devrgai11"
    location            = "southbrazil"
    tags                = { env = "dev" }
  }
}

aks_config = {
  dev = {
    name                = "devaksai11"
    location            = "southbrazil"
    resource_group_name = "devrgai11"
    dns_prefix          = "aksai"
    admin_username      = "azureuser"
    node_count          = 2
    vm_size             = "Standard_L2aos_v4"
    network_plugin      = "azure"
    load_balancer_sku   = "standard"
    tags = { env = "dev" }
  }
}

sql_config = {
  sql1 = {
    server_name            = "devsqlserverai11"
    database_name          = "devsqldbai11"
    resource_group_name    = "devrgai11"
    location               = "southbrazil"
    administrator_login    = "sqladmin"
    administrator_password = "StrongP@ssword123!"
    sku_name               = "S0"
    max_size_gb            = 2
    tags = { env = "dev" }
  }
}

