resource "azurerm_role_assignment" "this" {
  for_each = var.azurerm_role_assignment_params

  name                                   = each.value.name
  scope                                  = each.value.scope # Required
  role_definition_id                     = each.value.role_definition_id
  role_definition_name                   = each.value.role_definition_name
  principal_id                           = each.value.principal_id   # Required
  principal_type                         = each.value.principal_type # Required if one of condition or condition_version is set
  condition                              = each.value.condition
  condition_version                      = each.value.condition_version
  delegated_managed_identity_resource_id = each.value.delegated_managed_identity_resource_id
  description                            = each.value.description
  skip_service_principal_aad_check       = each.value.skip_service_principal_aad_check
}
