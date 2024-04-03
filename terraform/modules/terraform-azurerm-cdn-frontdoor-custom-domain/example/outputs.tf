output "frontdoor_custom_domains" {
  description = "An object containing the Azure Front Door Custom Domains created by the module."
  value       = module.frontdoor_custom_domain.frontdoor_custom_domains
}
