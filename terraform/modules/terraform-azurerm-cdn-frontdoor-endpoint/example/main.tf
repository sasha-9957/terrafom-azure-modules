module "frontdoor_endpoint" {
  source  = "app.terraform.io/captionhealth/front-door-endpoint/azurerm"
  version = "1.0.0"

  azurerm_cdn_frontdoor_endpoint_params = {
    front_door_endpoint1 = {
      name                     = module.name.names["front_door_endpoint1"].result                            # Required
      cdn_frontdoor_profile_id = module.front_door_profile.front_door_profiles["main_front_door_profile"].id # Required
      enabled                  = true
      tags                     = module.tags.tags
    }
  }
}
