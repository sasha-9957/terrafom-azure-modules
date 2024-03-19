module "service_principal_password" {
  source  = "app.terraform.io/captionhealth/service-principal-certificate/azuread"
  version = "1.0.0"

  service_principal_password_params = {
    main_principal_password = {
      display_name         = null
      end_date             = null
      end_date_relative    = null
      service_principal_id = module.azuread_service_principal.service_principals["main_service_principal"].id # Required
      start_date           = null
      rotate_when_changed = {
        rotation = null
      }
    }
  }
}