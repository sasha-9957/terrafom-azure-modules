module "service_principal_claims_mapping_policy_assignment" {
  source  = "app.terraform.io/captionhealth/service_principal_claims_mapping_policy_assignment/azuread"
  version = "1.0.0"

  service_principal_claims_mapping_policy_assignment_params = {
    main_claims_mapping_policy_assignment = {
      claims_mapping_policy_id = azuread_claims_mapping_policy.my_policy.id
      service_principal_id     = module.azuread_service_principal.service_principals["main_service_principal"].id # Required
    }
  }
}
