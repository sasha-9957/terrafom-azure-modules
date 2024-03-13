output "virtual_network_gateways" {
  description = "An object containing the Azure Virtual Network Gateways created by the module."
  value       = azurerm_virtual_network.this
}
