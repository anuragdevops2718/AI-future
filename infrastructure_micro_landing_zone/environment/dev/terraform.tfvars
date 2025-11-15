rg_config = {
  rg1 = {
    name     = "devrgai11"
    location = "brazilsouth"
    tags     = { env = "dev", owner = "anurag" }
  }
}

acr_config = {
  acr1 = {
    name                = "devacrai11"
    sku                 = "Standard"
    admin_enabled       = false
    resource_group_name = "devrgai11"
    location            = "brazilsouth"
    tags                = { env = "dev" }
  }
}

aks_config = {
  dev = {
    name                = "devaksai11"
    location            = "brazilsouth"
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

mssql_config = {
  sql1 = {
    servername = "aifuturesqlserver1411"
    resource_group_name = "devrgai11"
    location = "brazilsouth"
    dbname = "aifuturesqldb1411"
    tags = {
      "env" = "dev"
    }
  }
}

