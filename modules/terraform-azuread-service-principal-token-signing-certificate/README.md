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
| [azuread_service_principal_token_signing_certificate.this](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal_token_signing_certificate) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azuread_service_principal_token_signing_certificate_params"></a> [azuread\_service\_principal\_token\_signing\_certificate\_params](#input\_azuread\_service\_principal\_token\_signing\_certificate\_params) | Object map for Azure Service Principal Token Signing Certificate module input parameters. | <pre>map(object({<br>    display_name         = string<br>    end_date             = string<br>    service_principal_id = string # Required<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_principal_token_signing_certificates"></a> [service\_principal\_token\_signing\_certificates](#output\_service\_principal\_token\_signing\_certificates) | An object containing the Azure Service Principal Token Signing Certificate created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->