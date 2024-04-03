output "private_dns_mx_records" {
  description = "An object containing the Private DNS MX Records created by the module."
  value       = module.private_dns_mx_record.private_dns_mx_records
}
