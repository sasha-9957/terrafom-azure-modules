output "front_door_profiles" {
  description = "An object containing the Azure Front Door Profiles created by the module."
  value       = module.frontdoor_profile.frontdoor_profiles
}
