output "private_dns_zone_virtual_network_links" {
  description = "An object containing the Azure Private DNS Zone Virtual Network Links created by the module."
  value       = azurerm_private_dns_zone_virtual_network_link.this
}
