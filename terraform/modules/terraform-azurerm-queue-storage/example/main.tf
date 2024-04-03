module "queue_storage" {
  source  = "app.terraform.io/captionhealth/queue-storage/azurerm"
  version = "1.0.0"

  azurerm_storage_queue_params = {
    main_queue_storage = {
      name                 = module.name.names["main_storage_queue"].result                       # required
      storage_account_name = module.storage_account.storage_accounts["main_storage_account"].name # required
      metadata             = null
    }
  }
}
