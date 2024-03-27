module "service_principal" {
  source  = "app.terraform.io/captionhealth/service-principal/azuread"
  version = "1.0.0"

  azuread_service_principal_params = {
    service_principal_1 = {
      account_enabled               = null
      alternative_names             = null
      app_role_assignment_required  = null
      client_id                     = module.azuread_application.azuread_applications["azad_app_1"].client_id # Required
      description                   = null
      login_url                     = null
      notes                         = null
      notification_email_addresses  = null
      owners                        = [data.azuread_client_config.current.object_id]
      preferred_single_sign_on_mode = null
      use_existing                  = null
      tags                          = null # Cannot be used together with the feature_tags block.

      feature_tags = [ # Cannot be used together with the tags property.
        {
          custom_single_sign_on = null
          enterprise            = true
          gallery               = true
          hide                  = null
        }
      ]

      saml_single_sign_on = [
        {
          relay_state = null
        }
      ]
    }
  }
}
