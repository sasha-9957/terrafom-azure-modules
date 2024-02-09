module "private_dns_mx_records" {
  source = "app.terraform.io/captionhealth/private_dns_mx_record/azurerm"

  azurerm_private_dns_mx_record_params = {
    main_private_dns_zone = {
      name                = "@"                                                                     
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