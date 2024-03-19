output "service_principal_token_signing_certificates" {
  description = "An object containing the Service Principal Token Signing Certificate created by the module."
  value       = module.service_principal_token_signing_certificate.service_principal_token_signing_certificates
}
