module "private_dns_mx_records" {
  source  = "app.terraform.io/captionhealth/private-dns-mx-record/azurerm"
  version = "1.0.0"

  azurerm_private_dns_mx_record_params = {
    main_private_dns_zone = {
      name                = "@"
      resource_group_name = module.resource_group.resource_groups["main_rg"].name                   # Required
      zone_name           = module.private_dns_zone.private_dns_zones["main_private_dns_zone"].name # Required
      ttl                 = 300                                                                     # Required
      tags                = module.tags.tags
      record = { # Required
        "mx" = {
          preference = 10                # Required
          exchange   = "mx1.example.com" # Required
        }
        "backup-mx" = {
          preference = 20                     # Required
          exchange   = "backupmx.example.com" # Required
        }
      }
    }
  }
}
