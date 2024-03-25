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
