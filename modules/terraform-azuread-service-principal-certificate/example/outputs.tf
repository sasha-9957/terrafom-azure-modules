output "service_principal_certificates" {
  description = "An object containing the Azure Service Principal Certificates created by the module."
  value       = module.service_principal_certificate.service_principal_certificates
  sensitive   = true
}
