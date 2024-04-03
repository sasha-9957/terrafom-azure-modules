output "queue_storages" {
  description = "An object containing the Queue Storages created by the module."
  value       = azurerm_storage_queue.this
}
