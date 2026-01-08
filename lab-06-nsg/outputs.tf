output "nsg_name" {
  value = azurerm_network_security_group.lab6_nsg.name
}

output "nsg_rules" {
  value = azurerm_network_security_group.lab6_nsg.security_rule[*].name
}

