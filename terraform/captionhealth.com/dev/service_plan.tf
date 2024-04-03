module "azurerm_service_plan" {
  source = "../../modules/terraform-azurerm-service-plan"
  azurerm_service_plan_params = {
    dwh_service_plan_linux = {
      name                         = "dev-stamp-sp-eastus-spn"
      location                     = module.resource_group.resource_groups["dwh_rg"].location
      os_type                      = "Linux"
      resource_group_name          = module.resource_group.resource_groups["dwh_rg"].name
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
