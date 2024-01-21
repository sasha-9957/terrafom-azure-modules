[//]: # (BEGIN_TF_DOCS)

### Example

```hcl
module "private_dns_cname_record" {
  source = "../modules/azurerm_private_dns_cname_record"

  azurerm_private_dns_cname_record_params = {
    main_private_dns_zone = {
      name                = "record-name"                                                           # required
      resource_group_name = module.resource_group.resource_groups["main_rg"].name                   # required
      zone_name           = module.private_dns_zone.private_dns_zones["main_private_dns_zone"].name # required
      ttl                 = 300                                                                     # required
      record              = "aias-name.com"                                                         
      tags                = module.tags.tags
    }
  }
}

output "private_dns_cname_records" {
  value = module.private_dns_cname_record
}
```