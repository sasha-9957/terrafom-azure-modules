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
| [azurerm_cdn_frontdoor_origin.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_origin) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_cdn_frontdoor_origin_params"></a> [azurerm\_cdn\_frontdoor\_origin\_params](#input\_azurerm\_cdn\_frontdoor\_origin\_params) | Object map for Azure Front Door Origin module input parameters. | <pre>map(object({<br>    name                           = string # Required<br>    cdn_frontdoor_origin_group_id  = string # Required<br>    host_name                      = string # Required<br>    certificate_name_check_enabled = bool   # Required<br>    enabled                        = bool<br>    http_port                      = number<br>    https_port                     = number<br>    origin_host_header             = string<br>    priority                       = number<br>    weight                         = number<br><br>    private_link = list(object({<br>      request_message        = string<br>      target_type            = string<br>      location               = string # Required<br>      private_link_target_id = string # Required<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_frontdoor_origins"></a> [frontdoor\_origins](#output\_frontdoor\_origins) | An object containing the Azure Front Door Origins created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->