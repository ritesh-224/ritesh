resource "azurerm_resource_group" "example" {
  name     = "my-rg"
  location = "eastus"
}

resource "azurerm_storage_account" "stg" {
  name = "my-stg"
  location = azurerm_resource_group.example.location
  resource_group_name" = azurerm_resource_group.example.name
  account_tier = "Standard"
  account_replication_type = "LRS"
}