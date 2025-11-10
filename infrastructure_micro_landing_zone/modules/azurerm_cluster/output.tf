output "aks_fqdns" {
  value = { for k, v in azurerm_kubernetes_cluster.democluster : k => v.fqdn }
}