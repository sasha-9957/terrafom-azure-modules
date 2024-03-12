module "storage_container" {
  source  = "app.terraform.io/HHCompany/storage-container/azurerm"
  version = "1.0.0"

  azurerm_storage_container_params = {
    main_storage_container = {
      name                  = module.name.names["main_storage_container"].result                   # required
      storage_account_name  = module.storage_account.storage_accounts["main_storage_account"].name # required
      container_access_type = null
      metadata              = null
    }
  }
}
