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

