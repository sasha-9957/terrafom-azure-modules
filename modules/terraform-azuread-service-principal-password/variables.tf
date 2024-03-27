variable "azuread_service_principal_password_params" {
  description = "Object map for Azure Service Principal Password module input parameters."

  type = map(object({
    display_name         = string
    end_date             = string
    end_date_relative    = string
    rotate_when_changed  = map(string)
    service_principal_id = string # Required
    start_date           = string
  }))
}
