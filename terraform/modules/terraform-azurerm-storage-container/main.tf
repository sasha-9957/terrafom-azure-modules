resource "azurerm_storage_container" "this" {
  for_each = var.azurerm_storage_container_params

  name                  = each.value.name                 # required
  storage_account_name  = each.value.storage_account_name # required
  container_access_type = each.value.container_access_type
  metadata              = each.value.metadata
}
