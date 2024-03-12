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
| [azurerm_cdn_frontdoor_origin_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_origin_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_cdn_frontdoor_origin_group_params"></a> [azurerm\_cdn\_frontdoor\_origin\_group\_params](#input\_azurerm\_cdn\_frontdoor\_origin\_group\_params) | Object map for Azure Front Door Origin Group module input parameters. | <pre>map(object({<br>    name                                                      = string # Required<br>    cdn_frontdoor_profile_id                                  = string # Required<br>    restore_traffic_time_to_healed_or_new_endpoint_in_minutes = number<br>    session_affinity_enabled                                  = bool<br><br>    load_balancing = list(object({ # Required<br>      additional_latency_in_milliseconds = number<br>      sample_size                        = number<br>      successful_samples_required        = number<br>    }))<br><br>    health_probe = list(object({<br>      protocol            = string # Required<br>      interval_in_seconds = number # Required<br>      request_type        = string<br>      path                = string<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_frontdoor_origin_groups"></a> [frontdoor\_origin\_groups](#output\_frontdoor\_origin\_groups) | An object containing the Azure Front Door Origin Groupds created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->