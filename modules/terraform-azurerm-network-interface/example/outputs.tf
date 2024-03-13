output "network_interfaces" {
  description = "An object containing the Azure Network Interface created by the module."
  value       = module.network_interface.network_interfaces
}
