output "private_dns_a_records" {
  description = "An object containing the Private DNS A Records created by the module."
  value       = module.private_dns_a_record.private_dns_a_records
}
