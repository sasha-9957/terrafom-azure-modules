variable "azuread_service_principal_token_signing_certificate_params" {
  description = "Object map for Azure Service Principal Token Signing Certificate module input parameters."

  type = map(object({
    display_name         = string
    end_date             = string
    service_principal_id = string # Required
  }))
}
