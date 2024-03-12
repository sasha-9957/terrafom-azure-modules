output "frontdoor_custom_domain_associations" {
  description = "An object containing the Azure Front Door Custom Domain Associations created by the module."
  value       = module.frontdoor_custom_domain_association.frontdoor_custom_domain_associations
}
