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
