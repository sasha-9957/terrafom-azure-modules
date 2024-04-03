module "service_principal_claims_mapping_policy_assignment" {
  source  = "app.terraform.io/captionhealth/service-principal-claims-mapping-policy-assignment/azuread"
  version = "1.0.0"

  azuread_service_principal_claims_mapping_policy_assignment_params = {
    claims_mapping_policy_assignment_1 = {
      claims_mapping_policy_id = azuread_claims_mapping_policy.my_policy.id
      service_principal_id     = module.service_principal.service_principals["service_principal_1"].object_id # Required
    }
  }
}
