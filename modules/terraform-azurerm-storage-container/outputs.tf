output "storage_containers" {
  description = "An object containing the Storage Containers created by the module."
  value       = azurerm_storage_container.this
}
