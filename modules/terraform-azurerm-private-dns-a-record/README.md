[//]: # (BEGIN_TF_DOCS)

### Example

```hcl
module "private_dns_a_record" {
  source = "app.terraform.io/captionhealth/private-dns-zone/azurerm"

  azurerm_private_dns_zone_params = {
    main_private_dns_zone = {
      name                = "mydomain.com"                                                          # required
      resource_group_name = module.resource_group.resource_groups["main_rg"].location               # required
      zone_name           = module.private_dns_zone.private_dns_zones["main_private_dns_zone"].name # required
      ttl                 = 300                                                                     # required
      records             = ["10.0.180.17"]                                                         # required
      tags                = null
    }
  }
}
```

## Requirements

| Name                                                                      | Version |
|---------------------------------------------------------------------------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5  |

## Providers

| Name                                                          | Version |
|---------------------------------------------------------------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                                      | Type     |
|-------------------------------------------------------------------------------------------------------------------------------------------|----------|
| [azurerm_private_dns_a_record.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_a_record) | resource |

## Inputs

| Name                                                                                                                                                  | Description | Type                                                                                                                                                                                                                                                                                                                                          | Default | Required |
|-------------------------------------------------------------------------------------------------------------------------------------------------------|-------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------|:--------:|
| <a name="input_azurerm_private_dns_a_record_params"></a> [azurerm\_private\_dns\_a\_record\_params](#input\_azurerm\_private\_dns\_a\_record\_params) | n/a         | <pre>map(object({<br>    name                = string      # required<br>    resource_group_name = string      # required<br>    zone_name           = string      # required<br>    ttl                 = number      # required<br>    records             = set(string) # required<br>    tags                = map(string)<br>  }))</pre> | n/a     |   yes    |

## Outputs

| Name                                                                                                      | Description |
|-----------------------------------------------------------------------------------------------------------|-------------|
| <a name="output_private_dns_a_records"></a> [private\_dns\_a\_records](#output\_private\_dns\_a\_records) | n/a         |

[//]: # (END_TF_DOCS)
<!-- BEGIN_TF_DOCS -->
<!-- markdown-table-prettify-ignore-start -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_private_dns_a_record.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_a_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_private_dns_a_record_params"></a> [azurerm\_private\_dns\_a\_record\_params](#input\_azurerm\_private\_dns\_a\_record\_params) | n/a | <pre>map(object({<br>    name                = string      # required<br>    resource_group_name = string      # required<br>    zone_name           = string      # required<br>    ttl                 = number      # required<br>    records             = set(string) # required<br>    tags                = map(string)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_dns_a_records"></a> [private\_dns\_a\_records](#output\_private\_dns\_a\_records) | n/a |
<!-- markdown-table-prettify-ignore-end -->
<!-- END_TF_DOCS -->
