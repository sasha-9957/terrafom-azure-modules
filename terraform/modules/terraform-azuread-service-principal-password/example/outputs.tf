output "service_principal_passwords" {
  description = "An object containing the Service Principal Passwords created by the module."
  value       = module.service_principal_password.service_principal_passwords
  sensitive   = true
}
