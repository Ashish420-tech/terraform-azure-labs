output "vnet_name" {
  value = azurerm_virtual_network.lab5_vnet.name
}

output "subnet_name" {
  value = azurerm_subnet.lab5_subnet.name
}

output "subnet_cidr" {
  value = azurerm_subnet.lab5_subnet.address_prefixes
}
