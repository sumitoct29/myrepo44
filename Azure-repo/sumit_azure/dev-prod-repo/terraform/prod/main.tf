resource "azurerm_resource_group" "rg" {
  name     = "prod-rg111"
  location = "West Europe"
}

resource "azurerm_resource_group" "rg1" {
  name     = "prod-rg1111"
  location = "West Europe"
}


resource "azurerm_resource_group" "rg2" {
  name     = "prod-rg1111123"
  location = "West Europe"
}
