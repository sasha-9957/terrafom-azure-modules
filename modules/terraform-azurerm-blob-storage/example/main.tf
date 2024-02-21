module "blob_storage" {
  source  = "app.terraform.io/captionhealth/blob-storage/azurerm"
  version = "1.0.0"

  azurerm_storage_blob_params = {
    main_blob_storage = {
      name                 = module.name.names["main_blob_storage"].result                        # required
      storage_account_name = module.storage_account.storage_accounts["main_storage_account"].name # required
      type                 = "Block"                                                              # required
      size                 = null
      access_tier          = null
      cache_control        = null
      content_type         = null
      content_md5          = null
      source               = null
      source_content       = null
      source_uri           = null
      parallelism          = null
      metadata             = null
    }
  }
}
