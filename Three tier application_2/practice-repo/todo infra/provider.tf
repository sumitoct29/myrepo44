# name sunil 
# name sunil 
# name sunil 
#surname Dubey
# Add bhiwandi
# village matiyahi
# dist jaunpur
# state UP
#block sujanganj1



#surname Dubey
# Add bhiwandi
# village matiyahi
# dist jaunpur

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.36.0"
    }
  }
}


provider "azurerm" {
  features {}

  subscription_id = "5e1a4ed3-e4dc-4f98-88ec-6e69c7cf0255"

}
