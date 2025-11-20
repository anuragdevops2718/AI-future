rg_config = {
  rg1 = {
    name     = "devrgai20"
    location = "westus"
    tags     = { env = "dev" }
  }
}

acr_config = {
  acr1 = {
    name                = "devacrai11"
    sku                 = "Standard"
    admin_enabled       = false
    resource_group_name = "devrgai20"
    location            = "westus"
    tags                = { env = "dev" }
  }
}

aks_config = {
  dev = {
    name                = "devaksai11"
    location            = "westus"
    resource_group_name = "devrgai20"
    dns_prefix          = "aksai"
    admin_username      = "azureuser"
    node_count          = 2
    vm_size             = "Standard_B2ms"
    network_plugin      = "azure"
    load_balancer_sku   = "standard"
    tags = { env = "dev" }
  }
}

mssql_config = {
  sql1 = {
    servername = "aifuturesqlserver1411"
    resource_group_name = "devrgai20"
    location = "westus"
    dbname = "aifuturesqldb1411"
    tags = {
      "env" = "dev"
    }
  }
}

