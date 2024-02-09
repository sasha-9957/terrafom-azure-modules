module "private_dns_txt_record" {
  source = "app.terraform.io/captionhealth/private_dns_txt_record/azurerm"

  azurerm_private_dns_txt_record_params = {
    main_private_dns_zone = {
      name                = "@"                                                                     # required
      resource_group_name = module.resource_group.resource_groups["main_rg"].name                   # required
      zone_name           = module.private_dns_zone.private_dns_zones["main_private_dns_zone"].name # required
      ttl                 = 300                                                                     # required
      tags                = module.tags.tags
      record = {
        "spf" = {
         value = "v=spf1 include:_spf.example.com -all"
        }
        "verification" = {
         value = "google-site-verification=xxxxxxxxxxxx"
        }
      }                                                     
    }
  }
}