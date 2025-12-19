resource "azurerm_resource_group" "rg-1" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "sg-1" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg-1.name
  location                 = azurerm_resource_group.rg-1.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  public_network_access_enabled = false
  min_tls_version = "TLS1_2"
  
}
