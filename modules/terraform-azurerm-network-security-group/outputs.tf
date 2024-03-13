output "network_security_groups" {
  description = "An object containing the Azure Network Security Groups created by the module."
  value       = azurerm_network_security_group.this
}
