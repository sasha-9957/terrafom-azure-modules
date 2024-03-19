module "service_principal_token_signing_certificate" {
  source  = "app.terraform.io/captionhealth/service-principal-token-signing_certificate/azuread"
  version = "1.0.0"

  service_principal_token_signing_certificate_params = {
    main_principal_password = {
      display_name         = null
      end_date             = null
      service_principal_id = module.azuread_service_principal.service_principals["main_service_principal"].id # Required
    }
  }
}