output "public_ips" {
  description = "An object containing the Public IP created by the module."
  value       = module.public_ip.public_ips
}
