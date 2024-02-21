output "private_dns_a_records" {
  description = "An object containing the Private DNS A Records created by the module."
  value       = azurerm_private_dns_zone.this
}
