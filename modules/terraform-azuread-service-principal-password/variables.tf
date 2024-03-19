variable "service_principal_password_params" {
  description = "Object map for Service Principal Password module input parameters."

  type = map(object({
    display_name         = string
    end_date             = string
    end_date_relative    = string
    service_principal_id = string # Required
    start_date           = string
    rotate_when_changed = optional(object({
      rotation = string
    }))
  }))
}