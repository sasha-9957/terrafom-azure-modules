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
| [azuread_service_principal_certificate.this](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal_certificate) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azuread_service_principal_certificate_params"></a> [azuread\_service\_principal\_certificate\_params](#input\_azuread\_service\_principal\_certificate\_params) | Object map for Azure Service Principal Certificate module input parameters. | <pre>map(object({<br>    encoding             = string<br>    end_date             = string<br>    end_date_relative    = string<br>    key_id               = string<br>    service_principal_id = string # Required<br>    start_date           = string<br>    type                 = string # Required<br>    value                = string # Required<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_principal_certificates"></a> [service\_principal\_certificates](#output\_service\_principal\_certificates) | An object containing the Azure Service Principal Certificates created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->