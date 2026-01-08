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

resource "azurerm_resource_group" "lab4_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "lab4_vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.lab4_rg.location
  resource_group_name = azurerm_resource_group.lab4_rg.name
  address_space       = var.vnet_address_space

  tags = {
    environment = "lab"
  }
}
