resource "azurerm_storage_blob" "this" {
  for_each = var.azurerm_storage_blob_params

  name                   = each.value.name                   # required
  storage_account_name   = each.value.storage_account_name   # required
  storage_container_name = each.value.storage_container_name # required
  type                   = each.value.type                   # required
  size                   = each.value.size
  access_tier            = each.value.access_tier
  cache_control          = each.value.cache_control
  content_type           = each.value.content_type
  content_md5            = each.value.content_md5
  source                 = each.value.source
  source_content         = each.value.source_content
  source_uri             = each.value.source_uri
  parallelism            = each.value.parallelism
  metadata               = each.value.metadata
}
