terraform {
  required_version = ">= 1.6"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.9"
    }
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "1.2.27"
    }
  }

  backend "azurerm" {
    resource_group_name  = "my-group"
    storage_account_name = "mysteaccounteastus"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"

    use_oidc = true
  }
}
