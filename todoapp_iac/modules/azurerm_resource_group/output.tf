output "rg_data_block" {
    description = "The data block for the resource group"
    value       = azurerm_resource_group.devrg["rg1"].name
}