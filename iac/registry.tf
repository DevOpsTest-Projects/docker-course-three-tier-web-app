provider "azurerm" {
  features {}
}

data "azure_resource_group" "rg_name" {
    name = var.resource_group_name
}

resource "azurerm_resource_group" "example" {
  name     = data.resource_group_name.rg_name.name
  location = data.resource_group_name.rg_name.location
}

resource "azurerm_container_registry" "acr" {
  name                = ""
  resource_group_name = data.azurerm_resource_group.rg_name.name
  location            = data.azurerm_resource_group.rg_name.location
  sku                 = "Basic"
  admin_enabled       = false
}