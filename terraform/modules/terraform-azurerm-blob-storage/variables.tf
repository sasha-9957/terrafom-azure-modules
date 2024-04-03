variable "azurerm_storage_blob_params" {
  description = "Object map for Azure Blob Storage module input parameters."
  type = map(object({
    name                   = string # required
    storage_account_name   = string # required
    storage_container_name = string # required
    type                   = string # required
    size                   = number
    access_tier            = string
    cache_control          = string
    content_type           = string
    content_md5            = string
    source                 = string
    source_content         = string
    source_uri             = string
    parallelism            = number
    metadata               = map(string)
  }))
}
