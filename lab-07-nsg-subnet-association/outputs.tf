output "subnet_name" {
  value = azurerm_subnet.subnet.name
}

output "nsg_name" {
  value = azurerm_network_security_group.nsg.name
}

output "nsg_attached_to_subnet" {
  value = azurerm_subnet_network_security_group_association.nsg_assoc.id
}

