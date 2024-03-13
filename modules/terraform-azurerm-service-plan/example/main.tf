module "azurerm_service_plan" {
  source = "app.terraform.io/captionhealth//terraform-azurerm-service-plan/azurerm"
  version = "1.0.0"

  azurerm_service_plan_params = {
    main_service_plan = {
      name                         = "example"                                                 # Required
      location                     = module.resource_group.resource_groups["main_rg"].location # Required
      os_type                      = "Linux"                                                   # Required
      resource_group_name          = module.name.names["main_rg"].result                       # Required
      sku_name                     = "P1v2"                                                    # Required
      app_service_environment_id   = null
      maximum_elastic_worker_count = null
      worker_count                 = null
      per_site_scaling_enabled     = null
      zone_balancing_enabled       = null
      tags                         = module.tags.tags
    }
  }
}
