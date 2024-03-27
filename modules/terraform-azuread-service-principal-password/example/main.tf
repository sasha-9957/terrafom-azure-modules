module "service_principal_password" {
  source  = "app.terraform.io/captionhealth/service-principal-password/azuread"
  version = "1.0.0"

  azuread_service_principal_password_params = {
    service_principal_pswd_1 = {
      display_name         = null
      end_date             = null
      end_date_relative    = null
      rotate_when_changed  = null
      service_principal_id = module.service_principal.service_principals["service_principal_1"].object_id # Required
      start_date           = null
    }
  }
}
