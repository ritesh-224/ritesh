resource "azurerm_network_interface_backend_address_pool_association" "example" {
    network_interface_id    = var.nic_id
    ip_configuration_name   = "nic1-config"
    backend_address_pool_id = var.backend_pool_id
}