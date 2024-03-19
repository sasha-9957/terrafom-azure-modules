output "service_principal_claims_mapping_policy_assignments" {
  description = "An object containing the Service Principal Claims Mapping Policy Assignment created by the module."
  value       = azuread_service_principal_claims_mapping_policy_assignment.this
}
