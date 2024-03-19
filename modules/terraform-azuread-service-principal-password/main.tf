resource "azuread_service_principal_password" "this" {
  for_each = var.service_principal_password_params

  display_name         = each.value.display_name
  end_date             = each.value.end_date
  end_date_relative    = each.value.end_date_relative
  service_principal_id = each.value.service_principal_id # Required
  start_date           = each.value.start_date
  rotate_when_changed  = each.value.rotate_when_changed
}
