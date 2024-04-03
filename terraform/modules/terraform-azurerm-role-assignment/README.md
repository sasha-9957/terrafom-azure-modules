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
| [azurerm_role_assignment.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_role_assignment_params"></a> [azurerm\_role\_assignment\_params](#input\_azurerm\_role\_assignment\_params) | Object map for Azure Role Assignment module input parameters. | <pre>map(object({<br>    name                                   = string<br>    scope                                  = string # Required<br>    role_definition_id                     = string<br>    role_definition_name                   = string<br>    principal_id                           = string # Required<br>    principal_type                         = string # Required if one of condition or condition_version is set<br>    condition                              = string<br>    condition_version                      = string<br>    delegated_managed_identity_resource_id = string<br>    description                            = string<br>    skip_service_principal_aad_check       = bool<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_assignments"></a> [role\_assignments](#output\_role\_assignments) | An object containing the Azure Role Assignments created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->