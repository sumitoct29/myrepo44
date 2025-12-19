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
    tenant_id            = "51d54021-b2c6-433d-8383-ac4a7dbf4f25"  # Can also be set via `ARM_TENANT_ID` environment variable. Azure CLI will fallback to use the connected tenant ID if not supplied.
    storage_account_name = "stg131311"                              
    container_name       = "tfstate"                              
    key                  = "katty.tfstate"               
  }
}



provider "azurerm" {
    features {}
    subscription_id = "ee6f0318-699e-4ba7-bdac-9da2c0724419"


}