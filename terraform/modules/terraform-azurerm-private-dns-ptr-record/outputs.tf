output "private_dns_ptr_records" {
  description = "An object containing the Private DNS PTR Records created by the module."
  value       = azurerm_private_dns_ptr_record.this
}
