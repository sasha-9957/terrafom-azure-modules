[//]: # (BEGIN_TF_DOCS)

### Example

```hcl
module "private_dns_mx_record" {
  source = "../modules/azurerm_private_dns_mx_record"

  azurerm_private_dns_mx_record_params = {
    main_private_dns_zone = {
      name                = "@"                                                                      # required
      resource_group_name = module.resource_group.resource_groups["main_rg"].name                    # required
      zone_name           = module.private_dns_zone.private_dns_zones["main_private_dns_zone"].name  # required
      ttl                 = 300                                                                      # required
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

output "private_dns_txt_record" {
  value = module.private_dns_txt_record
}

```
