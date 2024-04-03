resource "azurerm_resource_group" "this" {
  for_each = var.resource_group_params

  location   = each.value.location
  name       = each.value.name
  managed_by = each.value.managed_by
  tags       = each.value.tags
}
