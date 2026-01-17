output "subnet_ids" {
  description = "Subnet IDs per virtual network"
  value = {
    for vnet_key, vnet in azurerm_virtual_network.vnet :
    vnet_key => {
      for subnet in vnet.subnet :
      subnet.name => subnet.id
    }
  }
}

# output "subnet_ids" {
#   value = { for s in azurerm_virtual_network.vnet.subnet : s.name => s.id }
# }