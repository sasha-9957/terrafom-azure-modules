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
| [azurerm_cdn_frontdoor_custom_domain.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_custom_domain) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_cdn_frontdoor_custom_domain_params"></a> [azurerm\_cdn\_frontdoor\_custom\_domain\_params](#input\_azurerm\_cdn\_frontdoor\_custom\_domain\_params) | Object map for Azure Front Door Custom Domain module input parameters. | <pre>map(object({<br>    name                     = string # Required<br>    cdn_frontdoor_profile_id = string # Required<br>    host_name                = string # Required<br>    dns_zone_id              = string<br><br>    tls = list(object({ # Required<br>      certificate_type        = string<br>      minimum_tls_version     = string<br>      cdn_frontdoor_secret_id = string<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_frontdoor_custom_domains"></a> [frontdoor\_custom\_domains](#output\_frontdoor\_custom\_domains) | An object containing the Azure Front Door Custom Domains created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->