<!-- BEGIN_TF_DOCS -->
<!-- markdown-table-prettify-ignore-start -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_role_definition.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_role_definition_params"></a> [azurerm\_role\_definition\_params](#input\_azurerm\_role\_definition\_params) | Object map for Azure Role Definition module input parameters. | <pre>map(object({<br>    role_definition_id = string<br>    name               = string # Required<br>    scope              = string # Required<br>    description        = string<br>    assignable_scopes  = list(string)<br><br>    permissions = list(object({<br>      actions          = list(string)<br>      data_actions     = set(string)<br>      not_actions      = list(string)<br>      not_data_actions = set(string)<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurerm_role_definitions"></a> [azurerm\_role\_definitions](#output\_azurerm\_role\_definitions) | An object containing the Azure Role Definitions created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->