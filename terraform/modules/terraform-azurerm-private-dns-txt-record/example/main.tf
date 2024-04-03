module "private_dns_txt_record" {
  source  = "app.terraform.io/captionhealth/private-dns-txt-record/azurerm"
  version = "1.0.0"

  azurerm_private_dns_txt_record_params = {
    main_private_dns_zone = {
      name                = "@"                                                                     # Required
      resource_group_name = module.resource_group.resource_groups["main_rg"].name                   # Required
      zone_name           = module.private_dns_zone.private_dns_zones["main_private_dns_zone"].name # Required
      ttl                 = 300                                                                     # Required
      tags                = module.tags.tags
      record = { # Required
        "spf" = {
          value = "v=spf1 include:_spf.example.com -all" # Required
        }
        "verification" = {
          value = "google-site-verification=xxxxxxxxxxxx" # Required
        }
      }
    }
  }
}
