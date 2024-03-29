# # provider "azurerm" {
# #   features {}
# #   skip_provider_registration = true
# # }

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
}

terraform {
  required_providers {
    azurerm = {
    }
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "2.0.0-preview3"
    }
  }
}