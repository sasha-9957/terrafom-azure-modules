module "frontdoor_custom_domain" {
  source  = "app.terraform.io/captionhealth/front-door-custom-domain/azurerm"
  version = "1.0.0"

  azurerm_cdn_frontdoor_custom_domain_params = {
    frontdoor_custom_domain1 = {
      name                     = "custom-domain1"                                                                # Required
      cdn_frontdoor_profile_id = module.frontdoor_profile.frontdoor_profiles["main_front_door_profile"].id       # Required
      host_name                = module.private_dns_a_record.private_dns_a_records["private_dns_a_record1"].fqdn # Required
      dns_zone_id              = module.private_dns_zone.private_dns_zones["main_private_dns_zone"]
    }
  }
}
