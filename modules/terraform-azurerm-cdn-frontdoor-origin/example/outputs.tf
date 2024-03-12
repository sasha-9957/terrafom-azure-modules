output "frontdoor_origins" {
  description = "An object containing the Azure Front Door Origins created by the module."
  value       = module.frontdoor_origin.frontdoor_origins
}
