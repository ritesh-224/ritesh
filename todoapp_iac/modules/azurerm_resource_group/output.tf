output "rg_names" {
    description = "Map of resource group names"
    value = {
    for k, rg in azurerm_resource_group.devrg :
    k => rg.name
  }
}