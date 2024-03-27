variable "azuread_service_principal_claims_mapping_policy_assignment_params" {
  description = "Object map for Azure Service Principal Claims Mapping Policy Assignment module input parameters."

  type = map(object({
    claims_mapping_policy_id = string # Require
    service_principal_id     = string # Require
  }))
}
