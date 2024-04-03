module "frontdoor_profile" {
  source  = "app.terraform.io/captionhealth/front-door-profile/azurerm"
  version = "1.0.0"

  azurerm_cdn_frontdoor_profile_params = {
    main_front_door_profile = {
      name                     = module.name.names["main_front_door"].result           # Required
      resource_group_name      = module.resource_group.resource_groups["main_rg"].name # Required
      sku_name                 = "Premium_AzureFrontDoor"                              # Required
      response_timeout_seconds = null
      tags                     = module.tags.tags
    }
  }
}
