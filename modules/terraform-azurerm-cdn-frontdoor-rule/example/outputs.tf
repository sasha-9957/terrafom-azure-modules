output "frontdoor_rules" {
  description = "An object containing the Azure Front Door Rules created by the module."
  value       = module.frontdoor_rule.frontdoor_rules
}
