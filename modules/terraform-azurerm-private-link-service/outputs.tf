output "private_link_service" {
  description = "An object containing the Private Link Services created by the module."
  value       = azurerm_private_link_service.this
}
