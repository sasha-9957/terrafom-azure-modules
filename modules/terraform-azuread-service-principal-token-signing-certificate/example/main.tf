module "service_principal_token_signing_certificate" {
  source  = "app.terraform.io/captionhealth/service-principal-token-signing-certificate/azuread"
  version = "1.0.0"

  azuread_service_principal_token_signing_certificate_params = {
    service_principal_token_signing_certificate_1 = {
      display_name         = null
      end_date             = null
      service_principal_id = module.service_principal.service_principals["service_principal_1"].object_id # Required
    }
  }
}
