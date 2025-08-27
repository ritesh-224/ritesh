terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.35.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "bcf304d8-21b8-4358-9c77-54b5dd26f938"
}

resource "azurerm_resource_group" "example" {
  name     = "my-rg"
  location = "eastus"
}

resource "azurerm_storage_account" "stg" {
  name = "pipelinestorage"
  location = azurerm_resource_group.example.location
  resource_group_name" = azurerm_resource_group.example.name
  account_tier = "Standard"
  account_replication_type = "LRS"
}
