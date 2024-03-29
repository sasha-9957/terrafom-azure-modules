module "private_dns_zone" {
  source = "../../modules/terraform-azurerm-private-dns-zone"

  azurerm_private_dns_zone_params = {
    main_private_dns_zone = {
      name                = "privatelink.blob.core.windows.net"                   # required
      resource_group_name = module.resource_group.resource_groups["main_rg"].name # required
      tags                = module.tags.tags

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
