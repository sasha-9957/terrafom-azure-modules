output "private_dns_cname_records" {
  description = "An object containing the Private DNS CNAME Records created by the module."
  value       = azurerm_private_dns_cname_record.this
}