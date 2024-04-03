output "private_dns_zones" {
  description = "An object containing the Private DNS Zones created by the module."
  value       = module.private_dns_zone.private_dns_zones
}
