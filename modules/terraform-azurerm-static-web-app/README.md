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
| [azurerm_static_web_app.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/static_web_app) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_static_web_app_params"></a> [azurerm\_static\_web\_app\_params](#input\_azurerm\_static\_web\_app\_params) | Object map for Azure Static Web App module input parameters. | <pre>map(object({<br>    name                               = string # Required<br>    location                           = string # Required<br>    resource_group_name                = string # Required<br>    configuration_file_changes_enabled = bool<br>    preview_environments_enabled       = bool<br>    sku_tier                           = string<br>    sku_size                           = string<br>    app_settings                       = map(string)<br>    tags                               = map(string)<br><br>    basic_auth = list(object({<br>      password     = string # Required, wrap the input into the sensitive() function.<br>      environments = string # Required<br>    }))<br><br>    identity = list(object({<br>      type         = string # Required<br>      identity_ids = set(string)<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_static_web_apps"></a> [static\_web\_apps](#output\_static\_web\_apps) | An object containing the Azure Static Wb Apps created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->