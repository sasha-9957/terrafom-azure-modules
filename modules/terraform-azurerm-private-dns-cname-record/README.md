[//]: # (BEGIN_TF_DOCS)


### Example:

```hcl
module "private_dns_cname_record" {
  source = "app.terraform.io/captionhealth/private_dns_cname_record/azurerm"

  azurerm_private_dns_cname_record_params = {
    main_private_dns_zone = {
      name                = "dev-1"                                                                 # required
      resource_group_name = module.resource_group.resource_groups["main_rg"].name                   # required
      zone_name           = module.private_dns_zone.private_dns_zones["main_private_dns_zone"].name # required
      ttl                 = 300                                                                     # required
      record              = "alias-name.com"                                                        # required
      tags                = module.tags.tags
    }
  }
}
```



## Requirements

| Name | Version |
|------|---------|
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
| [azurerm_private_dns_cname_record.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_cname_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_private_dns_cname_record_params"></a> [azurerm\_private\_dns\_cname\_record\_params](#input\_azurerm\_private\_dns\_cname\_record\_params) | Object map for Azure Private DNS CNAME Record module input parameters. | <pre>map(object({<br>    name                = string # required<br>    resource_group_name = string # required<br>    zone_name           = string # required<br>    ttl                 = number # required<br>    record              = string # required<br>    tags                = map(string)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_dns_cname_records"></a> [private\_dns\_cname\_records](#output\_private\_dns\_cname\_records) | An object containing the Private DNS CNAME Records created by the module. |

[//]: # (END_TF_DOCS)