#################
resource "azuread_claims_mapping_policy" "my_policy" {
  definition = [
    jsonencode(
      {
        ClaimsMappingPolicy = {
          ClaimsSchema = [
            {
              ID            = "employeeid"
              JwtClaimType  = "name"
              SamlClaimType = "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name"
              Source        = "user"
            },
            {
              ID            = "tenantcountry"
              JwtClaimType  = "country"
              SamlClaimType = "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/country"
              Source        = "company"
            }
          ]
          IncludeBasicClaimSet = "true"
          Version              = 1
        }
      }
    ),
  ]
  display_name = "My Policy"
}
#################



module "resource_group" {
  source = "../modules/terraform-azurerm-resource-group"

  resource_group_params = {
    main_rg = {
      location   = var.location                        # required
      name       = module.name.names["main_rg"].result # required
      managed_by = null
      tags       = module.tags.tags
    }
  }
}



data "azuread_client_config" "current" {}

resource "azuread_application" "this" {
  display_name = "example"
  owners       = [data.azuread_client_config.current.object_id]
}

# ######

module "azuread_service_principal" {
  source = "../modules/terraform-azuread-service-principal"

  azuread_service_principal_params = {
    main_service_principal = {
      account_enabled               = null
      alternative_names             = null
      app_role_assignment_required  = false
      client_id                     = azuread_application.this.client_id # Required
      description                   = null
      login_url                     = null
      notes                         = null
      notification_email_addresses  = null
      owners                        = [data.azuread_client_config.current.object_id]
      preferred_single_sign_on_mode = null
      use_existing                  = null
      tags                          = null # Cannot be used together with the feature_tags block.

      feature_tags = [ # Cannot be used together with the tags property.
        {
          custom_single_sign_on = null
          enterprise            = true
          gallery               = true
          hide                  = null
        }
      ]

      saml_single_sign_on = [
        {
          relay_state = null
        }
      ]
    }
  }
}

output "service_principals" {
  description = "An object containing the Service Principal created by the module."
  value       = module.azuread_service_principal.service_principals
}


module "service_principal_certificate" {
  source = "../modules/terraform-azuread-service-principal-certificate"

  service_principal_certificate_params = {
    main_principal_certificate = {
      encoding             = null
      end_date             = null
      end_date_relative    = null
      key_id               = null
      service_principal_id = module.azuread_service_principal.service_principals["main_service_principal"].id # Required
      start_date           = null
      type                 = "AsymmetricX509Cert" # Required
      value                = file("cert.pem")     # Required
    }
  }
}
output "service_principal_certificates" {
  description = "An object containing the Service Principal Certificates created by the module."
  value       = module.service_principal_certificate.service_principal_certificates
  sensitive   = true
}

resource "time_rotating" "this" {
  rotation_days = 10 # Change password every 7 days
}

module "service_principal_password" {
  source = "../modules/terraform-azuread-service-principal-password"

  service_principal_password_params = {
    main_principal_password = {
      display_name         = null
      end_date             = null
      end_date_relative    = null
      service_principal_id = module.azuread_service_principal.service_principals["main_service_principal"].id # Required
      start_date           = null
      rotate_when_changed = {
        rotation = null
      }
    }
  }
}

output "service_principal_passwords" {
  description = "An object containing the Service Principal Passwords created by the module."
  value       = module.service_principal_password.service_principal_passwords
  sensitive   = true
}

module "service_principal_claims_mapping_policy_assignment" {
  source  = "../modules/terraform-azuread-service-principal-claims-mapping-policy-assignment"


  service_principal_claims_mapping_policy_assignment_params = {
    main_claims_mapping_policy_assignment = {
      claims_mapping_policy_id             = azuread_claims_mapping_policy.my_policy.id
      service_principal_id                 = module.azuread_service_principal.service_principals["main_service_principal"].id # Required
    }
  }
}

output "service_principal_claims_mapping_policy_assignments" {
  description = "An object containing the Service Principal Claims Mapping Policy Assignments created by the module."
  value = module.service_principal_claims_mapping_policy_assignment.service_principal_claims_mapping_policy_assignments
}
#####

module "service_principal_token_signing_certificate" {
  source  = "../modules/terraform-azuread-service-principal-token-signing-certificate"

  service_principal_token_signing_certificate_params = {
    main_principal_password = {
      display_name         = "CN=example.com"
      end_date             = "2025-05-01T01:02:03Z"
      service_principal_id = module.azuread_service_principal.service_principals["main_service_principal"].id # Required
    }
  }
}

output "service_principal_token_signing_certificates" {
  description = "An object containing the Service Principal Token Signing Certificate created by the module."
  value       = module.service_principal_token_signing_certificate.service_principal_token_signing_certificates
  sensitive = true
}


# module "azurerm_service_plan" {
#   source = "../modules/terraform-azurerm-service-plan"
#   azurerm_service_plan_params = {
#     main_service_plan = {
#       name                         = "example"                                                 # Required
#       location                     = module.resource_group.resource_groups["main_rg"].location # Required
#       os_type                      = "Linux"                                                   # Required
#       resource_group_name          = module.name.names["main_rg"].result                       # Required
#       sku_name                     = "P1v2"                                                    # Required
#       app_service_environment_id   = null
#       maximum_elastic_worker_count = null
#       worker_count                 = null
#       per_site_scaling_enabled     = null
#       zone_balancing_enabled       = null
#       tags                         = module.tags.tags
#     }
#   }
# }

# output "azurerm_service_plans" {
#   description = "An object containing data created by the Azure Service Plans module."
#   value       = module.azurerm_service_plan.azurerm_service_plans
# }


# module "virtual_network" {
#   source = "../modules/terraform-azurerm-virtual-network"

#   azurerm_virtual_network_params = {
#     vnet1 = {
#       name                    = module.name.names["main_vnet"].result                     # required
#       resource_group_name     = module.resource_group.resource_groups["main_rg"].name     # required
#       address_space           = var.address_space                                         # required
#       location                = module.resource_group.resource_groups["main_rg"].location # required
#       bgp_community           = null
#       ddos_protection_plan    = []
#       encryption              = []
#       dns_servers             = []
#       edge_zone               = null
#       flow_timeout_in_minutes = null
#       subnet                  = []
#       tags                    = module.tags.tags
#     }
#   }
# }

# module "subnet" {
#   source = "../modules/terraform-azurerm-subnet"

#   azurerm_subnet_params = {
#     subnet1 = {
#       name                                          = module.name.names["subnet1"].result                   # Required
#       resource_group_name                           = module.resource_group.resource_groups["main_rg"].name # Required
#       virtual_network_name                          = module.virtual_network.virtual_networks["vnet1"].name # Required
#       address_prefixes                              = var.linux_subnet                                      # Required
#       private_endpoint_network_policies_enabled     = null
#       private_link_service_network_policies_enabled = null
#       service_endpoints                             = null
#       service_endpoint_policy_ids                   = null

#       delegation = [
#         {
#           name = "delegation1" # Required

#           service_delegation = [ # Required
#             {
#               name    = "Microsoft.PowerPlatform/vnetaccesslinks"
#               actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
#             }
#           ]
#         }
#       ]
#     }
#     subnet2 = {
#       name                                          = module.name.names["subnet2"].result                   # Required
#       resource_group_name                           = module.resource_group.resource_groups["main_rg"].name # Required
#       virtual_network_name                          = module.virtual_network.virtual_networks["vnet1"].name # Required
#       address_prefixes                              = var.powerbi_subnet                                    # Require
#       private_endpoint_network_policies_enabled     = null
#       private_link_service_network_policies_enabled = null
#       service_endpoints                             = null
#       service_endpoint_policy_ids                   = null

#       delegation = [
#         {
#           name = "delegation2" # Required

#           service_delegation = [ # Required
#             {
#               name    = "Microsoft.PowerPlatform/vnetaccesslinks"
#               actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
#             }
#           ]
#         }
#       ]
#     }
#   }
# }
