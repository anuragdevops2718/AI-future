resource "azurerm_kubernetes_cluster" "democluster" {
  for_each = var.aks_config

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    name       = "system"
    node_count = each.value.node_count
    vm_size    = each.value.node_vm_size
  }

  linux_profile {
    admin_username = "azureuser"
    ssh_key {
      key_data = file(each.value.ssh_public_key_path)
    }
  }

  identity {
    type = "SystemAssigned"
  }

  kubernetes_version = each.value.kubernetes_version

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }

  tags = each.value.tags
}