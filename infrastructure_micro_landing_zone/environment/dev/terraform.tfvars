rg_config = {
  rg1 = {
    name     = "devrgaifuture"
    location = "westus"
    tags     = { "env" = "dev" }
  }
}

acr_config = {
  acr1 = {
    name                = "devacrai"
    sku                 = "Standard"
    admin_enabled       = false
    resource_group_name = "devrgaifuture"
    location            = "westus"
    tags                = { "env" = "dev" }
  }
}

aks_config = {
  dev = {
    name                = "devaksai"
    location            = "westus"
    resource_group_name = "devrgaifuture"
    dns_prefix          = "aksai"
    admin_username      = "azureuser"
    node_count          = 2
    vm_size             = "Standard_B2ms"
    network_plugin      = "azure"
    load_balancer_sku   = "standard"
    tags = { "env" = "dev" }
  }
}

mssql_config = {
  sql1 = {
    servername = "aifuturesqlserver1411"
    resource_group_name = "devrgaifuture"
    location = "westus"
    dbname = "aifuturesqldb1411"
    tags = {
      ""env"" = "dev"
    }
  }
}

