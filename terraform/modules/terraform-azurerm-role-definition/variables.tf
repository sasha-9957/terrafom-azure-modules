variable "azurerm_role_definition_params" {
  description = "Object map for Azure Role Definition module input parameters."
  type = map(object({
    role_definition_id = string
    name               = string # Required
    scope              = string # Required
    description        = string
    assignable_scopes  = list(string)

    permissions = list(object({
      actions          = list(string)
      data_actions     = set(string)
      not_actions      = list(string)
      not_data_actions = set(string)
    }))
  }))
}
