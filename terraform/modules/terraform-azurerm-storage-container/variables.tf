variable "azurerm_storage_container_params" {
  description = "Object map for Azure Storage Container module input parameters."
  type = map(object({
    name                  = string # required
    storage_account_name  = string # required
    container_access_type = string
    metadata              = map(string)
  }))
}
