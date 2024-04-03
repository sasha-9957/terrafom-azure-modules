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
| [azuread_service_principal.this](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azuread_service_principal_params"></a> [azuread\_service\_principal\_params](#input\_azuread\_service\_principal\_params) | Object map for Azure Service Principal module input parameters. | <pre>map(object({<br>    account_enabled               = bool<br>    alternative_names             = set(string)<br>    app_role_assignment_required  = bool<br>    client_id                     = string # Required<br>    description                   = string<br>    login_url                     = string<br>    notes                         = string<br>    notification_email_addresses  = set(string)<br>    owners                        = set(string)<br>    preferred_single_sign_on_mode = string<br>    use_existing                  = bool<br>    tags                          = set(string) # Cannot be used together with the feature_tags block.<br><br>    feature_tags = list(object({ # Cannot be used in conjunction with the tags property.<br>      custom_single_sign_on = bool<br>      enterprise            = bool<br>      gallery               = bool<br>      hide                  = bool<br>    }))<br><br>    saml_single_sign_on = list(object({<br>      relay_state = string<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_principals"></a> [service\_principals](#output\_service\_principals) | An object containing the Azure Service Principals created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->