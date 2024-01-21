variable "location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group"
}

variable "resource_group_name" {
  type    = string
  default = "global-rg"
}

variable "storage_account" {
  type    = string
  default = "my-storage"
}

variable "azurerm_private_dns_zone_params" {
  default = {
    "soa_record" = {
      email        = "admin@example1.com"
      expire_time  = 3600
      minimum_ttl  = 300
      refresh_time = 900
      retry_time   = 600
      ttl          = 3600
    }
  }
}