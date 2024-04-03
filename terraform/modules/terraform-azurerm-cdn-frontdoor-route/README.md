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
| [azurerm_cdn_frontdoor_route.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_route) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_cdn_frontdoor_route_params"></a> [azurerm\_cdn\_frontdoor\_route\_params](#input\_azurerm\_cdn\_frontdoor\_route\_params) | Object map for Azure Front Door Route module input parameters. | <pre>map(object({<br>    name                            = string       # Required<br>    cdn_frontdoor_endpoint_id       = string       # Required<br>    cdn_frontdoor_origin_group_id   = string       # Required<br>    cdn_frontdoor_origin_ids        = list(string) # Required<br>    forwarding_protocol             = string<br>    patterns_to_match               = list(string) # Required<br>    supported_protocols             = set(string)  # Required<br>    cdn_frontdoor_custom_domain_ids = set(string)<br>    cdn_frontdoor_origin_path       = string<br>    cdn_frontdoor_rule_set_ids      = set(string)<br>    enabled                         = bool<br>    https_redirect_enabled          = bool<br>    link_to_default_domain          = bool<br><br>    cache = list(object({<br>      query_string_caching_behavior = string<br>      query_strings                 = list(string)<br>      compression_enabled           = bool<br>      content_types_to_compress     = list(string)<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurerm_cdn_frontdoor_routes"></a> [azurerm\_cdn\_frontdoor\_routes](#output\_azurerm\_cdn\_frontdoor\_routes) | An object containing the Azure Front Door Routes created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->