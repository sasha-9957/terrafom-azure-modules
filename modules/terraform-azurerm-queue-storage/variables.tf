variable "azurerm_storage_queue_params" {
  type = map(object({
    name                 = string # required
    storage_account_name = string # required
    metadata             = map(string)
  }))
}
