terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }

  backend "azurerm" {
    use_cli              = true                                    # Can also be set via `ARM_USE_CLI` environment variable.
    use_azuread_auth     = true                                    # Can also be set via `ARM_USE_AZUREAD` environment variable.
    tenant_id            = "020b3f00-0683-4415-8fdc-26e7b236e208"  # Can also be set via `ARM_TENANT_ID` environment variable. Azure CLI will fallback to use the connected tenant ID if not supplied.
    storage_account_name = "stg1313"                              
    container_name       = "tfstate"                              
    key                  = "kat.tfstate"               
  }
}



provider "azurerm" {
    features {}
    subscription_id = "8861d360-648c-4989-b314-ea9666b2f7ed"


}