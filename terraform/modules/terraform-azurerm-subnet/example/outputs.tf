output "subnets" {
  description = "An object containing the Azure Subnets created by the module."
  value       = module.subnet.subnets
}
