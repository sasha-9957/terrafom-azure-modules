output "virtual_network_gateways" {
  description = "An object containing the Azure Virtual Network Gateways created by the module."
  value       = module.virtual_network_gateway.virtual_network_gateways
}
