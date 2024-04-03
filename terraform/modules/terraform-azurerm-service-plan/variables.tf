variable "azurerm_service_plan_params" {
  description = "Object map for Azure Service Plan module input parameters."

  type = map(object({
    name                         = string # Required
    location                     = string # Required
    os_type                      = string # Required
    resource_group_name          = string # Required
    sku_name                     = string # Required
    app_service_environment_id   = string
    maximum_elastic_worker_count = number
    worker_count                 = number
    per_site_scaling_enabled     = bool
    zone_balancing_enabled       = bool
    tags                         = map(string)
  }))
}
