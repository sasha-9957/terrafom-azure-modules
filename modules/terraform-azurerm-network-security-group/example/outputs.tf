output "azurerm_network_security_groups" {
  description = "An object containing the Azure Network Security Groups created by the module."
  value       = module.azurerm_network_security_group.azurerm_network_security_groups
}
