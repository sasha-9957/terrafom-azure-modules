resource "azuread_service_principal_certificate" "this" {
  for_each = var.service_principal_certificate_params

  encoding             = each.value.encoding
  end_date             = each.value.end_date
  end_date_relative    = each.value.end_date_relative
  key_id               = each.value.key_id
  service_principal_id = each.value.service_principal_id # Required
  start_date           = each.value.start_date
  type                 = each.value.type  # Required
  value                = each.value.value # Required
}
