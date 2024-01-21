module "private_dns_ptr_record" {
  source = "../modules/azurerm_private_dns_ptr_record"

  azurerm_private_dns_ptr_record_params = {
    main_private_dns_zone = {
      name                = "record-name"                                                           # required
      resource_group_name = module.resource_group.resource_groups["main_rg"].name                   # required
      zone_name           = module.private_dns_zone.private_dns_zones["main_private_dns_zone"].name # required
      ttl                 = 300                                                                     # required
      records             = ["yourdomain.com"]                                                      # required
      tags                = module.tags.tags
    }
  }
}
