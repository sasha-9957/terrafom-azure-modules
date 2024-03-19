output "service_principals" {
  description = "An object containing the Service Principal created by the module."
  value       = module.azuread_service_principal.service_principals
}
