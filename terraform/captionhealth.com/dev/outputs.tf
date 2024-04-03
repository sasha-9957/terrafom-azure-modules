output "tags" {
  description = "Tags created for resources"
  value       = module.tags.tags
}

output "names" {
  description = "Names created for resources"
  value       = module.name.names
}

output "resource_groups" {
  description = "All created resource groups"
  value       = module.resource_group.resource_groups
}

output "private_dns_zones" {
  description = "An object containing the Private DNS Zones created by the module."
  value       = module.private_dns_zone.private_dns_zones
}

output "public_ips" {
  description = "An object containing the Public IP created by the module."
  value       = module.public_ip.public_ips
}

output "load_balancers" {
  description = "An object containing the Azure Load Balancers created by the module."
  value       = module.load_balancer.load_balancers
}

output "private_link_services" {
  description = "An object containing the Private Link Services created by the module."
  value       = module.private_link_service.private_link_services
}

output "private_endpoints" {
  description = "An object containing the Azure Private Endpoints created by the module."
  sensitive   = true
  value       = module.private_endpoint.private_endpoints
}

output "private_dns_zone_virtual_network_links" {
  description = "An object containing the Azure Private DNS Zone Virtual Network Links created by the module."
  value       = module.private_dns_zone_virtual_network_link.private_dns_zone_virtual_network_links
}

output "virtual_networks" {
  description = "An object containing the Virtual Networks created by the module."
  value       = module.virtual_network.virtual_networks
}

output "subnets" {
  description = "An object containing the Azure Subnets created by the module."
  value       = module.subnet.subnets
}

output "storage_accounts" {
  description = "An object containing the Storage Accounts created by the module."
  sensitive   = true
  value       = module.storage_account.storage_accounts
}

output "storage_containers" {
  description = "An object containing the Storage Containers created by the module."
  sensitive   = true
  value       = module.storage_container.storage_containers
}

output "blob_storages" {
  description = "An object containing the Blob Storages created by the module."
  sensitive   = true
  value       = module.blob_storage.blob_storages
}
