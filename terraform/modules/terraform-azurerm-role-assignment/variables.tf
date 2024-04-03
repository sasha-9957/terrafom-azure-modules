variable "azurerm_role_assignment_params" {
  description = "Object map for Azure Role Assignment module input parameters."
  type = map(object({
    name                                   = string
    scope                                  = string # Required
    role_definition_id                     = string
    role_definition_name                   = string
    principal_id                           = string # Required
    principal_type                         = string # Required if one of condition or condition_version is set
    condition                              = string
    condition_version                      = string
    delegated_managed_identity_resource_id = string
    description                            = string
    skip_service_principal_aad_check       = bool
  }))
}
