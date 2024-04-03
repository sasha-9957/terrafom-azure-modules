output "public_ips" {
  description = "An object containing the Public IPs created by the module."
  value       = azurerm_public_ip.this
}
