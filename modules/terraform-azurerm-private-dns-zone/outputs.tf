output "private_dns_zones" {
  description = "An object containing the Private DNS Zones created by the module."
  value       = azurerm_private_dns_zone.this
}
