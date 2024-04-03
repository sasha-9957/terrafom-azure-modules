module "blob_storage" {
  source = "../../modules/terraform-azurerm-blob-storage"

  azurerm_storage_blob_params = {
    main_blob_storage = {
      name                   = module.name.names["main_blob_storage"].result                              # required
      storage_account_name   = module.storage_account.storage_accounts["main_storage_account"].name       # required
      storage_container_name = module.storage_container.storage_containers["main_storage_container"].name # required
      type                   = "Block"                                                                    # required
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
