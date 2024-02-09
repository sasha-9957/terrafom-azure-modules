[//]: # (BEGIN_TF_DOCS)


### Example:

```hcl
module "private_dns_mx_record" {
  source = "app.terraform.io/captionhealth/private_dns_mx_record/azurerm"

  azurerm_private_dns_mx_record_params = {
    main_private_dns_zone = {
      name                = "@"                                                                     # required
      resource_group_name = module.resource_group.resource_groups["main_rg"].name                   # required
      zone_name           = module.private_dns_zone.private_dns_zones["main_private_dns_zone"].name # required
      ttl                 = 300                                                                     # required
      tags                = module.tags.tags
      record = {
        "backup-mx" = {
         preference  = 20
         exchange    = "backupmx.example.com"
        }
        "mx" = {
         preference  = 10
         exchange    = "mx1.example.com"
        }
      }                                                     
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
| [azurerm_private_dns_mx_record.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_mx_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_private_dns_mx_record_params"></a> [azurerm\_private\_dns\_mx\_record\_params](#input\_azurerm\_private\_dns\_mx\_record\_params) | n/a | <pre>map(object({<br>    description = "Object map for Azure Private DNS MX Record module input parameters."<br>    name                = string # required<br>    resource_group_name = string # required<br>    zone_name           = string # required<br>    ttl                 = number # required<br>    tags                = map(string)<br>    record = map(object({<br>      preference = number<br>      exchange   = string<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_dns_mx_record"></a> [private\_dns\_mx\_record](#output\_private\_dns\_mx\_record) | An object containing the Private DNS MX Records created by the module. |

[//]: # (END_TF_DOCS)