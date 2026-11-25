
# Resource Group
resource "azurerm_resource_group" "aks_rg" {
  name     = "PG_TF_AKS_RG"
  location = "polandcentral"

  tags = {
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}

# AKS Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "PiotrAKS-TF"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "piotraks-tf"

  private_cluster_enabled             = true
  private_cluster_public_fqdn_enabled = false

  node_provisioning_profile {
    mode = "Manual"
  }

  default_node_pool {
    name           = "agentpool"
    node_count     = 1
    vm_size        = "Standard_D2as_v6"
    max_pods       = 30
    vnet_subnet_id = azurerm_subnet.aks_subnet.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    network_policy    = "azure"
    load_balancer_sku = "standard"
    service_cidr      = "10.1.0.0/16"
    dns_service_ip    = "10.1.0.10"
  }

  tags = {
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}
