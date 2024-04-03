output "service_principals" {
  description = "An object containing the Azure Service Principals created by the module."
  value       = azuread_service_principal.this
}
