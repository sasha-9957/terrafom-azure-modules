output "private_dns_txt_records" {
  description = "An object containing the Private DNS TXT Records created by the module."
  value       = module.private_dns_txt_record.private_dns_txt_records
}
