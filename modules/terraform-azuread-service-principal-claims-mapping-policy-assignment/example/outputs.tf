output "service_principal_claims_mapping_policy_assignments" {
  description = "An object containing the Azure Service Principal Claims Mapping Policy Assignments created by the module."
  value       = module.service_principal_claims_mapping_policy_assignment.service_principal_claims_mapping_policy_assignments
}
