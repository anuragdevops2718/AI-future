terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.50.0"
    }
  }
# backend "azurerm" {} 
}
provider "azurerm" {
  features {}
  subscription_id = "1e26666e-4639-48ff-a80e-d59d7d02818a"
}



