output "virtual_networks" {
  description = "An object containing the Virtual Networks created by the module."
  value       = azurerm_virtual_network.this
}
