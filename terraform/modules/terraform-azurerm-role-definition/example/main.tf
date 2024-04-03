data "azurerm_subscription" "primary" {
}

module "role_definition" {
  source  = "app.terraform.io/captionhealth/role-definition/azurerm"
  version = "1.0.0"

  azurerm_role_definition_params = {
    role_definition1 = {
      role_definition_id = null
      name               = module.name.names["role_definition1"] # Required
      scope              = data.azurerm_subscription.primary.id  # Required
      description        = "This is a custom role created via Terraform"
      assignable_scopes = [
        data.azurerm_subscription.primary.id, # /subscriptions/00000000-0000-0000-0000-000000000000
      ]

      permissions = [
        # {
        #   actions          = ["*"]
        #   data_actions     = []
        #   not_actions      = []
        #   not_data_actions = []
        # }
      ]
    }
  }
}
