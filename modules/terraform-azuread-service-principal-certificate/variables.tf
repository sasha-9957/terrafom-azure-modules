variable "azuread_service_principal_certificate_params" {
  description = "Object map for Azure Service Principal Certificate module input parameters."

  type = map(object({
    encoding             = string
    end_date             = string
    end_date_relative    = string
    key_id               = string
    service_principal_id = string # Required
    start_date           = string
    type                 = string # Required
    value                = string # Required
  }))
}
