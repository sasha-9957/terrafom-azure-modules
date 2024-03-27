output "service_principal_certificates" {
  description = "An object containing the Azure Service Principal Certificates created by the module."
  value       = azuread_service_principal_certificate.this
}
