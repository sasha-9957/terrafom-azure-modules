<!-- BEGIN_TF_DOCS -->
<!-- markdown-table-prettify-ignore-start -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.89 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.89 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_access_policy.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_key_vault_access_policy_params"></a> [azurerm\_key\_vault\_access\_policy\_params](#input\_azurerm\_key\_vault\_access\_policy\_params) | Object map for Azure Key Vault Access Policy module input parameters. | <pre>map(object({<br>    key_vault_id            = string # Required<br>    tenant_id               = string # Required<br>    object_id               = string # Required<br>    application_id          = string<br>    certificate_permissions = list(string)<br>    key_permissions         = list(string)<br>    secret_permissions      = list(string)<br>    storage_permissions     = list(string)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_vault_access_policies"></a> [key\_vault\_access\_policies](#output\_key\_vault\_access\_policies) | An object containing the Key Vaults Access Policies created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->