module "frontdoor_rule_set" {
  source  = "app.terraform.io/captionhealth/front-door-rule-set/azurerm"
  version = "1.0.0"

  azurerm_cdn_frontdoor_rule_set_params = {
    frontdoor_rule_set1 = {
      name                     = "ExampleRuleSet"                                                       # Required
      cdn_frontdoor_profile_id = module.frontdoor_profile.frontdoor_profiles["main_front_door_profile"] # Required
    }
  }
}
