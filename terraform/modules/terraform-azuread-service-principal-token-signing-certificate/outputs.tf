output "service_principal_token_signing_certificates" {
  description = "An object containing the Azure Service Principal Token Signing Certificate created by the module."
  value       = azuread_service_principal_token_signing_certificate.this
}
