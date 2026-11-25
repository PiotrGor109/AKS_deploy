output "resource_group_name" {
  description = "Nazwa Resource Group"
  value       = azurerm_resource_group.aks_rg.name
}

output "aks_cluster_name" {
  description = "Nazwa klastra AKS"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "acr_name" {
  description = "Nazwa Azure Container Registry"
  value       = azurerm_container_registry.acr.name
}

output "acr_login_server" {
  description = "Adres Azure Container Registry"
  value       = azurerm_container_registry.acr.login_server
}
