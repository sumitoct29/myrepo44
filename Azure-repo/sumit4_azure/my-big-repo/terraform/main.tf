resource "azurerm_resource_group" "rg" {
  name     = "example-rg111"
  location = "West Europe"
}

resource "azurerm_resource_group" "rg1" {
  name     = "example-rg112"
  location = "West Europe"
}
