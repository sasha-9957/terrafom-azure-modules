module "private_dns_zone" {
  source  = "app.terraform.io/captionhealth/private-dns-zone/azurerm"
  version = "1.0.0"

  azurerm_private_dns_zone_params = {
    main_private_dns_zone = {
      name                = "dev.captionhealth.com"                                   # required
      resource_group_name = module.resource_group.resource_groups["main_rg"].location # required

      soa_record = [
        # {
        #   email        = "devops.captionhealth.com" # required
        #   expire_time  = null
        #   minimum_ttl  = null
        #   refresh_time = null
        #   retry_time   = null
        #   ttl          = null
        #   tags         = module.tags.tags
        # }
      ]
    }
  }
}
