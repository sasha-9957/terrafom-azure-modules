output "blob_storages" {
  description = "An object containing the Blob Storages created by the module."
  value       = azurerm_storage_blob.this
}
