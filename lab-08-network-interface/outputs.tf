output "nic_name" {
  value = azurerm_network_interface.nic.name
}

output "private_ip" {
  value = azurerm_network_interface.nic.private_ip_address
}
