output "network_interfaces" {
  description = "An object containing the Azure Network Interface created by the module."
  value       = azurerm_network_interface.this
}
