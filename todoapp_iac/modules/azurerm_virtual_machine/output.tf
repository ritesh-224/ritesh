output "nic_id" {
    description = "The ID of the existing Network Interface"
    value       = azurerm_network_interface.nic["vm1"].id
}