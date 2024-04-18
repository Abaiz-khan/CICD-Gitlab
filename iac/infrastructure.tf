# Using Provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.89.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Step 1: Resource group
resource "azurerm_resource_group" "demoresourcegroup" {
  name     = "deployment-demo-tf"
  location = "East US"
}

# Step 2: Azure Container Registry
resource "azurerm_container_registry" "acr" {
  name                = "imagetwotire"
  resource_group_name = azurerm_resource_group.demoresourcegroup.name
  location            = azurerm_resource_group.demoresourcegroup.location
  sku                 = "Basic"
  admin_enabled       = true
}

# Step 3: AKS creation
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks1-tf"
  location            = azurerm_resource_group.demoresourcegroup.location
  resource_group_name = azurerm_resource_group.demoresourcegroup.name
  dns_prefix          = "exampleaks1tf"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

# Step 4: Assigning role to aks(Pull access)
resource "azurerm_role_assignment" "aksrole" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}
