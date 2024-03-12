output "private_dns_zone_virtual_network_links" {
  description = "An object containing the Azure Private DNS Zone Virtual Network Links created by the module."
  value       = module.private_dns_zone_virtual_network_link.private_dns_zone_virtual_network_links
}
