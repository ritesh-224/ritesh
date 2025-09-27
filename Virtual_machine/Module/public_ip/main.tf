resource "azurerm_public_ip" "public_ip" {
  name                = var.pip_name
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"
}

output "public_ip_address_id" {
  value = azurerm_public_ip.public_ip.id
}