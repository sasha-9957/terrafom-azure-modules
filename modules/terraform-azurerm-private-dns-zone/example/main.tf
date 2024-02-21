module "private_dns_zone" {
  source  = "app.terraform.io/captionhealth/private-dns-zone/azurerm"
  version = "1.0.0"

  azurerm_private_dns_zone_params = {
    main_private_dns_zone = {
      name                = module.name.names["main_private_dns_zone"].result         # required
      resource_group_name = module.resource_group.resource_groups["main_rg"].location # required
    }
  }
}
