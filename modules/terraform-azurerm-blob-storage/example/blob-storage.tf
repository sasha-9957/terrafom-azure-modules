module "blob_storage" {
  source = "app.terraform.io/captionhealth/blob-storage/azurerm"

  azurerm_storage_blob_params = {
    test_blob_storage = {
      name                   = "hhcompbs" # required
      storage_account_name   = "hhcompsa" # required
      storage_container_name = "hhcompsc" # required
      type                   = "Block"    # required
      size                   = null
      access_tier            = null
      cache_control          = null
      content_type           = null
      content_md5            = null
      source                 = null
      source_content         = null
      source_uri             = null
      parallelism            = null
      metadata               = null
    }
  }
}
