resource "azurerm_service_plan" "this" {
  for_each = var.azurerm_service_plan_params

  name                         = each.value.name                # Required
  location                     = each.value.location            # Required
  os_type                      = each.value.os_type             # Required
  resource_group_name          = each.value.resource_group_name # Required
  sku_name                     = each.value.sku_name            # Required
  app_service_environment_id   = each.value.app_service_environment_id
  maximum_elastic_worker_count = each.value.maximum_elastic_worker_count
  worker_count                 = each.value.worker_count
  per_site_scaling_enabled     = each.value.per_site_scaling_enabled
  zone_balancing_enabled       = each.value.zone_balancing_enabled
  tags                         = each.value.tags
}