output "frontdoor_origin_groups" {
  description = "An object containing the Azure Front Door Origin Groups created by the module."
  value       = module.frontdoor_origin_group.frontdoor_origin_groups
}
