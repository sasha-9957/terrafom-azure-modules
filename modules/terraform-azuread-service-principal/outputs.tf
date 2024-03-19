output "service_principals" {
  description = "An object containing the Service Principal created by the module."
  value       = azuread_service_principal.this
}
