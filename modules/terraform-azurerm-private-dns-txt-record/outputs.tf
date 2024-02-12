output "private_dns_txt_records" {
  description = "An object containing the Private DNS TXT Records created by the module."
  value       = azurerm_private_dns_txt_record.this
}