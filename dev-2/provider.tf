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
  backend "azurerm" {
    resource_group_name  = "my-group"
    storage_account_name = "mysteaccounteastus"
    container_name       = "tfstate-dev2"
    key                  = "terraform.tfstate"
  }
}

