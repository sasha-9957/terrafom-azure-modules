# data "azurerm_management_group" "example" {
#   name = "00000000-0000-0000-0000-000000000000"
# }

data "azurerm_subscription" "primary" {
}

data "azurerm_client_config" "example" {
}

module "role_assignment" {
  source  = "app.terraform.io/captionhealth/role-assignment/azurerm"
  version = "1.0.0"

  azurerm_role_assignment_params = {
    role_assignment1 = {
      name                                   = module.name.names["role_assignment1"].result
      scope                                  = data.azurerm_subscription.primary.id # Required
      role_definition_id                     = module.role_definition.role_definitions["role_definition1"].role_definition_resource_id
      role_definition_name                   = "Reader"
      principal_id                           = data.azurerm_client_config.example.object_id # Required
      principal_type                         = "ServicePrincipal"                           # Required if one of condition or condition_version is set
      condition                              = null
      condition_version                      = null
      delegated_managed_identity_resource_id = null
      description                            = null
      skip_service_principal_aad_check       = null
    }
  }
}
