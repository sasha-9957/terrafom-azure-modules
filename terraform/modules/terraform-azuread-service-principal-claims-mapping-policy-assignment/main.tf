resource "azuread_service_principal_claims_mapping_policy_assignment" "this" {
  for_each = var.azuread_service_principal_claims_mapping_policy_assignment_params

  claims_mapping_policy_id = each.value.claims_mapping_policy_id # Required
  service_principal_id     = each.value.service_principal_id     # Required
}
