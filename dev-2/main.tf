module "resource_group" {
  source = "../modules/terraform-azurerm-resource-group"
  for_each             = local.environments

  resource_group_params = {
    main_rg = {
      location   = local.location
      name       = module.name.names["main_rg"].result
      managed_by = null
      tags       = module.tags.tags
    }
  }
}

module "azurerm_service_plan" {
  source = "../modules/terraform-azurerm-service-plan"
  for_each             = local.environments
  
  azurerm_service_plan_params = {
    service_plan_linux = {
      name                         = "${var.environment}-${local.location}-dwh"
      location                     = module.resource_group.resource_groups["main_rg"].location
      os_type                      = "Linux"
      resource_group_name          = module.name.names["main_rg"].result
      sku_name                     = "P1v2"
      app_service_environment_id   = null
      maximum_elastic_worker_count = null
      worker_count                 = null
      per_site_scaling_enabled     = null
      zone_balancing_enabled       = null
      tags                         = module.tags.tags
    }
  }
}
