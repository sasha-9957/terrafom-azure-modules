module "private_dns_a_record" {
  source  = "app.terraform.io/captionhealth/private-dns-zone/azurerm"
  version = "1.0.0"

  azurerm_private_dns_zone_params = {
    main_private_dns_zone = {
      name                = "mydomain.com"                                                          # required
      resource_group_name = module.resource_group.resource_groups["main_rg"].location               # required
      zone_name           = module.private_dns_zone.private_dns_zones["main_private_dns_zone"].name # required
      ttl                 = 300                                                                     # required
      records             = ["10.0.180.17"]                                                         # required
      tags                = null
    }
  }
}
