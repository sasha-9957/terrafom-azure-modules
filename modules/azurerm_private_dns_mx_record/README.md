[//]: # (BEGIN_TF_DOCS)

### Example

```hcl
module "private_dns_mx_record" {
  source = "../modules/azurerm_private_dns_mx_record"

  azurerm_private_dns_mx_record_params = {
    main_private_dns_zone = {
      name                = "@"                                                                     # required
      resource_group_name = module.resource_group.resource_groups["main_rg"].name                   # required
      zone_name           = module.private_dns_zone.private_dns_zones["main_private_dns_zone"].name # required
      ttl                 = 300                                                                     # required
      tags                = module.tags.tags
      record = {
        "1" = {
         preference  = 20
         exchange    = "backupmx.contoso.com"
        }
        "2" = {
         preference  = 10
         exchange    = "mx1.contoso.com"
        }
      }                                                     
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
| [private_dns_mx_record.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_a_record) | resource |

## Inputs

| Name                                                                                                                                                  | Description | Type                                                                                                                                                                                                                                                                                                                                          | Default | Required |
|-------------------------------------------------------------------------------------------------------------------------------------------------------|-------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------|:--------:|
| <a name="input_private_dns_mx_record_params"></a> [azurerm\_private\_dns\_mx\_record\_params](#input\_azurerm\_private\_dns\_mx\_record\_params) | n/a         | <pre>map(object({<br>    name                = string      # required<br>    resource_group_name = string      # required<br>    zone_name           = string      # required<br>    ttl                 = number      # required<br>    tags                = map(string)<br>    record              = map(object({<br>      preference = number<br>      exchange   = string<br>    }))<br>  }))</pre> | n/a     |   yes    |

## Outputs

| Name                                                                                                      | Description |
|-----------------------------------------------------------------------------------------------------------|-------------|
| <a name="output_private_dns_a_records"></a> [private\_dns\_mx\_records](#output\_private\_dns\_mx\_records) | n/a         |

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

