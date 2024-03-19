module "azuread_service_principal" {
  source  = "app.terraform.io/captionhealth/service-principal/azuread"
  version = "1.0.0"

  azuread_service_principal_params = {
    main_service_principal = {
      account_enabled               = null
      alternative_names             = null
      app_role_assignment_required  = false
      client_id                     = azuread_application.this.client_id # Required
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
