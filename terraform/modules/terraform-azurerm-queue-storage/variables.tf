variable "azurerm_storage_queue_params" {
  description = "Object map for Azure Storage Queue module input parameters."
  type = map(object({
    name                 = string # required
    storage_account_name = string # required
    metadata             = map(string)
  }))
}
