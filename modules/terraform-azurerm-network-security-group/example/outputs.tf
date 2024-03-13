output "network_security_groups" {
  description = "An object containing the Azure Network Security Groups created by the module."
  value       = module.network_security_group.network_security_groups
}
