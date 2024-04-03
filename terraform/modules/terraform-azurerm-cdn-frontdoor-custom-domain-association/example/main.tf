module "frontdoor_custom_domain_association" {
  source  = "app.terraform.io/captionhealth/front-door-custom-domain-association/azurerm"
  version = "1.0.0"

  azurerm_cdn_frontdoor_custom_domain_association_params = {
    frontdoor_custom_domain_association1 = {
      cdn_frontdoor_custom_domain_id = module.frontdoor_custom_domain.frontdoor_custom_domains["frontdoor_custom_domain1"] # Required
      cdn_frontdoor_route_ids        = module.frontdoor_route.frontdoor_routes["frontdoor_route1"].id                      # Required
    }
  }
}
