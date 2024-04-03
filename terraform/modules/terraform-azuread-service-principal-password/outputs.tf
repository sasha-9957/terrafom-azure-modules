output "service_principal_passwords" {
  description = "An object containing the Azure Service Principal Passwords created by the module."
  value       = azuread_service_principal_password.this
}
