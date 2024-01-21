module "queue_storage" {
  source = "app.terraform.io/captionhealth/queue-storage/azurerm"

  azurerm_storage_queue_params = {
    test_queue_storage = {
      name                 = "hhcompqs" # required
      storage_account_name = "hhcompsa" # required
      metadata             = null
    }
  }
}
