terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
}

provider "azurerm" {
    features {}
    subscription_id = "2775dd26-3d9b-4b17-b5d0-b8edea927622"


}