
module "resource_group" {
  source = "../modules/terraform-azurerm-resource-group"

  resource_group_params = {
    main_rg = {
      location   = local.location
      name       = module.name.names["main_rg"].result
      managed_by = null
      tags       = module.tags.tags
    }

  }
}

resource "azurerm_virtual_network" "this" {
  name                = "example-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = local.location
  resource_group_name = module.resource_group.resource_groups["main_rg"].name
}

resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = module.resource_group.resource_groups["main_rg"].name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.0.1.0/24"]

  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }
}


resource "azurerm_public_ip" "this" {
  name                = "PublicIPForLB"
  location            = local.location
  resource_group_name = module.resource_group.resource_groups["main_rg"].name
  allocation_method   = "Dynamic"
}

module "load_balancer" {
  source = "../modules/terraform-azurerm-load-balancer"

  azurerm_lb_params = {
    main_azurerm_lb = {
      name                = module.name.names["main_azurerm_lb"].result
      location            = module.resource_group.resource_groups["main_rg"].location
      resource_group_name = module.resource_group.resource_groups["main_rg"].name
      edge_zone           = null
      sku                 = null
      sku_tier            = null
      tags                = module.tags.tags

      frontend_ip_configuration = [
        {
          name                                               = "frontend_name"
          zones                                              = null
          subnet_id                                          = null
          private_ip_address                                 = null
          private_ip_address_allocation                      = null
          private_ip_address_version                         = null
          public_ip_address_id                               = azurerm_public_ip.this.id
          public_ip_prefix_id                                = null
          gateway_load_balancer_frontend_ip_configuration_id = null
        }
       ]
    }
  }
}

output "load_balancers" {
  description = "An object map for input parameters of the Load Balancer module."
  value       = module.load_balancer.load_balancers
}


# data "azurerm_client_config" "current" {}

# module "key_vault" {
#   source = "../modules/terraform-azurerm-key-vault"

#   azurerm_key_vault_params = {
#     main_key_vault = {
#       name                            = "examplekeyvault-00000002"                              # required
#       location                        = local.location                                        # required
#       resource_group_name             = module.resource_group.resource_groups["main_rg"].name # required
#       sku_name                        = "standard"                                            # required
#       tenant_id                       = data.azurerm_client_config.current.tenant_id          # required
#       enabled_for_deployment          = null
#       enabled_for_disk_encryption     = null
#       enabled_for_template_deployment = null
#       enable_rbac_authorization       = null
#       purge_protection_enabled        = null
#       public_network_access_enabled   = null
#       soft_delete_retention_days      = null
#       network_acls = null
#       tags                            = null
#     }
#   }
# }


# module "key_vault_access_policy" {

#   source = "../modules/terraform-azurerm-key-vault-access-policy"

#   azurerm_key_vault_access_policy_params = {
#     key_vault_access_policy = {
#       key_vault_id            = module.key_vault.key_vaults["main_key_vault"].id
#       tenant_id               = data.azurerm_client_config.current.tenant_id
#       object_id               = data.azurerm_client_config.current.object_id
#       key_permissions         = ["List", "Get", "Create", "Delete"]
#       secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"]
#       application_id          = null
#       certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup"]
#       storage_permissions     = null
#     }
#   }
# }

# module "application_insights" {
#   source = "../modules/terraform-azurerm-application-insights"

#   azurerm_application_insights_params = {
#     application_insights = {
#       name                                  = module.name.names["main_application_insights"].result                                # required
#       location                              = local.location                                        # required
#       resource_group_name                   = module.resource_group.resource_groups["main_rg"].name # required
#       application_type                      = "web"                                                 # required
#       workspace_id                          = null
#       retention_in_days                     = null
#       sampling_percentage                   = null
#       disable_ip_masking                    = null
#       daily_data_cap_in_gb                  = null
#       local_authentication_disabled         = null
#       daily_data_cap_notifications_disabled = null
#       internet_ingestion_enabled            = null
#       internet_query_enabled                = null
#       force_customer_storage_for_profiler   = null
#       tags                                  = module.tags.tags
#     }
#   }
# }


# module "private_dns_zone" {
#   source = "../modules/terraform-azurerm-private-dns-zone"

#   azurerm_private_dns_zone_params = {
#     main_private_dns_zone = {
#       name                = "test-mydomain-name.exampe.com"                       # required
#       resource_group_name = module.resource_group.resource_groups["main_rg"].name # required
#       tags                = module.tags.tags
#       soa_record = {
#         "primary" = {
#           email        = "admin.example1.com"
#           expire_time  = 3600
#           minimum_ttl  = 300
#           refresh_time = 900
#           retry_time   = 600
#           ttl          = 3600
#           tags         = module.tags.tags
#         }
#       }
#     }
#   }
# }

# module "private_dns_a_record" {
#   source = "../modules/terraform-azurerm-private-dns-a-record"

#   azurerm_private_dns_a_record_params = {
#     main_private_dns_zone = {
#       name                = "dev-0"                                                                 # required
#       resource_group_name = module.resource_group.resource_groups["main_rg"].name                   # required
#       zone_name           = module.private_dns_zone.private_dns_zones["main_private_dns_zone"].name # required
#       ttl                 = 300                                                                     # required
#       records             = ["10.0.180.17"]                                                         # required
#       tags                = module.tags.tags                                                        # required
#     }
#   }
# }


# module "private_dns_cname_record" {
#   source = "../modules/terraform-azurerm-private-dns-cname-record"

#   azurerm_private_dns_cname_record_params = {
#     main_private_dns_zone = {
#       name                = "dev-1"                                                                 # required
#       resource_group_name = module.resource_group.resource_groups["main_rg"].name                   # required
#       zone_name           = module.private_dns_zone.private_dns_zones["main_private_dns_zone"].name # required
#       ttl                 = 300                                                                     # required
#       record              = "aias-examle.com"                                                       # required
#       tags                = module.tags.tags
#     }
#   }
# }

# module "private_dns_ptr_record" {
#   source = "../modules/terraform-azurerm-private-dns-ptr-record"

#   azurerm_private_dns_ptr_record_params = {
#     main_private_dns_zone = {
#       name                = "dev-2"                                                                 # required
#       resource_group_name = module.resource_group.resource_groups["main_rg"].name                   # required
#       zone_name           = module.private_dns_zone.private_dns_zones["main_private_dns_zone"].name # required
#       ttl                 = 300                                                                     # required
#       records             = ["yourdomain.com"]                                                      # required
#       tags                = module.tags.tags
#     }
#   }
# }


# module "private_dns_txt_record" {
#   source = "../modules/terraform-azurerm-private-dns-txt-record"

#   azurerm_private_dns_txt_record_params = {
#     main_private_dns_zone = {
#       name                = "@"                                                                     # required
#       resource_group_name = module.resource_group.resource_groups["main_rg"].name                   # required
#       zone_name           = module.private_dns_zone.private_dns_zones["main_private_dns_zone"].name # required
#       ttl                 = 300                                                                     # required
#       tags                = module.tags.tags
#       record = {
#         "spf" = {
#           value = "v=spf1 include:_spf.example.com -all"
#         }
#         "verification" = {
#           value = "google-site-verification=xxxxxxxxxxxx"
#         }
#       }
#     }
#   }
# }

# module "private_dns_mx_record" {
#   source = "../modules/terraform-azurerm-private-dns-mx-record"

#   azurerm_private_dns_mx_record_params = {
#     main_private_dns_zone = {
#       name                = "@"                                                                     # required
#       resource_group_name = module.resource_group.resource_groups["main_rg"].name                   # required
#       zone_name           = module.private_dns_zone.private_dns_zones["main_private_dns_zone"].name # required
#       ttl                 = 300                                                                     # required
#       tags                = module.tags.tags
#       record = {
#         "backup-mx" = {
#           preference = 20
#           exchange   = "backupmx.example.com"
#         }
#         "mx" = {
#           preference = 10
#           exchange   = "mx1.example.com"
#         }
#       }
#     }
#   }
# }

# output "key_vault_access_policy" {
#   description = "An object containing the Key Vaults Access Policy created by the module"
#   value       = module.key_vault_access_policy.key_vault_access_policy
# }

# output "application_insights" {
#   description = "An object containing data created by the insights application module."
#   value       = module.application_insights.application_insights
#   sensitive   = true
# }
