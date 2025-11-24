rg_config = {
  rg1 = {
    name     = "devrgaifuture"
    location = "westus"
    tags     = { "env" = "dev" }
  }
}

acr_config = {
  acr1 = {
    name                = "devacraifuture"
    sku                 = "Standard"
    admin_enabled       = false
    resource_group_name = "devrgaifuture"
    location            = "westus"
    tags                = { "env" = "dev" }
  }
}

aks_config = {
  dev = {
    name                = "devaksaifuture"
    location            = "westus"
    resource_group_name = "devrgaifuture"
    dns_prefix          = "aksai"
    admin_username      = "azureuser"
    node_count          = 2
    vm_size             = "Standard_B2ms"
    network_plugin      = "azure"
    load_balancer_sku   = "standard"
    tags                = { "env" = "dev" }
  }
}

mssql_config = {
  sql1 = {
    servername          = "devsqlserveraifuture"
    resource_group_name = "devrgaifuture"
    location            = "westus"
    dbname              = "devsqldbaifuture"
    tags = {
      "env" = "dev"
    }
  }
}

kv_config = {
  "kv1" = {
    name                = "devkvaifuture"
    location            = "westus"
    resource_group_name = "devrgaifuture"
    sku_name            = "standard"
    access_policy = {
      "pol1" = {
        key_permissions     = ["Get", "Create"]
        secret_permissions  = ["Get", "Set", "Delete", "Purge", "Recover"]
        storage_permissions = ["Get", "Set", "Delete"]
      }
    }
    tags = {
      "env" = "dev"
    }
  }
}

kvsec_config = {
  "sec1" = {
    name  = "devsecret01"
    value = "adminuser"
    tags = {
      "env" = "dev"
    }
  }

  "sec2" = {
    name  = "devsecret02"
    value = "Pamanu2friends)"
    tags = {
      "env" = "dev"
    }
  }
}
