resource "azurerm_kubernetes_cluster" "this" {
  for_each = var.aks_config

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    name       = lookup(each.value, "node_pool_name", "systempool")
    vm_size    = lookup(each.value, "vm_size", "Standard_B2s")
    node_count = lookup(each.value, "node_count", 1)
  }

  linux_profile {
    admin_username = each.value.admin_username

      ssh_key {
      # 👇 Auto-generate SSH key using Terraform
      key_data = tls_private_key.aks_ssh.public_key_openssh
    }
  }

  identity {
    type = lookup(each.value, "identity_type", "SystemAssigned")
  }

  network_profile {
    network_plugin    = lookup(each.value, "network_plugin", "azure")
    load_balancer_sku = lookup(each.value, "load_balancer_sku", "standard")
  }

  tags = lookup(each.value, "tags", {})
}
