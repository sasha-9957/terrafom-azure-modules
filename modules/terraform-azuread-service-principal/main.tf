resource "azuread_service_principal" "this" {
  for_each = var.azuread_service_principal_params

  account_enabled               = each.value.account_enabled
  alternative_names             = each.value.alternative_names
  app_role_assignment_required  = each.value.app_role_assignment_required
  client_id                     = each.value.client_id # Required
  description                   = each.value.description
  login_url                     = each.value.login_url
  notes                         = each.value.notes
  notification_email_addresses  = each.value.notification_email_addresses
  owners                        = each.value.owners
  preferred_single_sign_on_mode = each.value.preferred_single_sign_on_mode
  use_existing                  = each.value.use_existing
  tags                          = each.value.tags # Cannot be used together with the feature_tags block.

  dynamic "feature_tags" { # Cannot be used in conjunction with the tags property.
    iterator = ft
    for_each = each.value.feature_tags

    content {
      custom_single_sign_on = ft.value.custom_single_sign_on
      enterprise            = ft.value.enterprise
      gallery               = ft.value.gallery
      hide                  = ft.value.hide
    }
  }

  dynamic "saml_single_sign_on" {
    iterator = ssso
    for_each = each.value.saml_single_sign_on

    content {
      relay_state = ssso.value.relay_state
    }
  }
}
