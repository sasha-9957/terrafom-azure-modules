module "frontdoor_origin_group" {
  source  = "app.terraform.io/captionhealth/front-door-origin-group/azurerm"
  version = "1.0.0"

  azurerm_cdn_frontdoor_origin_group_params = {
    frontdoor_origin_group1 = {
      name                                                      = "origin-group-1"                                                            # Required
      cdn_frontdoor_profile_id                                  = module.front_door_profile.front_door_profiles["main_front_door_profile"].id # Required
      restore_traffic_time_to_healed_or_new_endpoint_in_minutes = null
      session_affinity_enabled                                  = null

      load_balancing = [ # Required
        # {
        #   additional_latency_in_milliseconds = 0
        #   sample_size                        = 16
        #   successful_samples_required        = 3
        # }
      ]

      health_probe = [
        # {
        #   protocol            = "Https" # Required
        #   interval_in_seconds = 240     # Required
        #   request_type        = "HEAD"
        #   path                = "/healthProbe"
        # }
      ]
    }
  }
}
