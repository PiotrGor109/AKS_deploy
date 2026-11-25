
# Azure Container Registry
resource "azurerm_container_registry" "acr" {
  name                = "taskplanneracr2026"
  resource_group_name = azurerm_resource_group.aks_rg.name
  location            = azurerm_resource_group.aks_rg.location

  sku           = "Basic"
  admin_enabled = false

  tags = {
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}

# Allow AKS to pull images from ACR
resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}
