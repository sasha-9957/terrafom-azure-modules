variable "location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "prefixes" {
  type    = string
  default = "dwh"
}

variable "address_space" {
  default = ["10.0.0.0/8"]
}

variable "linux_subnet" {
  default = ["10.52.132.0/24"]
}

variable "powerbi_subnet" {
  default = ["10.52.133.0/24"]
}

