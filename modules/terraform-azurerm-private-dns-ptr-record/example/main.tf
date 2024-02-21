module "private_dns_ptr_record" {
  source  = "app.terraform.io/captionhealth/private-dns-ptr-record/azurerm"
  version = "1.0.0"

  azurerm_private_dns_ptr_record_params = {
    main_private_dns_zone = {
      name                = module.name.names["main_private_dns_ptr_record"].result                 # Required
      resource_group_name = module.resource_group.resource_groups["main_rg"].name                   # Required
      zone_name           = module.private_dns_zone.private_dns_zones["main_private_dns_zone"].name # Required
      ttl                 = 300                                                                     # Required
      records             = ["yourdomain.com"]                                                      # Required
      tags                = module.tags.tags
    }
  }
}
