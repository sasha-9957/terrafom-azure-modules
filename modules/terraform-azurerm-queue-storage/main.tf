resource "azurerm_storage_queue" "this" {
  for_each = var.azurerm_storage_queue_params

  name                 = each.value.name                 # required
  storage_account_name = each.value.storage_account_name # required
  metadata             = each.value.metadata
}
