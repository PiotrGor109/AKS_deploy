
# Azure Virtual Network
resource "azurerm_virtual_network" "aks_vnet" {
  name                = "vnet-taskplanner"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name

  address_space = ["10.0.0.0/16"]

  tags = {
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}

# Subnet for AKS
resource "azurerm_subnet" "aks_subnet" {
  name                 = "snet-aks"
  resource_group_name  = azurerm_resource_group.aks_rg.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name

  address_prefixes = ["10.0.1.0/24"]
}

# Subnet for administration
resource "azurerm_subnet" "admin_subnet" {
  name                 = "snet-admin"
  resource_group_name  = azurerm_resource_group.aks_rg.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name

  address_prefixes = ["10.0.2.0/24"]
}
