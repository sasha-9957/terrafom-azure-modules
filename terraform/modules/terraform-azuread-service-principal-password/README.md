<!-- BEGIN_TF_DOCS -->
<!-- markdown-table-prettify-ignore-start -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_service_principal_password.this](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal_password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azuread_service_principal_password_params"></a> [azuread\_service\_principal\_password\_params](#input\_azuread\_service\_principal\_password\_params) | Object map for Azure Service Principal Password module input parameters. | <pre>map(object({<br>    display_name         = string<br>    end_date             = string<br>    end_date_relative    = string<br>    rotate_when_changed  = map(string)<br>    service_principal_id = string # Required<br>    start_date           = string<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_principal_passwords"></a> [service\_principal\_passwords](#output\_service\_principal\_passwords) | An object containing the Azure Service Principal Passwords created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->