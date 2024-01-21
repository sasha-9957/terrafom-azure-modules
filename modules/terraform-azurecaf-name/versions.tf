terraform {
  required_version = ">= 1.5"

  required_providers {
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "~> 1.2"
    }
  }
}
