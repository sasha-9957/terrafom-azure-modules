variable "azuread_service_principal_params" {
  description = "Object map for Service Principal module input parameters."

  type = map(object({
    account_enabled               = bool
    alternative_names             = set(string)
    app_role_assignment_required  = bool
    client_id                     = string # Required
    description                   = string
    login_url                     = string
    notes                         = string
    notification_email_addresses  = set(string)
    owners                        = set(string)
    preferred_single_sign_on_mode = string
    use_existing                  = bool
    tags                          = set(string) # Cannot be used together with the feature_tags block.

    feature_tags = list(object({ # Cannot be used in conjunction with the tags property.
      custom_single_sign_on = bool
      enterprise            = bool
      gallery               = bool
      hide                  = bool
    }))
    saml_single_sign_on = list(object({
      relay_state = string
    }))
  }))
}
