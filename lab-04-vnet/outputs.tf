output "vnet_name" {
  value = azurerm_virtual_network.lab4_vnet.name
}

output "vnet_address_space" {
  value = azurerm_virtual_network.lab4_vnet.address_space
}
