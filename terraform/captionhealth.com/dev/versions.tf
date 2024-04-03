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
    tenant_id            = "4f47fb49-521c-4371-be4e-d9ae5b4b691b" # Caption Health
    subscription_id      = "f666585b-231b-4711-bbe1-8fad4cbcf1c4" # app-store-pilot
    resource_group_name  = "global-rg"
    storage_account_name = "chrgglobalyoeastus"
    container_name       = "terraform-state"
    key                  = "dev.terraform.tfstate"

    use_oidc = true
  }
}
