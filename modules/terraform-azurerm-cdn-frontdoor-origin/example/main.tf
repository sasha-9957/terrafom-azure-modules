module "frontdoor_origin" {
  source  = "app.terraform.io/captionhealth/front-door-origin/azurerm"
  version = "1.0.0"

  # If you are attempting to implement an Origin that uses its own Private Link Service with a Load Balancer the Profile resource in your configuration file must have a depends_on meta-argument which references the azurerm_private_link_service.

  azurerm_cdn_frontdoor_origin_params = {
    frontdoor_origin1 = {
      name                           = "origin-1"                                                                          # Required
      cdn_frontdoor_origin_group_id  = module.frontdoor_origin_group.frontdoor_origin_groups["frontdoor_origin_group1"].id # Required
      host_name                      = module.storage_account.storage_accounts["main_storage_account"].primary_blob_host   # Required
      certificate_name_check_enabled = true                                                                                # Required
      enabled                        = true
      http_port                      = 80
      https_port                     = 443
      origin_host_header             = module.storage_account.storage_accounts["main_storage_account"].primary_blob_host
      priority                       = 1
      weight                         = 1

      private_link = [
        {
          request_message        = "Request access for Private Link Origin CDN Frontdoor"
          target_type            = "blob"
          location               = module.storage_account.storage_accounts["main_storage_account"].location # Required
          private_link_target_id = module.storage_account.storage_accounts["main_storage_account"].id       # Required
        }
      ]
    }
  }
}
