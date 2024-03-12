output "private_endpoints" {
  description = "An object containing the Azure Private Endpoints created by the module."
  value       = azurerm_private_endpoint.this
}
