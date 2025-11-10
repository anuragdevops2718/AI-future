terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.30.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "demorg1110"
    storage_account_name = "demostg1110"
    container_name       = "statemanagement"
    key                  = "aidev.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "1e26666e-4639-48ff-a80e-d59d7d02818a"

}

