resource "azuread_service_principal_token_signing_certificate" "this" {
  for_each = var.azuread_service_principal_token_signing_certificate_params

  display_name         = each.value.display_name
  end_date             = each.value.end_date
  service_principal_id = each.value.service_principal_id # Required
}
