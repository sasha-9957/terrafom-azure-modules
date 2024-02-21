output "virtual_networks" {
  description = "An object containing the Virtual Networks created by the module."
  value       = module.virtual_network.virtual_networks
}
