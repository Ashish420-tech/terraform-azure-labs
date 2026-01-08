terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "lab5_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "lab5_vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.lab5_rg.location
  resource_group_name = azurerm_resource_group.lab5_rg.name
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "lab5_subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.lab5_rg.name
  virtual_network_name = azurerm_virtual_network.lab5_vnet.name
  address_prefixes     = var.subnet_address_prefixes
}
